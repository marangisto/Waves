
#include "board.h"
//#include <math.h>
//#include <fixed.h>

static const uint32_t SAMPLE_FREQ = 98380;  // adjusted for I2S prescale = 27 at 170MHz

#include "gui.h"

using hal::sys_tick;
using namespace board;
using namespace analog;
using namespace synth;
using namespace fixed;

typedef hal::timer::timer_t<2> dac_tim;

static volatile float dac_load = 0.0f;

static const float voct_volt_per_adc = 1. / 464.67;

static inline float adc2cv(uint16_t adc)
{
    return (2745.67 - static_cast<float>(adc)) * voct_volt_per_adc;
}

static imodel *model_a = 0;
static imodel *model_b = 0;

template<> void handler<interrupt::EXTI15_10>()
{
    bool ba = triga::interrupt_pending();
    bool bb = trigb::interrupt_pending();

    if (ba)
    {
        if (model_a)
            model_a->trigger();
        led1::toggle();
    }

    if (bb)
    {
        if (model_b)
            model_b->trigger();
        led2::toggle();
    }

    if (ba)
        triga::clear_interrupt();
    if (bb)
        trigb::clear_interrupt();
}

static void fa(int32_t *buf, uint16_t n, uint8_t stride)
{
    ctrl_t ctrl;

    ctrl.freq = adc2cv(reada<0>());
    ctrl.cv1 = reada<1>();
    ctrl.cv2 = reada<2>();
    ctrl.cv3 = reada<3>();

    if (model_a)
        model_a->generate(ctrl, buf, n, stride);
}

static void fb(int32_t *buf, uint16_t n, uint8_t stride)
{
    ctrl_t ctrl;

    ctrl.freq = adc2cv(readb<0>());
    ctrl.cv1 = reada<1>();
    ctrl.cv2 = reada<2>();
    ctrl.cv3 = reada<3>();

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
    static gui_t<board::tft> gui;

    dac_tim::setup(170, 0xffff);

    board::dacdma::set_left_gen(fa);
    board::dacdma::set_right_gen(fb);

    board::setup();
    sys_tick::delay_ms(1000);

    triga::enable_interrupt<falling_edge>();
    trigb::enable_interrupt<falling_edge>();
    hal::nvic<interrupt::EXTI15_10>::enable();
    hal::nvic<interrupt::DMA2_CH1>::enable();

    gui.setup();
    gui.render();

    model_a = &gui.channel_a;
    model_b = &gui.channel_b;

    setup_cordic();

    message_t m;

    while (mq::get(m));     // ignore message noise

    for (;;)
    {
        if (mq::get(m))
            gui.handle_message(m);

        gui.channel_a.freq = gui.channel_a.voct.freq(adc2cv(reada<0>()));
        gui.channel_a.note = gui.channel_a.freq;
        gui.channel_a.cv1 = reada<1>();
        gui.channel_a.cv2 = reada<2>();
        gui.channel_a.cv3 = reada<3>();

        gui.channel_b.freq = gui.channel_b.voct.freq(adc2cv(readb<0>()));
        gui.channel_b.note = gui.channel_b.freq;
        gui.channel_b.cv1 = readb<1>();
        gui.channel_b.cv2 = readb<2>();
        gui.channel_b.cv3 = readb<3>();

        float load = dac_load;  // capture volatile value

        gui.load = load;

        sys_tick::delay_ms(1);
    }
}

namespace std
{

void __throw_bad_function_call() { while(1); }

} // namespace std


