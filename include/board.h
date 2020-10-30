#pragma once

#include <timer.h>
#include <pulse.h>
#include <button.h>
#include <adc.h>
#include <i2s.h>
#include <at25.h>
#include <st7789.h>
#include <fifo.h>
#include <message.h>
#include "dacdma.h"
#include "types.h"

namespace board
{

using namespace dacdma;

typedef tim_t<7> aux_tim;

// CV inputs
/*
typedef analog_t<PA0> cv1a;
typedef analog_t<PA2> cv2a;
typedef analog_t<PA3> cv3a;
typedef analog_t<PB0> cv4a;
typedef analog_t<PA1> cv1b;
typedef analog_t<PA6> cv2b;
typedef analog_t<PB11> cv3b;
typedef analog_t<PB15> cv4b;
*/

// trigger inputs
typedef input_t<PC13> trigb;
typedef input_t<PC15> triga;

// user controls
typedef encoder_t<4, PB6, PB7> encoder;
typedef button_t<PB9> encoder_btn;
//typedef analog_t<PA4> btnsa;
//typedef analog_t<PB14> btnsb;
typedef pulse_t<PB10> led1;
typedef pulse_t<PB2> led2;
typedef pulse_t<PA12> led3;
typedef pulse_t<PC14> led4;

// peripherals

typedef at25_t<256, spi_t<2, PB13, PA11, PA10>, PB12> eeprom;
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

typedef tim_t<3> adc_tim;
typedef adc_t<1> adc1;
typedef adc_t<2> adc2;
typedef dma_t<1> adc_dma;
static const uint8_t adc1_dma_ch = 1;
static const uint8_t adc2_dma_ch = 2;
static const uint32_t adc_sample_freq = 4000;
static const uint8_t adc_buf_size = 7;
extern uint16_t adc1_buf[adc_buf_size];
extern uint16_t adc2_buf[adc_buf_size];

template<uint8_t CH> inline uint16_t reada();
template<uint8_t CH> inline uint16_t readb();

template<> inline uint16_t reada<0>() { return adc1_buf[1]; }
template<> inline uint16_t reada<1>() { return adc1_buf[3]; }
template<> inline uint16_t reada<2>() { return adc1_buf[4]; }
template<> inline uint16_t reada<3>() { return adc1_buf[5]; }
template<> inline uint16_t reada<4>() { return adc2_buf[6]; }

template<> inline uint16_t readb<0>() { return adc2_buf[1]; }
template<> inline uint16_t readb<1>() { return adc2_buf[3]; }
template<> inline uint16_t readb<2>() { return adc2_buf[4]; }
template<> inline uint16_t readb<3>() { return adc2_buf[5]; }
template<> inline uint16_t readb<4>() { return adc1_buf[6]; }

void read_cv_a(ctrl_t& ctrl);

void read_cv_b(ctrl_t& ctrl);

void setup();

void start_io();

void start_dacdma();

} // namespace board

void register_triggers(itrigger *a, itrigger *b);

template<ch_t CH> float calibration<CH>::m_x0 = 2745.67;
template<ch_t CH> float calibration<CH>::m_k = 1. / 464.67;

