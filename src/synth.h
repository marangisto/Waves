#pragma once

#include <algorithm>
#include <fixed.h>

namespace synth
{

using namespace fixed;

static inline float exp6(float x)
{
    x = 1. + x / 64;
    x *= x; x *= x; x *= x;
    x *= x; x *= x; x *= x;
    return x;
}

static inline float exp_response(float x)
{
    static constexpr float a = log(1e-3);

    return exp6(a * (1. - x));
}

__attribute__((always_inline))
static inline q31_t response(q31_t x)
{
    static constexpr q31_t k = q31_t(log(1e-3) / 64.0f);
    static constexpr q31_t one = q31_t(1.0);

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

