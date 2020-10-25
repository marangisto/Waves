#include <waves.h>
#include <textio.h>
#include <text.h>
#include <hexdump.h>
#include <at25.h>

using namespace fontlib;
using namespace text;
using namespace color;

using display = board::tft;
using console = console_t<display>;
using encoder = board::encoder;
using eeprom = at25_t<256, spi_t<2, PB13, PA11, PA10>, PB12>;

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
        uint16_t c = ((-encoder::count()) >> 1) & 0xff;

        if (c != encoder_last_count)
        {
            static char buf[128];
            uint32_t addr = sizeof(buf) * c;

            console::set_pos(0, 0);
            printf<console>("page %3u 0x%04x\n\n", c, addr);

            if (eeprom::read(addr, buf, sizeof(buf)))
                printf<console>("read failure!\n");
            else
                hexdump<console, 8>(buf, sizeof(buf), addr);
        }

        encoder_last_count = c;
    }
}

