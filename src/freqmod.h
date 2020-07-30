#pragma once

#include "signal.h"
#include <list.h>

template<typename DISPLAY>
struct operator_t: border_t<DISPLAY>
{
    typedef valuebox_t<DISPLAY, show_int> intlabel;
    typedef valuebox_t<DISPLAY, show_float<2>, edit_float<1> > floatbox;

    operator_t(const theme_t& t, uint8_t i)
        : border_t<DISPLAY>(&m_column)
        , m_opno(t, i)
        , m_ratio(t, 1.0f)
        , m_index(t, 8.0f)
        , m_attack(t, 1.0f)
        , m_decay(t, 8.0f)
        , m_column(&m_opno, &m_ratio, &m_index, &m_attack, &m_decay)
    {
        m_carrier.setup(440.0f);
    }

    list<ifocus*> navigation()
    {
        list<ifocus*> l;

        l.push_back(&m_ratio);
        l.push_back(&m_index);
        l.push_back(&m_attack);
        l.push_back(&m_decay);
        return l;
    }

    __attribute__((always_inline))
    inline void update(float freq)
    {
        m_carrier.control(freq * m_ratio, m_index);
    }

    __attribute__((always_inline))
    inline q31_t sample(q31_t mod = q31_t())
    {
        return response(m_envelope.sample()) * m_carrier.sample(mod);
    }

    __attribute__((always_inline))
    inline void trigger()
    {
        m_envelope.set_a(m_attack * 0.01f);    // FIXME: curve control
        m_envelope.set_d(m_decay * 0.1f);      // FIXME: curve control
        m_envelope.trigger();
    }

    intlabel                                m_opno;
    floatbox                                m_ratio;
    floatbox                                m_index;
    floatbox                                m_attack;
    floatbox                                m_decay;
    vertical_t<DISPLAY>                     m_column;
    signal_generator_t<sine, SAMPLE_FREQ>   m_carrier;
    ad_envelope_t<SAMPLE_FREQ>              m_envelope;
};

template<typename DISPLAY>
struct oplabels_t: border_t<DISPLAY>
{
    typedef valuebox_t<DISPLAY, show_str> label;

    oplabels_t(const theme_t& t)
        : border_t<DISPLAY>(&m_column)   // FIXME: color?
        , m_opno(t, "op no")
        , m_ratio(t, "ratio")
        , m_index(t, "index")
        , m_attack(t, "attack")
        , m_decay(t, "decay")
        , m_column(&m_opno, &m_ratio, &m_index, &m_attack, &m_decay)
    {
    }

    label               m_opno;
    label               m_ratio;
    label               m_index;
    label               m_attack;
    label               m_decay;
    vertical_t<DISPLAY> m_column;
};

template<ch_t CH, typename DISPLAY>
struct freqmod_t: window_t<DISPLAY>, imodel
{
    static constexpr uint8_t num_ops = 2;
    typedef valuebox_t<DISPLAY, show_str> label;

    freqmod_t(const theme_t& t)
        : m_labels(t)
        , m_op0(t, 0)
        , m_op1(t, 1)
        , m_panel(&m_labels, &m_op0, &m_op1)
    {
        list<ifocus*> navigation;

        navigation.splice(navigation.end(), m_op0.navigation());
        navigation.splice(navigation.end(), m_op1.navigation());

        window_t<DISPLAY>::setup(&m_panel, navigation, t);

        m_op0.m_decay = 25.0f;
        m_op1.m_ratio = 3.0f;
        m_op1.m_attack = 0.0f;
    }

    virtual action_t handle_message(const message_t& m)
    {
        if (m.index() == button_press)
        {
            uint8_t i = std::get<button_press>(m);

            if ((CH == A && i == 0) || (CH == B && i == 2))
                return action_t().emplace<pop_window>(0);
            else
                return action_t().emplace<pop_window_message>(m);
        }
        else
            return window_t<DISPLAY>::handle_message(m);
    }

    // imodel

    virtual void generate(ctrl_t& ctx, int32_t *buf, uint16_t n, uint8_t stride)
    {
        m_op0.update(ctx.freq);
        m_op1.update(ctx.freq);

        for (uint16_t i = 0; i < n; ++i, buf += stride)
            *buf = board::dacdma::swap(m_op0.sample(m_op1.sample()).q);
    }

    virtual void trigger(bool rise)
    {
        if (rise)
        {
            m_op0.trigger();
            m_op1.trigger();
        }
    }

    oplabels_t<DISPLAY>         m_labels;
    operator_t<DISPLAY>         m_op0;
    operator_t<DISPLAY>         m_op1;
    horizontal_t<DISPLAY>       m_panel;
    vertical_t<DISPLAY>         m_screen;
};

