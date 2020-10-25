#include <waves.h>
#include <textio.h>
#include <text.h>
#include <hexdump.h>

using namespace fontlib;
using namespace text;
using namespace color;

using console = console_t<board::tft>;
using encoder = board::encoder;
using eeprom = board::eeprom;

static void handle_message(const message_t& m)
{
    if (m.index() != encoder_delta)
        return;

    static char buf[128];
    static uint16_t page = 0;
    int16_t dx = std::get<encoder_delta>(m);

    dx < 0 ? board::led1::pulse(100) : board::led3::pulse(100);

    page = (page + dx) & 0xff;

    uint32_t addr = sizeof(buf) * page;

    console::set_pos(0, 0);
    printf<console>("page %3u 0x%04x\n\n", page, addr);

    if (eeprom::read(addr, buf, sizeof(buf)))
        printf<console>("read failure!\n");
    else
        hexdump<console, 8>(buf, sizeof(buf), addr);
}

int main()
{
    board::setup();
    board::start_io();
    console::setup(fontlib::cmuntt_16, color::green, color::black);
    console::clear();

    message_t m;

    board::mq::put(m.emplace<encoder_delta>(0));

    for (;;)
        if (board::mq::get(m))
            handle_message(m);
}

