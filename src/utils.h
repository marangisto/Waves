#pragma once

#include <widget.h>
#include <synth.h>
#include <message.h>

using namespace text;
using namespace color;
using namespace graphics;
using namespace fontlib;
using namespace waves;

static char tmp_buf[256];

struct show_str
{
    typedef const char *T;
    static const char *show(T x) { return x; }
};

struct show_int
{
    typedef int T;
    static const char *show(T x) { sprintf(tmp_buf, "%d", x); return tmp_buf; }
};

struct edit_int
{
    static void edit(volatile int& x, int i) { x += i; }
};

template<int DECIMALS>
struct show_float
{
    typedef float T;
    static const char *show(T x) { sprintf(tmp_buf, "%.*f", DECIMALS, x); return tmp_buf; }
};

template<int DIVISOR>
struct edit_float
{
    static void edit(volatile float& x, int i) { x += static_cast<float>(i) / DIVISOR; }
};

template<int DECIMALS>
struct show_percent
{
    typedef float T;
    static const char *show(T x) { sprintf(tmp_buf, "%.*f%%", DECIMALS, x * 100.0f); return tmp_buf; }
};

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

enum prog_t
    { pg_freqmod
    , pg_classic
    , pg_noise
    , pg_sentinel
    };

struct show_prog
{
    typedef prog_t T;
    static const char *show(T x)
    {
        switch (x)
        {
        case pg_freqmod: return "FM";
        case pg_classic: return "Classic";
        case pg_noise: return "Noise";
        default: return "???";
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

static constexpr color_t normal_bg = cornflower_blue;
static constexpr color_t normal_fg = yellow;
static constexpr color_t alternate_bg = color::tan;
static constexpr color_t alternate_fg = black;
static constexpr color_t dark_bg = dark_slate_gray;
static constexpr color_t dark_fg = white;
static constexpr color_t normal_cursor = light_green;
static constexpr color_t active_cursor = orange;

