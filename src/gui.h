#pragma once

#include <list.h>
#include "utils.h"
#include "control.h"
#include "freqmod.h"
//#include "classic.h"
//#include "kick.h"
//#include "snare.h"
//#include "hihat.h"
//#include "calib.h"

template<ch_t CH, typename DISPLAY>
struct channel_t: border_t<DISPLAY>, imodel
{
    typedef valuebox_t<DISPLAY, show_str> label;
    typedef valuebox_t<DISPLAY, show_note> notebox;
    typedef valuebox_t<DISPLAY, show_prog, edit_prog> progbox;
    typedef valuebox_t<DISPLAY, show_int, edit_int> intbox;
    typedef valuebox_t<DISPLAY, show_float<3>, edit_float<1000> > floatbox;
    typedef valuebox_t<DISPLAY, show_scale, edit_scale> scalebox;

    channel_t(const theme_t& t, const bool& quiet)
        : border_t<DISPLAY>(&m_column)
        , m_note(t, 440.0f)
        , m_freq(t, 440.000f)
        , m_cv1(t, 0)
        , m_cv2(t, 0)
        , m_cv3(t, 0)
        , m_prog(t, pg_freqmod)
        , m_scale(t, unscaled)
        , m_transpose(t, 0)
        , m_tuning(t, 0.0f)
        , m_column
            ( &m_note, &m_freq, &m_cv1, &m_cv2, &m_cv3
            , &m_prog, &m_scale, &m_transpose, &m_tuning
            )
        , m_freqmod(t)
        , m_quiet(quiet)
    {
        m_voct.setup(m_tuning.ptr(), m_transpose.ptr(), m_scale.ptr());
        /*
        m_classic.setup();
        m_kick.setup();
        m_snare.setup();
        m_hihat.setup();
        m_calib.setup();
        */
    }

    window_t<DISPLAY> *program()
    {
        switch (m_prog)
        {
            case pg_freqmod:    return &m_freqmod;
/*
            case pg_classic:    return &m_classic;
            case pg_kick:       return &m_kick;
            case pg_snare:      return &m_snare;
            case pg_hihat:      return &m_hihat;
            case pg_calib:      return &m_calib;
*/
            default:            return &m_freqmod;  // safety first
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
        if (!m_quiet)
        {
            m_note = m_freq = m_voct.freq(ctrl.freq);
            m_cv1 = ctrl.cv1;
            m_cv2 = ctrl.cv2;
            m_cv3 = ctrl.cv3;
        }
    }

    // imodel

    virtual void generate(ctrl_t& ctrl, int32_t *buf, uint16_t n, uint8_t stride)
    {
        ctrl.freq = m_voct.freq(ctrl.freq);

        switch (m_prog)
        {
            case pg_freqmod:    m_freqmod.generate(ctrl, buf, n, stride); break;
/*
            case pg_classic:    m_classic.generate(ctrl, buf, n, stride); break;
            case pg_kick:       m_kick.generate(ctrl, buf, n, stride); break;
            case pg_snare:      m_snare.generate(ctrl, buf, n, stride); break;
            case pg_hihat:      m_hihat.generate(ctrl, buf, n, stride); break;
            case pg_calib:      m_calib.generate(ctrl, buf, n, stride); break;
*/
            default: ;
        }
    }

    virtual void trigger(bool rise)
    {
        switch (m_prog)
        {
            case pg_freqmod:    m_freqmod.trigger(rise); break;
/*
            case pg_classic:    m_classic.trigger(rise); break;
            case pg_kick:       m_kick.trigger(rise); break;
            case pg_snare:      m_snare.trigger(rise); break;
            case pg_hihat:      m_hihat.trigger(rise); break;
            case pg_calib:      m_calib.trigger(rise); break;
*/
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
    voct_t                  m_voct;
    freqmod_t<CH, DISPLAY>  m_freqmod;
/*
    classic_t<DISPLAY>      m_classic;
    kick_t<DISPLAY>         m_kick;
    snare_t<DISPLAY>        m_snare;
    hihat_t<DISPLAY>        m_hihat;
    calib_t<DISPLAY>        m_calib;
*/
    const bool&             m_quiet;
};

template<typename DISPLAY>
struct gui_t: window_t<DISPLAY>
{
    enum state_t { navigating, editing, prog_a, prog_b };

    gui_t(const theme_t& t)
        : channel_a(t, quiet)
        , channel_b(t, quiet)
        , load(t)
        , inner(&channel_a, &channel_b)
        , panel(&inner, &load)
    {
        list<ifocus*> navigation = channel_a.navigation();

        navigation.splice(navigation.end(), channel_b.navigation());
        quiet = false;
        window_t<DISPLAY>::setup(&panel, navigation, t);
    }

    virtual void render()
    {
        quiet = false;
        window_t<DISPLAY>::render();
    }

    virtual action_t handle_message(const message_t& m)
    {
        switch (m.index())
        {
        case button_press:
            switch (std::get<button_press>(m))
            {
            case 0:
                quiet = true;
                return action_t().emplace<push_window>(channel_a.program());
            case 2:
                quiet = true;
                return action_t().emplace<push_window>(channel_b.program());
            default:
                ; // fall through to this window handler
            }
        default:
            return window_t<DISPLAY>::handle_message(m);
        }
    }

    using pctbox = valuebox_t<DISPLAY, show_percent<1>>;

    channel_t<A, DISPLAY>   channel_a;
    channel_t<B, DISPLAY>   channel_b;
    pctbox                  load;
    horizontal_t<DISPLAY>   inner;
    vertical_t<DISPLAY>     panel;
    list<ifocus*>           navigation;
    list_iterator<ifocus*>  focus;
    state_t                 state;
    bool                    quiet;
};

