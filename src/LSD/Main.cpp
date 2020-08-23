////
//
//      Line graphics demo
//
////

#include <gpio.h>
#include <spi.h>
#include <st7789.h>
#include <draw.h>
#include <cstdlib>

using namespace color;

typedef st7789_t<1, PA5, PA7, PB1, PB4> display;
static const spi_clock_divider_t display_spi_prescale = fpclk_8;

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
    display::setup<display_spi_prescale>();

    for (;;)
    {
        squares();
        sys_tick::delay_ms(250);
        circles();
        sys_tick::delay_ms(250);
    }

    for (;;);   // never return
}

