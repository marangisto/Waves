#include "board.h"
#include "analog.h"

using hal::sys_tick;
using namespace board;
using namespace analog;

int main()
{
    board::setup();
    analog::setup();

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
