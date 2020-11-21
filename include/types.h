#pragma once

enum prog_t
    { pg_freqmod
    , pg_karplus
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

struct igenerator: itrigger
{
    virtual void pitch(float freq) = 0;
    virtual void modify(uint8_t i, float x) = 0;
    virtual void generate(int32_t *buf, uint16_t len, uint8_t stride) = 0;
};

__attribute__((always_inline))
static inline uint32_t swap16(uint32_t x)
{
    return x << 16 | x >> 16;
}

