#include <gpio.h>

using hal::sys_tick;
using namespace hal::gpio;

typedef output_t<PB10> led1;
typedef output_t<PB2> led2;
typedef output_t<PA12> led3;
typedef output_t<PC14> led4;

typedef input_t<PB6> ch1;
typedef input_t<PB7> ch2;
typedef input_t<PB9> btn;

void loop();

int main()
{
    led1::setup();
    led2::setup();
    led3::setup();
    led4::setup();

    ch1::setup<pull_up>();
    ch2::setup<pull_up>();
    btn::setup<pull_up>();

    for (;;)
        loop();
}

void loop()
{
    led1::toggle();
    led2::write(btn::read());
    led3::write(ch1::read());
    led4::write(ch2::read());
    sys_tick::delay_ms(100);
}

