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

static inline float cv2index(uint16_t x)
{
    return x * (5 / 4095.);
}

static signal_generator_t<sine, 96000> modulator;
static signal_generator_t<sine, 96000> carrier;

static volatile float freq = 440.;
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

static const float rational[] =
    { 0.1111111111111111,0.125,0.14285714285714285,0.16666666666666666,0.2,0.2222222222222222,0.25,0.2857142857142857,0.3333333333333333,0.375,0.4,0.42857142857142855,0.4444444444444444,0.5,0.5555555555555556,0.5714285714285714,0.6,0.625,0.6666666666666666,0.7142857142857143,0.75,0.7777777777777778,0.8,0.8333333333333334,0.8571428571428571,0.875,0.8888888888888888,1.0,1.125,1.1428571428571428,1.1666666666666667,1.2
    , 1.25,1.2857142857142858,1.3333333333333333,1.4,1.5,1.6,1.6666666666666667,1.75,1.8,2.0,2.25,2.3333333333333335,2.5,2.6666666666666665,3.0,3.5,4.0,4.5,5.0,6.0,7.0,8.0,9.0
    };

static const uint8_t rational_size = sizeof(rational) / sizeof(*rational);

template<typename T, typename U>
static void bounded_add(T& x, U y, T lb, T ub)
{
    T z = x + y;

    if (z >= lb && z <= ub)
        x = z;
}

enum focus_t { focus_freq, focus_ratio, focus_end };

int main()
{
    board::setup();
    analog::setup();
    setup_cordic();
    modulator.setup(440);
    carrier.setup(440);
    output::setup();

    focus_t focus = focus_freq;
    uint8_t midi = 69;
    uint8_t ridx = 0;

    for (;;)
    {
        message_t m;

        if (mq::get(m))
        {
            switch (m.index())
            {
            case button_press:
                printf("button %d\n", std::get<button_press>(m));
                if (std::get<button_press>(m) == 0)
                {
                    focus = static_cast<focus_t>(static_cast<int>(focus) + 1);
                    if (focus == focus_end)
                        focus = static_cast<focus_t>(0);
                }
                break;
            case encoder_delta:
                printf("encoder %d\n", std::get<encoder_delta>(m));
                switch (focus)
                {
                case focus_freq:
                    bounded_add<uint8_t, int16_t>(midi, std::get<encoder_delta>(m), 20, 108);
                    freq = midi2freq(midi);
                    printf("midi %d, f = %6.2f\n", midi, freq);
                    break;
                case focus_ratio:
                    bounded_add<uint8_t, int16_t>(ridx, std::get<encoder_delta>(m), 0, rational_size - 1);
                    ratio = rational[ridx];
                    break;
                default: printf("wrong focus\n");
                }
                break;
            default:
                printf("unhandled message type\n");
            }
        }

        index = cv2index(read<2>());

        printf("%5d %5f %5f\n", read<0>(), ratio, index);
        sys_tick::delay_ms(20);
    }
}

