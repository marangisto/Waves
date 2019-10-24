EESchema Schematic File Version 4
LIBS:Waves-cache
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 11
Title "Waves VCO"
Date ""
Rev ""
Comp "Marangisto"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L STM32G431:STM32G431 U1
U 1 1 5D6566FC
P 7800 3950
F 0 "U1" H 7800 5581 50  0000 C CNN
F 1 "STM32G431" H 7800 5490 50  0000 C CNN
F 2 "Package_QFP:LQFP-48_7x7mm_P0.5mm" H 7800 3950 50  0001 C CNN
F 3 "" H 7800 3950 50  0001 C CNN
	1    7800 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5DA32312
P 9100 10200
F 0 "C11" H 9215 10246 50  0000 L CNN
F 1 "100n" H 9215 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9138 10050 50  0001 C CNN
F 3 "~" H 9100 10200 50  0001 C CNN
	1    9100 10200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR032
U 1 1 5DA34425
P 9100 10450
F 0 "#PWR032" H 9100 10200 50  0001 C CNN
F 1 "GND" H 9105 10277 50  0000 C CNN
F 2 "" H 9100 10450 50  0001 C CNN
F 3 "" H 9100 10450 50  0001 C CNN
	1    9100 10450
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR031
U 1 1 5DA35D1E
P 9100 9900
F 0 "#PWR031" H 9100 9750 50  0001 C CNN
F 1 "+3.3V" H 9115 10073 50  0000 C CNN
F 2 "" H 9100 9900 50  0001 C CNN
F 3 "" H 9100 9900 50  0001 C CNN
	1    9100 9900
	1    0    0    -1  
$EndComp
Text GLabel 10850 2300 0    50   Input ~ 0
I2S_WS
Text GLabel 10850 2450 0    50   Input ~ 0
I2S_SD
Text GLabel 10850 2600 0    50   Input ~ 0
I2S_CK
Text GLabel 8750 3600 2    50   Input ~ 0
I2S_CK
Text GLabel 8750 3400 2    50   Input ~ 0
I2S_SD
Text GLabel 8750 3700 2    50   Input ~ 0
I2S_WS
$Sheet
S 11150 2050 850  800 
U 5DABD69F
F0 "DAC" 50
F1 "DAC.sch" 50
F2 "OUTL" I R 12000 2300 50 
F3 "OUTR" I R 12000 2600 50 
F4 "WS" I L 11150 2300 50 
F5 "SD" I L 11150 2450 50 
F6 "CK" I L 11150 2600 50 
$EndSheet
Wire Wire Line
	10850 2600 11150 2600
Wire Wire Line
	10850 2450 11150 2450
Wire Wire Line
	10850 2300 11150 2300
Wire Wire Line
	10700 10400 10700 10350
Wire Wire Line
	11100 10400 11100 10350
Connection ~ 10700 10400
Wire Wire Line
	10700 10450 10700 10400
$Comp
L power:GNDA #PWR035
U 1 1 5DA34A3A
P 10700 10450
F 0 "#PWR035" H 10700 10200 50  0001 C CNN
F 1 "GNDA" H 10705 10277 50  0000 C CNN
F 2 "" H 10700 10450 50  0001 C CNN
F 3 "" H 10700 10450 50  0001 C CNN
	1    10700 10450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 5DA32C6E
P 10300 10200
F 0 "C14" H 10415 10246 50  0000 L CNN
F 1 "100n" H 10415 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10338 10050 50  0001 C CNN
F 3 "~" H 10300 10200 50  0001 C CNN
	1    10300 10200
	1    0    0    -1  
$EndComp
$Comp
L Connector:AudioJack2_SwitchT J13
U 1 1 5DBBBBE9
P 12900 2300
F 0 "J13" H 12720 2233 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 12720 2324 50  0000 R CNN
F 2 "Local:PJ398SM" H 12900 2300 50  0001 C CNN
F 3 "~" H 12900 2300 50  0001 C CNN
	1    12900 2300
	-1   0    0    1   
$EndComp
Wire Wire Line
	12000 2300 12700 2300
NoConn ~ 12700 2200
$Comp
L power:GND #PWR040
U 1 1 5DBBDE36
P 12600 2500
F 0 "#PWR040" H 12600 2250 50  0001 C CNN
F 1 "GND" H 12605 2327 50  0000 C CNN
F 2 "" H 12600 2500 50  0001 C CNN
F 3 "" H 12600 2500 50  0001 C CNN
	1    12600 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	12600 2500 12600 2400
Wire Wire Line
	12600 2400 12700 2400
$Comp
L Connector:AudioJack2_SwitchT J14
U 1 1 5DBBE9DC
P 12900 3200
F 0 "J14" H 12720 3133 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 12720 3224 50  0000 R CNN
F 2 "Local:PJ398SM" H 12900 3200 50  0001 C CNN
F 3 "~" H 12900 3200 50  0001 C CNN
	1    12900 3200
	-1   0    0    1   
$EndComp
NoConn ~ 12700 3100
$Comp
L power:GND #PWR041
U 1 1 5DBBE9E8
P 12600 3400
F 0 "#PWR041" H 12600 3150 50  0001 C CNN
F 1 "GND" H 12605 3227 50  0000 C CNN
F 2 "" H 12600 3400 50  0001 C CNN
F 3 "" H 12600 3400 50  0001 C CNN
	1    12600 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	12600 3400 12600 3300
Wire Wire Line
	12600 3300 12700 3300
Wire Wire Line
	12000 2600 12300 2600
Wire Wire Line
	12300 2600 12300 3200
Wire Wire Line
	12300 3200 12700 3200
$Sheet
S 800  9700 850  800 
U 5DBC944B
F0 "POWER" 50
F1 "POWER.sch" 50
$EndSheet
$Comp
L Device:C C16
U 1 1 5DCD0DD6
P 11100 10200
F 0 "C16" H 11215 10246 50  0000 L CNN
F 1 "1u" H 11215 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 11138 10050 50  0001 C CNN
F 3 "~" H 11100 10200 50  0001 C CNN
	1    11100 10200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 5DCD32C8
P 9500 10200
F 0 "C12" H 9615 10246 50  0000 L CNN
F 1 "100n" H 9615 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9538 10050 50  0001 C CNN
F 3 "~" H 9500 10200 50  0001 C CNN
	1    9500 10200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 5DCD3476
P 9900 10200
F 0 "C13" H 10015 10246 50  0000 L CNN
F 1 "100n" H 10015 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9938 10050 50  0001 C CNN
F 3 "~" H 9900 10200 50  0001 C CNN
	1    9900 10200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5DCCFDDE
P 8700 10200
F 0 "C10" H 8815 10246 50  0000 L CNN
F 1 "1u" H 8815 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8738 10050 50  0001 C CNN
F 3 "~" H 8700 10200 50  0001 C CNN
	1    8700 10200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 5DCD3CBF
P 8300 10200
F 0 "C9" H 8415 10246 50  0000 L CNN
F 1 "1u" H 8415 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8338 10050 50  0001 C CNN
F 3 "~" H 8300 10200 50  0001 C CNN
	1    8300 10200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 10350 8300 10400
Wire Wire Line
	8300 10400 8700 10400
Wire Wire Line
	9900 10400 9900 10350
Wire Wire Line
	9900 10000 9500 10000
Wire Wire Line
	8300 10000 8300 10050
Wire Wire Line
	8700 10050 8700 10000
Connection ~ 8700 10000
Wire Wire Line
	8700 10000 8300 10000
Wire Wire Line
	8700 10350 8700 10400
Connection ~ 8700 10400
Wire Wire Line
	8700 10400 9100 10400
Wire Wire Line
	9500 10350 9500 10400
Connection ~ 9500 10400
Wire Wire Line
	9500 10400 9900 10400
Wire Wire Line
	9100 10350 9100 10400
Connection ~ 9100 10400
Wire Wire Line
	9100 10400 9500 10400
Wire Wire Line
	9100 10400 9100 10450
Wire Wire Line
	9100 9900 9100 10000
Connection ~ 9100 10000
Wire Wire Line
	9100 10000 8700 10000
Wire Wire Line
	9100 10000 9100 10050
Wire Wire Line
	9500 10050 9500 10000
Connection ~ 9500 10000
Wire Wire Line
	9500 10000 9100 10000
$Comp
L Device:C C8
U 1 1 5DCD9162
P 7900 10200
F 0 "C8" H 8015 10246 50  0000 L CNN
F 1 "1u" H 8015 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7938 10050 50  0001 C CNN
F 3 "~" H 7900 10200 50  0001 C CNN
	1    7900 10200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 10050 7900 10000
Wire Wire Line
	7900 10000 8300 10000
Connection ~ 8300 10000
Wire Wire Line
	7900 10350 7900 10400
Wire Wire Line
	7900 10400 8300 10400
Connection ~ 8300 10400
$Comp
L power:+3.3V #PWR027
U 1 1 5DCDADA9
P 7650 2050
F 0 "#PWR027" H 7650 1900 50  0001 C CNN
F 1 "+3.3V" H 7665 2223 50  0000 C CNN
F 2 "" H 7650 2050 50  0001 C CNN
F 3 "" H 7650 2050 50  0001 C CNN
	1    7650 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 2050 7650 2300
Wire Wire Line
	7650 2300 7750 2300
Wire Wire Line
	7850 2300 7850 2500
Connection ~ 7650 2300
Wire Wire Line
	7650 2300 7650 2500
Wire Wire Line
	7750 2300 7750 2500
Connection ~ 7750 2300
Wire Wire Line
	7750 2300 7850 2300
Wire Wire Line
	10700 10400 11100 10400
$Comp
L power:+3.3VA #PWR029
U 1 1 5DCE5C40
P 7950 2050
F 0 "#PWR029" H 7950 1900 50  0001 C CNN
F 1 "+3.3VA" H 7965 2223 50  0000 C CNN
F 2 "" H 7950 2050 50  0001 C CNN
F 3 "" H 7950 2050 50  0001 C CNN
	1    7950 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 2050 7950 2500
$Comp
L power:GND #PWR030
U 1 1 5DCE82C6
P 7950 5650
F 0 "#PWR030" H 7950 5400 50  0001 C CNN
F 1 "GND" H 7955 5477 50  0000 C CNN
F 2 "" H 7950 5650 50  0001 C CNN
F 3 "" H 7950 5650 50  0001 C CNN
	1    7950 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 5550 7950 5400
Wire Wire Line
	7850 5400 7850 5550
Connection ~ 7850 5550
Wire Wire Line
	7850 5550 7950 5550
Wire Wire Line
	7750 5400 7750 5550
Wire Wire Line
	7750 5550 7850 5550
$Comp
L Device:C C15
U 1 1 5DCED150
P 10700 10200
F 0 "C15" H 10815 10246 50  0000 L CNN
F 1 "10n" H 10815 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10738 10050 50  0001 C CNN
F 3 "~" H 10700 10200 50  0001 C CNN
	1    10700 10200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 10400 10300 10350
Wire Wire Line
	10300 10050 10300 10000
Wire Wire Line
	10700 10000 11100 10000
$Comp
L power:+3.3VA #PWR034
U 1 1 5DA37762
P 10700 9950
F 0 "#PWR034" H 10700 9800 50  0001 C CNN
F 1 "+3.3VA" H 10715 10123 50  0000 C CNN
F 2 "" H 10700 9950 50  0001 C CNN
F 3 "" H 10700 9950 50  0001 C CNN
	1    10700 9950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 9950 10700 10000
Connection ~ 10700 10000
Wire Wire Line
	11100 10000 11100 10050
Wire Wire Line
	10700 10000 10700 10050
Wire Wire Line
	7100 10400 7100 10350
Wire Wire Line
	7500 10400 7500 10350
Connection ~ 7100 10400
Wire Wire Line
	7100 10450 7100 10400
$Comp
L power:GNDA #PWR026
U 1 1 5DD008D1
P 7100 10450
F 0 "#PWR026" H 7100 10200 50  0001 C CNN
F 1 "GNDA" H 7105 10277 50  0000 C CNN
F 2 "" H 7100 10450 50  0001 C CNN
F 3 "" H 7100 10450 50  0001 C CNN
	1    7100 10450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5DD008DB
P 7100 10200
F 0 "C6" H 7215 10246 50  0000 L CNN
F 1 "100n" H 7215 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7138 10050 50  0001 C CNN
F 3 "~" H 7100 10200 50  0001 C CNN
	1    7100 10200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5DD008E5
P 7500 10200
F 0 "C7" H 7615 10246 50  0000 L CNN
F 1 "1u" H 7615 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7538 10050 50  0001 C CNN
F 3 "~" H 7500 10200 50  0001 C CNN
	1    7500 10200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 10400 7500 10400
Wire Wire Line
	7100 10000 7500 10000
Connection ~ 7100 10000
Wire Wire Line
	7500 10000 7500 10050
Wire Wire Line
	7100 10000 7100 10050
Text GLabel 6950 10000 0    50   Input ~ 0
VREF
Wire Wire Line
	6950 10000 7100 10000
Text GLabel 6850 4800 0    50   Input ~ 0
VREF
Wire Wire Line
	6850 3000 6750 3000
Wire Wire Line
	6750 3000 6750 2300
Wire Wire Line
	6750 2300 7650 2300
$Comp
L Connector:TestPoint TP3
U 1 1 5DD12AF2
P 13950 9000
F 0 "TP3" V 13904 9188 50  0000 L CNN
F 1 "TestPoint" V 13995 9188 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 14150 9000 50  0001 C CNN
F 3 "~" H 14150 9000 50  0001 C CNN
	1    13950 9000
	0    1    1    0   
$EndComp
Text GLabel 13950 9000 0    50   Input ~ 0
VREF
$Comp
L Device:Rotary_Encoder_Switch SW?
U 1 1 5DD70181
P 6300 8100
AR Path="/5DD41DD6/5DD70181" Ref="SW?"  Part="1" 
AR Path="/5DD70181" Ref="SW2"  Part="1" 
F 0 "SW2" H 6300 8467 50  0000 C CNN
F 1 "Rotary_Encoder_Switch" H 6300 8376 50  0000 C CNN
F 2 "Rotary_Encoder:RotaryEncoder_Alps_EC11E-Switch_Vertical_H20mm" H 6150 8260 50  0001 C CNN
F 3 "~" H 6300 8360 50  0001 C CNN
	1    6300 8100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD7018D
P 6300 8500
AR Path="/5DD41DD6/5DD7018D" Ref="#PWR?"  Part="1" 
AR Path="/5DD7018D" Ref="#PWR024"  Part="1" 
F 0 "#PWR024" H 6300 8250 50  0001 C CNN
F 1 "GND" H 6305 8327 50  0000 C CNN
F 2 "" H 6300 8500 50  0001 C CNN
F 3 "" H 6300 8500 50  0001 C CNN
	1    6300 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 8000 6000 8000
Wire Wire Line
	5900 8200 6000 8200
Text GLabel 5900 8200 0    50   Input ~ 0
ENC_CH1
Text GLabel 5900 8000 0    50   Input ~ 0
ENC_CH2
Text GLabel 6700 8000 2    50   Input ~ 0
ENC_SW
Wire Wire Line
	6600 8000 6700 8000
$Comp
L Local:IPS240x240 U?
U 1 1 5DD7E5F7
P 11750 4600
AR Path="/5DD41DD6/5DD7E5F7" Ref="U?"  Part="1" 
AR Path="/5DD7E5F7" Ref="U3"  Part="1" 
F 0 "U3" H 11900 4331 50  0000 C CNN
F 1 "IPS240x240" H 11900 4240 50  0000 C CNN
F 2 "Local:IPS240x240" H 11750 4600 50  0001 C CNN
F 3 "" H 11750 4600 50  0001 C CNN
	1    11750 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DD7E5FD
P 11300 5450
AR Path="/5DD41DD6/5DD7E5FD" Ref="R?"  Part="1" 
AR Path="/5DD7E5FD" Ref="R9"  Part="1" 
F 0 "R9" V 11093 5450 50  0000 C CNN
F 1 "1k" V 11184 5450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 11230 5450 50  0001 C CNN
F 3 "~" H 11300 5450 50  0001 C CNN
	1    11300 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	11450 5450 11550 5450
$Comp
L power:GND #PWR?
U 1 1 5DD7E604
P 11900 5900
AR Path="/5DD41DD6/5DD7E604" Ref="#PWR?"  Part="1" 
AR Path="/5DD7E604" Ref="#PWR039"  Part="1" 
F 0 "#PWR039" H 11900 5650 50  0001 C CNN
F 1 "GND" H 11905 5727 50  0000 C CNN
F 2 "" H 11900 5900 50  0001 C CNN
F 3 "" H 11900 5900 50  0001 C CNN
	1    11900 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	11900 5900 11900 5800
$Comp
L power:+3.3V #PWR?
U 1 1 5DD7E60B
P 11900 4800
AR Path="/5DD41DD6/5DD7E60B" Ref="#PWR?"  Part="1" 
AR Path="/5DD7E60B" Ref="#PWR038"  Part="1" 
F 0 "#PWR038" H 11900 4650 50  0001 C CNN
F 1 "+3.3V" H 11915 4973 50  0000 C CNN
F 2 "" H 11900 4800 50  0001 C CNN
F 3 "" H 11900 4800 50  0001 C CNN
	1    11900 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	11900 4800 11900 4900
Text GLabel 11050 5350 0    50   Input ~ 0
TFT_SCL
Text GLabel 11050 5450 0    50   Input ~ 0
TFT_SDA
Wire Wire Line
	11050 5350 11550 5350
Wire Wire Line
	11050 5450 11150 5450
Text GLabel 11050 5550 0    50   Input ~ 0
TFT_DC
Wire Wire Line
	11050 5550 11550 5550
Wire Wire Line
	12250 5350 12650 5350
Wire Wire Line
	12250 5450 12350 5450
Wire Wire Line
	12350 5450 12350 4900
Wire Wire Line
	12350 4900 11900 4900
Connection ~ 11900 4900
Wire Wire Line
	11900 4900 11900 5050
$Comp
L Memory_EEPROM:AT25xxx U?
U 1 1 5DD88E60
P 11250 8050
AR Path="/5DD41DD6/5DD88E60" Ref="U?"  Part="1" 
AR Path="/5DD88E60" Ref="U2"  Part="1" 
F 0 "U2" H 11250 8531 50  0000 C CNN
F 1 "AT25xxx" H 11250 8440 50  0000 C CNN
F 2 "Package_SO:TSSOP-8_4.4x3mm_P0.65mm" H 11250 8050 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8707-SEEPROM-AT25010B-020B-040B-Datasheet.pdf" H 11250 8050 50  0001 C CNN
	1    11250 8050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD88E66
P 11250 8450
AR Path="/5DD41DD6/5DD88E66" Ref="#PWR?"  Part="1" 
AR Path="/5DD88E66" Ref="#PWR037"  Part="1" 
F 0 "#PWR037" H 11250 8200 50  0001 C CNN
F 1 "GND" H 11255 8277 50  0000 C CNN
F 2 "" H 11250 8450 50  0001 C CNN
F 3 "" H 11250 8450 50  0001 C CNN
	1    11250 8450
	1    0    0    -1  
$EndComp
Wire Wire Line
	11250 8450 11250 8350
$Comp
L power:+3.3V #PWR?
U 1 1 5DD88E6D
P 11250 7500
AR Path="/5DD41DD6/5DD88E6D" Ref="#PWR?"  Part="1" 
AR Path="/5DD88E6D" Ref="#PWR036"  Part="1" 
F 0 "#PWR036" H 11250 7350 50  0001 C CNN
F 1 "+3.3V" H 11265 7673 50  0000 C CNN
F 2 "" H 11250 7500 50  0001 C CNN
F 3 "" H 11250 7500 50  0001 C CNN
	1    11250 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	11250 7750 11250 7600
Text GLabel 11850 7950 2    50   Input ~ 0
MEM_SCK
Wire Wire Line
	11850 7950 11650 7950
Text GLabel 11850 8050 2    50   Input ~ 0
MEM_MOSI
Text GLabel 11850 8150 2    50   Input ~ 0
MEM_MISO
Text GLabel 10600 8150 0    50   Input ~ 0
MEM_CS
Wire Wire Line
	10600 8150 10850 8150
Wire Wire Line
	11650 8050 11850 8050
Wire Wire Line
	11650 8150 11850 8150
Wire Wire Line
	10850 7950 10750 7950
Wire Wire Line
	10750 7950 10750 7600
Wire Wire Line
	10750 7600 11250 7600
Connection ~ 11250 7600
Wire Wire Line
	11250 7600 11250 7500
Wire Wire Line
	10850 8050 10750 8050
Wire Wire Line
	10750 8050 10750 7950
Connection ~ 10750 7950
Text GLabel 12650 5350 2    50   Input ~ 0
TFT_RES
Text GLabel 6850 4200 0    50   Input ~ 0
TFT_SCL
Text GLabel 6850 4400 0    50   Input ~ 0
TFT_SDA
Text GLabel 6850 4600 0    50   Input ~ 0
TFT_DC
Text GLabel 8750 3500 2    50   Input ~ 0
TFT_RES
Text GLabel 8750 4700 2    50   Input ~ 0
MEM_SCK
Text GLabel 8750 4100 2    50   Input ~ 0
MEM_MOSI
Text GLabel 8750 4200 2    50   Input ~ 0
MEM_MISO
Text GLabel 8750 4800 2    50   Input ~ 0
MEM_CS
Wire Wire Line
	6000 8100 5950 8100
Wire Wire Line
	5950 8100 5950 8400
Wire Wire Line
	5950 8400 6300 8400
Wire Wire Line
	6300 8400 6300 8500
Wire Wire Line
	6300 8400 6650 8400
Wire Wire Line
	6650 8400 6650 8200
Wire Wire Line
	6650 8200 6600 8200
Connection ~ 6300 8400
Text GLabel 8750 3200 2    50   Input ~ 0
ENC_CH2
Text GLabel 8750 3300 2    50   Input ~ 0
ENC_CH1
Text GLabel 8750 3000 2    50   Input ~ 0
ENC_SW
$Comp
L Device:Crystal_GND24_Small Y?
U 1 1 5DDF1CBB
P 5700 3350
AR Path="/5DD41DD6/5DDF1CBB" Ref="Y?"  Part="1" 
AR Path="/5DDF1CBB" Ref="Y1"  Part="1" 
F 0 "Y1" V 5654 3519 50  0000 L CNN
F 1 "8MHz" V 5745 3519 50  0000 L CNN
F 2 "Crystal:Crystal_SMD_5032-4Pin_5.0x3.2mm" H 5700 3350 50  0001 C CNN
F 3 "https://sg.element14.com/multicomp/mcsjk-7i-8-00-18-10-60-b-10/crystal-8mhz-18pf-5mm-x-3-2mm/dp/2854012" H 5700 3350 50  0001 C CNN
	1    5700 3350
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5DDF1CC1
P 6250 3500
AR Path="/5DD41DD6/5DDF1CC1" Ref="R?"  Part="1" 
AR Path="/5DDF1CC1" Ref="R6"  Part="1" 
F 0 "R6" V 6043 3500 50  0000 C CNN
F 1 "470" V 6134 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6180 3500 50  0001 C CNN
F 3 "~" H 6250 3500 50  0001 C CNN
	1    6250 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 3450 5700 3500
Wire Wire Line
	5700 3250 5700 3200
Wire Wire Line
	5700 3200 6050 3200
Wire Wire Line
	6050 3200 6050 3400
Wire Wire Line
	5700 3500 6100 3500
$Comp
L Device:C C?
U 1 1 5DDF1CCC
P 5250 3200
AR Path="/5DD41DD6/5DDF1CCC" Ref="C?"  Part="1" 
AR Path="/5DDF1CCC" Ref="C2"  Part="1" 
F 0 "C2" V 4998 3200 50  0000 C CNN
F 1 "27p" V 5089 3200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5288 3050 50  0001 C CNN
F 3 "~" H 5250 3200 50  0001 C CNN
	1    5250 3200
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5DDF1CD2
P 5250 3500
AR Path="/5DD41DD6/5DDF1CD2" Ref="C?"  Part="1" 
AR Path="/5DDF1CD2" Ref="C3"  Part="1" 
F 0 "C3" V 4998 3500 50  0000 C CNN
F 1 "27p" V 5089 3500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5288 3350 50  0001 C CNN
F 3 "~" H 5250 3500 50  0001 C CNN
	1    5250 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	5400 3200 5700 3200
Connection ~ 5700 3200
Wire Wire Line
	5400 3500 5700 3500
Connection ~ 5700 3500
Wire Wire Line
	5100 3200 4950 3200
Wire Wire Line
	4950 3200 4950 3500
Wire Wire Line
	4950 3500 5100 3500
$Comp
L power:GND #PWR?
U 1 1 5DDF1CDF
P 4950 3800
AR Path="/5DD41DD6/5DDF1CDF" Ref="#PWR?"  Part="1" 
AR Path="/5DDF1CDF" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 4950 3550 50  0001 C CNN
F 1 "GND" H 4955 3627 50  0000 C CNN
F 2 "" H 4950 3800 50  0001 C CNN
F 3 "" H 4950 3800 50  0001 C CNN
	1    4950 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3800 4950 3500
Connection ~ 4950 3500
$Comp
L power:GND #PWR?
U 1 1 5DDF1CE7
P 5500 3350
AR Path="/5DD41DD6/5DDF1CE7" Ref="#PWR?"  Part="1" 
AR Path="/5DDF1CE7" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 5500 3100 50  0001 C CNN
F 1 "GND" H 5505 3177 50  0000 C CNN
F 2 "" H 5500 3350 50  0001 C CNN
F 3 "" H 5500 3350 50  0001 C CNN
	1    5500 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DDF1CED
P 5900 3350
AR Path="/5DD41DD6/5DDF1CED" Ref="#PWR?"  Part="1" 
AR Path="/5DDF1CED" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 5900 3100 50  0001 C CNN
F 1 "GND" H 5905 3177 50  0000 C CNN
F 2 "" H 5900 3350 50  0001 C CNN
F 3 "" H 5900 3350 50  0001 C CNN
	1    5900 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 3400 6850 3400
Wire Wire Line
	5500 3350 5600 3350
Wire Wire Line
	5800 3350 5900 3350
Wire Wire Line
	6400 3500 6850 3500
$Comp
L Device:C C?
U 1 1 5DE03D3B
P 6050 10250
AR Path="/5DD41DD6/5DE03D3B" Ref="C?"  Part="1" 
AR Path="/5DE03D3B" Ref="C4"  Part="1" 
F 0 "C4" H 6165 10296 50  0000 L CNN
F 1 "100n" H 6165 10205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6088 10100 50  0001 C CNN
F 3 "~" H 6050 10250 50  0001 C CNN
	1    6050 10250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DE03D41
P 6050 10550
AR Path="/5DD41DD6/5DE03D41" Ref="#PWR?"  Part="1" 
AR Path="/5DE03D41" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 6050 10300 50  0001 C CNN
F 1 "GND" H 6055 10377 50  0000 C CNN
F 2 "" H 6050 10550 50  0001 C CNN
F 3 "" H 6050 10550 50  0001 C CNN
	1    6050 10550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 10550 6050 10500
$Comp
L Switch:SW_Push SW?
U 1 1 5DE03D48
P 5600 10250
AR Path="/5DD41DD6/5DE03D48" Ref="SW?"  Part="1" 
AR Path="/5DE03D48" Ref="SW1"  Part="1" 
F 0 "SW1" V 5646 10202 50  0000 R CNN
F 1 "SW_Push" V 5555 10202 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 5600 10450 50  0001 C CNN
F 3 "~" H 5600 10450 50  0001 C CNN
	1    5600 10250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5600 10450 5600 10500
Wire Wire Line
	5600 10500 6050 10500
Connection ~ 6050 10500
Wire Wire Line
	6050 10500 6050 10400
Wire Wire Line
	5600 10050 5600 10000
Wire Wire Line
	5600 10000 6050 10000
Wire Wire Line
	6050 10000 6050 10100
Text GLabel 6200 10000 2    50   Input ~ 0
RESET
Wire Wire Line
	6200 10000 6050 10000
Connection ~ 6050 10000
$Comp
L power:GND #PWR?
U 1 1 5DE03D66
P 3100 10450
AR Path="/5DD41DD6/5DE03D66" Ref="#PWR?"  Part="1" 
AR Path="/5DE03D66" Ref="#PWR013"  Part="1" 
F 0 "#PWR013" H 3100 10200 50  0001 C CNN
F 1 "GND" H 3105 10277 50  0000 C CNN
F 2 "" H 3100 10450 50  0001 C CNN
F 3 "" H 3100 10450 50  0001 C CNN
	1    3100 10450
	1    0    0    -1  
$EndComp
Text GLabel 8750 3800 2    50   Input ~ 0
SWCLK
Text GLabel 8750 3900 2    50   Input ~ 0
SWDIO
Text GLabel 6850 3600 0    50   Input ~ 0
RESET
$Comp
L Connector:AudioJack2_SwitchT J?
U 1 1 5DE158BF
P 1950 1700
AR Path="/5DD41DD6/5DE158BF" Ref="J?"  Part="1" 
AR Path="/5DE158BF" Ref="J1"  Part="1" 
F 0 "J1" H 1771 1633 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 1771 1724 50  0000 R CNN
F 2 "Local:PJ398SM" H 1950 1700 50  0001 C CNN
F 3 "~" H 1950 1700 50  0001 C CNN
	1    1950 1700
	1    0    0    1   
$EndComp
Wire Wire Line
	2150 1800 2200 1800
Wire Wire Line
	2150 1600 2200 1600
Wire Wire Line
	2200 1600 2200 1800
Connection ~ 2200 1800
Wire Wire Line
	2200 1800 2200 1850
$Comp
L Connector:AudioJack2_SwitchT J?
U 1 1 5DE20ACF
P 1950 8500
AR Path="/5DD41DD6/5DE20ACF" Ref="J?"  Part="1" 
AR Path="/5DE20ACF" Ref="J10"  Part="1" 
F 0 "J10" H 1771 8433 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 1771 8524 50  0000 R CNN
F 2 "Local:PJ398SM" H 1950 8500 50  0001 C CNN
F 3 "~" H 1950 8500 50  0001 C CNN
	1    1950 8500
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DE20AD5
P 2200 8650
AR Path="/5DD41DD6/5DE20AD5" Ref="#PWR?"  Part="1" 
AR Path="/5DE20AD5" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 2200 8400 50  0001 C CNN
F 1 "GND" H 2205 8477 50  0000 C CNN
F 2 "" H 2200 8650 50  0001 C CNN
F 3 "" H 2200 8650 50  0001 C CNN
	1    2200 8650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 8600 2200 8600
Wire Wire Line
	2200 8600 2200 8650
Wire Wire Line
	2200 8350 2200 8400
Wire Wire Line
	2200 8400 2150 8400
$Sheet
S 2500 8400 500  200 
U 5DE20ADD
F0 "sheet5DE20AC9" 50
F1 "DigitalIn.sch" 50
F2 "Trig" I R 3000 8500 50 
F3 "In" I L 2500 8500 50 
$EndSheet
Wire Wire Line
	2150 8500 2500 8500
Wire Wire Line
	3000 8500 3350 8500
Text GLabel 3350 8500 2    50   Input ~ 0
TRIGB
$Sheet
S 8200 6500 550  450 
U 5DE2B991
F0 "sheet5DE2B98D" 50
F1 "PushLED.sch" 50
F2 "LED" I L 8200 6650 50 
F3 "SW" I L 8200 6800 50 
$EndSheet
Text GLabel 7950 6650 0    50   Input ~ 0
LED1
Text GLabel 7950 6800 0    50   Input ~ 0
BTN1
Wire Wire Line
	7950 6800 8200 6800
Wire Wire Line
	8200 6650 7950 6650
$Comp
L power:GND #PWR033
U 1 1 5DE65221
P 9350 3200
F 0 "#PWR033" H 9350 2950 50  0001 C CNN
F 1 "GND" H 9355 3027 50  0000 C CNN
F 2 "" H 9350 3200 50  0001 C CNN
F 3 "" H 9350 3200 50  0001 C CNN
	1    9350 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 3200 9350 3100
Wire Wire Line
	9350 3100 8750 3100
Text GLabel 6850 3700 0    50   Input ~ 0
CV1A
Text GLabel 6850 3900 0    50   Input ~ 0
CV2A
Text GLabel 6850 4000 0    50   Input ~ 0
CV3A
Text GLabel 6850 4500 0    50   Input ~ 0
CV4A
Text GLabel 6850 3800 0    50   Input ~ 0
CV1B
Text GLabel 6850 4300 0    50   Input ~ 0
CV2B
Text GLabel 8750 4900 2    50   Input ~ 0
CV3B
Text GLabel 8750 4500 2    50   Input ~ 0
CV4B
Wire Wire Line
	3100 10350 3100 10450
$Comp
L Connector:Conn_01x04_Male J12
U 1 1 5DED261C
P 4250 10350
F 0 "J12" H 4222 10232 50  0000 R CNN
F 1 "Conn_01x04_Male" H 4222 10323 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 4250 10350 50  0001 C CNN
F 3 "~" H 4250 10350 50  0001 C CNN
	1    4250 10350
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DED37B6
P 4550 10550
AR Path="/5DD41DD6/5DED37B6" Ref="#PWR?"  Part="1" 
AR Path="/5DED37B6" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 4550 10300 50  0001 C CNN
F 1 "GND" H 4555 10377 50  0000 C CNN
F 2 "" H 4550 10550 50  0001 C CNN
F 3 "" H 4550 10550 50  0001 C CNN
	1    4550 10550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 10450 4550 10450
Wire Wire Line
	4550 10450 4550 10550
Wire Wire Line
	4550 10450 4550 10250
Wire Wire Line
	4550 10250 4450 10250
Connection ~ 4550 10450
Text GLabel 4850 10150 2    50   Input ~ 0
I2C_SDA
Text GLabel 4850 10350 2    50   Input ~ 0
I2C_SCL
Text GLabel 8750 4400 2    50   Input ~ 0
I2C_SDA
Text GLabel 8750 4300 2    50   Input ~ 0
I2C_SCL
Wire Wire Line
	2950 10350 3100 10350
$Comp
L Connector:Conn_01x04_Male J11
U 1 1 5DE9C7EE
P 2750 10250
F 0 "J11" H 2722 10132 50  0000 R CNN
F 1 "Conn_01x04_Male" H 2722 10223 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 2750 10250 50  0001 C CNN
F 3 "~" H 2750 10250 50  0001 C CNN
	1    2750 10250
	1    0    0    1   
$EndComp
Text GLabel 2950 10250 2    50   Input ~ 0
SWCLK
Text GLabel 2950 10150 2    50   Input ~ 0
SWDIO
Text GLabel 2950 10050 2    50   Input ~ 0
RESET
$Comp
L Device:R R3
U 1 1 5DF95B04
P 4550 9900
F 0 "R3" H 4620 9946 50  0000 L CNN
F 1 "4k7" H 4620 9855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4480 9900 50  0001 C CNN
F 3 "~" H 4550 9900 50  0001 C CNN
	1    4550 9900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5DF964EB
P 4700 9900
F 0 "R4" H 4770 9946 50  0000 L CNN
F 1 "4k7" H 4770 9855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4630 9900 50  0001 C CNN
F 3 "~" H 4700 9900 50  0001 C CNN
	1    4700 9900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 10050 4550 10150
Wire Wire Line
	4450 10150 4550 10150
Connection ~ 4550 10150
Wire Wire Line
	4550 10150 4850 10150
Wire Wire Line
	4450 10350 4700 10350
Wire Wire Line
	4700 10350 4700 10050
Connection ~ 4700 10350
Wire Wire Line
	4700 10350 4850 10350
$Comp
L power:+3.3V #PWR015
U 1 1 5DFC782D
P 4550 9600
F 0 "#PWR015" H 4550 9450 50  0001 C CNN
F 1 "+3.3V" H 4565 9773 50  0000 C CNN
F 2 "" H 4550 9600 50  0001 C CNN
F 3 "" H 4550 9600 50  0001 C CNN
	1    4550 9600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 9650 4700 9750
Wire Wire Line
	4550 9650 4550 9750
Connection ~ 4550 9650
Wire Wire Line
	4550 9600 4550 9650
Wire Wire Line
	4550 9650 4700 9650
$Comp
L Connector:AudioJack2_SwitchT J?
U 1 1 5E00864D
P 1950 7650
AR Path="/5DD41DD6/5E00864D" Ref="J?"  Part="1" 
AR Path="/5E00864D" Ref="J9"  Part="1" 
F 0 "J9" H 1771 7583 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 1771 7674 50  0000 R CNN
F 2 "Local:PJ398SM" H 1950 7650 50  0001 C CNN
F 3 "~" H 1950 7650 50  0001 C CNN
	1    1950 7650
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E008657
P 2200 7800
AR Path="/5DD41DD6/5E008657" Ref="#PWR?"  Part="1" 
AR Path="/5E008657" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 2200 7550 50  0001 C CNN
F 1 "GND" H 2205 7627 50  0000 C CNN
F 2 "" H 2200 7800 50  0001 C CNN
F 3 "" H 2200 7800 50  0001 C CNN
	1    2200 7800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 7750 2200 7750
Wire Wire Line
	2200 7750 2200 7800
Wire Wire Line
	2200 7500 2200 7550
Wire Wire Line
	2200 7550 2150 7550
$Sheet
S 2500 7550 500  200 
U 5E008663
F0 "sheet5E008663" 50
F1 "DigitalIn.sch" 50
F2 "Trig" I R 3000 7650 50 
F3 "In" I L 2500 7650 50 
$EndSheet
Wire Wire Line
	2150 7650 2500 7650
Wire Wire Line
	3000 7650 3350 7650
Text GLabel 3350 7650 2    50   Input ~ 0
TRIGA
Text GLabel 6850 4700 0    50   Input ~ 0
TRIGA
Text GLabel 6850 4900 0    50   Input ~ 0
TRIGB
$Sheet
S 8200 7200 550  450 
U 5E016F8F
F0 "sheet5E016F8F" 50
F1 "PushLED.sch" 50
F2 "LED" I L 8200 7350 50 
F3 "SW" I L 8200 7500 50 
$EndSheet
Text GLabel 7950 7350 0    50   Input ~ 0
LED2
Text GLabel 7950 7500 0    50   Input ~ 0
BTN2
Wire Wire Line
	7950 7500 8200 7500
Wire Wire Line
	8200 7350 7950 7350
$Sheet
S 8200 7900 550  450 
U 5E023019
F0 "sheet5E023019" 50
F1 "PushLED.sch" 50
F2 "LED" I L 8200 8050 50 
F3 "SW" I L 8200 8200 50 
$EndSheet
Text GLabel 7950 8050 0    50   Input ~ 0
LED3
Text GLabel 7950 8200 0    50   Input ~ 0
BTN3
Wire Wire Line
	7950 8200 8200 8200
Wire Wire Line
	8200 8050 7950 8050
Text GLabel 6850 3100 0    50   Input ~ 0
LED1
Text GLabel 4350 6550 0    50   Input ~ 0
BTN1
Text GLabel 6850 3200 0    50   Input ~ 0
LED2
Text GLabel 4350 6950 0    50   Input ~ 0
BTN2
Text GLabel 8750 4000 2    50   Input ~ 0
LED4
Text GLabel 6100 6550 0    50   Input ~ 0
BTN3
$Comp
L Connector:TestPoint TP1
U 1 1 5E04A27D
P 13950 8300
F 0 "TP1" V 13904 8488 50  0000 L CNN
F 1 "TestPoint" V 13995 8488 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 14150 8300 50  0001 C CNN
F 3 "~" H 14150 8300 50  0001 C CNN
	1    13950 8300
	0    1    1    0   
$EndComp
Text GLabel 13950 8300 0    50   Input ~ 0
CV1A
$Comp
L Connector:TestPoint TP2
U 1 1 5E062212
P 13950 8650
F 0 "TP2" V 13904 8838 50  0000 L CNN
F 1 "TestPoint" V 13995 8838 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 14150 8650 50  0001 C CNN
F 3 "~" H 14150 8650 50  0001 C CNN
	1    13950 8650
	0    1    1    0   
$EndComp
Text GLabel 13950 8650 0    50   Input ~ 0
CV1B
$Sheet
S 2850 1550 800  750 
U 5E0AD457
F0 "QuadCV" 50
F1 "QuadCV.sch" 50
F2 "VOCT" I L 2850 1700 50 
F3 "VOCT_ADC" I R 3650 1700 50 
F4 "CV1" I L 2850 1850 50 
F5 "CV1_ADC" I R 3650 1850 50 
F6 "CV2_ADC" I R 3650 2000 50 
F7 "CV3" I L 2850 2150 50 
F8 "CV3_ADC" I R 3650 2150 50 
F9 "CV2" I L 2850 2000 50 
$EndSheet
$Comp
L power:GND #PWR?
U 1 1 5DE158C5
P 2200 1850
AR Path="/5DD41DD6/5DE158C5" Ref="#PWR?"  Part="1" 
AR Path="/5DE158C5" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 2200 1600 50  0001 C CNN
F 1 "GND" H 2205 1677 50  0000 C CNN
F 2 "" H 2200 1850 50  0001 C CNN
F 3 "" H 2200 1850 50  0001 C CNN
	1    2200 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1700 2850 1700
$Comp
L Connector:AudioJack2_SwitchT J?
U 1 1 5E1707D6
P 1950 2350
AR Path="/5DD41DD6/5E1707D6" Ref="J?"  Part="1" 
AR Path="/5E1707D6" Ref="J2"  Part="1" 
F 0 "J2" H 1771 2283 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 1771 2374 50  0000 R CNN
F 2 "Local:PJ398SM" H 1950 2350 50  0001 C CNN
F 3 "~" H 1950 2350 50  0001 C CNN
	1    1950 2350
	1    0    0    1   
$EndComp
Wire Wire Line
	2150 2450 2200 2450
Wire Wire Line
	2150 2250 2200 2250
Wire Wire Line
	2200 2250 2200 2450
Connection ~ 2200 2450
Wire Wire Line
	2200 2450 2200 2500
$Comp
L power:GND #PWR?
U 1 1 5E1707E5
P 2200 2500
AR Path="/5DD41DD6/5E1707E5" Ref="#PWR?"  Part="1" 
AR Path="/5E1707E5" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 2200 2250 50  0001 C CNN
F 1 "GND" H 2205 2327 50  0000 C CNN
F 2 "" H 2200 2500 50  0001 C CNN
F 3 "" H 2200 2500 50  0001 C CNN
	1    2200 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 2350 2350 2350
$Comp
L Connector:AudioJack2_SwitchT J?
U 1 1 5E17C1D8
P 1950 3000
AR Path="/5DD41DD6/5E17C1D8" Ref="J?"  Part="1" 
AR Path="/5E17C1D8" Ref="J3"  Part="1" 
F 0 "J3" H 1771 2933 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 1771 3024 50  0000 R CNN
F 2 "Local:PJ398SM" H 1950 3000 50  0001 C CNN
F 3 "~" H 1950 3000 50  0001 C CNN
	1    1950 3000
	1    0    0    1   
$EndComp
Wire Wire Line
	2150 3100 2200 3100
Wire Wire Line
	2150 2900 2200 2900
Wire Wire Line
	2200 2900 2200 3100
Connection ~ 2200 3100
Wire Wire Line
	2200 3100 2200 3150
$Comp
L power:GND #PWR?
U 1 1 5E17C1E7
P 2200 3150
AR Path="/5DD41DD6/5E17C1E7" Ref="#PWR?"  Part="1" 
AR Path="/5E17C1E7" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 2200 2900 50  0001 C CNN
F 1 "GND" H 2205 2977 50  0000 C CNN
F 2 "" H 2200 3150 50  0001 C CNN
F 3 "" H 2200 3150 50  0001 C CNN
	1    2200 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 3000 2500 3000
$Comp
L Connector:AudioJack2_SwitchT J?
U 1 1 5E17C1F2
P 1950 3650
AR Path="/5DD41DD6/5E17C1F2" Ref="J?"  Part="1" 
AR Path="/5E17C1F2" Ref="J4"  Part="1" 
F 0 "J4" H 1771 3583 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 1771 3674 50  0000 R CNN
F 2 "Local:PJ398SM" H 1950 3650 50  0001 C CNN
F 3 "~" H 1950 3650 50  0001 C CNN
	1    1950 3650
	1    0    0    1   
$EndComp
Wire Wire Line
	2150 3750 2200 3750
Wire Wire Line
	2150 3550 2200 3550
Wire Wire Line
	2200 3550 2200 3750
Connection ~ 2200 3750
Wire Wire Line
	2200 3750 2200 3800
$Comp
L power:GND #PWR?
U 1 1 5E17C201
P 2200 3800
AR Path="/5DD41DD6/5E17C201" Ref="#PWR?"  Part="1" 
AR Path="/5E17C201" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 2200 3550 50  0001 C CNN
F 1 "GND" H 2205 3627 50  0000 C CNN
F 2 "" H 2200 3800 50  0001 C CNN
F 3 "" H 2200 3800 50  0001 C CNN
	1    2200 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 3650 2650 3650
Wire Wire Line
	2850 1850 2350 1850
Wire Wire Line
	2350 1850 2350 2350
Wire Wire Line
	2850 2000 2500 2000
Wire Wire Line
	2500 2000 2500 3000
Wire Wire Line
	2850 2150 2650 2150
Wire Wire Line
	2650 2150 2650 3650
$Comp
L Connector:AudioJack2_SwitchT J?
U 1 1 5E1FC1D4
P 1950 4600
AR Path="/5DD41DD6/5E1FC1D4" Ref="J?"  Part="1" 
AR Path="/5E1FC1D4" Ref="J5"  Part="1" 
F 0 "J5" H 1771 4533 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 1771 4624 50  0000 R CNN
F 2 "Local:PJ398SM" H 1950 4600 50  0001 C CNN
F 3 "~" H 1950 4600 50  0001 C CNN
	1    1950 4600
	1    0    0    1   
$EndComp
Wire Wire Line
	2150 4700 2200 4700
Wire Wire Line
	2150 4500 2200 4500
Wire Wire Line
	2200 4500 2200 4700
Connection ~ 2200 4700
Wire Wire Line
	2200 4700 2200 4750
$Sheet
S 2850 4450 800  750 
U 5E1FC1E7
F0 "sheet5E1FC1E7" 50
F1 "QuadCV.sch" 50
F2 "VOCT" I L 2850 4600 50 
F3 "VOCT_ADC" I R 3650 4600 50 
F4 "CV1" I L 2850 4750 50 
F5 "CV1_ADC" I R 3650 4750 50 
F6 "CV2_ADC" I R 3650 4900 50 
F7 "CV3" I L 2850 5050 50 
F8 "CV3_ADC" I R 3650 5050 50 
F9 "CV2" I L 2850 4900 50 
$EndSheet
$Comp
L power:GND #PWR?
U 1 1 5E1FC1ED
P 2200 4750
AR Path="/5DD41DD6/5E1FC1ED" Ref="#PWR?"  Part="1" 
AR Path="/5E1FC1ED" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 2200 4500 50  0001 C CNN
F 1 "GND" H 2205 4577 50  0000 C CNN
F 2 "" H 2200 4750 50  0001 C CNN
F 3 "" H 2200 4750 50  0001 C CNN
	1    2200 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 4600 2850 4600
$Comp
L Connector:AudioJack2_SwitchT J?
U 1 1 5E1FC1F8
P 1950 5250
AR Path="/5DD41DD6/5E1FC1F8" Ref="J?"  Part="1" 
AR Path="/5E1FC1F8" Ref="J6"  Part="1" 
F 0 "J6" H 1771 5183 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 1771 5274 50  0000 R CNN
F 2 "Local:PJ398SM" H 1950 5250 50  0001 C CNN
F 3 "~" H 1950 5250 50  0001 C CNN
	1    1950 5250
	1    0    0    1   
$EndComp
Wire Wire Line
	2150 5350 2200 5350
Wire Wire Line
	2150 5150 2200 5150
Wire Wire Line
	2200 5150 2200 5350
Connection ~ 2200 5350
Wire Wire Line
	2200 5350 2200 5400
$Comp
L power:GND #PWR?
U 1 1 5E1FC207
P 2200 5400
AR Path="/5DD41DD6/5E1FC207" Ref="#PWR?"  Part="1" 
AR Path="/5E1FC207" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 2200 5150 50  0001 C CNN
F 1 "GND" H 2205 5227 50  0000 C CNN
F 2 "" H 2200 5400 50  0001 C CNN
F 3 "" H 2200 5400 50  0001 C CNN
	1    2200 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 5250 2350 5250
$Comp
L Connector:AudioJack2_SwitchT J?
U 1 1 5E1FC212
P 1950 5900
AR Path="/5DD41DD6/5E1FC212" Ref="J?"  Part="1" 
AR Path="/5E1FC212" Ref="J7"  Part="1" 
F 0 "J7" H 1771 5833 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 1771 5924 50  0000 R CNN
F 2 "Local:PJ398SM" H 1950 5900 50  0001 C CNN
F 3 "~" H 1950 5900 50  0001 C CNN
	1    1950 5900
	1    0    0    1   
$EndComp
Wire Wire Line
	2150 6000 2200 6000
Wire Wire Line
	2150 5800 2200 5800
Wire Wire Line
	2200 5800 2200 6000
Connection ~ 2200 6000
Wire Wire Line
	2200 6000 2200 6050
$Comp
L power:GND #PWR?
U 1 1 5E1FC221
P 2200 6050
AR Path="/5DD41DD6/5E1FC221" Ref="#PWR?"  Part="1" 
AR Path="/5E1FC221" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 2200 5800 50  0001 C CNN
F 1 "GND" H 2205 5877 50  0000 C CNN
F 2 "" H 2200 6050 50  0001 C CNN
F 3 "" H 2200 6050 50  0001 C CNN
	1    2200 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 5900 2500 5900
$Comp
L Connector:AudioJack2_SwitchT J?
U 1 1 5E1FC22C
P 1950 6550
AR Path="/5DD41DD6/5E1FC22C" Ref="J?"  Part="1" 
AR Path="/5E1FC22C" Ref="J8"  Part="1" 
F 0 "J8" H 1771 6483 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 1771 6574 50  0000 R CNN
F 2 "Local:PJ398SM" H 1950 6550 50  0001 C CNN
F 3 "~" H 1950 6550 50  0001 C CNN
	1    1950 6550
	1    0    0    1   
$EndComp
Wire Wire Line
	2150 6650 2200 6650
Wire Wire Line
	2150 6450 2200 6450
Wire Wire Line
	2200 6450 2200 6650
Connection ~ 2200 6650
Wire Wire Line
	2200 6650 2200 6700
$Comp
L power:GND #PWR?
U 1 1 5E1FC23B
P 2200 6700
AR Path="/5DD41DD6/5E1FC23B" Ref="#PWR?"  Part="1" 
AR Path="/5E1FC23B" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 2200 6450 50  0001 C CNN
F 1 "GND" H 2205 6527 50  0000 C CNN
F 2 "" H 2200 6700 50  0001 C CNN
F 3 "" H 2200 6700 50  0001 C CNN
	1    2200 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 6550 2650 6550
Wire Wire Line
	2850 4750 2350 4750
Wire Wire Line
	2350 4750 2350 5250
Wire Wire Line
	2850 4900 2500 4900
Wire Wire Line
	2500 4900 2500 5900
Wire Wire Line
	2850 5050 2650 5050
Wire Wire Line
	2650 5050 2650 6550
Text GLabel 3800 1700 2    50   Input ~ 0
CV1A
Text GLabel 3800 4600 2    50   Input ~ 0
CV1B
Text GLabel 3800 1850 2    50   Input ~ 0
CV2A
Text GLabel 3800 2000 2    50   Input ~ 0
CV3A
Text GLabel 3800 2150 2    50   Input ~ 0
CV4A
Text GLabel 3800 4750 2    50   Input ~ 0
CV2B
Text GLabel 3800 4900 2    50   Input ~ 0
CV3B
Text GLabel 3800 5050 2    50   Input ~ 0
CV4B
Wire Wire Line
	3650 4600 3800 4600
Wire Wire Line
	3650 4750 3800 4750
Wire Wire Line
	3650 4900 3800 4900
Wire Wire Line
	3650 5050 3800 5050
Wire Wire Line
	3650 1700 3800 1700
Wire Wire Line
	3650 1850 3800 1850
Wire Wire Line
	3650 2000 3800 2000
Wire Wire Line
	3650 2150 3800 2150
Wire Wire Line
	7950 5550 7950 5650
Connection ~ 7950 5550
$Comp
L power:GNDA #PWR028
U 1 1 5E311600
P 7650 5650
F 0 "#PWR028" H 7650 5400 50  0001 C CNN
F 1 "GNDA" H 7655 5477 50  0000 C CNN
F 2 "" H 7650 5650 50  0001 C CNN
F 3 "" H 7650 5650 50  0001 C CNN
	1    7650 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 5400 7650 5650
$Comp
L power:+3.3V #PWR021
U 1 1 5E33CF89
P 6050 9600
F 0 "#PWR021" H 6050 9450 50  0001 C CNN
F 1 "+3.3V" H 6065 9773 50  0000 C CNN
F 2 "" H 6050 9600 50  0001 C CNN
F 3 "" H 6050 9600 50  0001 C CNN
	1    6050 9600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5DB537DD
P 6050 9800
F 0 "R5" H 6120 9846 50  0000 L CNN
F 1 "10k" H 6120 9755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5980 9800 50  0001 C CNN
F 3 "~" H 6050 9800 50  0001 C CNN
	1    6050 9800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 9650 6050 9600
Wire Wire Line
	6050 10000 6050 9950
$Sheet
S 8200 8600 550  450 
U 5DB13571
F0 "sheet5DB13571" 50
F1 "PushLED.sch" 50
F2 "LED" I L 8200 8750 50 
F3 "SW" I L 8200 8900 50 
$EndSheet
Text GLabel 7950 8750 0    50   Input ~ 0
LED4
Text GLabel 7950 8900 0    50   Input ~ 0
BTN4
Wire Wire Line
	7950 8900 8200 8900
Wire Wire Line
	8200 8750 7950 8750
Text GLabel 6850 3300 0    50   Input ~ 0
LED3
Text GLabel 6100 6950 0    50   Input ~ 0
BTN4
$Comp
L Device:R R1
U 1 1 5DB49818
P 4500 6350
F 0 "R1" H 4570 6396 50  0000 L CNN
F 1 "4k7" H 4570 6305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4430 6350 50  0001 C CNN
F 3 "~" H 4500 6350 50  0001 C CNN
	1    4500 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5DB49BD4
P 4500 6750
F 0 "R2" H 4570 6796 50  0000 L CNN
F 1 "4k7" H 4570 6705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4430 6750 50  0001 C CNN
F 3 "~" H 4500 6750 50  0001 C CNN
	1    4500 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 6500 4500 6550
Wire Wire Line
	4350 6550 4500 6550
Connection ~ 4500 6550
Wire Wire Line
	4500 6550 4500 6600
Wire Wire Line
	4350 6950 4500 6950
Wire Wire Line
	4500 6950 4500 6900
Wire Wire Line
	4500 6150 4500 6200
$Comp
L Device:C C1
U 1 1 5DB94965
P 4850 6750
F 0 "C1" H 4965 6796 50  0000 L CNN
F 1 "100n" H 4965 6705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4888 6600 50  0001 C CNN
F 3 "~" H 4850 6750 50  0001 C CNN
	1    4850 6750
	1    0    0    -1  
$EndComp
Text GLabel 5050 6550 2    50   Input ~ 0
BTNSA
Wire Wire Line
	4500 6550 4850 6550
Wire Wire Line
	4850 6550 4850 6600
Connection ~ 4850 6550
Wire Wire Line
	4850 6550 5050 6550
$Comp
L power:GND #PWR017
U 1 1 5DBCC794
P 4850 7000
F 0 "#PWR017" H 4850 6750 50  0001 C CNN
F 1 "GND" H 4855 6827 50  0000 C CNN
F 2 "" H 4850 7000 50  0001 C CNN
F 3 "" H 4850 7000 50  0001 C CNN
	1    4850 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 7000 4850 6900
$Comp
L Device:R R7
U 1 1 5DC0547D
P 6250 6350
F 0 "R7" H 6320 6396 50  0000 L CNN
F 1 "4k7" H 6320 6305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6180 6350 50  0001 C CNN
F 3 "~" H 6250 6350 50  0001 C CNN
	1    6250 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5DC05487
P 6250 6750
F 0 "R8" H 6320 6796 50  0000 L CNN
F 1 "4k7" H 6320 6705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6180 6750 50  0001 C CNN
F 3 "~" H 6250 6750 50  0001 C CNN
	1    6250 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 6500 6250 6550
Wire Wire Line
	6100 6550 6250 6550
Connection ~ 6250 6550
Wire Wire Line
	6250 6550 6250 6600
Wire Wire Line
	6100 6950 6250 6950
Wire Wire Line
	6250 6950 6250 6900
Wire Wire Line
	6250 6150 6250 6200
$Comp
L Device:C C5
U 1 1 5DC054A2
P 6600 6750
F 0 "C5" H 6715 6796 50  0000 L CNN
F 1 "100n" H 6715 6705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6638 6600 50  0001 C CNN
F 3 "~" H 6600 6750 50  0001 C CNN
	1    6600 6750
	1    0    0    -1  
$EndComp
Text GLabel 6800 6550 2    50   Input ~ 0
BTNSB
Wire Wire Line
	6250 6550 6600 6550
Wire Wire Line
	6600 6550 6600 6600
Connection ~ 6600 6550
Wire Wire Line
	6600 6550 6800 6550
$Comp
L power:GND #PWR025
U 1 1 5DC054B1
P 6600 7000
F 0 "#PWR025" H 6600 6750 50  0001 C CNN
F 1 "GND" H 6605 6827 50  0000 C CNN
F 2 "" H 6600 7000 50  0001 C CNN
F 3 "" H 6600 7000 50  0001 C CNN
	1    6600 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 7000 6600 6900
Text GLabel 6850 4100 0    50   Input ~ 0
BTNSA
Text GLabel 8750 4600 2    50   Input ~ 0
BTNSB
$Comp
L power:+3.3V #PWR014
U 1 1 5DD45BFF
P 4500 6150
F 0 "#PWR014" H 4500 6000 50  0001 C CNN
F 1 "+3.3V" H 4515 6323 50  0000 C CNN
F 2 "" H 4500 6150 50  0001 C CNN
F 3 "" H 4500 6150 50  0001 C CNN
	1    4500 6150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR023
U 1 1 5DD4665B
P 6250 6150
F 0 "#PWR023" H 6250 6000 50  0001 C CNN
F 1 "+3.3V" H 6265 6323 50  0000 C CNN
F 2 "" H 6250 6150 50  0001 C CNN
F 3 "" H 6250 6150 50  0001 C CNN
	1    6250 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 10050 9900 10000
Wire Wire Line
	9900 10000 10300 10000
Connection ~ 9900 10000
Wire Wire Line
	9900 10400 10300 10400
Connection ~ 9900 10400
$Comp
L power:+3.3VA #PWR0101
U 1 1 5DE2E1FE
P 2200 7500
F 0 "#PWR0101" H 2200 7350 50  0001 C CNN
F 1 "+3.3VA" H 2215 7673 50  0000 C CNN
F 2 "" H 2200 7500 50  0001 C CNN
F 3 "" H 2200 7500 50  0001 C CNN
	1    2200 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VA #PWR0102
U 1 1 5DE2E9F0
P 2200 8350
F 0 "#PWR0102" H 2200 8200 50  0001 C CNN
F 1 "+3.3VA" H 2215 8523 50  0000 C CNN
F 2 "" H 2200 8350 50  0001 C CNN
F 3 "" H 2200 8350 50  0001 C CNN
	1    2200 8350
	1    0    0    -1  
$EndComp
$EndSCHEMATC
