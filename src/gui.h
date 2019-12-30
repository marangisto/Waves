#pragma once

#include <list.h>
#include "utils.h"
#include "control.h"
#include "freqmod.h"
#include "classic.h"
#include "kick.h"
#include "snare.h"

template<typename DISPLAY>
struct channel_t: public imodel
{
    typedef valuebox_t<DISPLAY, show_str> label;
    typedef valuebox_t<DISPLAY, show_note> notebox;
    typedef valuebox_t<DISPLAY, show_prog, edit_prog> progbox;
    typedef valuebox_t<DISPLAY, show_int, edit_int> intbox;
    typedef valuebox_t<DISPLAY, show_float<3>, edit_float<1000> > floatbox;
    typedef valuebox_t<DISPLAY, show_scale, edit_scale> scalebox;

    void setup(const bool *quiet)
    {
        const fontlib::font_t& font = fontlib::cmunvt_28;
        const fontlib::font_t& large = fontlib::cmunssdc_32;

        m_note.setup(large, dark_fg, dark_bg, 440.0f, quiet);
        m_freq.setup(font, alternate_fg, alternate_bg, 440.000f, quiet);
        m_cv1.setup(font, alternate_fg, alternate_bg, 0, quiet);
        m_cv2.setup(font, alternate_fg, alternate_bg, 0, quiet);
        m_cv3.setup(font, alternate_fg, alternate_bg, 0, quiet);
        m_prog.setup(font, normal_fg, normal_bg, pg_freqmod);
        m_scale.setup(font, normal_fg, normal_bg, chromatic);
        m_transpose.setup(font, normal_fg, normal_bg, 0);
        m_tuning.setup(font, normal_fg, normal_bg, 0.0f);
        m_column.setup();
        m_column.append(&m_note);
        m_column.append(&m_freq);
        m_column.append(&m_cv1);
        m_column.append(&m_cv2);
        m_column.append(&m_cv3);
        m_column.append(&m_prog);
        m_column.append(&m_scale);
        m_column.append(&m_transpose);
        m_column.append(&m_tuning);
        m_frame.setup(&m_column, dim_gray);
        m_voct.setup(m_tuning.ptr(), m_transpose.ptr(), m_scale.ptr());
        m_freqmod.setup();
        m_classic.setup();
        m_kick.setup();
        m_snare.setup();
    }

    void render()
    {
        m_frame.render();
    }

    void prog_render()
    {
        switch (m_prog)
        {
            case pg_freqmod:    m_freqmod.render(); break;
            case pg_classic:    m_classic.render(); break;
            case pg_kick:       m_kick.render(); break;
            case pg_snare:      m_snare.render(); break;
            default: ;
        }
    }

    bool prog_handle_message(const message_t& m)
    {
        switch (m_prog)
        {
            case pg_freqmod:    return m_freqmod.handle_message(m);
            case pg_classic:    return m_classic.handle_message(m);
            case pg_kick:       return m_kick.handle_message(m);
            case pg_snare:      return m_snare.handle_message(m);
            default:            return false;
        }
    }

    list<ifocus*> navigation()
    {
        list<ifocus*> l;

        l.push_back(&m_prog);
        l.push_back(&m_scale);
        l.push_back(&m_transpose);
        l.push_back(&m_tuning);
        return l;
    }

    void update(const ctrl_t& ctrl)
    {
        m_note = m_freq = m_voct.freq(ctrl.freq);
        m_cv1 = ctrl.cv1;
        m_cv2 = ctrl.cv2;
        m_cv3 = ctrl.cv3;
    }

    // imodel

    virtual void generate(ctrl_t& ctrl, int32_t *buf, uint16_t n, uint8_t stride)
    {
        ctrl.freq = m_voct.freq(ctrl.freq);

        switch (m_prog)
        {
            case pg_freqmod:    m_freqmod.generate(ctrl, buf, n, stride); break;
            case pg_classic:    m_classic.generate(ctrl, buf, n, stride); break;
            case pg_kick:       m_kick.generate(ctrl, buf, n, stride); break;
            case pg_snare:      m_snare.generate(ctrl, buf, n, stride); break;
            default: ;
        }
    }

    virtual void trigger(bool rise)
    {
        switch (m_prog)
        {
            case pg_freqmod:    m_freqmod.trigger(rise); break;
            case pg_classic:    m_classic.trigger(rise); break;
            case pg_kick:       m_kick.trigger(rise); break;
            case pg_snare:      m_snare.trigger(rise); break;
            default: ;
        }
    }

    notebox                 m_note;
    floatbox                m_freq;
    intbox                  m_cv1, m_cv2, m_cv3;
    progbox                 m_prog;
    scalebox                m_scale;
    intbox                  m_transpose;
    floatbox                m_tuning;
    vertical_t<DISPLAY>     m_column;
    border_t<DISPLAY>       m_frame;
    voct_t                  m_voct;
    freqmod_t<DISPLAY>      m_freqmod;
    classic_t<DISPLAY>      m_classic;
    kick_t<DISPLAY>         m_kick;
    snare_t<DISPLAY>        m_snare;
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
        load.setup(font, gold, dark_bg, 0.0f, &quiet);
        inner.setup();
        inner.append(&channel_a.m_frame);
        inner.append(&channel_b.m_frame);
        panel.setup();
        panel.append(&inner);
        panel.append(&load);
        panel.constrain(10, 240, 10, 480); // FIXME: LAYOUT HACK! & what about zero min?
        panel.layout(0, 0);
        navigation = channel_a.navigation();
        navigation.splice(navigation.end(), channel_b.navigation());
        focus = navigation.begin();
        (*focus)->focus(normal_cursor);
        quiet = false;
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
                (*focus)->focus(state == editing ? active_cursor : normal_cursor);
                break;
            case 1: // top-left
                state = prog_a;
                render();
                break;
            case 2: // bottom-left
                break;
            case 3: // top-right
                state = prog_b;
                render();
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

                (*focus)->defocus();
                if (dir > 0 && ++focus == navigation.end())
                    focus = navigation.begin();
                else if (dir < 0 && --focus == navigation.end())
                    --focus;
                (*focus)->focus(normal_cursor);
            }
            else
                (*focus)->edit(std::get<encoder_delta>(m));
            break;
        default: ;      // unhandled message
        }
    }

    channel_t<DISPLAY>      channel_a, channel_b;
    pctbox                  load;
    horizontal_t<DISPLAY>   inner;
    vertical_t<DISPLAY>     panel;
    list<ifocus*>           navigation;
    list_iterator<ifocus*>  focus;
    state_t                 state;
    bool                    quiet;
};

