#pragma once

#include <algorithm>

namespace synth
{

template<uint32_t SAMPLE_FREQ>
class ad_envelope_t
{
public:
    static constexpr float dt = 1. / SAMPLE_FREQ;

    ad_envelope_t(): m_t(.0) {}

    void trigger()
    {
        m_t = .0;
    }

    float sample()
    {
        float y = m_t < m_a ? m_t * m_1_a : (m_t < m_a + m_d ? 1. - (m_t - m_a) * m_1_d : .0);
        m_t += dt;
        return y;
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

