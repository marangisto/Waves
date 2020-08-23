#pragma once

#include <widget.h>

using namespace text;
using namespace color;
using namespace fontlib;
using namespace board;

static char tmp_buf[256];

struct gui_t
{
    static const uint16_t w = tft::width() / 2;
    static const uint16_t h = 40;

    font_t font;
    widget_t<tft, int> cv1a, cv2a, cv3a, cv4a;
    widget_t<tft, int> cv1b, cv2b, cv3b, cv4b;
    widget_t<tft, int> btnsa, btnsb;
    widget_t<tft, bool> encbtn;
    widget_t<tft, int> enc;

    gui_t()
        : font(fontlib::cmuntt_36)
        , cv1a(font, yellow, blue, w*0, h*0, w, h, [](auto x) { sprintf(tmp_buf, "%d", x); return tmp_buf; }, [](auto& x, int i) { x += i; }, true)
        , cv2a(font, yellow, blue, w*0, h*1, w, h, [](auto x) { sprintf(tmp_buf, "%d", x); return tmp_buf; }, [](auto& x, int i) { x += i; }, true)
        , cv3a(font, yellow, blue, w*0, h*2, w, h, [](auto x) { sprintf(tmp_buf, "%d", x); return tmp_buf; }, [](auto& x, int i) { x += i; }, true)
        , cv4a(font, yellow, blue, w*0, h*3, w, h, [](auto x) { sprintf(tmp_buf, "%d", x); return tmp_buf; }, [](auto& x, int i) { x += i; }, true)
        , cv1b(font, yellow, blue, w*1, h*0, w, h, [](auto x) { sprintf(tmp_buf, "%d", x); return tmp_buf; }, [](auto& x, int i) { x += i; }, true)
        , cv2b(font, yellow, blue, w*1, h*1, w, h, [](auto x) { sprintf(tmp_buf, "%d", x); return tmp_buf; }, [](auto& x, int i) { x += i; }, true)
        , cv3b(font, yellow, blue, w*1, h*2, w, h, [](auto x) { sprintf(tmp_buf, "%d", x); return tmp_buf; }, [](auto& x, int i) { x += i; }, true)
        , cv4b(font, yellow, blue, w*1, h*3, w, h, [](auto x) { sprintf(tmp_buf, "%d", x); return tmp_buf; }, [](auto& x, int i) { x += i; }, true)
        , btnsa(font, yellow, blue, w*0, h*4, w, h, [](auto x) { sprintf(tmp_buf, "%d", x); return tmp_buf; }, [](auto& x, int i) { x += i; }, true)
        , btnsb(font, yellow, blue, w*1, h*4, w, h, [](auto x) { sprintf(tmp_buf, "%d", x); return tmp_buf; }, [](auto& x, int i) { x += i; }, true)
        , encbtn(font, yellow, red, w*0, h*5, w, h, [](auto x) { return x ? "true" : "false"; }, [](auto& x, int i) { x = !x; }, true)
        , enc(font, yellow, red, w*1, h*5, w, h, [](auto x) { sprintf(tmp_buf, "%d", x); return tmp_buf; }, [](auto& x, int i) { x += i; }, true)
        {
        }

    void render()
    {
        cv1a.render();
        cv2a.render();
        cv3a.render();
        cv4a.render();
        btnsa.render();
        cv1b.render();
        cv2b.render();
        cv3b.render();
        cv4b.render();
        btnsb.render();
        encbtn.render();
        enc.render();
    }
};

