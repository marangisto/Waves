#include <console.h>

using eeprom = board::eeprom;

static constexpr unsigned OCTAVES = 8;

struct trigger_t: itrigger
{
    void setup(ch_t _ch) { ch = _ch; fired = false; }

    virtual void trigger(bool gate)
    {
        if (gate)
        {
            adc = ch == A ? board::reada<0>() : board::readb<0>();
            fired = true;
        }
    }

    ch_t                ch;
    volatile uint16_t   adc;
    volatile bool       fired;
};

static unsigned collect_samples(trigger_t& t, uint16_t *xs, unsigned n)
{
    message_t m;

    console::set_pos(0, 0);
    printf<console>("waiting...");

    for (unsigned i = 0; i < n; ++i)
    {
        while (!t.fired)
            if (board::mq::get(m))              // user aboort
                return i;
        xs[i] = t.adc;
        t.fired = false;
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

static int load(ch_t ch, uint16_t tab[OCTAVES])
{
    const uint16_t size = OCTAVES * sizeof(*tab);
    const uint16_t addr = ch == B ? size : 0;

    return eeprom::read(addr, reinterpret_cast<char*>(tab), size);
};

static int save(ch_t ch, const uint16_t tab[OCTAVES])
{
    const uint16_t size = OCTAVES * sizeof(*tab);
    const uint16_t addr = ch == B ? size : 0;

    return eeprom::write(addr, reinterpret_cast<const char*>(tab), size);
};

static void calibrate(ch_t ch, trigger_t& t)
{
    constexpr unsigned N = 200;
    static uint16_t xs[N];

    console::clear();

    unsigned n = collect_samples(t, xs, N);

    console::set_pos(0, 0);
    printf<console>("got %d samples\n", n);

    if (n < N)
    {
        pause("not enough samples");
        return;
    }

    uint16_t tab[OCTAVES];

    load(ch, tab);

    bucketize(xs, n, tab);
    if (menu("save", noyes, sizeof(noyes) / sizeof(*noyes)))
        save(ch, tab);
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

    static trigger_t ta, tb;

    ta.setup(A);
    tb.setup(B);

    register_triggers(&ta, &tb);

    for (;;)
    {
        console::clear();

        switch (menu(text, items, sizeof(items) / sizeof(*items)))
        {
        case 0:
            register_triggers(0, 0);
            return;
        case 1:
            calibrate(A, ta);
            break;
        case 2:
            calibrate(B, tb);
            break;
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

