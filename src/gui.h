#pragma once

#include "utils.h"
#include "freqmod.h"

template<typename DISPLAY>
struct channel_t
{
    typedef valuebox_t<DISPLAY, show_str> label;
    typedef valuebox_t<DISPLAY, show_prog, edit_prog> progbox;
    typedef valuebox_t<DISPLAY, show_int, edit_int> intbox;
    typedef valuebox_t<DISPLAY, show_float<2>, edit_float<1> > floatbox;
    typedef valuebox_t<DISPLAY, show_note> notebox;

    void setup(const bool *quiet)
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

        note.setup(large, dark_fg, dark_bg, 440.0f, quiet);
        freq.setup(font, normal_fg, normal_bg, 440.000f, quiet);
        cv1.setup(font, normal_fg, normal_bg, 0, quiet);
        cv2.setup(font, normal_fg, normal_bg, 0, quiet);
        cv3.setup(font, normal_fg, normal_bg, 0, quiet);
        prog.setup(font, normal_fg, normal_bg, pg_freqmod);
        column.setup();
        column.append(&note);
        column.append(&freq);
        column.append(&cv1);
        column.append(&cv2);
        column.append(&cv3);
        column.append(&prog);
        frame.setup(&column, dim_gray);
        freqmod_ui.setup();
    }

    void render()
    {
        frame.render();
    }

    void prog_render()
    {
        switch (prog)
        {
            case pg_freqmod: freqmod_ui.render(); break;
            default: ;
        }
    }

    bool prog_handle_message(const message_t& m)
    {
        switch (prog)
        {
            case pg_freqmod: return freqmod_ui.handle_message(m);
            default: return false;
        }
    }

    notebox                 note;
    floatbox                freq;
    intbox                  cv1, cv2, cv3;
    progbox                 prog;
    vertical_t<DISPLAY>     column;
    border_t<DISPLAY>       frame;
    float                   last_freq;
    freqmod_ui_t<DISPLAY>   freqmod_ui;
};

template<typename DISPLAY>
struct gui_t
{
    typedef valuebox_t<DISPLAY, show_percent<1> > pctbox;
    enum state_t { navigating, editing, prog_a, prog_b };

    void setup()
    {
        const fontlib::font_t& font = fontlib::cmunvt_28;

        channel_a.setup(&quiet);
        channel_b.setup(&quiet);
        load.setup(font, normal_fg, normal_bg, 0.0f, &quiet);
        inner.setup();
        inner.append(&channel_a.frame);
        inner.append(&channel_b.frame);
        panel.setup();
        panel.append(&inner);
        panel.append(&load);
        panel.constrain(10, 240, 10, 480); // FIXME: LAYOUT HACK! & what about zero min?
        panel.layout(0, 0);
        focus[0] = &channel_a.prog;
        focus[1] = &channel_b.prog;
        pos = 0;
        state = navigating;
        quiet = false;
        focus[pos]->focus(normal_cursor);
    }

    void render()
    {
        DISPLAY::clear();
        switch (state)
        {
            case prog_a: quiet = true; channel_a.prog_render(); break;
            case prog_b: quiet = true; channel_b.prog_render(); break;
            default: quiet = false; panel.render();
        }
    }

    void handle_message(const message_t& m)
    {
        static constexpr uint8_t npos = sizeof(focus) / sizeof(*focus);

        switch (state)
        {
            case prog_a:
                if (!channel_a.prog_handle_message(m))
                {
                    state = navigating;
                    quiet = false;
                    panel.render();
                }
                return;
            case prog_b:
                if (!channel_b.prog_handle_message(m))
                {
                    state = navigating;
                    quiet = false;
                    panel.render();
                }
                return;
            default: ;
        }

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
                state = pos == 0 ? prog_a : prog_b;
                render();
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
                focus[pos]->edit(std::get<encoder_delta>(m));
            break;
        default: ;      // unhandled message
        }
    }

    channel_t<DISPLAY>      channel_a, channel_b;
    pctbox                  load;
    horizontal_t<DISPLAY>   inner;
    vertical_t<DISPLAY>     panel;
    ifocus                  *focus[2];
    uint8_t                 pos;
    state_t                 state;
    bool                    quiet;
};

