#include <board.h>
#include <tuning.h>

int main()
{
    board::setup();
    board::start_io();

    for (;;)
        auto_tune();
}

