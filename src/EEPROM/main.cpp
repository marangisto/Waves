#include <cstdlib>
#include <stdlib.h>
#include <ctype.h>
#include <textio.h>
#include <gpio.h>
#include <spi.h>
#include <timer.h>
#include <st7789.h>
#include <draw.h>
#include <text.h>
#include <at25.h>

using namespace fontlib;
using namespace text;
using namespace color;

using display = st7789_t<1, PA5, PA7, PB1, PB4>;
using console = console_t<display>;
using encoder = encoder_t<4, PB6, PB7>;
using eeprom = at25_t<256, spi_t<2, PB13, PA11, PA10>, PB12>;

template<typename WRITER>
static void hexdump(const char *buf, uint16_t len, uint16_t base = 0)
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

        printf<WRITER>("%s\n", line);
    }
}

int main()
{
    display::setup<fpclk_8>();
    console::setup(fontlib::cmuntt_16, color::green, color::black);
    console::clear();
    encoder::setup<pull_up>(65535);
    eeprom::setup();

    console::clear();
    printf<console>("start!\n");

    for (;;)
    {
        static uint16_t encoder_last_count = -1;
        uint16_t c = ((-encoder::count()) >> 1) & 0x1ff;

        if (c != encoder_last_count)
        {
            static char buf[128];
            uint32_t addr = sizeof(buf) * c;

            console::clear();
            printf<console>("page %3u 0x%04x\n\n", c, addr);

            if (eeprom::read(addr, buf, sizeof(buf)))
                printf<console>("read failure!\n");
            else
                hexdump<console>(buf, sizeof(buf), addr);
        }

        encoder_last_count = c;
    }
}

