#pragma once

#include <cordic.h>

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
        m_dphi = 2. * freq / SAMPLE_FREQ;
    }

    float sample()
    {
        float s = WAVEGEN::value(m_phi);                // generate signal value

        if ((m_phi += m_dphi) >= 1.)                    // advance and wrap around
            m_phi -= 2.;
        return s;
    }

private:
    float           m_phi;
    volatile float  m_dphi;
};

struct sine
{
    typedef hal::cordic::cordic_t cordic;   // FIXME: leaking device into here?

    static inline float value(float phi)
    {
        using namespace hal::cordic;

        return q31tof(cordic::compute(ftoq31(phi)));
    }
};

struct triangle
{
    static inline float value(float phi)
    {
        if (phi < -.5)
            return 2. * phi + 2.;
        else if (phi < .5)
            return -2. * phi;
        else
            return 2 * phi - 2.;
        return phi;
    }
};

struct sawtooth
{
    static inline float value(float phi)
    {
        return phi;
    }
};

struct square
{
    static inline float value(float phi)
    {
        return phi < 0 ? 1. : -1.;
    }
};

struct mixed
{
    static inline float value(float phi)
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

