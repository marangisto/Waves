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

typedef hal::timer::timer_t<3> adc_tim;
typedef adc_t<1> adc1;
typedef dma_t<1> adc_dma;
static const uint8_t adc1_dma_ch = 1;
static const uint32_t adc_sample_freq = 8000;
static const uint8_t adc_buf_size = 7;
static uint16_t adc1_buf[adc_buf_size];

template<uint8_t CH> inline uint16_t reada();

template<> inline uint16_t reada<0>() { return adc1_buf[1]; }
template<> inline uint16_t reada<1>() { return adc1_buf[3]; }
template<> inline uint16_t reada<2>() { return adc1_buf[4]; }
template<> inline uint16_t reada<3>() { return adc1_buf[5]; }
template<> inline uint16_t reada<4>() { return adc1_buf[6]; }

void setup()
{
    adc_tim::setup(0, sys_clock::freq() / adc_sample_freq - 1);
    adc_tim::master_mode<adc_tim::mm_update>();
    adc_tim::update_interrupt_enable();
    hal::nvic<interrupt::TIM3>::enable();

    adc_dma::setup();
    adc1::setup<6>();
    adc1::sample_time<2>();
    //adc1::oversample<32>();
    adc1::sequence<1, 1, 1, 3, 4, 15, 5>();

    device::ADC1.IER |= device::adc1_t::IER_EOSIE; // enable end of sequence interrupt
    hal::nvic<interrupt::ADC1_2>::enable();

    adc1::dma<adc_dma, adc1_dma_ch>(adc1_buf, adc_buf_size);
    adc1::trigger<0x4>();        // FIXME: use symbol for TIM3_TRGO
    adc1::enable();
    adc1::start_conversion();
}

} // namespace analog

template<> void handler<interrupt::TIM3>()
{
    board::led1::set();
    analog::adc_tim::clear_uif();
}

template<> void handler<interrupt::ADC1_2>()
{
    device::ADC1.ISR |= device::adc1_t::ISR_EOS; // clear end of sequence flag
    board::led1::clear();
}

