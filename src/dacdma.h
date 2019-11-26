#pragma once

#include <i2s.h>
#include <gpio.h>
#include <fixed.h>
#include <math.h>

namespace dacdma
{

template<typename I2S, uint8_t DMA, uint8_t DMACH, uint16_t NSMPL>
class dacdma_t
{
public:
    static_assert((NSMPL & 0x1) == 0, "number of samples per channel must be even");
    typedef hal::dma::dma_t<DMA> dma;

    static void setup()
    {
        using namespace hal::i2s;
        using namespace hal::dma;
        using namespace hal::gpio;

        dma::setup();
        I2S::template setup<philips_i2s, low_level, format_32_32, 27>();
        I2S::template enable_dma<dma, DMACH>(reinterpret_cast<uint16_t*>(m_buf), NSMPL << 2);
        dma::template enable_interrupt<DMACH, true>();
    }

    static void test_signal()
    {
        using namespace fixed;

        for (uint16_t i = 0; i < NSMPL; ++i)
        {
            uint16_t j = i << 1;
            float x = -1. + 2 * static_cast<float>(i) / static_cast<float>(NSMPL);
            float y = sin(x*M_PI);

            m_buf[j] = swap(ftoq31(y));
            m_buf[j + 1] = swap(ftoq31(-y * 0.25));
        }
    }

    template<typename F>
    inline static void handle_interrupt(F fa, F fb)
    {
        uint32_t sts = dma::template interrupt_status<DMACH>();
        using namespace hal::dma;

        dma::template clear_interrupt_flags<DMACH>();

        if (sts & (dma_half_transfer | dma_transfer_complete))
        {
            constexpr uint16_t n = NSMPL >> 1;
            int32_t *p = m_buf + (sts & dma_transfer_complete ? NSMPL : 0);

            fa(p, n, 2);
            fb(p + 1, n, 2);
        }
    }

private:
    static inline uint32_t swap(uint32_t x)
    {
        return x << 16 | x >> 16;
    }

    static constexpr uint16_t BSIZE = NSMPL << 1;    // hold both channels
    static int32_t m_buf[BSIZE];
};

template<typename I2S, uint8_t DMA, uint8_t DMACH, uint16_t NSMPL>
int32_t dacdma_t<I2S, DMA, DMACH, NSMPL>::m_buf[dacdma_t<I2S, DMA, DMACH, NSMPL>::BSIZE];

} // dacdma

