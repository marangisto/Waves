#include <cstdlib>
#include <stdlib.h>
#include <ctype.h>
#include <textio.h>
#include <gpio.h>
#include <spi.h>
#include <st7789.h>
#include <draw.h>
#include <text.h>
#include <at25.h>

using namespace fontlib;
using namespace text;
using namespace color;

typedef st7789_t<1, PA5, PA7, PB1, PB4> display;
static const spi_clock_divider_t display_spi_prescale = fpclk_8;

using eeprom = at25_t<256, spi_t<2, PB13, PA11, PA10>, PB12>;

template<typename TXR>
static void hexdump(TXR& txr, const char *buf, uint16_t len, uint16_t base = 0)
{
    static constexpr unsigned bpl = 8; // bytes per line
    static char line[8 + 4 * bpl];

    for (unsigned i = 0; i < len; i += bpl)
    {
        char *lp = line;

        lp += sprintf(lp, "%04x ", base + i);
        for (unsigned j = 0; j < bpl; ++j)
            if (i + j < len)
                lp += sprintf(lp, "%02x ", buf[i+j]);
            else
                lp += sprintf(lp, "   ");
        for (unsigned j = 0; j < bpl; ++j)
            if (i + j < len)
                lp += sprintf(lp, "%c", isprint(buf[i+j]) ? buf[i+j] : '.');
        txr.writeln(line);
    }
}

int main()
{
    display::setup<display_spi_prescale>();
    eeprom::setup();

    font_t ft = fontlib::cmuntt_16;
    text_renderer_t<display> txr(ft, color::green, color::black, true);

    static char buf[128];
    uint16_t addr = 0;

    if (eeprom::read(addr, buf, sizeof(buf)))
        txr.writeln("read failure!");
    else
        hexdump(txr, buf, sizeof(buf), addr);
}

