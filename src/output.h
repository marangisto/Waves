#pragma once

#include <timer.h>
#include <gpio.h>
#include <dac.h>
#include <dma.h>

namespace output
{

using hal::sys_clock;
using namespace hal::timer;
using namespace hal::gpio;
using namespace hal::dac;
using namespace hal::dma;

typedef hal::timer::timer_t<6> dac_tim;

typedef dac_t<1> dac;
typedef dma_t<2> dac_dma;

constexpr uint8_t dac_dma_ch = 1;

constexpr uint32_t dac_sample_freq = 96000;
constexpr uint16_t half_buffer_size = 32;
constexpr uint16_t buffer_size = half_buffer_size * 2;

static uint16_t output_buffer[buffer_size];

void setup()
{
    dac_tim::setup(0, sys_clock::freq() / dac_sample_freq - 1);
    dac_tim::master_mode<dac_tim::mm_update>();

    // enable for sampling frequency probe
    //dac_tim::update_interrupt_enable();
    //hal::nvic<interrupt::TIM6_DACUNDER>::enable();

    dac_dma::setup();
    hal::nvic<interrupt::DMA2_CH1>::enable();

    dac::setup();
    dac::enable_trigger<1, 7>();    // FIXME: use constant for TIM6_TRGO
    dac::enable_dma<1, dac_dma, dac_dma_ch, uint16_t>(output_buffer, buffer_size);
    dac_dma::enable_interrupt<dac_dma_ch, true>();
}

} // namespace output

template<> void handler<interrupt::TIM6_DACUNDER>()
{
    using namespace output;

    dac_tim::clear_uif();
}

extern void process_buffer(uint16_t *buf, uint16_t len);

template<> void handler<interrupt::DMA2_CH1>()
{
    using namespace output;

    uint32_t sts = dac_dma::interrupt_status<dac_dma_ch>();

    dac_dma::clear_interrupt_flags<dac_dma_ch>();

    if (sts & (dma_half_transfer | dma_transfer_complete))
    {
        uint16_t *p = output_buffer + (sts & dma_transfer_complete ? half_buffer_size : 0);

        process_buffer(p, half_buffer_size);
    }
}

