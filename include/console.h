#pragma once

#include <waves.h>
#include <textio.h>
#include <text.h>
#include <algorithm>
#include <cstring>

using namespace fontlib;
using namespace text;
using namespace color;

using console = console_t<board::tft>;
using encoder = board::encoder;

static const char *noyes[] = { "no", "yes" };

static unsigned menu(const char *s, const char **xs, unsigned n)
{
    uint16_t r, c;
    unsigned w = 0;
    int16_t choice = 0;

    for (unsigned i = 0; i < n; ++i)
        w = std::max(w, strlen(xs[i]));

    printf<console>("%s: ", s);
    console::get_pos(r, c);

    for (;;)
    {
        message_t m;

        console::set_pos(r, c);
        printf<console>("%-*s", w, xs[choice]);

        while (!board::mq::get(m));

        switch (m.index())
        {
        case encoder_delta:
            choice = choice + std::get<encoder_delta>(m);
            if (choice >= static_cast<int>(n))
                choice = 0;
            else if (choice < 0)
                choice = n - 1;
            break;
        case encoder_press:
            return choice;
        default: ;
        }
    }
}

static void pause(const char *message)
{
    const char *items[] = { "continue" };

    menu(message, items, 1);
}

