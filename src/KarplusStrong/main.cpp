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

static constexpr uint32_t sample_freq = 96000;
static constexpr uint8_t dac_dma_ch = 1;
static constexpr uint16_t buffer_size = 256; // N.B. even!
static constexpr uint16_t half_buffer_size = buffer_size >> 1;
static uint16_t buffer[buffer_size];

using led = output_t<PA5>;
using probe = output_t<PA8>;

static constexpr unsigned lo_freq = 20;
static constexpr unsigned wg_len = sample_freq / lo_freq;

static constexpr q31_t zero = q31_t(.0);
static constexpr q31_t one = q31_t(1.);

extern const q31_t *epanechnikov(unsigned n);

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

// Create fractionally shifted kernel of order n
// into buffer and return the mid-point index.
// Note that kernel n has n + 1 elements and
// thus the interpolated kernel has n + 1 + 1
// = n + 2 elements because of the shifted values.

static unsigned make_kernel(q31_t *buf, unsigned n, q31_t frac)
{
    const q31_t *p = epanechnikov(n);

    if (p)
    {
        const q31_t w(one - frac);

        buf[0] = w * p[0];
        for (unsigned i = 1; i <= n; ++i)
            buf[i] = w * p[i] + frac * p[i-1];
        buf[n+1] = frac * p[n];
    }
    else
        for (unsigned i = 0; i <= n + 1; ++i)
            buf[i] = zero;
    return n >> 1;
}

static delay_line_t delay_line;
static volatile bool trigger = false;
static volatile unsigned index = 400;
static q31_t kernel[33]; // usable for orders 1..31
static volatile unsigned kernel_order = 31;
static volatile unsigned kernel_mid = 2;

static void set_freq(float freq, unsigned ko = 1)
{
    float period = static_cast<float>(sample_freq) / freq;

    index = period;
    kernel_order = ko;
    kernel_mid = make_kernel(kernel, kernel_order, q31_t(period - index));
}

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
        q31_t mix(0.9);
        q31_t noise = q31_t(static_cast<int32_t>(rand()) << 1);
        q31_t pulse = q31_t(excite > (index >> 1) ? 0.99 : -0.99);

        return q31_t(0.5) * delay_line.write
            ( mix * noise
            + (q31_t(1.0) - mix) * pulse
            );
    }
    else
    {
        q31_t s = q31_t(.0);
        unsigned kernel_width = kernel_order + 2;

        for (unsigned k = 0; k < kernel_width; ++k)
            s = s + kernel[k] * delay_line.read(index + k - kernel_mid);

        return delay_line.write(q31_t(0.5) * s + q31_t(0.500) * s);
    }
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

    for (;;)
      for (unsigned i = 0; i <= 12; ++i)
        {
            led::toggle();
            sys_tick::delay_ms(2000);
            set_freq(110. * pow(2., static_cast<float>(i) / 12.), 1);
            trigger = true;
        }
}

