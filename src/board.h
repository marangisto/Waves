#pragma once

#include <variant>
#include <stdlib.h>
#include <usart.h>
#include <redirect.h>
#include <timer.h>
#include <button.h>
#include <gpio.h>

namespace board
{

using hal::sys_clock;
using namespace hal::timer;
using namespace hal::gpio;

typedef usart_t<2, PA2, PA3> serial;
typedef hal::timer::timer_t<7> aux_tim;

typedef output_t<PB8> led;
typedef output_t<PA10> probe;

typedef encoder_t<3, PA6, PA7> encoder;
typedef button_t<PB5> encoder_btn;
typedef button_t<PB3> push_btn;

enum message_tag_t { button_press, encoder_delta };
typedef std::variant<uint8_t, int16_t> message_t;
typedef fifo_t<message_t, 0, 8> mq;

typedef analog_t<PA0> ain1;
typedef analog_t<PA1> ain2;
typedef analog_t<PB0> ain3;

void setup()
{
    interrupt::enable();
    serial::setup<115200>();
    hal::nvic<interrupt::USART2>::enable();
    stdio_t::bind<serial>();
    printf("Waves VCO v0.1\n");

    probe::setup();
    led::setup();

    aux_tim::setup(10 - 1, sys_clock::freq() / 10000 - 1);  // 1kHz
    aux_tim::update_interrupt_enable();
    hal::nvic<interrupt::TIM7>::enable();

    encoder::setup<pull_up>(65535);
    encoder_btn::setup<pull_up>();
    push_btn::setup<pull_up>();

    ain1::setup();
    ain2::setup();
    ain3::setup();
}

} // namespace board

template<> void handler<interrupt::USART2>()
{
    serial::isr();
}

template<> void handler<interrupt::TIM7>()
{
    using namespace board;

    static int16_t encoder_last_count = 0;
    message_t m;

    aux_tim::clear_uif();
    encoder_btn::update();
    push_btn::update();

    if (encoder_btn::read())
        mq::put(m.emplace<button_press>(0));
    if (push_btn::read())
        mq::put(m.emplace<button_press>(1));

    int16_t c = static_cast<int16_t>(encoder::count()) >> 1;

    if (c != encoder_last_count)
    {
        mq::put(m.emplace<encoder_delta>(c - encoder_last_count));
        encoder_last_count = c;
    }
}

