#pragma once

#include <fixed.h>
#include <cordic.h>

using namespace fixed;

void setup_cordic()
{
    using namespace hal::cordic;

    cordic_t::setup<cordic_t::sine, 4>();
}

template<typename WAVEGEN, uint32_t SAMPLE_FREQ>
class signal_generator_t
{
public:
    void setup(float freq = 440.)
    {
        m_phi = q31_t::min_val;
        control(freq, 0.0f);
    }

    __attribute__((always_inline))
    inline void control(float freq, float idx)
    {
        float k = 2.0f * freq / SAMPLE_FREQ;

        m_dphi = q31_t(k);
        m_idx = q31_t(k * idx);
    }

    __attribute__((always_inline))
    inline q31_t sample(q31_t mod = q31_t())
    {
        q31_t s = WAVEGEN::value(m_phi);            // generate signal value

        m_phi = m_phi + m_dphi + mod * m_idx;       // advance angle
        return s;
    }

private:
    q31_t           m_phi;
    volatile q31_t  m_dphi;
    volatile q31_t  m_idx;
};

struct sine
{
    static inline q31_t value(q31_t phi)
    {
        using namespace hal::cordic;

        return q31_t(cordic_t::compute(phi.q));
    }
};


struct triangle
{
    static inline q31_t value(q31_t phi)
    {
        static constexpr q31_t one(q31_t(1.0f));
        static constexpr q31_t half(q31_t(0.5f));

        if (phi < -half)
            return q31_t::lshift(phi + one, 1);
        else if (phi < half)
            return q31_t::lshift(-phi, 1);
        else
            return q31_t::lshift(phi - one, 1);
    }
};

struct sawtooth
{
    static inline q31_t value(q31_t phi)
    {
        return phi;
    }
};

struct square
{
    static inline q31_t value(q31_t phi)
    {
        return phi < q31_t(0l) ? q31_t::max_val : q31_t::min_val;
    }
};

struct mixed
{
    static inline q31_t value(q31_t phi)
    {
        switch (m_mode)
        {
            case 0: return sine::value(phi);
            case 1: return triangle::value(phi);
            case 2: return sawtooth::value(phi);
            case 3: return square::value(phi);
            default: return q31_t(0l);
        }
    }

    static uint8_t m_mode;
};

uint8_t mixed::m_mode = 0;

