#include "board.h"
#include "analog.h"
#include "signal.h"
#include "output.h"
#include <math.h>

using hal::sys_tick;
using namespace board;
using namespace analog;

static inline float cv2midi(float x)
{
    return 0;
}

static inline float midi2freq(float m)
{
    return 440 * pow(2., (m-69.) / 12.);
}

static inline float cv2freq(float x)
{
    static const float f0 = 440.;
    static const float semi_tone = pow(2., 1. / 12.);

    return f0 * pow(semi_tone, 12 * x);
}

static inline float cv2ratio(uint16_t x)
{
    return exp(x * (log(11.) / 4095.)) - 1.;
}

static signal_generator_t<sine, 96000> modulator;
static signal_generator_t<sine, 96000> carrier;

static volatile float freq = midi2freq(69);
static volatile float index = 0.5;
static volatile float ratio = 1.5;

void process_buffer(uint16_t *buf, uint16_t len)
{
    modulator.set_freq(freq * ratio);

    for (uint16_t i = 0; i < len; ++i)
    {
        carrier.set_freq(freq * (1 + index * modulator.sample()));
        buf[i] = (carrier.sample() + 1.01) * 2010.;     // FIXME: correct for clipping
    }
}

int main()
{
    board::setup();
    analog::setup();
    setup_cordic();
    modulator.setup(440);
    carrier.setup(440);
    output::setup();

    static uint8_t midi = 69;

    for (;;)
    {
        message_t m;

        if (mq::get(m))
        {
            switch (m.index())
            {
            case button_press:
                printf("button %d\n", std::get<button_press>(m));
                break;
            case encoder_delta:
                printf("encoder %d\n", std::get<encoder_delta>(m));
                midi += std::get<encoder_delta>(m);
                freq = midi2freq(midi);
                printf("midi %d, f = %6.2f\n", midi, freq);
                break;
            default:
                printf("unhandled message type\n");
            }
        }

        ratio = cv2ratio(read<2>());

        printf("%5d %5d %5f\n", read<0>(), read<1>(), ratio);
        sys_tick::delay_ms(20);
    }
}

