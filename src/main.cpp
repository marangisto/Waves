#include "board.h"
#include "analog.h"
#include "signal.h"
#include "output.h"
#include <math.h>

using hal::sys_tick;
using namespace board;
using namespace analog;

static inline float cv2freq(float x)
{
    static const float f0 = 440.;
    static const float semi_tone = pow(2., 1. / 12.);

    return f0 * pow(semi_tone, 12 * x);
}

static signal_generator_t<mixed, 96000> sig_gen;

void process_buffer(uint16_t *buf, uint16_t len)
{
    for (uint16_t i = 0; i < len; ++i)
        buf[i] = (sig_gen.sample() + 1.01) * 2010.;     // FIXME: correct for clipping
}

int main()
{
    board::setup();
    analog::setup();
    setup_cordic();
    sig_gen.setup(440);
    output::setup();

    for (;;)
    {
        message_t m;

        if (mq::get(m))
        {
            switch (m.index())
            {
            case button_press:
                printf("button %d\n", std::get<0>(m));
                break;
            case encoder_delta:
                printf("encoder %d\n", std::get<1>(m));
                break;
            default:
                printf("unhandled message type\n");
            }
        }

        printf("%5d %5d %5d\n", read<0>(), read<1>(), read<2>());
        sys_tick::delay_ms(20);
    }
}

