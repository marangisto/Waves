#pragma once

#include "signal.h"
#include "utils.h"
#include <list.h>

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

template<typename DISPLAY>
struct oscillator_t
{
    typedef valuebox_t<DISPLAY, show_int> intlabel;
    typedef valuebox_t<DISPLAY, show_float<2>, edit_float<1> > floatbox;
    typedef valuebox_t<DISPLAY, show_waveform, edit_waveform > wavebox;

    void setup(uint8_t i)
    {
        const fontlib::font_t& font = fontlib::cmunvt_28;

        m_opno.setup(font, dark_fg, dark_bg, i);
        m_waveform.setup(font, normal_fg, normal_bg, wf_sine);
        m_ratio.setup(font, normal_fg, normal_bg, 1.0f);
        m_attack.setup(font, normal_fg, normal_bg, 1.0f);
        m_decay.setup(font, normal_fg, normal_bg, 8.0f);
        m_column.setup();
        m_column.append(&m_opno);
        m_column.append(&m_waveform);
        m_column.append(&m_ratio);
        m_column.append(&m_attack);
        m_column.append(&m_decay);
        m_frame.setup(&m_column, dim_gray);
        m_carrier.setup(440.0f);
        m_carrier.m_waveform = m_waveform.ptr();;
    }

    void render()
    {
        m_frame.render();
    }

    list<ifocus*> navigation()
    {
        list<ifocus*> l;

        l.push_back(&m_waveform);
        l.push_back(&m_ratio);
        l.push_back(&m_attack);
        l.push_back(&m_decay);
        return l;
    }

    __attribute__((always_inline))
    inline void update(float freq)
    {
        m_carrier.control(freq * m_ratio);
    }

    __attribute__((always_inline))
    inline q31_t sample()
    {
        return response(m_envelope.sample()) * m_carrier.sample();
    }

    __attribute__((always_inline))
    inline void trigger()
    {
        m_envelope.set_a(m_attack * 0.01f);    // FIXME: curve control
        m_envelope.set_d(m_decay * 0.1f);      // FIXME: curve control
        m_envelope.trigger();
    }

    intlabel                                    m_opno;
    wavebox                                     m_waveform;
    floatbox                                    m_ratio;
    floatbox                                    m_attack;
    floatbox                                    m_decay;
    vertical_t<DISPLAY>                         m_column;
    border_t<DISPLAY>                           m_frame;
    signal_generator_t<classic, SAMPLE_FREQ>    m_carrier;
    ad_envelope_t<SAMPLE_FREQ>                  m_envelope;
};

template<typename DISPLAY>
struct osclabels_t
{
    typedef valuebox_t<DISPLAY, show_str> label;

    void setup()
    {
        const fontlib::font_t& font = fontlib::cmunvt_28;

        m_opno.setup(font, dark_fg, dark_bg, "op no");
        m_waveform.setup(font, normal_fg, normal_bg, "waveform");
        m_ratio.setup(font, normal_fg, normal_bg, "ratio");
        m_attack.setup(font, normal_fg, normal_bg, "attack");
        m_decay.setup(font, normal_fg, normal_bg, "decay");
        m_column.setup();
        m_column.append(&m_opno);
        m_column.append(&m_waveform);
        m_column.append(&m_ratio);
        m_column.append(&m_attack);
        m_column.append(&m_decay);
        m_frame.setup(&m_column, dim_gray);
    }

    void render()
    {
        m_frame.render();
    }

    label               m_opno;
    label               m_waveform;
    label               m_ratio;
    label               m_attack;
    label               m_decay;
    vertical_t<DISPLAY> m_column;
    border_t<DISPLAY>   m_frame;
};

template<typename DISPLAY>
struct classic_t: public imodel
{
    enum state_t { navigating, editing };
    static constexpr uint8_t num_ops = 2;
    typedef valuebox_t<DISPLAY, show_str> label;

    void setup()
    {
        m_panel.setup();
        m_labels.setup();
        m_panel.append(&m_labels.m_frame);

        for (uint8_t i = 0; i < num_ops; ++i)
        {
            m_ops[i].setup(i);
            m_panel.append(&m_ops[i].m_frame);
            m_navigation.splice(m_navigation.end(), m_ops[i].navigation());
        }
        m_panel.constrain(10, 240, 10, 240); // fixme: what about zero min?
        m_panel.layout(0, 0);

        m_focus = m_navigation.begin();
        (*m_focus)->focus(normal_cursor);
    }

    void render()
    {
        m_panel.render();
    }

    bool handle_message(const message_t& m)
    {
        switch (m.index())
        {
        case button_press:
            switch (std::get<button_press>(m))
            {
            case 0: // encoder button
                m_state = m_state == navigating ? editing : navigating;
                (*m_focus)->focus(m_state == editing ? active_cursor : normal_cursor);
                break;
            case 1: // top-left
                return false;           // exit window
            case 2: // bottom-left
                break;
            case 3: // top-right
                return false;           // exit window
            case 4: // bottom-right
                break;
            default: ;  // unhandled button
            }
            break;
        case encoder_delta:
            if (m_state == navigating)
            {
                int dir = std::get<encoder_delta>(m);

                (*m_focus)->defocus();
                if (dir > 0 && ++m_focus == m_navigation.end())
                    m_focus = m_navigation.begin();
                else if (dir < 0 && --m_focus == m_navigation.end())
                    --m_focus;
                (*m_focus)->focus(normal_cursor);
            }
            else
                (*m_focus)->edit(std::get<encoder_delta>(m));
            break;
        default: ;      // unhandled message
        }

        return true;   // take more messages
    }

    // imodel

    virtual void generate(ctrl_t& ctx, int32_t *buf, uint16_t n, uint8_t stride)
    {
        q31_t w0(0.5f), w1 = q31_t(1.0f) - w0;

        for (uint8_t i = 0; i < num_ops; ++i)
            m_ops[i].update(ctx.freq);

        for (uint16_t i = 0; i < n; ++i, buf += stride)
        {
            q31_t y = w0 * m_ops[0].sample() + w1 * m_ops[1].sample();

            *buf = board::dacdma::swap(y.q);
        }
    }

    virtual void trigger(bool rise)
    {
        if (rise)
            for (uint8_t i = 0; i < num_ops; ++i)
                m_ops[i].trigger();
    }

    osclabels_t<DISPLAY>    m_labels;
    oscillator_t<DISPLAY>   m_ops[num_ops];
    horizontal_t<DISPLAY>   m_panel;
    list<ifocus*>           m_navigation;
    list_iterator<ifocus*>  m_focus;
    state_t                 m_state;
};

