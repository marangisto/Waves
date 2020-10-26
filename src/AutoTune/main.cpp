#include <waves.h>
#include <trigger.h>
#include <textio.h>
#include <text.h>

using namespace fontlib;
using namespace text;
using namespace color;

using console = console_t<board::tft>;
using encoder = board::encoder;
//using eeprom = board::eeprom;

static volatile uint16_t g_cva = 0, g_cvb = 0;
static volatile bool g_trga = false, g_trgb = false;

void trigger_a(bool gate)
{
    board::led1::write(gate);

    if (gate)
    {
        g_cva = board::reada<0>();
        g_trga = true;
    }
}

void trigger_b(bool gate)
{
    board::led3::write(gate);

    if (gate)
    {
        g_cvb = board::readb<0>();
        g_trgb = true;
    }
}

static unsigned collect_samples(ch_t ch, uint16_t *buf, unsigned n)
{
    uint32_t start = sys_tick::count();

    console::set_pos(0, 0);
    printf<console>("waiting...");

    for (unsigned i = 0; i < n; ++i)
    {
        while (!(ch == A ? g_trga : g_trgb))
            if (sys_tick::count() - start > 5000)   // time-out
                return i;
        buf[i] = ch == A ? g_cva : g_cvb;
        (ch == A ? g_trga : g_trgb) = false;
        console::set_pos(0, 0);
        printf<console>("%3d %5d ", i, g_cva);
    }

    return n;
}

static void calibrate(ch_t ch)
{
    constexpr unsigned N = 200;
    static uint16_t buf[N];

    console::clear();

    unsigned n = collect_samples(ch, buf, N);
    message_t m;

    console::set_pos(0, 0);
    printf<console>("got %d samples\n", n);
    while (!board::mq::get(m));
}

static void auto_tune()
{
    console::clear();
    printf<console>("AutoTune 0.1\n");
    printf<console>("-------------------------------\n");

    uint16_t choice = 0;
    message_t m;

    board::mq::put(m.emplace<encoder_delta>(0));

    printf<console>(
        "options:\n\n"
        "    1: tune channel a\n"
        "    2: tune channel b\n"
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
            case 1: calibrate(A); return;
            case 2: calibrate(B); return;
            case 0: return;
            }
        default: ;
        }
    }
}

int main()
{
    board::setup();
    board::start_io();
    board::start_trigger();
    console::setup(fontlib::cmuntt_20, color::green, color::black);
    console::clear();

    for (;;)
        auto_tune();
}

