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

static volatile float dac_load = 0.0f;

static const uint32_t SAMPLE_FREQ = 98380;  // adjusted for I2S prescale = 27 at 170MHz

static const float voct_volt_per_adc = 1. / 464.67;

static inline float adc2cv(uint16_t adc)
{
    return (2745.67 - static_cast<float>(adc)) * voct_volt_per_adc;
}

class operator_t
{
public:
    void setup
        ( const volatile float *ratio
        , const volatile float *index
        , const volatile float *attack
        , const volatile float *decay
        )
    {
        m_ratio = ratio;
        m_index = index;
        m_attack = attack;
        m_decay = decay;
        m_carrier.setup(440.0f);
        m_envelope.set_a(*m_attack);
        m_envelope.set_d(*m_decay);
    }

    inline void update(float freq)
    {
        m_carrier.control(freq * *m_ratio, *m_index);
    }

    __attribute__((always_inline))
    inline q31_t sample(q31_t mod = q31_t())
    {
        return response(m_envelope.sample()) * m_carrier.sample(mod);
    }

    __attribute__((always_inline))
    void trigger()
    {
        m_envelope.set_a(*m_attack * 0.01f);    // FIXME: curve control
        m_envelope.set_d(*m_decay * 0.1f);      // FIXME: curve control
        m_envelope.trigger();
    }

private:
    signal_generator_t<sine, SAMPLE_FREQ>   m_carrier;
    ad_envelope_t<SAMPLE_FREQ>              m_envelope;
    const volatile float                    *m_ratio;
    const volatile float                    *m_index;
    const volatile float                    *m_attack;
    const volatile float                    *m_decay;
};

class freqmod_t
{
public:
    static constexpr uint8_t num_ops = 2;

    inline void trigger()
    {
        for (uint8_t i = 0; i < num_ops; ++i)
            m_op[i].trigger();
    }

private:
    operator_t m_op[num_ops];
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

static gui_t<board::tft> *gui_ptr = 0;

static void fa(int32_t *buf, uint16_t n, uint8_t stride)
{
    //float f = cv2freq(adc2cv(reada<0>()));
    float f = gui_ptr->channel_a.voct.freq(adc2cv(reada<0>()));

    opa1.update(f);
    opa2.update(f);
    for (uint16_t i = 0; i < n; ++i, buf += stride)
        *buf = board::dacdma::swap(opa1.sample(opa2.sample()).q);
}

static void fb(int32_t *buf, uint16_t n, uint8_t stride)
{
    //float f = cv2freq(adc2cv(readb<0>()));
    float f = gui_ptr->channel_b.voct.freq(adc2cv(reada<0>()));

    opb1.update(f);
    opb2.update(f);
    for (uint16_t i = 0; i < n; ++i, buf += stride)
        *buf = board::dacdma::swap(opb1.sample(opb2.sample()).q);
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

    gui_ptr = &gui;     // FIXME: not this!

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

    opa1.setup
        ( gui.channel_a.freqmod_ui.ops[0].ratio.ptr()
        , gui.channel_a.freqmod_ui.ops[0].index.ptr()
        , gui.channel_a.freqmod_ui.ops[0].attack.ptr()
        , gui.channel_a.freqmod_ui.ops[0].decay.ptr()
        );

    opa2.setup
        ( gui.channel_a.freqmod_ui.ops[1].ratio.ptr()
        , gui.channel_a.freqmod_ui.ops[1].index.ptr()
        , gui.channel_a.freqmod_ui.ops[1].attack.ptr()
        , gui.channel_a.freqmod_ui.ops[1].decay.ptr()
        );

    opb1.setup
        ( gui.channel_b.freqmod_ui.ops[0].ratio.ptr()
        , gui.channel_b.freqmod_ui.ops[0].index.ptr()
        , gui.channel_b.freqmod_ui.ops[0].attack.ptr()
        , gui.channel_b.freqmod_ui.ops[0].decay.ptr()
        );

    opb2.setup
        ( gui.channel_b.freqmod_ui.ops[1].ratio.ptr()
        , gui.channel_b.freqmod_ui.ops[1].index.ptr()
        , gui.channel_b.freqmod_ui.ops[1].attack.ptr()
        , gui.channel_b.freqmod_ui.ops[1].decay.ptr()
        );

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


