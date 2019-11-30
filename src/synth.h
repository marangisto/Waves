#pragma once

#include <algorithm>

namespace synth
{

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

template<uint32_t SAMPLE_FREQ>
class ad_envelope_t
{
public:
    static constexpr float dt = 1. / SAMPLE_FREQ;

    ad_envelope_t(): m_t(.0) {}

    void trigger()
    {
        m_t = m_a * sample();
    }

    float sample()
    {
        float t = m_t;

        m_t += dt;

        if (t < m_a)
            return t * m_1_a;
        else if (t < m_a + m_d)
            return 1. - (t - m_a) * m_1_d;
        else
            return .0;
    }

    void set_a(float a)
    {
        m_a = std::max(a, dt);
        m_1_a = 1. / m_a;
    }

    void set_d(float d)
    {
        m_d = std::max(d, dt);
        m_1_d = 1. / m_d;
    }

private:
    float   m_t;
    float   m_a;
    float   m_1_a;
    float   m_d;
    float   m_1_d;
};

} // namespace synth

