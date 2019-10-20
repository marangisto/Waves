EESchema Schematic File Version 4
LIBS:CordicVCO-cache
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 5
Title "Cordic VCA"
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
P 7300 4900
F 0 "U1" H 7300 6531 50  0000 C CNN
F 1 "STM32G431" H 7300 6440 50  0000 C CNN
F 2 "Package_QFP:LQFP-48_7x7mm_P0.5mm" H 7300 4900 50  0001 C CNN
F 3 "" H 7300 4900 50  0001 C CNN
	1    7300 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5DA32312
P 9100 10200
F 0 "C6" H 9215 10246 50  0000 L CNN
F 1 "100n" H 9215 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9138 10050 50  0001 C CNN
F 3 "~" H 9100 10200 50  0001 C CNN
	1    9100 10200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5DA34425
P 9100 10450
F 0 "#PWR06" H 9100 10200 50  0001 C CNN
F 1 "GND" H 9105 10277 50  0000 C CNN
F 2 "" H 9100 10450 50  0001 C CNN
F 3 "" H 9100 10450 50  0001 C CNN
	1    9100 10450
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR05
U 1 1 5DA35D1E
P 9100 9900
F 0 "#PWR05" H 9100 9750 50  0001 C CNN
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
Text GLabel 8250 4550 2    50   Input ~ 0
I2S_CK
Text GLabel 8250 4350 2    50   Input ~ 0
I2S_SD
Text GLabel 8250 4650 2    50   Input ~ 0
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
L power:GNDA #PWR010
U 1 1 5DA34A3A
P 10700 10450
F 0 "#PWR010" H 10700 10200 50  0001 C CNN
F 1 "GNDA" H 10705 10277 50  0000 C CNN
F 2 "" H 10700 10450 50  0001 C CNN
F 3 "" H 10700 10450 50  0001 C CNN
	1    10700 10450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5DA32C6E
P 10700 10200
F 0 "C10" H 10815 10246 50  0000 L CNN
F 1 "100n" H 10815 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10738 10050 50  0001 C CNN
F 3 "~" H 10700 10200 50  0001 C CNN
	1    10700 10200
	1    0    0    -1  
$EndComp
$Comp
L Connector:AudioJack2_SwitchT J1
U 1 1 5DBBBBE9
P 12900 2300
F 0 "J1" H 12720 2233 50  0000 R CNN
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
L power:GND #PWR07
U 1 1 5DBBDE36
P 12600 2500
F 0 "#PWR07" H 12600 2250 50  0001 C CNN
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
L Connector:AudioJack2_SwitchT J2
U 1 1 5DBBE9DC
P 12900 3200
F 0 "J2" H 12720 3133 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 12720 3224 50  0000 R CNN
F 2 "Local:PJ398SM" H 12900 3200 50  0001 C CNN
F 3 "~" H 12900 3200 50  0001 C CNN
	1    12900 3200
	-1   0    0    1   
$EndComp
NoConn ~ 12700 3100
$Comp
L power:GND #PWR08
U 1 1 5DBBE9E8
P 12600 3400
F 0 "#PWR08" H 12600 3150 50  0001 C CNN
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
L Device:C C11
U 1 1 5DCD0DD6
P 11100 10200
F 0 "C11" H 11215 10246 50  0000 L CNN
F 1 "1u" H 11215 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 11138 10050 50  0001 C CNN
F 3 "~" H 11100 10200 50  0001 C CNN
	1    11100 10200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5DCD32C8
P 9500 10200
F 0 "C7" H 9615 10246 50  0000 L CNN
F 1 "100n" H 9615 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9538 10050 50  0001 C CNN
F 3 "~" H 9500 10200 50  0001 C CNN
	1    9500 10200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5DCD3476
P 9900 10200
F 0 "C8" H 10015 10246 50  0000 L CNN
F 1 "100n" H 10015 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9938 10050 50  0001 C CNN
F 3 "~" H 9900 10200 50  0001 C CNN
	1    9900 10200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5DCCFDDE
P 8700 10200
F 0 "C5" H 8815 10246 50  0000 L CNN
F 1 "1u" H 8815 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8738 10050 50  0001 C CNN
F 3 "~" H 8700 10200 50  0001 C CNN
	1    8700 10200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5DCD3CBF
P 8300 10200
F 0 "C4" H 8415 10246 50  0000 L CNN
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
	9900 10050 9900 10000
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
L Device:C C3
U 1 1 5DCD9162
P 7900 10200
F 0 "C3" H 8015 10246 50  0000 L CNN
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
L power:+3.3V #PWR01
U 1 1 5DCDADA9
P 7150 3000
F 0 "#PWR01" H 7150 2850 50  0001 C CNN
F 1 "+3.3V" H 7165 3173 50  0000 C CNN
F 2 "" H 7150 3000 50  0001 C CNN
F 3 "" H 7150 3000 50  0001 C CNN
	1    7150 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3000 7150 3250
Wire Wire Line
	7150 3250 7250 3250
Wire Wire Line
	7350 3250 7350 3450
Connection ~ 7150 3250
Wire Wire Line
	7150 3250 7150 3450
Wire Wire Line
	7250 3250 7250 3450
Connection ~ 7250 3250
Wire Wire Line
	7250 3250 7350 3250
Wire Wire Line
	10700 10400 11100 10400
$Comp
L power:+3.3VA #PWR03
U 1 1 5DCE5C40
P 7450 3000
F 0 "#PWR03" H 7450 2850 50  0001 C CNN
F 1 "+3.3VA" H 7465 3173 50  0000 C CNN
F 2 "" H 7450 3000 50  0001 C CNN
F 3 "" H 7450 3000 50  0001 C CNN
	1    7450 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 3000 7450 3450
$Comp
L power:GND #PWR02
U 1 1 5DCE82C6
P 7150 6550
F 0 "#PWR02" H 7150 6300 50  0001 C CNN
F 1 "GND" H 7155 6377 50  0000 C CNN
F 2 "" H 7150 6550 50  0001 C CNN
F 3 "" H 7150 6550 50  0001 C CNN
	1    7150 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 6550 7150 6500
Wire Wire Line
	7150 6500 7250 6500
Wire Wire Line
	7450 6500 7450 6350
Connection ~ 7150 6500
Wire Wire Line
	7150 6500 7150 6350
Wire Wire Line
	7350 6350 7350 6500
Connection ~ 7350 6500
Wire Wire Line
	7350 6500 7450 6500
Wire Wire Line
	7250 6350 7250 6500
Connection ~ 7250 6500
Wire Wire Line
	7250 6500 7350 6500
$Comp
L Device:C C9
U 1 1 5DCED150
P 10300 10200
F 0 "C9" H 10415 10246 50  0000 L CNN
F 1 "10n" H 10415 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10338 10050 50  0001 C CNN
F 3 "~" H 10300 10200 50  0001 C CNN
	1    10300 10200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 10400 10300 10400
Wire Wire Line
	10300 10400 10300 10350
Wire Wire Line
	10300 10000 10700 10000
Wire Wire Line
	10300 10050 10300 10000
Wire Wire Line
	10700 10000 11100 10000
$Comp
L power:+3.3VA #PWR09
U 1 1 5DA37762
P 10700 9950
F 0 "#PWR09" H 10700 9800 50  0001 C CNN
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
L power:GNDA #PWR04
U 1 1 5DD008D1
P 7100 10450
F 0 "#PWR04" H 7100 10200 50  0001 C CNN
F 1 "GNDA" H 7105 10277 50  0000 C CNN
F 2 "" H 7100 10450 50  0001 C CNN
F 3 "" H 7100 10450 50  0001 C CNN
	1    7100 10450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5DD008DB
P 7100 10200
F 0 "C1" H 7215 10246 50  0000 L CNN
F 1 "100n" H 7215 10155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7138 10050 50  0001 C CNN
F 3 "~" H 7100 10200 50  0001 C CNN
	1    7100 10200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5DD008E5
P 7500 10200
F 0 "C2" H 7615 10246 50  0000 L CNN
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
Text GLabel 6350 5750 0    50   Input ~ 0
VREF
Wire Wire Line
	6350 3950 6250 3950
Wire Wire Line
	6250 3950 6250 3250
Wire Wire Line
	6250 3250 7150 3250
$Comp
L Connector:TestPoint TP4
U 1 1 5DD12AF2
P 13950 9000
F 0 "TP4" V 13904 9188 50  0000 L CNN
F 1 "TestPoint" V 13995 9188 50  0000 L CNN
F 2 "" H 14150 9000 50  0001 C CNN
F 3 "~" H 14150 9000 50  0001 C CNN
	1    13950 9000
	0    1    1    0   
$EndComp
Text GLabel 13950 9000 0    50   Input ~ 0
VREF
$Comp
L Device:Rotary_Encoder_Switch SW?
U 1 1 5DD70181
P 2950 8000
AR Path="/5DD41DD6/5DD70181" Ref="SW?"  Part="1" 
AR Path="/5DD70181" Ref="SW1"  Part="1" 
F 0 "SW1" H 2950 8367 50  0000 C CNN
F 1 "Rotary_Encoder_Switch" H 2950 8276 50  0000 C CNN
F 2 "Rotary_Encoder:RotaryEncoder_Alps_EC11E-Switch_Vertical_H20mm" H 2800 8160 50  0001 C CNN
F 3 "~" H 2950 8260 50  0001 C CNN
	1    2950 8000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD7018D
P 2950 8400
AR Path="/5DD41DD6/5DD7018D" Ref="#PWR?"  Part="1" 
AR Path="/5DD7018D" Ref="#PWR043"  Part="1" 
F 0 "#PWR043" H 2950 8150 50  0001 C CNN
F 1 "GND" H 2955 8227 50  0000 C CNN
F 2 "" H 2950 8400 50  0001 C CNN
F 3 "" H 2950 8400 50  0001 C CNN
	1    2950 8400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 7900 2650 7900
Wire Wire Line
	2550 8100 2650 8100
Text GLabel 2550 8100 0    50   Input ~ 0
ENC_CH1
Text GLabel 2550 7900 0    50   Input ~ 0
ENC_CH2
Text GLabel 3350 7900 2    50   Input ~ 0
ENC_SW
Wire Wire Line
	3250 7900 3350 7900
$Comp
L Local:IPS240x240 U?
U 1 1 5DD7E5F7
P 11400 3950
AR Path="/5DD41DD6/5DD7E5F7" Ref="U?"  Part="1" 
AR Path="/5DD7E5F7" Ref="U7"  Part="1" 
F 0 "U7" H 11550 3681 50  0000 C CNN
F 1 "IPS240x240" H 11550 3590 50  0000 C CNN
F 2 "Local.pretty:IPS240x240" H 11400 3950 50  0001 C CNN
F 3 "" H 11400 3950 50  0001 C CNN
	1    11400 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DD7E5FD
P 10950 4800
AR Path="/5DD41DD6/5DD7E5FD" Ref="R?"  Part="1" 
AR Path="/5DD7E5FD" Ref="R16"  Part="1" 
F 0 "R16" V 10743 4800 50  0000 C CNN
F 1 "1k" V 10834 4800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10880 4800 50  0001 C CNN
F 3 "~" H 10950 4800 50  0001 C CNN
	1    10950 4800
	0    1    1    0   
$EndComp
Wire Wire Line
	11100 4800 11200 4800
$Comp
L power:GND #PWR?
U 1 1 5DD7E604
P 11550 5250
AR Path="/5DD41DD6/5DD7E604" Ref="#PWR?"  Part="1" 
AR Path="/5DD7E604" Ref="#PWR054"  Part="1" 
F 0 "#PWR054" H 11550 5000 50  0001 C CNN
F 1 "GND" H 11555 5077 50  0000 C CNN
F 2 "" H 11550 5250 50  0001 C CNN
F 3 "" H 11550 5250 50  0001 C CNN
	1    11550 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	11550 5250 11550 5150
$Comp
L power:+3.3V #PWR?
U 1 1 5DD7E60B
P 11550 4150
AR Path="/5DD41DD6/5DD7E60B" Ref="#PWR?"  Part="1" 
AR Path="/5DD7E60B" Ref="#PWR053"  Part="1" 
F 0 "#PWR053" H 11550 4000 50  0001 C CNN
F 1 "+3.3V" H 11565 4323 50  0000 C CNN
F 2 "" H 11550 4150 50  0001 C CNN
F 3 "" H 11550 4150 50  0001 C CNN
	1    11550 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	11550 4150 11550 4250
Text GLabel 10700 4700 0    50   Input ~ 0
TFT_SCL
Text GLabel 10700 4800 0    50   Input ~ 0
TFT_SDA
Wire Wire Line
	10700 4700 11200 4700
Wire Wire Line
	10700 4800 10800 4800
Text GLabel 10700 4900 0    50   Input ~ 0
TFT_DC
Wire Wire Line
	10700 4900 11200 4900
Wire Wire Line
	11900 4700 12300 4700
Wire Wire Line
	11900 4800 12000 4800
Wire Wire Line
	12000 4800 12000 4250
Wire Wire Line
	12000 4250 11550 4250
Connection ~ 11550 4250
Wire Wire Line
	11550 4250 11550 4400
$Comp
L Memory_EEPROM:AT25xxx U?
U 1 1 5DD88E60
P 11550 6900
AR Path="/5DD41DD6/5DD88E60" Ref="U?"  Part="1" 
AR Path="/5DD88E60" Ref="U8"  Part="1" 
F 0 "U8" H 11550 7381 50  0000 C CNN
F 1 "AT25xxx" H 11550 7290 50  0000 C CNN
F 2 "Package_SO:TSSOP-8_4.4x3mm_P0.65mm" H 11550 6900 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8707-SEEPROM-AT25010B-020B-040B-Datasheet.pdf" H 11550 6900 50  0001 C CNN
	1    11550 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD88E66
P 11550 7300
AR Path="/5DD41DD6/5DD88E66" Ref="#PWR?"  Part="1" 
AR Path="/5DD88E66" Ref="#PWR056"  Part="1" 
F 0 "#PWR056" H 11550 7050 50  0001 C CNN
F 1 "GND" H 11555 7127 50  0000 C CNN
F 2 "" H 11550 7300 50  0001 C CNN
F 3 "" H 11550 7300 50  0001 C CNN
	1    11550 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	11550 7300 11550 7200
$Comp
L power:+3.3V #PWR?
U 1 1 5DD88E6D
P 11550 6350
AR Path="/5DD41DD6/5DD88E6D" Ref="#PWR?"  Part="1" 
AR Path="/5DD88E6D" Ref="#PWR055"  Part="1" 
F 0 "#PWR055" H 11550 6200 50  0001 C CNN
F 1 "+3.3V" H 11565 6523 50  0000 C CNN
F 2 "" H 11550 6350 50  0001 C CNN
F 3 "" H 11550 6350 50  0001 C CNN
	1    11550 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	11550 6600 11550 6450
Text GLabel 12150 6800 2    50   Input ~ 0
MEM_SCK
Wire Wire Line
	12150 6800 11950 6800
Text GLabel 12150 6900 2    50   Input ~ 0
MEM_MOSI
Text GLabel 12150 7000 2    50   Input ~ 0
MEM_MISO
Text GLabel 10900 7000 0    50   Input ~ 0
MEM_CS
Wire Wire Line
	10900 7000 11150 7000
Wire Wire Line
	11950 6900 12150 6900
Wire Wire Line
	11950 7000 12150 7000
Wire Wire Line
	11150 6800 11050 6800
Wire Wire Line
	11050 6800 11050 6450
Wire Wire Line
	11050 6450 11550 6450
Connection ~ 11550 6450
Wire Wire Line
	11550 6450 11550 6350
Wire Wire Line
	11150 6900 11050 6900
Wire Wire Line
	11050 6900 11050 6800
Connection ~ 11050 6800
Text GLabel 12300 4700 2    50   Input ~ 0
TFT_RES
Text GLabel 6350 5150 0    50   Input ~ 0
TFT_SCL
Text GLabel 6350 5350 0    50   Input ~ 0
TFT_SDA
Text GLabel 6350 5550 0    50   Input ~ 0
TFT_DC
Text GLabel 8250 4450 2    50   Input ~ 0
TFT_RES
Text GLabel 8250 5650 2    50   Input ~ 0
MEM_SCK
Text GLabel 8250 5050 2    50   Input ~ 0
MEM_MOSI
Text GLabel 8250 5150 2    50   Input ~ 0
MEM_MISO
Text GLabel 8250 5750 2    50   Input ~ 0
MEM_CS
Wire Wire Line
	2650 8000 2600 8000
Wire Wire Line
	2600 8000 2600 8300
Wire Wire Line
	2600 8300 2950 8300
Wire Wire Line
	2950 8300 2950 8400
Wire Wire Line
	2950 8300 3300 8300
Wire Wire Line
	3300 8300 3300 8100
Wire Wire Line
	3300 8100 3250 8100
Connection ~ 2950 8300
Text GLabel 8250 4150 2    50   Input ~ 0
ENC_CH2
Text GLabel 8250 4250 2    50   Input ~ 0
ENC_CH1
Text GLabel 8250 3950 2    50   Input ~ 0
ENC_SW
$Comp
L Device:Crystal_GND24_Small Y?
U 1 1 5DDF1CBB
P 5200 4300
AR Path="/5DD41DD6/5DDF1CBB" Ref="Y?"  Part="1" 
AR Path="/5DDF1CBB" Ref="Y1"  Part="1" 
F 0 "Y1" V 5154 4469 50  0000 L CNN
F 1 "8MHz" V 5245 4469 50  0000 L CNN
F 2 "Crystal:Crystal_SMD_5032-4Pin_5.0x3.2mm" H 5200 4300 50  0001 C CNN
F 3 "https://sg.element14.com/multicomp/mcsjk-7i-8-00-18-10-60-b-10/crystal-8mhz-18pf-5mm-x-3-2mm/dp/2854012" H 5200 4300 50  0001 C CNN
	1    5200 4300
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5DDF1CC1
P 5750 4450
AR Path="/5DD41DD6/5DDF1CC1" Ref="R?"  Part="1" 
AR Path="/5DDF1CC1" Ref="R14"  Part="1" 
F 0 "R14" V 5543 4450 50  0000 C CNN
F 1 "470" V 5634 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5680 4450 50  0001 C CNN
F 3 "~" H 5750 4450 50  0001 C CNN
	1    5750 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 4400 5200 4450
Wire Wire Line
	5200 4200 5200 4150
Wire Wire Line
	5200 4150 5550 4150
Wire Wire Line
	5550 4150 5550 4350
Wire Wire Line
	5200 4450 5600 4450
$Comp
L Device:C C?
U 1 1 5DDF1CCC
P 4750 4150
AR Path="/5DD41DD6/5DDF1CCC" Ref="C?"  Part="1" 
AR Path="/5DDF1CCC" Ref="C40"  Part="1" 
F 0 "C40" V 4498 4150 50  0000 C CNN
F 1 "27p" V 4589 4150 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4788 4000 50  0001 C CNN
F 3 "~" H 4750 4150 50  0001 C CNN
	1    4750 4150
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5DDF1CD2
P 4750 4450
AR Path="/5DD41DD6/5DDF1CD2" Ref="C?"  Part="1" 
AR Path="/5DDF1CD2" Ref="C41"  Part="1" 
F 0 "C41" V 4498 4450 50  0000 C CNN
F 1 "27p" V 4589 4450 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4788 4300 50  0001 C CNN
F 3 "~" H 4750 4450 50  0001 C CNN
	1    4750 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 4150 5200 4150
Connection ~ 5200 4150
Wire Wire Line
	4900 4450 5200 4450
Connection ~ 5200 4450
Wire Wire Line
	4600 4150 4450 4150
Wire Wire Line
	4450 4150 4450 4450
Wire Wire Line
	4450 4450 4600 4450
$Comp
L power:GND #PWR?
U 1 1 5DDF1CDF
P 4450 4750
AR Path="/5DD41DD6/5DDF1CDF" Ref="#PWR?"  Part="1" 
AR Path="/5DDF1CDF" Ref="#PWR048"  Part="1" 
F 0 "#PWR048" H 4450 4500 50  0001 C CNN
F 1 "GND" H 4455 4577 50  0000 C CNN
F 2 "" H 4450 4750 50  0001 C CNN
F 3 "" H 4450 4750 50  0001 C CNN
	1    4450 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4750 4450 4450
Connection ~ 4450 4450
$Comp
L power:GND #PWR?
U 1 1 5DDF1CE7
P 5000 4300
AR Path="/5DD41DD6/5DDF1CE7" Ref="#PWR?"  Part="1" 
AR Path="/5DDF1CE7" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H 5000 4050 50  0001 C CNN
F 1 "GND" H 5005 4127 50  0000 C CNN
F 2 "" H 5000 4300 50  0001 C CNN
F 3 "" H 5000 4300 50  0001 C CNN
	1    5000 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DDF1CED
P 5400 4300
AR Path="/5DD41DD6/5DDF1CED" Ref="#PWR?"  Part="1" 
AR Path="/5DDF1CED" Ref="#PWR050"  Part="1" 
F 0 "#PWR050" H 5400 4050 50  0001 C CNN
F 1 "GND" H 5405 4127 50  0000 C CNN
F 2 "" H 5400 4300 50  0001 C CNN
F 3 "" H 5400 4300 50  0001 C CNN
	1    5400 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 4350 6350 4350
Wire Wire Line
	5000 4300 5100 4300
Wire Wire Line
	5300 4300 5400 4300
Wire Wire Line
	5900 4450 6350 4450
$Comp
L Device:C C?
U 1 1 5DE03D3B
P 6050 10250
AR Path="/5DD41DD6/5DE03D3B" Ref="C?"  Part="1" 
AR Path="/5DE03D3B" Ref="C39"  Part="1" 
F 0 "C39" H 6165 10296 50  0000 L CNN
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
AR Path="/5DE03D41" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 6050 10300 50  0001 C CNN
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
AR Path="/5DE03D48" Ref="SW2"  Part="1" 
F 0 "SW2" V 5646 10202 50  0000 R CNN
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
AR Path="/5DE03D66" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 3100 10200 50  0001 C CNN
F 1 "GND" H 3105 10277 50  0000 C CNN
F 2 "" H 3100 10450 50  0001 C CNN
F 3 "" H 3100 10450 50  0001 C CNN
	1    3100 10450
	1    0    0    -1  
$EndComp
Text GLabel 8250 4750 2    50   Input ~ 0
SWCLK
Text GLabel 8250 4850 2    50   Input ~ 0
SWDIO
Text GLabel 6350 4550 0    50   Input ~ 0
RESET
$Comp
L Connector:AudioJack2_SwitchT J?
U 1 1 5DE158BF
P 2300 2250
AR Path="/5DD41DD6/5DE158BF" Ref="J?"  Part="1" 
AR Path="/5DE158BF" Ref="J5"  Part="1" 
F 0 "J5" H 2121 2183 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 2121 2274 50  0000 R CNN
F 2 "Local.pretty:PJ398SM" H 2300 2250 50  0001 C CNN
F 3 "~" H 2300 2250 50  0001 C CNN
	1    2300 2250
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DE158C5
P 2550 2650
AR Path="/5DD41DD6/5DE158C5" Ref="#PWR?"  Part="1" 
AR Path="/5DE158C5" Ref="#PWR042"  Part="1" 
F 0 "#PWR042" H 2550 2400 50  0001 C CNN
F 1 "GND" H 2555 2477 50  0000 C CNN
F 2 "" H 2550 2650 50  0001 C CNN
F 3 "" H 2550 2650 50  0001 C CNN
	1    2550 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 2350 2550 2350
Wire Wire Line
	2500 2150 2550 2150
Wire Wire Line
	2550 2150 2550 2350
Connection ~ 2550 2350
$Comp
L Device:R R?
U 1 1 5DE158CF
P 3250 2250
AR Path="/5DD41DD6/5DE158CF" Ref="R?"  Part="1" 
AR Path="/5DE158CF" Ref="R12"  Part="1" 
F 0 "R12" V 3043 2250 50  0000 C CNN
F 1 "100k" V 3134 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3180 2250 50  0001 C CNN
F 3 "~" H 3250 2250 50  0001 C CNN
	1    3250 2250
	0    1    1    0   
$EndComp
Text GLabel 3000 1800 0    50   Input ~ 0
VRef-10
$Comp
L Device:R R?
U 1 1 5DE158D6
P 3250 1800
AR Path="/5DD41DD6/5DE158D6" Ref="R?"  Part="1" 
AR Path="/5DE158D6" Ref="R11"  Part="1" 
F 0 "R11" V 3043 1800 50  0000 C CNN
F 1 "200k" V 3134 1800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3180 1800 50  0001 C CNN
F 3 "~" H 3250 1800 50  0001 C CNN
	1    3250 1800
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 1800 3100 1800
$Comp
L Amplifier_Operational:MCP6004 U?
U 1 1 5DE158DD
P 3900 2350
AR Path="/5DD41DD6/5DE158DD" Ref="U?"  Part="1" 
AR Path="/5DE158DD" Ref="U6"  Part="1" 
F 0 "U6" H 3900 1983 50  0000 C CNN
F 1 "MCP6004" H 3900 2074 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 3850 2450 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 3950 2550 50  0001 C CNN
	1    3900 2350
	1    0    0    1   
$EndComp
Wire Wire Line
	3400 2250 3500 2250
Wire Wire Line
	3400 1800 3500 1800
Wire Wire Line
	3500 1800 3500 2250
Connection ~ 3500 2250
Wire Wire Line
	3500 2250 3600 2250
$Comp
L Device:R R?
U 1 1 5DE158E8
P 3900 1800
AR Path="/5DD41DD6/5DE158E8" Ref="R?"  Part="1" 
AR Path="/5DE158E8" Ref="R13"  Part="1" 
F 0 "R13" V 3693 1800 50  0000 C CNN
F 1 "33k" V 3784 1800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3830 1800 50  0001 C CNN
F 3 "~" H 3900 1800 50  0001 C CNN
	1    3900 1800
	0    1    1    0   
$EndComp
Wire Wire Line
	3500 1800 3750 1800
Connection ~ 3500 1800
Wire Wire Line
	4050 1800 4300 1800
Wire Wire Line
	4300 1800 4300 2350
Wire Wire Line
	4300 2350 4200 2350
$Comp
L Device:C C?
U 1 1 5DE158F3
P 3900 1400
AR Path="/5DD41DD6/5DE158F3" Ref="C?"  Part="1" 
AR Path="/5DE158F3" Ref="C38"  Part="1" 
F 0 "C38" V 3648 1400 50  0000 C CNN
F 1 "470p" V 3739 1400 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3938 1250 50  0001 C CNN
F 3 "~" H 3900 1400 50  0001 C CNN
	1    3900 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	3500 1800 3500 1400
Wire Wire Line
	3500 1400 3750 1400
Wire Wire Line
	4050 1400 4300 1400
Wire Wire Line
	4300 1400 4300 1800
Connection ~ 4300 1800
$Comp
L power:GND #PWR?
U 1 1 5DE158FE
P 3500 2550
AR Path="/5DD41DD6/5DE158FE" Ref="#PWR?"  Part="1" 
AR Path="/5DE158FE" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 3500 2300 50  0001 C CNN
F 1 "GND" H 3505 2377 50  0000 C CNN
F 2 "" H 3500 2550 50  0001 C CNN
F 3 "" H 3500 2550 50  0001 C CNN
	1    3500 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 2550 3500 2450
Wire Wire Line
	3500 2450 3600 2450
Wire Wire Line
	2550 2350 2550 2650
Wire Wire Line
	4300 2350 4550 2350
Connection ~ 4300 2350
Text GLabel 4550 2350 2    50   Input ~ 0
PC4
Wire Wire Line
	2500 2250 3100 2250
$Comp
L Connector:AudioJack2_SwitchT J?
U 1 1 5DE20ACF
P 2150 6350
AR Path="/5DD41DD6/5DE20ACF" Ref="J?"  Part="1" 
AR Path="/5DE20ACF" Ref="J4"  Part="1" 
F 0 "J4" H 1971 6283 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 1971 6374 50  0000 R CNN
F 2 "Local.pretty:PJ398SM" H 2150 6350 50  0001 C CNN
F 3 "~" H 2150 6350 50  0001 C CNN
	1    2150 6350
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DE20AD5
P 2400 6500
AR Path="/5DD41DD6/5DE20AD5" Ref="#PWR?"  Part="1" 
AR Path="/5DE20AD5" Ref="#PWR041"  Part="1" 
F 0 "#PWR041" H 2400 6250 50  0001 C CNN
F 1 "GND" H 2405 6327 50  0000 C CNN
F 2 "" H 2400 6500 50  0001 C CNN
F 3 "" H 2400 6500 50  0001 C CNN
	1    2400 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 6450 2400 6450
Wire Wire Line
	2400 6450 2400 6500
Wire Wire Line
	2400 6200 2400 6250
Wire Wire Line
	2400 6250 2350 6250
$Sheet
S 2700 6250 500  200 
U 5DE20ADD
F0 "sheet5DE20AC9" 50
F1 "DigitalIn.sch" 50
F2 "Trig" I R 3200 6350 50 
F3 "In" I L 2700 6350 50 
$EndSheet
Wire Wire Line
	2350 6350 2700 6350
Wire Wire Line
	3200 6350 3550 6350
Text GLabel 3550 6350 2    50   Input ~ 0
TRIGB
$Comp
L power:+3.3V #PWR?
U 1 1 5DE20AE6
P 2400 6200
AR Path="/5DD41DD6/5DE20AE6" Ref="#PWR?"  Part="1" 
AR Path="/5DE20AE6" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 2400 6050 50  0001 C CNN
F 1 "+3.3V" H 2415 6373 50  0000 C CNN
F 2 "" H 2400 6200 50  0001 C CNN
F 3 "" H 2400 6200 50  0001 C CNN
	1    2400 6200
	1    0    0    -1  
$EndComp
$Sheet
S 6800 7200 550  450 
U 5DE2B991
F0 "sheet5DE2B98D" 50
F1 "PushLED.sch" 50
F2 "LED" I L 6800 7350 50 
F3 "SW" I L 6800 7500 50 
$EndSheet
Text GLabel 6550 7350 0    50   Input ~ 0
LED1
Text GLabel 6550 7500 0    50   Input ~ 0
BTN1
Wire Wire Line
	6550 7500 6800 7500
Wire Wire Line
	6800 7350 6550 7350
Wire Wire Line
	8600 8650 8600 8600
Wire Wire Line
	8600 8300 8600 8250
$Comp
L Device:LED D?
U 1 1 5DE43ED0
P 8600 8450
AR Path="/5DD41DD6/5DE43ED0" Ref="D?"  Part="1" 
AR Path="/5DE43ED0" Ref="D5"  Part="1" 
F 0 "D5" V 8639 8333 50  0000 R CNN
F 1 "LED" V 8548 8333 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Castellated" H 8600 8450 50  0001 C CNN
F 3 "~" H 8600 8450 50  0001 C CNN
	1    8600 8450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DE43ED6
P 8600 8650
AR Path="/5DD41DD6/5DE43ED6" Ref="#PWR?"  Part="1" 
AR Path="/5DE43ED6" Ref="#PWR052"  Part="1" 
F 0 "#PWR052" H 8600 8400 50  0001 C CNN
F 1 "GND" H 8605 8477 50  0000 C CNN
F 2 "" H 8600 8650 50  0001 C CNN
F 3 "" H 8600 8650 50  0001 C CNN
	1    8600 8650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 7950 8600 7900
Wire Wire Line
	8600 7450 8600 7500
$Comp
L power:+12V #PWR?
U 1 1 5DE43EDE
P 8600 7450
AR Path="/5DA90748/5DE43EDE" Ref="#PWR?"  Part="1" 
AR Path="/5DAF110B/5DE43EDE" Ref="#PWR?"  Part="1" 
AR Path="/5DB16B82/5DE43EDE" Ref="#PWR?"  Part="1" 
AR Path="/5DB16B86/5DE43EDE" Ref="#PWR?"  Part="1" 
AR Path="/5DB3CAB0/5DE43EDE" Ref="#PWR?"  Part="1" 
AR Path="/5DB3CAB4/5DE43EDE" Ref="#PWR?"  Part="1" 
AR Path="/5DB3CAB8/5DE43EDE" Ref="#PWR?"  Part="1" 
AR Path="/5DB3CABC/5DE43EDE" Ref="#PWR?"  Part="1" 
AR Path="/5DB87BB5/5DE43EDE" Ref="#PWR?"  Part="1" 
AR Path="/5DB87BB9/5DE43EDE" Ref="#PWR?"  Part="1" 
AR Path="/5DB87BBD/5DE43EDE" Ref="#PWR?"  Part="1" 
AR Path="/5DE43EDE" Ref="#PWR051"  Part="1" 
AR Path="/5DD41DD6/5DE43EDE" Ref="#PWR?"  Part="1" 
F 0 "#PWR051" H 8600 7300 50  0001 C CNN
F 1 "+12V" H 8615 7623 50  0000 C CNN
F 2 "" H 8600 7450 50  0001 C CNN
F 3 "" H 8600 7450 50  0001 C CNN
	1    8600 7450
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC847 Q?
U 1 1 5DE43EE4
P 8500 7700
AR Path="/5C756F9B/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5C763CB7/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5C7644B3/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5C7644B9/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5C188821/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5C192077/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5C19208D/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5C24C2D4/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5D78C3C7/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5D7C6377/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5DE43EE4" Ref="Q1"  Part="1" 
AR Path="/5DA90748/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5DAF110B/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5DB16B82/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5DB16B86/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5DB3CAB0/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5DB3CAB4/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5DB3CAB8/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5DB3CABC/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5DB87BB5/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5DB87BB9/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5DB87BBD/5DE43EE4" Ref="Q?"  Part="1" 
AR Path="/5DD41DD6/5DE43EE4" Ref="Q?"  Part="1" 
F 0 "Q1" H 8691 7746 50  0000 L CNN
F 1 "BC847" H 8691 7655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8700 7625 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 8500 7700 50  0001 L CNN
	1    8500 7700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 5DE43EEA
P 8600 8100
AR Path="/5DE43EEA" Ref="R15"  Part="1" 
AR Path="/5DA90748/5DE43EEA" Ref="R?"  Part="1" 
AR Path="/5DAF110B/5DE43EEA" Ref="R?"  Part="1" 
AR Path="/5DB16B82/5DE43EEA" Ref="R?"  Part="1" 
AR Path="/5DB16B86/5DE43EEA" Ref="R?"  Part="1" 
AR Path="/5DB3CAB0/5DE43EEA" Ref="R?"  Part="1" 
AR Path="/5DB3CAB4/5DE43EEA" Ref="R?"  Part="1" 
AR Path="/5DB3CAB8/5DE43EEA" Ref="R?"  Part="1" 
AR Path="/5DB3CABC/5DE43EEA" Ref="R?"  Part="1" 
AR Path="/5DB87BB5/5DE43EEA" Ref="R?"  Part="1" 
AR Path="/5DB87BB9/5DE43EEA" Ref="R?"  Part="1" 
AR Path="/5DB87BBD/5DE43EEA" Ref="R?"  Part="1" 
AR Path="/5DD41DD6/5DE43EEA" Ref="R?"  Part="1" 
F 0 "R15" V 8393 8100 50  0000 C CNN
F 1 "47" V 8484 8100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8530 8100 50  0001 C CNN
F 3 "~" H 8600 8100 50  0001 C CNN
	1    8600 8100
	-1   0    0    1   
$EndComp
Text GLabel 8300 7700 0    50   Input ~ 0
PB9
$Comp
L power:GND #PWR?
U 1 1 5DE65221
P 8850 4150
F 0 "#PWR?" H 8850 3900 50  0001 C CNN
F 1 "GND" H 8855 3977 50  0000 C CNN
F 2 "" H 8850 4150 50  0001 C CNN
F 3 "" H 8850 4150 50  0001 C CNN
	1    8850 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 4150 8850 4050
Wire Wire Line
	8850 4050 8250 4050
Text GLabel 6350 4650 0    50   Input ~ 0
CV1A
Text GLabel 6350 4850 0    50   Input ~ 0
CV2A
Text GLabel 6350 4950 0    50   Input ~ 0
CV3A
Text GLabel 6350 5450 0    50   Input ~ 0
CV4A
Text GLabel 6350 4750 0    50   Input ~ 0
CV1B
Text GLabel 6350 5250 0    50   Input ~ 0
CV2B
Text GLabel 8250 5850 2    50   Input ~ 0
CV3B
Text GLabel 8250 5450 2    50   Input ~ 0
CV4B
Wire Wire Line
	3100 10350 3100 10450
$Comp
L Connector:Conn_01x04_Male J?
U 1 1 5DED261C
P 4250 10350
F 0 "J?" H 4222 10232 50  0000 R CNN
F 1 "Conn_01x04_Male" H 4222 10323 50  0000 R CNN
F 2 "" H 4250 10350 50  0001 C CNN
F 3 "~" H 4250 10350 50  0001 C CNN
	1    4250 10350
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DED37B6
P 4550 10550
AR Path="/5DD41DD6/5DED37B6" Ref="#PWR?"  Part="1" 
AR Path="/5DED37B6" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4550 10300 50  0001 C CNN
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
Text GLabel 8250 5350 2    50   Input ~ 0
I2C_SDA
Text GLabel 8250 5250 2    50   Input ~ 0
I2C_SCL
Wire Wire Line
	2950 10350 3100 10350
$Comp
L Connector:Conn_01x04_Male J?
U 1 1 5DE9C7EE
P 2750 10250
F 0 "J?" H 2722 10132 50  0000 R CNN
F 1 "Conn_01x04_Male" H 2722 10223 50  0000 R CNN
F 2 "" H 2750 10250 50  0001 C CNN
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
L Device:R R?
U 1 1 5DF95B04
P 4550 9900
F 0 "R?" H 4620 9946 50  0000 L CNN
F 1 "4k7" H 4620 9855 50  0000 L CNN
F 2 "" V 4480 9900 50  0001 C CNN
F 3 "~" H 4550 9900 50  0001 C CNN
	1    4550 9900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DF964EB
P 4700 9900
F 0 "R?" H 4770 9946 50  0000 L CNN
F 1 "4k7" H 4770 9855 50  0000 L CNN
F 2 "" V 4630 9900 50  0001 C CNN
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
L power:+3.3V #PWR?
U 1 1 5DFC782D
P 4550 9600
F 0 "#PWR?" H 4550 9450 50  0001 C CNN
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
P 2150 5500
AR Path="/5DD41DD6/5E00864D" Ref="J?"  Part="1" 
AR Path="/5E00864D" Ref="J?"  Part="1" 
F 0 "J?" H 1971 5433 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 1971 5524 50  0000 R CNN
F 2 "Local.pretty:PJ398SM" H 2150 5500 50  0001 C CNN
F 3 "~" H 2150 5500 50  0001 C CNN
	1    2150 5500
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E008657
P 2400 5650
AR Path="/5DD41DD6/5E008657" Ref="#PWR?"  Part="1" 
AR Path="/5E008657" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2400 5400 50  0001 C CNN
F 1 "GND" H 2405 5477 50  0000 C CNN
F 2 "" H 2400 5650 50  0001 C CNN
F 3 "" H 2400 5650 50  0001 C CNN
	1    2400 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 5600 2400 5600
Wire Wire Line
	2400 5600 2400 5650
Wire Wire Line
	2400 5350 2400 5400
Wire Wire Line
	2400 5400 2350 5400
$Sheet
S 2700 5400 500  200 
U 5E008663
F0 "sheet5E008663" 50
F1 "DigitalIn.sch" 50
F2 "Trig" I R 3200 5500 50 
F3 "In" I L 2700 5500 50 
$EndSheet
Wire Wire Line
	2350 5500 2700 5500
Wire Wire Line
	3200 5500 3550 5500
Text GLabel 3550 5500 2    50   Input ~ 0
TRIGA
$Comp
L power:+3.3V #PWR?
U 1 1 5E00866C
P 2400 5350
AR Path="/5DD41DD6/5E00866C" Ref="#PWR?"  Part="1" 
AR Path="/5E00866C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2400 5200 50  0001 C CNN
F 1 "+3.3V" H 2415 5523 50  0000 C CNN
F 2 "" H 2400 5350 50  0001 C CNN
F 3 "" H 2400 5350 50  0001 C CNN
	1    2400 5350
	1    0    0    -1  
$EndComp
Text GLabel 6350 5650 0    50   Input ~ 0
TRIGA
Text GLabel 6350 5850 0    50   Input ~ 0
TRIGB
$Sheet
S 6800 7900 550  450 
U 5E016F8F
F0 "sheet5E016F8F" 50
F1 "PushLED.sch" 50
F2 "LED" I L 6800 8050 50 
F3 "SW" I L 6800 8200 50 
$EndSheet
Text GLabel 6550 8050 0    50   Input ~ 0
LED2
Text GLabel 6550 8200 0    50   Input ~ 0
BTN2
Wire Wire Line
	6550 8200 6800 8200
Wire Wire Line
	6800 8050 6550 8050
$Sheet
S 6800 8600 550  450 
U 5E023019
F0 "sheet5E023019" 50
F1 "PushLED.sch" 50
F2 "LED" I L 6800 8750 50 
F3 "SW" I L 6800 8900 50 
$EndSheet
Text GLabel 6550 8750 0    50   Input ~ 0
LED3
Text GLabel 6550 8900 0    50   Input ~ 0
BTN3
Wire Wire Line
	6550 8900 6800 8900
Wire Wire Line
	6800 8750 6550 8750
Text GLabel 6350 4050 0    50   Input ~ 0
LED1
Text GLabel 6350 4150 0    50   Input ~ 0
BTN1
Text GLabel 6350 4250 0    50   Input ~ 0
LED2
Text GLabel 6350 5050 0    50   Input ~ 0
BTN2
Text GLabel 8250 4950 2    50   Input ~ 0
LED3
Text GLabel 8250 5550 2    50   Input ~ 0
BTN3
$Comp
L Connector:TestPoint TP?
U 1 1 5E04A27D
P 13950 8300
F 0 "TP?" V 13904 8488 50  0000 L CNN
F 1 "TestPoint" V 13995 8488 50  0000 L CNN
F 2 "" H 14150 8300 50  0001 C CNN
F 3 "~" H 14150 8300 50  0001 C CNN
	1    13950 8300
	0    1    1    0   
$EndComp
Text GLabel 13950 8300 0    50   Input ~ 0
CV1A
$Comp
L Connector:TestPoint TP?
U 1 1 5E062212
P 13950 8650
F 0 "TP?" V 13904 8838 50  0000 L CNN
F 1 "TestPoint" V 13995 8838 50  0000 L CNN
F 2 "" H 14150 8650 50  0001 C CNN
F 3 "~" H 14150 8650 50  0001 C CNN
	1    13950 8650
	0    1    1    0   
$EndComp
Text GLabel 13950 8650 0    50   Input ~ 0
CV1B
$EndSCHEMATC
