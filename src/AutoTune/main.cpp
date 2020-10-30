#include <console.h>
#include <trigger.h>

//using eeprom = board::eeprom;

static constexpr unsigned OCTAVES = 8;

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

static unsigned collect_samples(ch_t ch, uint16_t *xs, unsigned n)
{
    message_t m;

    console::set_pos(0, 0);
    printf<console>("waiting...");

    for (unsigned i = 0; i < n; ++i)
    {
        while (!(ch == A ? g_trga : g_trgb))
            if (board::mq::get(m))              // user aboort
                return i;
        xs[i] = ch == A ? g_cva : g_cvb;
        (ch == A ? g_trga : g_trgb) = false;
        console::set_pos(0, 0);
        printf<console>("%3d %5d ", i, xs[i]);
    }

    return n;
}

static unsigned bucketize(uint16_t *xs, unsigned n, uint16_t ys[OCTAVES])
{
    std::sort(xs, xs + n);

    const uint32_t spread = 100;
    uint32_t sums[OCTAVES];
    uint16_t counts[OCTAVES];
    uint16_t k = 0;

    for (uint16_t i = 0; i < OCTAVES; ++i)
        sums[i] = counts[i] = 0;

    sums[0] = xs[0];
    counts[0] = 1;

    for (uint16_t i = 1; i < n; ++i)
    {
        uint32_t avg = sums[k] / counts[k];

        if (xs[i] > avg + spread)
            ++k;

        if (k == OCTAVES)
        {
            printf<console>("overrun x[%u] = %u, avg = %lu\n", i, xs[i], avg);
            return 0;
        }

        sums[k] += xs[i];
        counts[k]++;
    }

    if (k + 1 != OCTAVES)
    {
        printf<console>("underrun, found only %u levels\n", k);
        return 0;
    }

    printf<console>("no  cnt   prev    avg   chg\n");
    printf<console>("------------------------------\n");

    for (uint16_t k = 0; k < OCTAVES; ++k)
    {
        uint16_t avg = sums[k] / counts[k];
        int16_t chg = avg - ys[k];
        printf<console>("%2u  %3u  %5lu  %5lu  %4d\n", k, counts[k], ys[k], avg, chg);
        ys[k] = avg;
    }

    return OCTAVES;
}

static void calibrate(ch_t ch)
{
    constexpr unsigned N = 200;
    static uint16_t xs[N];

    console::clear();

    unsigned n = collect_samples(ch, xs, N);

    console::set_pos(0, 0);
    printf<console>("got %d samples\n", n);

    if (n < N)
    {
        pause("not enough samples");
        return;
    }

    uint16_t tab[OCTAVES] = { 400, 900, 1300, 1900, 2300, 2770, 3200, 3700 };

    bucketize(xs, n, tab);
    pause("done");
}

static void auto_tune()
{
    const char *text = 
        "AutoTune 0.1\n"
        "-------------------------------\n"
        "options:\n\n"
        "    1: tune channel a\n"
        "    2: tune channel b\n"
        "    0: quit\n"
        "\nchoice"
        ;
    const char *items[] = { "0", "1", "2" };

    for (;;)
    {
        console::clear();

        switch (menu(text, items, sizeof(items) / sizeof(*items)))
        {
        case 0:
            return;
        case 1:
            calibrate(A);
            break;
        case 2:
            calibrate(B);
            break;
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

