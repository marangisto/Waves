#pragma once

enum prog_t
    { pg_freqmod
    , pg_classic
    , pg_kick
    , pg_snare
    , pg_hihat
    , pg_sentinel
    };

enum waveform_t
    { wf_sine
    , wf_triangle
    , wf_sawtooth
    , wf_square
    , wf_sentinel
    };

enum ch_t
    { A
    , B
    };

struct ctrl_t
{
    float       freq;
    float       cv1;
    float       cv2;
    float       cv3;
};

struct itrigger
{
    virtual void trigger(bool rise = true) = 0;
};

struct igenerator
{
    virtual void trigger(bool rise = true) = 0;
    virtual void pitch(float freq) = 0;
    virtual void generate(uint16_t *buf, uint16_t len) = 0;
};

template<ch_t CH>
struct calibration
{
    static inline float cv(uint16_t adc)
    {
        return (m_x0 - static_cast<float>(adc)) * m_k;
    }

    static void set(float x0, float k)
    {
        m_x0 = x0;
        m_k = k;
    }

    static float m_x0, m_k;
};

