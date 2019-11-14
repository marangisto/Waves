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
    static const uint16_t w = tft::width() / 3;
    static const uint16_t h = 40;

    font_t font;
    widget_t<tft, int> cnt;
    widget_t<tft, int> btnsa;
    widget_t<tft, int> btnsb;
    widget_t<tft, bool> encch1;
    widget_t<tft, bool> encch2;
    widget_t<tft, bool> encbtn;
    xy_plot_t<tft> plot;

    gui_t()
        : font(fontlib::cmuntt_36)
        , cnt(font, yellow, red, 0, 0, w, h, [](auto x) { sprintf(tmp_buf, "%d", x); return tmp_buf; }, [](auto& x, int i) { x += i; }, true)
        , btnsa(font, yellow, blue, w, 0, w, h, [](auto x) { sprintf(tmp_buf, "%d", x); return tmp_buf; }, [](auto& x, int i) { x += i; }, true)
        , btnsb(font, yellow, red, 2*w, 0, w, h, [](auto x) { sprintf(tmp_buf, "%d", x); return tmp_buf; }, [](auto& x, int i) { x += i; }, true)
        , encch1(font, yellow, blue, 0, h, w, h, [](auto x) { return x ? "true" : "false"; }, [](auto& x, int i) { x = !x; }, true)
        , encch2(font, yellow, red, w, h, w, h, [](auto x) { return x ? "true" : "false"; }, [](auto& x, int i) { x = !x; }, true)
        , encbtn(font, yellow, blue, 2*w, h, w, h, [](auto x) { return x ? "true" : "false"; }, [](auto& x, int i) { x = !x; }, true)
        {
            plot.setup(0, 2*h, tft::width(), tft::height() - 2 * h, yellow, black);
            plot.viewport(-1., -1., 1., 1.);
        }

    void render()
    {
        cnt.render();
        btnsa.render();
        btnsb.render();
        encch1.render();
        encch2.render();
        encbtn.render();
        plot.clear();
    }
};

