#pragma once

#include <widget.h>
#include "synth.h"
#include "types.h"

using namespace text;
using namespace color;
using namespace graphics;
using namespace fontlib;
using namespace synth;

struct show_note
{
    typedef float T;
    static const char *show(T x)
    {
        using namespace synth;

        float m = freq2midi(x);
        uint8_t n = midino(m), o;
        const char *s = note_octave(n, o);
        float f = midi2freq(n);
        int c = static_cast<int>(cents(f, x));

        sprintf(tmp_buf, "%s%d %s%d", s, o, c > 0 ? "+" : "", c);
        return tmp_buf;
    }
};

struct show_scale
{
    typedef scale_t T;
    static const char *show(T x)
    {
        switch (x)
        {
        case unscaled:      return "-";
        case chromatic:     return "Chromatic";
        case octatonic:     return "Octatonic";
        case heptatonic:    return "Heptatonic";
        case hexatonic:     return "Hexatonic";
        case pentatonic:    return "Pentatonic";
        case tetratonic:    return "Tetratonic";
        case tritonic:      return "Tritonic";
        case ditonic:       return "Ditonic";
        case monotonic:     return "Monotonic";
        default:            return "???";
        }
    }
};

struct edit_scale
{
    static void edit(volatile scale_t& x, int i)
    {
        int j = static_cast<int>(x) + i;

        x = static_cast<scale_t>(j < 0 ? scale_sentinel - 1 : (j < scale_sentinel ? j : 0));
    }
};

struct show_prog
{
    typedef prog_t T;
    static const char *show(T x)
    {
        switch (x)
        {
        case pg_freqmod:    return "FM";
        case pg_classic:    return "Classic";
        case pg_kick:       return "Kick";
        case pg_snare:      return "Snare";
        case pg_hihat:      return "Hi-hat";
        case pg_calib:      return "Calib";
        default:            return "???";
        }
    }
};

struct edit_prog
{
    static void edit(volatile prog_t& x, int i)
    {
        int j = static_cast<int>(x) + i;

        x = static_cast<prog_t>(j < 0 ? pg_sentinel - 1 : (j < pg_sentinel ? j : 0));
    }
};

struct show_waveform
{
    typedef waveform_t T;
    static const char *show(T x)
    {
        switch (x)
        {
        case wf_sine:       return "Sine";
        case wf_triangle:   return "Tri";
        case wf_sawtooth:   return "Saw";
        case wf_square:     return "Rect";
        default:            return "???";
        }
    }
};

struct edit_waveform
{
    static void edit(volatile waveform_t& x, int i)
    {
        int j = static_cast<int>(x) + i;

        x = static_cast<waveform_t>(j < 0 ? wf_sentinel - 1 : (j < wf_sentinel ? j : 0));
    }
};

static constexpr color_t normal_bg = medium_sea_green;
static constexpr color_t normal_fg = yellow;
static constexpr color_t alternate_bg = khaki;
static constexpr color_t alternate_fg = black;
static constexpr color_t dark_bg = dark_slate_gray;
static constexpr color_t dark_fg = white;
static constexpr color_t normal_cursor = light_green;
static constexpr color_t active_cursor = orange;

