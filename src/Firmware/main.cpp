static const unsigned long SAMPLE_FREQ = 98380;  // adjusted for I2S prescale = 27 at 170MHz

#include <board.h>
#include "gui.h"

using namespace board;
using namespace synth;
using namespace fixed;

typedef tim_t<2> dac_tim;

static volatile float dac_load = 0.0f;

static imodel *model_a = 0;
static imodel *model_b = 0;

static void fa(int32_t *buf, uint16_t n, uint8_t stride)
{
    ctrl_t ctrl;

    read_cv_a(ctrl);
    if (model_a)
        model_a->generate(ctrl, buf, n, stride);
}

static void fb(int32_t *buf, uint16_t n, uint8_t stride)
{
    ctrl_t ctrl;

    read_cv_b(ctrl);
    if (model_b)
        model_b->generate(ctrl, buf, n, stride);
}

template<> void handler<interrupt::DMA2_CH1>()
{
    uint32_t total_count = dac_tim::count();

    dac_tim::set_count(0);
    board::dacdma::handle_interrupt();

    if (total_count > 0)
        dac_load = static_cast<float>(dac_tim::count()) / total_count;
}

int main()
{
    dac_tim::setup(170, 0xffff);

    board::dacdma::set_left_gen(fa);
    board::dacdma::set_right_gen(fb);

    board::setup();
    sys_tick::delay_ms(250);

    static theme_t theme =
        { white                 // primary font color
        , grey(48)              // normal background
        , black                 // border color
        , yellow                // cursor color
        , orange_red            // editor color
        , fontlib::cmunss_28    // standard font
        , false                 // don't be quiet
        };

    static gui_t<board::tft> gui(theme);

    model_a = &gui.channel_a;
    model_b = &gui.channel_b;

    register_triggers(&gui.channel_a, &gui.channel_b);

    board::start_io();
    board::start_dacdma();

    interrupt::set<interrupt::DMA2_CH1>();

    setup_cordic();

    window_manager wm(&gui);
    message_t m;

    while (mq::get(m));     // ignore message noise

    for (;;)
    {
        if (mq::get(m))
            wm.handle_message(m);

        ctrl_t ctrl;

        read_cv_a(ctrl);
        gui.channel_a.update(ctrl);
        read_cv_b(ctrl);
        gui.channel_b.update(ctrl);

        float load = dac_load;  // capture volatile value

        gui.load = load;
        sys_tick::delay_ms(1);
    }
}

namespace std
{

void __throw_bad_function_call() { while(1); }

} // namespace std

