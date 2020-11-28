#include <gui.h>
#include <emulator.h>

typedef display_t<240, 240> display;

void run()
{
    static gui_t<display> gui;
    bool quit = false;

    display::initialize("Waves Emulator", 1);
    display::clear(dim_gray);

    gui.setup();
    gui.render();
    display::render();

    bool navigate = true;

    while (!quit)
    {
        message_t m;
        int x;

        switch (poll_event(x))
        {
        case ev_quit:
            quit = true;
            break;
        case ev_key:
            {
                switch (static_cast<char>(x))
                {
                case '0': gui.handle_message(m.emplace<encoder_press>(0)); break;
                case '1': gui.handle_message(m.emplace<button_press>(1)); break;
                case '2': gui.handle_message(m.emplace<button_press>(2)); break;
                case '3': gui.handle_message(m.emplace<button_press>(3)); break;
                case '4': gui.handle_message(m.emplace<button_press>(4)); break;
                case 'q': quit = true; break;
                default: ;
                }
                display::render();
                break;
            }
        case ev_wheel:
            gui.handle_message(m.emplace<encoder_delta>(x));
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

