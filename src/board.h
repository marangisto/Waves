#pragma once

#include <stdlib.h>
#include <timer.h>
#include <button.h>
#include <vrefbuf.h>
#include <gpio.h>
#include <i2s.h>
#include <st7789.h>
#include <draw.h>
#include <analog.h>
#include <dacdma.h>
#include <fifo.h>
#include <message.h>

namespace board
{

using hal::sys_clock;
using namespace hal::vrefbuf;
using namespace hal::timer;
using namespace hal::gpio;
using namespace hal::i2s;
using namespace st7789;
using namespace graphics;
using namespace dacdma;
using namespace analog;

typedef hal::timer::timer_t<7> aux_tim;

// CV inputs
typedef analog_t<PA0> cv1a;
typedef analog_t<PA2> cv2a;
typedef analog_t<PA3> cv3a;
typedef analog_t<PB0> cv4a;
typedef analog_t<PA1> cv1b;
typedef analog_t<PA6> cv2b;
typedef analog_t<PB11> cv3b;
typedef analog_t<PB15> cv4b;

// trigger inputs
typedef input_t<PC13> trigb;
typedef input_t<PC15> triga;

// user controls
typedef encoder_t<4, PB6, PB7> encoder;
typedef button_t<PB9> encoder_btn;
typedef analog_t<PA4> btnsa;
typedef analog_t<PB14> btnsb;
typedef output_t<PB10> led1;
typedef output_t<PB2> led2;
typedef output_t<PA12> led3;
typedef output_t<PC14> led4;

// peripherals

typedef st7789_t<1, PA5, PA7, PB1, PB4> tft;
typedef i2s_t<3, PB3, PB5, PA15> dac;
typedef dacdma_t<dac, 2, 1, 128> dacdma;
typedef output_t<PA10> mem_miso;
typedef output_t<PA11> mem_mosi;
typedef output_t<PA8> i2c_sda;
typedef output_t<PA9> i2c_scl;
typedef output_t<PB12> mem_cs;
typedef output_t<PB13> mem_sck;

// event message queue
typedef fifo_t<message_t, 0, 8> mq;

// buttons decoder (corrsponding to mid-points on the adc readings)

class btns_decoder_t
{
public:
    void setup()
    {
        m_count = m_last = 0;
    }

    inline uint8_t decode(uint16_t x)  // call with ADC value
    {
        uint8_t y = x < 1175 ? 1 : (x < 3223 ? 2 : 0);

        m_count = y != 0 && y == m_last ? m_count + 1 : 0;
        m_last = y;
        return m_count == 10 ? y : 0;
    }

private:
    uint8_t m_count;
    uint8_t m_last;
};

static btns_decoder_t bdeca, bdecb;

void setup()
{
    cv1a::setup();
    cv2a::setup();
    cv3a::setup();
    cv4a::setup();
    cv1b::setup();
    cv2b::setup();
    cv3b::setup();
    cv4b::setup();

    triga::setup();
    trigb::setup();

    encoder::setup<pull_up>(65535);
    encoder_btn::setup<pull_up>();
    btnsa::setup();
    btnsb::setup();
    led1::setup();
    led2::setup();
    led3::setup();
    led4::setup();

    interrupt::enable();

    aux_tim::setup(10 - 1, sys_clock::freq() / 10000 - 1);  // 1kHz
    aux_tim::update_interrupt_enable();
    hal::nvic<interrupt::TIM7>::enable();

    tft::setup<spi::fpclk_8>(dark_red);
    pen_t<tft>(yellow).circle(119, 119, 100);
    vrefbuf::vrefbuf_t::setup<vrs_2900>();

    dacdma::setup();
    dacdma::test_signal();

    analog::setup();

    bdeca.setup();
    bdecb.setup();
}

} // namespace board

template<> void handler<interrupt::TIM7>()
{
    using namespace board;

    static int16_t encoder_last_count = 0;
    message_t m;

    aux_tim::clear_uif();
    encoder_btn::update();

    if (encoder_btn::read())
        mq::put(m.emplace<button_press>(0));

    uint8_t ba = bdeca.decode(reada<4>());
    uint8_t bb = bdecb.decode(readb<4>());

    if (ba)
        mq::put(m.emplace<button_press>(ba));

    if (bb)
        mq::put(m.emplace<button_press>(bb + 2));

    int16_t c = static_cast<int16_t>(encoder::count()) >> 1;

    if (c != encoder_last_count)
    {
        mq::put(m.emplace<encoder_delta>(encoder_last_count - c));
        encoder_last_count = c;
    }
}

