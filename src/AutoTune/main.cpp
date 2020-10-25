#include <waves.h>
#include <textio.h>
#include <text.h>

using namespace fontlib;
using namespace text;
using namespace color;

using console = console_t<board::tft>;
using encoder = board::encoder;
//using eeprom = board::eeprom;

static void auto_tune()
{
    console::clear();
    sys_tick::delay_ms(250);
    printf<console>("AutoTune 0.1\n");
    printf<console>("-------------------------------\n");

    uint16_t choice = 0;
    message_t m;

    board::mq::put(m.emplace<encoder_delta>(0));

    printf<console>(
        "options:\n\n"
        "    1: tune channel 1\n"
        "    2: tune channel 2\n"
        "    0: quit\n"
        );

    for (;;)
    {
        while (!board::mq::get(m));

        switch (m.index())
        {
        case encoder_delta:
            choice = (choice + std::get<encoder_delta>(m)) & 0x7;
            console::set_pos(8, 0);
            printf<console>("choice: %1u\n", choice);
            break;
        case encoder_press:
            switch (choice)
            {
            case 0:
                return;
            }
        default: ;
        }
    }
}

int main()
{
    board::setup();
    board::start_io();
    console::setup(fontlib::cmuntt_20, color::green, color::black);
    console::clear();

    for (;;)
        auto_tune();
}

