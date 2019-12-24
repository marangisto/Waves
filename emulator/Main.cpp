#include <gui.h>
#include <emulator.h>

typedef display_t<240, 240> display;

void run()
{
    static gui_t<display> gui;
    bool quit = false;

    display::initialize("Waves Emulator", 1);
    display::clear(slate_gray);

    gui.setup();
    gui.render();
    display::render();

    bool navigate = true;

    while (!quit)
    {
        int x;

        switch (poll_event(x))
        {
        case ev_quit:
            quit = true;
            break;
        case ev_key:
            {
                char c[2] = { static_cast<char>(x), 0 };
                display::render();
                navigate = !navigate;
                gui.edit_state(!navigate);
                display::render();
                break;
            }
        case ev_wheel:
            if (navigate)
                gui.navigate(x);
            else
                gui.edit(x);
            display::render();
            break;
        default: ;
        }
    }

    display::shutdown();
}

int main()
{
    try
    {
        run();
    }
    catch (const char *s)
    {
        printf("exception: %s\n", s);
    }
}

