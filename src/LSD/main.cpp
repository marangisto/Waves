////
//
//      Line graphics demo
//
////

#include <board.h>

using display = board::tft;
using namespace color;

static void squares()
{
    int16_t x1 = display::width() - 1;
    int16_t y1 = display::height() - 1;
    int16_t xc = x1 >> 1, yc = y1 >> 1;

    for (int i = 0; i <= y1 >> 1; i += 8)
    {
        pen_t<display> pen(std::rand());
        pen.rectangle(xc - i, yc - i, i << 1, i << 1);
    }
}

static void circles()
{
    int16_t x1 = display::width() - 1;
    int16_t y1 = display::height() - 1;
    int16_t xc = x1 >> 1, yc = y1 >> 1;

    for (int r = 0; r <= y1 >> 1; r += 8)
    {
        pen_t<display> pen(std::rand());
        pen.circle(xc, yc, r);
    }
}

int main()
{
    board::setup();

    for (;;)
    {
        squares();
        sys_tick::delay_ms(250);
        circles();
        sys_tick::delay_ms(250);
    }

    for (;;);   // never return
}

