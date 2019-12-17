#pragma once

#include <fixed.h>
#include <cordic.h>

using namespace fixed;

void setup_cordic()
{
    typedef hal::cordic::cordic_t cordic;   // FIXME: leaking device into here?

    cordic::setup<cordic::sine, 4>();
}

template<typename WAVEGEN, uint32_t SAMPLE_FREQ>
class signal_generator_t
{
public:
    void setup(float freq = 440.)
    {
        m_phi = -1.;
        set_freq(freq);
    }

    void set_freq(float freq)
    {
        m_dphi = ftoq31(2. * freq / SAMPLE_FREQ);
    }

    int32_t sample()
    {
        int32_t s = WAVEGEN::value(m_phi);              // generate signal value

        m_phi += m_dphi;                                // advance angle
        return s;
    }

private:
    int32_t             m_phi;      // FIXME: q31!
    volatile int32_t    m_dphi;     // FIXME: q31!
};

struct sine
{
    typedef hal::cordic::cordic_t cordic;   // FIXME: leaking device into here?

    static inline int32_t value(int32_t phi)    // FIXME: q31!
    {
        using namespace hal::cordic;

        return cordic::compute(phi);
    }
};

struct triangle
{
    static inline int32_t value(float phi)    // FIXME: q31!
    {
        if (phi < -.5)
            return ftoq31(2. * phi + 2.);
        else if (phi < .5)
            return ftoq31(-2. * phi);
        else
            return ftoq31(2 * phi - 2.);
        return ftoq31(phi);
    }
};

struct sawtooth
{
    static inline int32_t value(int32_t phi)    // FIXME: q31!
    {
        return phi;
    }
};

struct square
{
    static inline int32_t value(int32_t phi)    // FIXME: q31!
    {
        return phi < 0 ? q31_t::max_val.q : q31_t::min_val.q;
    }
};

struct mixed
{
    static inline int32_t value(float phi)    // FIXME: q31!
    {
        switch (m_mode)
        {
            case 0: return sine::value(phi);
            case 1: return triangle::value(phi);
            case 2: return sawtooth::value(phi);
            case 3: return square::value(phi);
            default: return 0;
        }
    }

    static uint8_t m_mode;
};

uint8_t mixed::m_mode = 0;

