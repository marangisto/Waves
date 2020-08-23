#pragma once

#include "signal.h"
#include "utils.h"
#include <list.h>

template<typename DISPLAY>
struct hihat_t: public screen_t<DISPLAY>, public imodel
{
    enum state_t { navigating, editing };
    typedef valuebox_t<DISPLAY, show_str> label;
    typedef valuebox_t<DISPLAY, show_float<2>, edit_float<1> > floatbox;

    static constexpr uint8_t num_ops = 3;

    void setup()
    {
        const fontlib::font_t& font = fontlib::cmunvt_28;

        m_panel.setup();

        m_labels.setup();
        l_freq_spread.setup(font, alternate_fg, alternate_bg, "spread");
        l_amp_attack.setup(font, alternate_fg, alternate_bg, "attack");
        l_amp_decay.setup(font, alternate_fg, alternate_bg, "decay");
        m_labels.append(&l_freq_spread);
        m_labels.append(&l_amp_attack);
        m_labels.append(&l_amp_decay);

        m_controls.setup();
        m_freq_spread.setup(font, normal_fg, normal_bg, 65.0f);
        m_amp_attack.setup(font, normal_fg, normal_bg, 0.0f);
        m_amp_decay.setup(font, normal_fg, normal_bg, 15.0f);
        m_controls.append(&m_freq_spread);
        m_controls.append(&m_amp_attack);
        m_controls.append(&m_amp_decay);

        m_panel.append(&m_labels);
        m_panel.append(&m_controls);

        list<ifocus*> navigation;

        navigation.push_back(&m_freq_spread);
        navigation.push_back(&m_amp_attack);
        navigation.push_back(&m_amp_decay);

        screen_t<DISPLAY>::setup(&m_panel, navigation, normal_cursor, active_cursor);
    }

    // imodel

    virtual void generate(ctrl_t& ctx, int32_t *buf, uint16_t n, uint8_t stride)
    {
        float spread = m_freq_spread * 1e-2;
        float freq = ctx.freq;
        q31_t dphi[num_ops];

        for (uint8_t j = 0; j < num_ops; ++j)
            dphi[j] = q31_t((1.0f + spread * (uniform_rand() - 0.5f)) * 2.0f * freq / SAMPLE_FREQ);

        for (uint16_t i = 0; i < n; ++i, buf += stride)
        {
            q31_t y;

            for (uint8_t j = 0; j < num_ops; ++j)
            {
                y = y + signal(m_phi[j]);
                m_phi[j] = m_phi[j] + dphi[j];
            }

            y = response(m_amplitude.sample()) * y;
            *buf = board::dacdma::swap(y.q);
        }
    }

    virtual void trigger(bool rise)
    {
        if (!rise)
            return;
        m_amplitude.set_a(m_amp_attack * 0.001f);    // FIXME: curve control
        m_amplitude.set_d(m_amp_decay * 0.01f);      // FIXME: curve control
        m_amplitude.trigger();
        for (uint8_t i = 0; i < num_ops; ++i)
            m_phi[i] = q31_t(static_cast<int32_t>(rand()) << 1);
    }

    __attribute__((always_inline))
    static inline q31_t signal(q31_t phi)
    {
        static constexpr q31_t hi(1.0f / num_ops);
        static constexpr q31_t lo(-1.0f / num_ops);

        return phi.q < 0 ? hi : lo;
    }

    vertical_t<DISPLAY>         m_labels;
    vertical_t<DISPLAY>         m_controls;
    horizontal_t<DISPLAY>       m_panel;
    q31_t                       m_phi[num_ops];
    ad_envelope_t<SAMPLE_FREQ>  m_amplitude;
    ad_envelope_t<SAMPLE_FREQ>  m_noiseamp;
    label                       l_freq_spread;
    label                       l_amp_attack;
    label                       l_amp_decay;
    floatbox                    m_freq_spread;
    floatbox                    m_amp_attack;
    floatbox                    m_amp_decay;
};

