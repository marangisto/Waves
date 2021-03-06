#pragma once

#include "signal.h"
#include "utils.h"
#include <list.h>

template<typename DISPLAY>
struct kick_t: public screen_t<DISPLAY>, public imodel
{
    enum state_t { navigating, editing };
    static constexpr uint8_t num_ops = 2;
    typedef valuebox_t<DISPLAY, show_str> label;
    typedef valuebox_t<DISPLAY, show_float<2>, edit_float<1> > floatbox;

    void setup()
    {
        const fontlib::font_t& font = fontlib::cmunvt_28;

        m_panel.setup();

        m_labels.setup();
        l_freq_shift.setup(font, alternate_fg, alternate_bg, "oct-shift");
        l_freq_mult.setup(font, alternate_fg, alternate_bg, "f-mult");
        l_freq_attack.setup(font, alternate_fg, alternate_bg, "f-attack");
        l_freq_decay.setup(font, alternate_fg, alternate_bg, "f-decay");
        l_amp_attack.setup(font, alternate_fg, alternate_bg, "a-attack");
        l_amp_decay.setup(font, alternate_fg, alternate_bg, "a-decay");
        m_labels.append(&l_freq_shift);
        m_labels.append(&l_freq_mult);
        m_labels.append(&l_freq_attack);
        m_labels.append(&l_freq_decay);
        m_labels.append(&l_amp_attack);
        m_labels.append(&l_amp_decay);

        m_controls.setup();
        m_freq_shift.setup(font, normal_fg, normal_bg, -3.0f);
        m_freq_mult.setup(font, normal_fg, normal_bg, 3.0f);
        m_freq_attack.setup(font, normal_fg, normal_bg, 1.0f);
        m_freq_decay.setup(font, normal_fg, normal_bg, 5.0f);
        m_amp_attack.setup(font, normal_fg, normal_bg, 5.0f);
        m_amp_decay.setup(font, normal_fg, normal_bg, 20.0f);
        m_controls.append(&m_freq_shift);
        m_controls.append(&m_freq_mult);
        m_controls.append(&m_freq_attack);
        m_controls.append(&m_freq_decay);
        m_controls.append(&m_amp_attack);
        m_controls.append(&m_amp_decay);

        m_panel.append(&m_labels);
        m_panel.append(&m_controls);

        list<ifocus*> navigation;

        navigation.push_back(&m_freq_shift);
        navigation.push_back(&m_freq_mult);
        navigation.push_back(&m_freq_attack);
        navigation.push_back(&m_freq_decay);
        navigation.push_back(&m_amp_attack);
        navigation.push_back(&m_amp_decay);

        screen_t<DISPLAY>::setup(&m_panel, navigation, normal_cursor, active_cursor);
    }

    // imodel

    virtual void generate(ctrl_t& ctx, int32_t *buf, uint16_t n, uint8_t stride)
    {
        using namespace hal::cordic;

        float shift = m_freq_shift;
        float mult = m_freq_mult;
        float freq = ctx.freq * pow(2.0, shift);
        q31_t min_dphi = q31_t(2.0f * freq / SAMPLE_FREQ);
        q31_t dphi = q31_t(2.0f * freq  * mult / SAMPLE_FREQ);

        for (uint16_t i = 0; i < n; ++i, buf += stride)
        {
            q31_t inc = dphi * m_frequency.sample();

            m_phi = m_phi + (inc < min_dphi ? min_dphi : inc);
            q31_t y = response(m_amplitude.sample()) * q31_t(cordic_t::compute(m_phi.q));

            *buf = board::dacdma::swap(y.q);
        }
    }

    virtual void trigger(bool rise)
    {
        if (!rise)
            return;
        m_frequency.set_a(m_freq_attack * 0.001f);    // FIXME: curve control
        m_frequency.set_d(m_freq_decay * 0.01f);      // FIXME: curve control
        m_amplitude.set_a(m_amp_attack * 0.001f);    // FIXME: curve control
        m_amplitude.set_d(m_amp_decay * 0.01f);      // FIXME: curve control
        m_frequency.trigger();
        m_amplitude.trigger();
        m_phi = q31_t::min_val;
    }

    vertical_t<DISPLAY>         m_labels;
    vertical_t<DISPLAY>         m_controls;
    horizontal_t<DISPLAY>       m_panel;
    q31_t                       m_phi;
    ad_envelope_t<SAMPLE_FREQ>  m_amplitude;
    ad_envelope_t<SAMPLE_FREQ>  m_frequency;
    label                       l_freq_shift;
    label                       l_freq_mult;
    label                       l_freq_attack;
    label                       l_freq_decay;
    label                       l_amp_attack;
    label                       l_amp_decay;
    floatbox                    m_freq_shift;
    floatbox                    m_freq_mult;
    floatbox                    m_freq_attack;
    floatbox                    m_freq_decay;
    floatbox                    m_amp_attack;
    floatbox                    m_amp_decay;
};

