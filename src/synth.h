#pragma once

#include <algorithm>
#include <fixed.h>
#include <math.h>
#include "control.h"

namespace synth
{

using namespace fixed;

struct imodel
{
    virtual void generate(ctrl_t& ctx, int32_t *buf, uint16_t n, uint8_t stride) = 0;
    virtual void trigger(bool rise = true) = 0;
};

enum scale_t
    { unscaled
    , chromatic
    , octatonic
    , heptatonic
    , hexatonic
    , pentatonic
    , tetratonic
    , tritonic
    , ditonic
    , monotonic
    , scale_sentinel
    };

static inline float cv2midi(float cv)
{
    return 12.0 * cv + 69.0f;
}

static inline float freq2midi(float f)
{
    static constexpr float k = 12.0f / log(2.0f);
    static constexpr float z = 1.0f / 440.0f;

    return k * log(f * z) + 69.0f;
}

static inline float midi2freq(float m)
{
    static constexpr float d = 1.0f / 12.0f;

    return 440.0 * pow(2.0f, (m - 69.0f) * d);
}

static inline uint8_t midino(float m)
{
    return static_cast<uint8_t>(m + 0.5);
}

static const char *note_octave(uint8_t m, uint8_t& o)
{
    static const char *notes[] =
        { "C", "C#", "D", "D#", "E", "F"
        , "F#", "G", "G#", "A", "A#", "B"
        };

    m -= 12;
    o = m / 12;
    return notes[m % 12];
}

static const int8_t shift_to_scale(uint16_t s, uint8_t m)
{
    uint16_t b = 1 << (m % 12);

    for (uint8_t i = 0; i < 12; ++i)
        if ((b >> i) & s)
            return -i;
        else if ((b << i) & s)
            return i;
    return 0;               // never reached?
}

static inline float cents(float a, float b)
{
    static constexpr float k = 1200.0f / logf(2.0f);

    return k * logf(b / a);
}

class voct_t
{
public:
    void setup
        ( const volatile float *tuning
        , const volatile int *transpose
        , const volatile scale_t *scale
        )
    {
        m_tuning = tuning;
        m_transpose = transpose;
        m_scale = scale;
    }

    float freq(float cv)
    {
        float m = cv2midi(cv + *m_tuning) + *m_transpose;

        if (*m_scale == unscaled)
            return midi2freq(m);

        uint8_t n = midino(m);

        switch (*m_scale)
        {
            case chromatic:     return midi2freq(n);
            case octatonic:     return midi2freq(n + shift_to_scale(0b101101101101, n));
            case heptatonic:    return midi2freq(n + shift_to_scale(0b101010110101, n));
            case hexatonic:     return midi2freq(n + shift_to_scale(0b010101010101, n));
            case pentatonic:    return midi2freq(n + shift_to_scale(0b001010010101, n));
            case tetratonic:    return midi2freq(n + shift_to_scale(0b001001001001, n));
            case tritonic:      return midi2freq(n + shift_to_scale(0b000100010001, n));
            case ditonic:       return midi2freq(n + shift_to_scale(0b000001000001, n));
            case monotonic:     return midi2freq(n + shift_to_scale(0b000000000001, n));
            default: return midi2freq(m);
        }
    }
 
private:
    const volatile float *m_tuning;
    const volatile int *m_transpose;
    const volatile scale_t *m_scale;
};

static inline float exp6(float x)
{
    x = 1. + x / 64;
    x *= x; x *= x; x *= x;
    x *= x; x *= x; x *= x;
    return x;
}

__attribute__((always_inline))
static inline q31_t response(q31_t x)
{
    static constexpr q31_t k = q31_t(logf(1e-3f) / 64.0f);
    static constexpr q31_t one = q31_t(1.0f);

    x = (x - one) * k;
    x = x + one;
    x = x * x;
    x = x * x;
    x = x * x;
    x = x * x;
    x = x * x;
    x = x * x;
    return x;
}

template<uint32_t SAMPLE_FREQ>
class ad_envelope_t
{
public:
    enum state_t { stop, attack, decay };

    ad_envelope_t(): m_state(stop) {}

    __attribute__((always_inline))
    void trigger() { m_state = attack; }

    __attribute__((always_inline))
    inline q31_t sample()
    {
        switch (m_state)
        {
        case attack:
            if (q31_t::max_val - m_y < m_da)
            {
                m_y = q31_t::max_val;
                m_state = decay;
            }
            else
                m_y = m_y + m_da;   // FIXME: +=
            break;
        case decay:
            if (m_y < m_dd)
            {
                m_y = q31_t(0l);
                m_state = stop;
            }
            else
                m_y = m_y - m_dd;   // FIXME: -=
            break;
        case stop:
            break;
        }

        return m_y;
    }

    void set_a(float a) { m_da = a > 0.0f ? q31_t(1.0f / (a * SAMPLE_FREQ)) : q31_t::max_val; }
    void set_d(float d) { m_dd = d > 0.0f ? q31_t(1.0f / (d * SAMPLE_FREQ)) : q31_t::max_val; }

private:
    state_t m_state;
    q31_t   m_da;
    q31_t   m_dd;
    q31_t   m_y;
};

} // namespace synth

