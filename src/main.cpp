#include "board.h"
#include "signal.h"
#include "gui.h"
#include <math.h>
#include <fixed.h>

using hal::sys_tick;
using namespace board;
using namespace analog;
using namespace synth;
using namespace fixed;

typedef hal::timer::timer_t<2> dac_tim;

static volatile uint32_t dac_load = 0;

static const uint32_t SAMPLE_FREQ = 98380;  // adjusted for I2S prescale = 27 at 170MHz

static const float voct_volt_per_adc = 1. / 464.67;

static inline float adc2cv(uint16_t adc)
{
    return (2745.67 - static_cast<float>(adc)) * voct_volt_per_adc;
}

static inline float cv2midi(float x)
{
    return 60 + x * 12.;
}

static inline float midi2freq(float m)
{
    return 440 * pow(2., (m-69.) / 12.);
}

static inline float cv2freq(float cv)
{
    return 440. * pow(2., cv - 9. / 12.);
}

class operator_t
{
public:
    void setup()
    {
        m_carrier.setup(220.);
        m_envelope.set_a(20e-3);
        m_envelope.set_d(0.5);
    }

    inline void control(float freq, float idx)
    {
        m_carrier.control(freq, idx);
    }

    __attribute__((always_inline))
    inline q31_t sample(q31_t mod = q31_t())
    {
        return response(m_envelope.sample()) * m_carrier.sample(mod);
    }

    __attribute__((always_inline))
    void trigger()
    {
        m_envelope.trigger();
    }

private:
    signal_generator_t<sine, SAMPLE_FREQ>   m_carrier;
    ad_envelope_t<SAMPLE_FREQ>              m_envelope;
};


static operator_t opa1, opa2;
static operator_t opb1, opb2;

template<> void handler<interrupt::EXTI15_10>()
{
    bool ba = triga::interrupt_pending();
    bool bb = trigb::interrupt_pending();

    if (ba)
    {
        opa1.trigger();
        opa2.trigger();
        led1::toggle();
    }

    if (bb)
    {
        opb1.trigger();
        opb2.trigger();
        led2::toggle();
    }

    if (ba)
        triga::clear_interrupt();
    if (bb)
        trigb::clear_interrupt();
}

static void fa(int32_t *buf, uint16_t n, uint8_t stride)
{
    float f = cv2freq(adc2cv(reada<0>()));

    opa1.control(f, 3.0f);
    opa2.control(f * 2.0f, 0.0f);
    for (uint16_t i = 0; i < n; ++i, buf += stride)
        *buf = board::dacdma::swap(opa1.sample(opa2.sample()).q);
}

static void fb(int32_t *buf, uint16_t n, uint8_t stride)
{
    float f = cv2freq(adc2cv(readb<0>()));

    opb1.control(f, 3.0f);
    opb2.control(f * 5.0f, 0.0f);
    for (uint16_t i = 0; i < n; ++i, buf += stride)
        *buf = board::dacdma::swap(opb1.sample(opb2.sample()).q);
}

template<> void handler<interrupt::DMA2_CH1>()
{
    uint32_t total_count = dac_tim::count();

    dac_tim::set_count(0);
    board::dacdma::handle_interrupt();

    if (total_count > 0)
        dac_load = (100 * dac_tim::count()) / total_count;
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

    setup_cordic();
    opa1.setup();
    opa2.setup();
    opb1.setup();
    opb2.setup();

    message_t m;

    while (mq::get(m));     // ignore message noise

    for (;;)
    {
        if (mq::get(m))
            gui.handle_message(m);

        gui.channel_a.freq = cv2freq(adc2cv(reada<0>()));
        gui.channel_a.note = gui.channel_a.freq;
        gui.channel_a.cv1 = reada<1>();
        gui.channel_a.cv2 = reada<2>();
        gui.channel_a.cv3 = reada<3>();

        gui.channel_b.freq = cv2freq(adc2cv(readb<0>()));
        gui.channel_b.note = gui.channel_b.freq;
        gui.channel_b.cv1 = readb<1>();
        gui.channel_b.cv2 = readb<2>();
        gui.channel_b.cv3 = readb<3>();
 
        //gui.cv4b = dac_load;

        sys_tick::delay_ms(1);
    }
}

namespace std
{

void __throw_bad_function_call() { while(1); }

} // namespace std


