#include <dac.h>
#include <dma.h>
#include <timer.h>
#include <fixed.h>
#include <cstdlib>
#include <math.h>

using namespace fixed;

using tim6 = tim_t<6>;
using dac = dac_t<1>;
using dma = dma_t<1>;

static constexpr uint32_t sample_freq = 48000;
static constexpr uint8_t dac_dma_ch = 1;
static constexpr uint16_t buffer_size = 256; // N.B. even!
static constexpr uint16_t half_buffer_size = buffer_size >> 1;
static uint16_t buffer[buffer_size];

using led = output_t<PA5>;
using probe = output_t<PA8>;

static constexpr unsigned lo_freq = 50;
static constexpr unsigned wg_len = sample_freq / lo_freq;

struct delay_line_t
{
    void setup()
    {
        m_pos = 0;

        for (unsigned i = 0; i < wg_len; ++i)
            m_buf[i] = q31_t();
    }

    q31_t write(q31_t x)
    {
        m_buf[m_pos++] = x;
        if (static_cast<unsigned>(m_pos) >= wg_len)
            m_pos = 0;
        return x;
    }

    q31_t read(unsigned tap)
    {
        int j = m_pos - tap;

        return m_buf[j < 0 ? j + wg_len : j];
    }

    int      m_pos;
    q31_t    m_buf[wg_len];
};

template<unsigned N>
struct kernel_t
{
    static constexpr unsigned width = N;
    static constexpr unsigned mid = (N & 1) ? N / 2 : (N / 2 - 1);
    static constexpr q31_t zero = q31_t(.0);
    static constexpr q31_t one = q31_t(1.);
    static constexpr q31_t k = q31_t(1. / (N - 1));

    static inline q31_t c0(unsigned i) { return i == N - 1 ? zero : k; }
    static inline q31_t c1(unsigned i) { return i == 0 ? zero : k; }
    static inline q31_t c2(unsigned i) { return i == mid ? one : zero; }
    static inline q31_t c3(unsigned i) { return i == mid + 1 ? one : zero; }

    void configure(q31_t a, q31_t b)
    {
        for (unsigned i = 0; i < N; ++i)
            coeff[i] = (one - b) * ((one - a) * c0(i) + a * c1(i))
                     + b * ((one - a) * c2(i) + a * c3(i))
                     ;
    }

    q31_t coeff[N];
};

static delay_line_t delay_line;

static volatile bool trigger = false;

static volatile unsigned index = 400;

static kernel_t<8> kernel;

static q31_t karplus()
{
    static unsigned excite = 0;

    if (trigger)
    {
        excite = index;
        trigger = false;
    }

    if (excite)
    {
        --excite;
        q31_t mix(0.5);
        q31_t noise = q31_t(static_cast<int32_t>(rand()) << 1);
        q31_t pulse = q31_t(excite > (index >> 5) ? 0.99 : -0.99);

        return q31_t(0.0) * delay_line.write
            ( mix * noise
            + (q31_t(1.0) - mix) * pulse
            );
    }
    else
    {
        q31_t s = q31_t(.0);

        for (unsigned k = 0; k < kernel.width; ++k)
            s = s + kernel.coeff[k] * delay_line.read(index + k - kernel.mid);

        return delay_line.write(q31_t(0.999) * s);
    }
/*
        return delay_line.write
            ( q31_t(0.199) * delay_line.read(index + -2)
            + q31_t(0.199) * delay_line.read(index + -1)
            + q31_t(0.199) * delay_line.read(index + 0)
            + q31_t(0.199) * delay_line.read(index + 1)
            + q31_t(0.199) * delay_line.read(index + 2)
            );
*/
}

static void generate(uint16_t *buf, uint16_t len)
{
    for (uint16_t i = 0; i < len; ++i)
        buf[i] = 2048 + (karplus().q >> 20);
}

template<> void handler<interrupt::DMA1_CH1>()
{
    uint32_t sts = dma::interrupt_status<dac_dma_ch>();

    dma::clear_interrupt_flags<dac_dma_ch>();

    probe::set();

    if (sts & (dma_half_transfer | dma_transfer_complete))
        generate
            ( buffer
            + (sts & dma_transfer_complete ? half_buffer_size : 0)
            , half_buffer_size
            );

    probe::clear();
}

template<> void handler<interrupt::TIM6_DACUNDER>()
{
    probe::set();
    tim6::clear_update_interrupt_flag();
    probe::clear();
}

int main()
{
    probe::setup();
    led::setup();

    interrupt::enable();

    dma::setup();
    interrupt::set<interrupt::DMA1_CH1>();

    dac::setup();
    //dac::enable_trigger<1, 5>();    // FIXME: use constant for TIM6_TRGO
    dac::enable_trigger<1, 7>();    // FIXME: use constant for TIM6_TRGO
    dac::enable_dma<1, dma, dac_dma_ch, uint16_t>(buffer, buffer_size);
    dma::enable_interrupt<dac_dma_ch, true>();

    tim6::setup(0, sys_clock::freq() / sample_freq - 1);
    tim6::master_mode<tim6::mm_update>();
    //tim6::enable_update_interrupt();    // enable sampling frequency probe
    //interrupt::set<interrupt::TIM6_DACUNDER>();

    delay_line.setup();

    kernel.configure(q31_t(0.5), q31_t(.99));

    index = static_cast<float>(sample_freq) / 220.0;

    for (float t = 0;; t += 0.1)
    {
        static unsigned j = 0;

        led::toggle();
        sys_tick::delay_ms(2000);
//        index = 400. + 100. * sin(t);
        index = static_cast<float>(sample_freq) / ((j++ & 1) ? 220 : 330);
        trigger = true;
    }
}

