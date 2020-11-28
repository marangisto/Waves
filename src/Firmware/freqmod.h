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
        , m_index(t, 10.0f)
        , m_attack(t, 1.0f)
        , m_decay(t, 8.0f)
        , m_sustain(t, 85.0f)
        , m_release(t, 20.0f)
        , m_column
            ( &m_opno
            , &m_ratio
            , &m_index
            , &m_attack
            , &m_decay
            , &m_sustain
            , &m_release
            )
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
        l.push_back(&m_sustain);
        l.push_back(&m_release);
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
    inline void trigger(bool gate)
    {
        if (gate)
        {
            m_envelope.set_a(m_attack * 0.01f);    // FIXME: curve control
            m_envelope.set_d(m_decay * 0.1f);      // FIXME: curve control
            m_envelope.set_s(m_sustain * 0.01f);   // FIXME: curve control
            m_envelope.set_r(m_release * 0.1f);    // FIXME: curve control
        }

        m_envelope.trigger(gate);
    }

    intlabel                                m_opno;
    floatbox                                m_ratio;
    floatbox                                m_index;
    floatbox                                m_attack;
    floatbox                                m_decay;
    floatbox                                m_sustain;
    floatbox                                m_release;
    vertical_t<DISPLAY>                     m_column;
    signal_generator_t<sine, SAMPLE_FREQ>   m_carrier;
    adsr_envelope_t<SAMPLE_FREQ>            m_envelope;
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
        , m_sustain(t, "sustain")
        , m_release(t, "release")
        , m_column
          ( &m_opno
          , &m_ratio
          , &m_index
          , &m_attack
          , &m_decay
          , &m_sustain
          , &m_release
          )
    {
    }

    uint16_t height(const theme_t& t) const
    {
        return m_column.count() * t.font.line_spacing() + 2;
    }

    label               m_opno;
    label               m_ratio;
    label               m_index;
    label               m_attack;
    label               m_decay;
    label               m_sustain;
    label               m_release;
    vertical_t<DISPLAY> m_column;
};

template<ch_t CH, typename DISPLAY>
struct freqmod_t: window_t<DISPLAY>, igenerator
{
    static constexpr uint8_t num_ops = 2;
    typedef valuebox_t<DISPLAY, show_str> label;

    freqmod_t(const theme_t& t)
        : m_labels(t)
        , m_op0(t, 0)
        , m_op1(t, 1)
        , m_panel(&m_labels, &m_op0, &m_op1)
        , m_frame(&m_panel, t.border_color, 2)
    {
        list<ifocus*> navigation;

        navigation.splice(navigation.end(), m_op0.navigation());
        navigation.splice(navigation.end(), m_op1.navigation());

        uint16_t h = m_labels.height(t) + 4;

        window_t<DISPLAY>::setup
            ( &m_frame
            , navigation
            , t
            , rect_t(5, (240 - h) >> 1, 230, h)
            );

        m_op1.m_ratio = 3.0f;
        m_op1.m_decay = 25.0f;
    }

    virtual action_t handle_message(const message_t& m)
    {
        if (m.index() == button_press)
        {
            uint8_t i = std::get<button_press>(m);

            if ((CH == A && i == 1) || (CH == B && i == 3))
                return action_t().emplace<pop_window>(0);
            else
                return action_t().emplace<pop_window_message>(m);
        }
        else
            return window_t<DISPLAY>::handle_message(m);
    }

    // igenerator

    virtual void trigger(bool rise)
    {
        m_op0.trigger(rise);
        m_op1.trigger(rise);
    }

    virtual void pitch(float freq)
    {
        m_op0.update(freq);
        m_op1.update(freq);
    }

    virtual void modify(uint8_t i, float x)
    {
        // FIXME: bind some parameters
    }

    virtual void generate(int32_t *buf, uint16_t len, uint8_t stride)
    {
        for (uint16_t i = 0; i < len; ++i, buf += stride)
            *buf = board::dacdma::swap(m_op0.sample(m_op1.sample()).q);
    }

    oplabels_t<DISPLAY>         m_labels;
    operator_t<DISPLAY>         m_op0;
    operator_t<DISPLAY>         m_op1;
    horizontal_t<DISPLAY>       m_panel;
    border_t<DISPLAY>           m_frame;
};

