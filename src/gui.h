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

static constexpr color_t normal_bg = slate_gray;
static constexpr color_t normal_fg = yellow;
static constexpr color_t normal_cursor = light_green;
static constexpr color_t active_cursor = orange;

template<typename DISPLAY>
struct channel_t
{
    typedef valuebox_t<DISPLAY, show_str> label;
    typedef valuebox_t<DISPLAY, show_prog, edit_prog> progbox;
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

        prog.setup(font, normal_fg, normal_bg, pg_freqmod);
        note.setup(large, orange, dark_slate_gray, 440.0f);
        freq.setup(font, normal_fg, normal_bg, 440.000f);
        cv1.setup(font, normal_fg, normal_bg, 0);
        cv2.setup(font, normal_fg, normal_bg, 0);
        cv3.setup(font, normal_fg, normal_bg, 0);
        column.setup();
        column.append(&prog);
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

    void update()
    {
        if (freq != last_freq)
            note = last_freq = freq;
    }

    progbox             prog;
    notebox             note;
    floatbox            freq;
    intbox              cv1, cv2, cv3;
    vertical_t<DISPLAY> column;
    border_t<DISPLAY>   frame;
    float               last_freq;
};

template<typename DISPLAY>
struct gui_t
{
    enum state_t { navigating, editing };

    void setup()
    {
        channel_a.setup();
        channel_b.setup();
        panel.append(&channel_a.frame);
        panel.append(&channel_b.frame);
        panel.constrain(10, 240, 10, 240); // fixme: what about zero min?
        panel.layout(0, 0);
        focus[0] = &channel_a.prog;
        focus[1] = &channel_b.prog;
        pos = 0;
        state = navigating;
        focus[pos]->focus(normal_cursor);
    }

    void render()
    {
        panel.render();
    }

    void handle_message(const message_t& m)
    {
        static constexpr uint8_t npos = sizeof(focus) / sizeof(*focus);

        switch (m.index())
        {
        case button_press:
            switch (std::get<button_press>(m))
            {
            case 0: // encoder button
                state = state == navigating ? editing : navigating;
                focus[pos]->focus(state == editing ? active_cursor : normal_cursor);
                break;
            case 1: // top-left
                break;
            case 2: // bottom-left
                break;
            case 3: // top-right
                break;
            case 4: // bottom-right
                break;
            default: ;  // unhandled button
            }
            break;
        case encoder_delta:
            if (state == navigating)
            {
                int dir = std::get<encoder_delta>(m);

                focus[pos]->defocus();
                if (dir > 0 && ++pos >= npos)
                    pos = 0;
                if (dir < 0 && pos-- == 0)
                    pos = npos - 1;
                focus[pos]->focus(light_green);
            }
            else
            {
                focus[pos]->edit(std::get<encoder_delta>(m));
                channel_a.update();
            }
            break;
        default: ;      // unhandled message
        }
    }

    channel_t<DISPLAY>      channel_a, channel_b;
    horizontal_t<DISPLAY>   panel;
    ifocus                  *focus[2];
    uint8_t                 pos;
    state_t                 state;
};

