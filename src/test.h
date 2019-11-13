#pragma once

#include <widget.h>
#include <plot.h>

using namespace text;
using namespace color;
using namespace graphics;
using namespace fontlib;
using namespace board;

static char tmp_buf[256];

struct gui_t
{
    static const uint16_t w = tft::width() / 2;
    static const uint16_t h = 40;

    widget_t<tft, int> fbox;
    xy_plot_t<tft> plot;

    gui_t()
        : fbox
            ( fontlib::cmuntt_36, yellow, red, 0, 0, w, h
            , [](auto x) { sprintf(tmp_buf, "%d", x); return         tmp_buf; }
            , [](auto& x, int i) { x += i; }
            , true
            )
        {
            plot.setup(0, h, tft::width(), tft::height() -   h, yellow, black);
            plot.viewport(-1., -1., 1., 1.);
        }

    void render()
    {
        fbox.render();
        plot.clear();
    }
};

