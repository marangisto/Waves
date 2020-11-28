#include <types.h>
#include <fixed.h>
#include <numeric.h>
#include <cstdlib>
#include <algorithm>

using namespace fixed;

static constexpr q31_t zero = q31_t(.0);
static constexpr q31_t one = q31_t(1.);
static constexpr q31_t half = q31_t(.5);

extern const q31_t *epanechnikov(unsigned n);

template<typename T>
static inline T clamp(const T& x, const T& a, const T& b)
{
    return std::max(a, std::min(b, x));
}

template<unsigned N>
struct delay_line_t
{
    void setup()
    {
        m_pos = 0;

        for (unsigned i = 0; i < N; ++i)
            m_buf[i] = q31_t();
    }

    __attribute__((always_inline))
    inline q31_t write(q31_t x)
    {
        m_buf[m_pos++] = x;
        if (static_cast<unsigned>(m_pos) >= N)
            m_pos = 0;
        return x;
    }

    __attribute__((always_inline))
    inline q31_t read(unsigned tap)
    {
        int j = m_pos - tap;

        return m_buf[j < 0 ? j + N : j];
    }

    int      m_pos;
    q31_t    m_buf[N];
};

// Create fractionally shifted kernel of order n
// into buffer and return the mid-point index.
// Note that kernel n has n + 1 elements and
// thus the interpolated kernel has n + 1 + 1
// = n + 2 elements because of the shifted values.

static unsigned shift_kernel(q31_t *buf, unsigned n, q31_t frac)
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

template<unsigned N>
struct karplus_strong_t: igenerator
{
    // igenerator

    virtual void trigger(bool rise = true)
    {
        if (rise)
            excite = index;
    }

    virtual void pitch(float freq)
    {
        set_freq(freq, m_kno);
    }

    virtual void modify(uint8_t i, float x)
    {
        switch (i)
        {
        case 0:
            m_mix = q31_t(clamp<float>(exp6(5. * (x - 1.)), .0, 1.));
            break;
        case 1:
            m_exvol = q31_t(clamp<float>(exp6(5. * (x - 1.)), .0, 1.));
            break;
        case 2:
            set_freq(m_freq, clamp<uint16_t>(x * 30. + 1., 1, 31));
            break;
        }
    }

    /*
    virtual void generate(uint16_t *buf, uint16_t len, uint8_t stride)
    {
        for (uint16_t i = 0; i < len; ++i, buf += stride)
            *buf = sample();
    }
    */

    virtual void generate(int32_t *buf, uint16_t len, uint8_t stride)
    {
        for (uint16_t i = 0; i < len; ++i, buf += stride)
            *buf = swap16(sample());
    }

    void setup()
    {
        excite = 0;
        delay.setup();
        set_freq(440.);
        count = 0;
        m_mix = q31_t(.0);
        m_exvol = q31_t(0.5);
    }

    void set_freq(float freq, unsigned kno = 1)
    {
        // FIXME: is there a better way to share state?
        m_kno = kno;
        m_freq = freq;

        unsigned undersample = 0;
        float period = static_cast<float>(SAMPLE_FREQ) / freq;

        while (period > N - 31)     // kernel margin
        {
            period *= 0.5;
            ++undersample;
        }

        {
            critical_section_t cs;

            index = period;
            mid = shift_kernel(kernel, kno, q31_t(period - index));
            width = kno + 2;
            mask = (1 << undersample) - 1;
        }
    }

/*
    __attribute__((always_inline))
    inline uint16_t sample()
    {
        if (!mask || !(count++ & mask))
            last = 2048 + (step().q >> 20);

        return last;
    }
*/

    __attribute__((always_inline))
    inline int32_t sample()
    {
        if (!mask || !(count++ & mask))
            last = step().q;

        return last;
    }

    __attribute__((always_inline))
    inline q31_t step()
    {
        if (excite)
        {
            q31_t noise = q31_t(static_cast<int32_t>(rand()) << 1);
            q31_t pulse = q31_t(excite < (index >> 1) ? 0.99 : -0.99);

            --excite;

            // FIXME: add excitation amplitude for velocity

            return m_exvol * delay.write
                ( (one - m_mix) * noise
                + m_mix * pulse
                );
        }
        else
        {
            q31_t s = zero;

            for (unsigned k = 0; k < width; ++k)
                s = s + kernel[k] * delay.read(index + k - mid);

            return delay.write(half * s + q31_t(0.500) * s);
        }
    }

    delay_line_t<N>     delay;
    q31_t               kernel[33];     // usable for orders 1..31
    volatile unsigned   mid;
    volatile unsigned   width;
    volatile unsigned   index;
    volatile unsigned   excite;
    volatile unsigned   count;
    volatile unsigned   mask;
    int32_t             last;
    // modulation parameters
    volatile q31_t      m_mix;
    volatile q31_t      m_exvol;
    // state marshalling
    uint16_t            m_kno;
    float               m_freq;
};

