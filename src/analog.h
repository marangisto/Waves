#pragma once

#include <timer.h>
#include <gpio.h>
#include <adc.h>
#include <dma.h>

namespace analog
{

using hal::sys_clock;
using namespace hal::timer;
using namespace hal::gpio;
using namespace hal::adc;
using namespace hal::dma;

typedef hal::timer::timer_t<4> adc_tim;
typedef adc_t<1> adc;
typedef dma_t<1> adc_dma;
static const uint8_t adc_dma_ch = 1;
static const uint32_t adc_sample_freq = 10000;
static const uint8_t adc_buf_size = 3;
static uint16_t adc_buf[adc_buf_size] = { 2047, 2047, 2047 };

template<uint8_t CH> inline uint16_t read();

template<> inline uint16_t read<0>() { return adc_buf[0]; }
template<> inline uint16_t read<1>() { return adc_buf[1]; }
template<> inline uint16_t read<2>() { return adc_buf[2]; }

void setup()
{
    adc_tim::setup(0, sys_clock::freq() / adc_sample_freq - 1);
    adc_tim::master_mode<adc_tim::mm_update>();
    //adc_tim::update_interrupt_enable();
    //hal::nvic<interrupt::TIM4>::enable();

    adc_dma::setup();
    adc::setup();
    adc::sequence<1, 2, 15>();

    device::ADC1.CFGR2 |= device::adc1_t::CFGR2_ROVSE
                       |  device::adc1_t::CFGR2_OVSR<0x3>
                       |  device::adc1_t::CFGR2_OVSS<0x4>
                       ;

    //device::ADC1.IER |= device::adc1_t::IER_EOSIE; // enable end of sequence interrupt
    //hal::nvic<interrupt::ADC1_2>::enable();

    adc::dma<adc_dma, adc_dma_ch>(adc_buf, adc_buf_size);
    adc::trigger<0xc>();        // FIXME: use symbol for TIM4_TRGO
    adc::enable();
    adc::start_conversion();
}

} // namespace analog

template<> void handler<interrupt::TIM4>()
{
    analog::adc_tim::clear_uif();
    board::probe::set();
}

