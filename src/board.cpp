#include <board.h>
#include <tuning.h>
#include <vrefbuf.h>
#include <numeric.h>

namespace board
{

using namespace dacdma;

uint16_t adc1_buf[adc_buf_size];
uint16_t adc2_buf[adc_buf_size];

static uint16_t tab_a[OCTAVES];
static uint16_t tab_b[OCTAVES];

static inline float remap4096(float x)
{
    return remap(4095, 0, x);
}

void read_cv_a(ctrl_t& ctrl)
{
    ctrl.freq = adc2cv(tab_a, reada<0>());
    ctrl.cv2 = remap4096(reada<1>());
    ctrl.cv2 = remap4096(reada<2>());
    ctrl.cv3 = remap4096(reada<3>());
}

void read_cv_b(ctrl_t& ctrl)
{
    ctrl.freq = adc2cv(tab_b, readb<0>());
    ctrl.cv1 = remap4096(readb<1>());
    ctrl.cv2 = remap4096(readb<2>());
    ctrl.cv3 = remap4096(readb<3>());
}

// buttons decoder (corrsponding to mid-points on the adc readings)

template<int A, int B>
class btns_decoder_t
{
public:
    void setup()
    {
        m_count = m_last = m_btn = 0;
    }

    inline int8_t decode(uint16_t x)  // call with ADC value
    {
        int8_t y = x < 1175 ? A : (x < 3223 ? B : 0);

        if (y == m_last)
        {
            if (++m_count == 10)
            {
                if (y)
                    m_btn = y;
                return y ? y : -m_btn;
            }
        }
        else
        {
            m_count = 0;
            m_last = y;
        }

        return 0;
    }

private:
    uint32_t m_count;
    int8_t   m_last;    // last adc reading
    int8_t   m_btn;     // last button press
};

static btns_decoder_t<1, 2> bdeca;
static btns_decoder_t<3, 4> bdecb;

void setup()
{
    /*
    cv1a::setup();
    cv2a::setup();
    cv3a::setup();
    cv4a::setup();
    cv1b::setup();
    cv2b::setup();
    cv3b::setup();
    cv4b::setup();
    */

    triga::setup();
    trigb::setup();

    encoder::setup<pull_up>(65535);
    encoder_btn::setup<pull_up>();
    /*
    btnsa::setup();
    btnsb::setup();
    */
    led1::setup();
    led2::setup();
    led3::setup();
    led4::setup();

    bdeca.setup();
    bdecb.setup();

    tft::setup<fpclk_8>(color::black);
    console::setup(fontlib::cmuntt_20, color::green, color::black);

    eeprom::setup();
    load_tuning(A, tab_a);
    load_tuning(B, tab_b);

    adc_tim::setup(1, (sys_clock::freq() >> 1) / adc_sample_freq - 1);
    adc_tim::master_mode<adc_tim::mm_update>();
    adc_tim::enable_update_interrupt();
    interrupt::set<interrupt::TIM3>();
    adc_dma::setup();

    vrefbuf::setup<vrs_2900>();

    adc1::setup<6>();
    adc1::sample_time<2>();
    adc1::oversample<32>();
    adc1::sequence<1, 1, 1, 3, 4, 15, 5>();
    adc1::dma<adc_dma, adc1_dma_ch>(adc1_buf, adc_buf_size);
    adc1::trigger<0x4>();        // FIXME: use symbol for TIM3_TRGO
    adc1::enable();
    adc1::start_conversion();

    adc2::setup<6>();
    adc2::sample_time<2>();
    adc2::oversample<32>();
    adc2::sequence<2, 2, 2, 3, 15, 14, 17>();
    adc2::dma<adc_dma, adc2_dma_ch>(adc2_buf, adc_buf_size);
    adc2::trigger<0x4>();        // FIXME: use symbol for TIM3_TRGO
    adc2::enable();
    adc2::start_conversion();

    adc1::enable_interrupt(adc1::EOS);
    interrupt::set<interrupt::ADC1_2>();
}

void start_io()
{
    interrupt::enable();

    aux_tim::setup(10 - 1, sys_clock::freq() / 10000 - 1);  // 1kHz
    aux_tim::enable_update_interrupt();
    interrupt::set<interrupt::TIM7>();

    triga::enable_interrupt<both_edges>();
    trigb::enable_interrupt<both_edges>();
    interrupt::set<interrupt::EXTI15_10>();
}

void start_dacdma()
{
    dacdma::setup();
    dacdma::test_signal();
}

} // namespace board

template<> void handler<interrupt::TIM7>()
{
    using namespace board;

    static int16_t encoder_last_count = 0;
    message_t m;

    aux_tim::clear_update_interrupt_flag();
    encoder_btn::update();

    if (encoder_btn::read())
        mq::put(m.emplace<encoder_press>(unit));

    int8_t ba = bdeca.decode(reada<4>());
    int8_t bb = bdecb.decode(readb<4>());

    if (ba)
        mq::put(m.emplace<button_press>(ba));

    if (bb)
        mq::put(m.emplace<button_press>(bb));

    int16_t c = static_cast<int16_t>(encoder::count()) >> 1;

    if (c != encoder_last_count)
    {
        mq::put(m.emplace<encoder_delta>(encoder_last_count - c));
        encoder_last_count = c;
    }

    led1::update();
    led2::update();
    led3::update();
    led4::update();
}

template<> void handler<interrupt::TIM3>()
{
    board::adc_tim::clear_update_interrupt_flag();
}

template<> void handler<interrupt::ADC1_2>()
{
    board::adc1::clear_interrupt_flags(board::adc1::EOS);
}

static itrigger *cb_trig_a = 0, *cb_trig_b = 0;

void register_triggers(itrigger *a, itrigger *b)
{
    cb_trig_a = a;
    cb_trig_b = b;
}

void manual_trigger(ch_t ch, bool gate)
{
    if (ch == A && cb_trig_a)
        cb_trig_a->trigger(gate);
    else if (ch == B && cb_trig_b)
        cb_trig_b->trigger(gate);
}

template<> void handler<interrupt::EXTI15_10>()
{
    using namespace board;
    extern void trigger_a(bool), trigger_b(bool);

    bool ba = triga::interrupt_pending();
    bool bb = trigb::interrupt_pending();

    if (ba && cb_trig_a)
    {
        bool gate = !triga::read();

        cb_trig_a->trigger(gate);
        board::led1::write(gate);
    }

    if (bb && cb_trig_b)
    {
        bool gate = !trigb::read();

        cb_trig_b->trigger(gate);
        board::led3::write(gate);
    }

    if (ba)
        triga::clear_interrupt();
    if (bb)
        trigb::clear_interrupt();
}

