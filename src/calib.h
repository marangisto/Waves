#pragma once

#include "signal.h"
#include <list.h>

template<ch_t CH, typename DISPLAY>
struct calib_t: window_t<DISPLAY>, imodel
{
    calib_t(const theme_t& t)
        : m_freq0(t, 0)
        , m_freq1(t, 0)
        , m_panel(&m_freq0, &m_freq1)
    {
        list<ifocus*> navigation;

        window_t<DISPLAY>::setup(&m_panel, navigation, t);
    }

    // FIXME: refactor to share this across models
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

    virtual void generate(ctrl_t& ctx, int32_t *, uint16_t, uint8_t)
    {
        // we have ctx.freq to read;
    }

    virtual void trigger(bool rise)
    {
        if (rise)
        {
            ; // switch state and capture
        }
    }

    using freqbox = valuebox_t<DISPLAY, show_float<4> >;

    freqbox              m_freq0;
    freqbox              m_freq1;
    vertical_t<DISPLAY>  m_panel;
};

