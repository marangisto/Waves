#include "board.h"

int main()
{
    setup();
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
    }
}
