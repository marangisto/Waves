#pragma once

#include <list.h>

template<typename DISPLAY>
struct opfields_t
{
    typedef valuebox_t<DISPLAY, show_int> intlabel;
    typedef valuebox_t<DISPLAY, show_float<2>, edit_float<1> > floatbox;

    void setup(uint8_t i)
    {
        const fontlib::font_t& font = fontlib::cmunvt_28;

        opno.setup(font, dark_fg, dark_bg, i);
        ratio.setup(font, normal_fg, normal_bg, 1.0f);
        index.setup(font, normal_fg, normal_bg, 2.0f);
        attack.setup(font, normal_fg, normal_bg, 1.0f);
        decay.setup(font, normal_fg, normal_bg, 8.0f);
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

    list<ifocus*> navigation()
    {
        list<ifocus*> l;

        l.push_back(&ratio);
        l.push_back(&index);
        l.push_back(&attack);
        l.push_back(&decay);
        return l;
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
struct oplabels_t
{
    typedef valuebox_t<DISPLAY, show_str> label;

    void setup()
    {
        const fontlib::font_t& font = fontlib::cmunvt_28;

        opno.setup(font, dark_fg, dark_bg, "op no");
        ratio.setup(font, normal_fg, normal_bg, "ratio");
        index.setup(font, normal_fg, normal_bg, "index");
        attack.setup(font, normal_fg, normal_bg, "attack");
        decay.setup(font, normal_fg, normal_bg, "decay");
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

    label            opno;
    label            ratio;
    label            index;
    label            attack;
    label            decay;
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
        labels.setup();
        panel.append(&labels.frame);

        for (uint8_t i = 0; i < num_ops; ++i)
        {
            ops[i].setup(i);
            panel.append(&ops[i].frame);
            navigation.splice(navigation.end(), ops[i].navigation());
        }
        panel.constrain(10, 240, 10, 240); // fixme: what about zero min?
        panel.layout(0, 0);

        focus = navigation.begin();
        (*focus)->focus(normal_cursor);
    }

    void render()
    {
        panel.render();
    }

    bool handle_message(const message_t& m)
    {
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

        return true;   // take more messages
    }

    oplabels_t<DISPLAY>     labels;
    opfields_t<DISPLAY>     ops[num_ops];
    horizontal_t<DISPLAY>   panel;
    list<ifocus*>           navigation;
    list_iterator<ifocus*>  focus;
    state_t                 state;
};

