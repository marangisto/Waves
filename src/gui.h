#pragma once

#include <widget.h>
#include <synth.h>

using namespace text;
using namespace color;
using namespace graphics;
using namespace fontlib;

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

static constexpr color_t normal_bg = slate_gray;
static constexpr color_t normal_fg = yellow;

template<typename DISPLAY>
struct channel_t
{
    typedef valuebox_t<DISPLAY, show_str> label;
    typedef valuebox_t<DISPLAY, show_int, edit_int> intbox;
    typedef valuebox_t<DISPLAY, show_float<2>, edit_float<1> > floatbox;
    typedef valuebox_t<DISPLAY, show_note> notebox;

    void setup()
    {
        //const fontlib::font_t& font = fontlib::cmunbi_28.cpp
        //const fontlib::font_t& font = fontlib::cmunbtl_28;
        //const fontlib::font_t& font = fontlib::cmunbto_28;
        //const fontlib::font_t& font = fontlib::cmunbx_28;
        //const fontlib::font_t& font = fontlib::cmunit_28;
        //const fontlib::font_t& font = fontlib::cmunrm_28;
        //const fontlib::font_t& font = fontlib::cmunsi_28;
        //const fontlib::font_t& font = fontlib::cmunso_28;
        //const fontlib::font_t& font = fontlib::cmunss_28;
        //const fontlib::font_t& font = fontlib::cmunssdc_28;
        //const fontlib::font_t& font = fontlib::cmunsx_28;
        //const fontlib::font_t& font = fontlib::cmuntb_28;
        //const fontlib::font_t& font = fontlib::cmunti_28;
        //const fontlib::font_t& font = fontlib::cmuntt_28;
        //const fontlib::font_t& font = fontlib::cmuntx_28;
        //const fontlib::font_t& font = fontlib::cmunvi_28;
        const fontlib::font_t& font = fontlib::cmunvt_28;
        const fontlib::font_t& large = fontlib::cmunssdc_32;

        note.setup(large, orange, dark_slate_gray, 440.0f);
        freq.setup(font, normal_fg, normal_bg, 440.000f);
        cv1.setup(font, normal_fg, normal_bg, 0);
        cv2.setup(font, normal_fg, normal_bg, 0);
        cv3.setup(font, normal_fg, normal_bg, 0);
        column.setup();
        column.append(&note);
        column.append(&freq);
        column.append(&cv1);
        column.append(&cv2);
        column.append(&cv3);
        frame.setup(&column, dim_gray);
    }

    void render()
    {
        frame.render();
    }

    notebox             note;
    floatbox            freq;
    intbox              cv1, cv2, cv3;
    vertical_t<DISPLAY> column;
    border_t<DISPLAY>   frame;
};

template<typename DISPLAY>
struct gui_t
{
    void setup()
    {
        channel_a.setup();
        channel_b.setup();
        q1.append(&channel_a.frame);
        q1.append(&channel_b.frame);
        q1.constrain(10, 240, 10, 240); // fixme: what about zero min?
        q1.layout(0, 0);
        focus[0] = &channel_a.freq;
        focus[1] = &channel_a.cv1;
        focus[2] = &channel_a.cv2;
        focus[3] = &channel_a.cv3;
    }

    void render()
    {
        q1.render();
    }

    void navigate(int dir)
    {
        static constexpr uint8_t npos = sizeof(focus) / sizeof(*focus);

        focus[pos]->defocus();
        if (dir > 0 && ++pos >= npos)
            pos = 0;
        if (dir < 0 && pos-- == 0)
            pos = npos - 1;
        focus[pos]->focus(light_green);
    }

    void edit_state(bool b)
    {
        focus[pos]->focus(b ? orange_red : light_green);
    }

    void edit(int i)
    {
        focus[pos]->edit(i);
    }

    channel_t<DISPLAY> channel_a, channel_b;
    horizontal_t<DISPLAY> q1;

    ifocus *focus[4];
    uint8_t pos = 0;
};

