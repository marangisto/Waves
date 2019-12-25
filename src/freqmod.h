#pragma once

template<typename DISPLAY>
struct opfields_t
{
    typedef valuebox_t<DISPLAY, show_str> label;
    typedef valuebox_t<DISPLAY, show_int> intlabel;
    typedef valuebox_t<DISPLAY, show_float<2>, edit_float<1> > floatbox;

    void setup(uint8_t i)
    {
        const fontlib::font_t& font = fontlib::cmunvt_28;

        opno.setup(font, normal_fg, normal_bg, i);
        ratio.setup(font, normal_fg, normal_bg, 1.0f);
        index.setup(font, normal_fg, normal_bg, 1.0f);
        attack.setup(font, normal_fg, normal_bg, 1e-3f);
        decay.setup(font, normal_fg, normal_bg, 1.0f);
        column.setup();
        column.append(&opno);
        column.append(&ratio);
        column.append(&index);
        column.append(&attack);
        column.append(&decay);
        frame.setup(&column, dim_gray);
    }

    void render()
    {
        frame.render();
    }

    intlabel            opno;
    floatbox            ratio;
    floatbox            index;
    floatbox            attack;
    floatbox            decay;
    vertical_t<DISPLAY> column;
    border_t<DISPLAY>   frame;
};

template<typename DISPLAY>
struct freqmod_ui_t
{
    enum state_t { navigating, editing };
    static constexpr uint8_t num_ops = 2;
    typedef valuebox_t<DISPLAY, show_str> label;

    void setup()
    {
        panel.setup();

        for (uint8_t i = 0; i < num_ops; ++i)
        {
            ops[i].setup(i);
            panel.append(&ops[i].frame);
        }

        panel.constrain(10, 240, 10, 240); // fixme: what about zero min?
        panel.layout(0, 0);
    }

    void render()
    {
        panel.render();
    }

    bool handle_message(const message_t& m)
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
                return false;           // exit window
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
            }
            break;
        default: ;      // unhandled message
        }

        return true;    // take more messages
    }

    opfields_t<DISPLAY>     ops[num_ops];
    horizontal_t<DISPLAY>   panel;
    ifocus                  *focus[2];
    uint8_t                 pos;
    state_t                 state;
};

