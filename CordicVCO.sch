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
P 8600 9950
F 0 "C6" H 8715 9996 50  0000 L CNN
F 1 "100n" H 8715 9905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8638 9800 50  0001 C CNN
F 3 "~" H 8600 9950 50  0001 C CNN
	1    8600 9950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5DA34425
P 8600 10200
F 0 "#PWR06" H 8600 9950 50  0001 C CNN
F 1 "GND" H 8605 10027 50  0000 C CNN
F 2 "" H 8600 10200 50  0001 C CNN
F 3 "" H 8600 10200 50  0001 C CNN
	1    8600 10200
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR05
U 1 1 5DA35D1E
P 8600 9650
F 0 "#PWR05" H 8600 9500 50  0001 C CNN
F 1 "+3.3V" H 8615 9823 50  0000 C CNN
F 2 "" H 8600 9650 50  0001 C CNN
F 3 "" H 8600 9650 50  0001 C CNN
	1    8600 9650
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
	10200 10150 10200 10100
Wire Wire Line
	10600 10150 10600 10100
Connection ~ 10200 10150
Wire Wire Line
	10200 10200 10200 10150
$Comp
L power:GNDA #PWR010
U 1 1 5DA34A3A
P 10200 10200
F 0 "#PWR010" H 10200 9950 50  0001 C CNN
F 1 "GNDA" H 10205 10027 50  0000 C CNN
F 2 "" H 10200 10200 50  0001 C CNN
F 3 "" H 10200 10200 50  0001 C CNN
	1    10200 10200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5DA32C6E
P 10200 9950
F 0 "C10" H 10315 9996 50  0000 L CNN
F 1 "100n" H 10315 9905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10238 9800 50  0001 C CNN
F 3 "~" H 10200 9950 50  0001 C CNN
	1    10200 9950
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
S 1000 9750 850  800 
U 5DBC944B
F0 "POWER" 50
F1 "POWER.sch" 50
$EndSheet
$Comp
L Device:C C11
U 1 1 5DCD0DD6
P 10600 9950
F 0 "C11" H 10715 9996 50  0000 L CNN
F 1 "1u" H 10715 9905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10638 9800 50  0001 C CNN
F 3 "~" H 10600 9950 50  0001 C CNN
	1    10600 9950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5DCD32C8
P 9000 9950
F 0 "C7" H 9115 9996 50  0000 L CNN
F 1 "100n" H 9115 9905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9038 9800 50  0001 C CNN
F 3 "~" H 9000 9950 50  0001 C CNN
	1    9000 9950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5DCD3476
P 9400 9950
F 0 "C8" H 9515 9996 50  0000 L CNN
F 1 "100n" H 9515 9905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9438 9800 50  0001 C CNN
F 3 "~" H 9400 9950 50  0001 C CNN
	1    9400 9950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5DCCFDDE
P 8200 9950
F 0 "C5" H 8315 9996 50  0000 L CNN
F 1 "1u" H 8315 9905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8238 9800 50  0001 C CNN
F 3 "~" H 8200 9950 50  0001 C CNN
	1    8200 9950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5DCD3CBF
P 7800 9950
F 0 "C4" H 7915 9996 50  0000 L CNN
F 1 "1u" H 7915 9905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7838 9800 50  0001 C CNN
F 3 "~" H 7800 9950 50  0001 C CNN
	1    7800 9950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 10100 7800 10150
Wire Wire Line
	7800 10150 8200 10150
Wire Wire Line
	9400 10150 9400 10100
Wire Wire Line
	9400 9800 9400 9750
Wire Wire Line
	9400 9750 9000 9750
Wire Wire Line
	7800 9750 7800 9800
Wire Wire Line
	8200 9800 8200 9750
Connection ~ 8200 9750
Wire Wire Line
	8200 9750 7800 9750
Wire Wire Line
	8200 10100 8200 10150
Connection ~ 8200 10150
Wire Wire Line
	8200 10150 8600 10150
Wire Wire Line
	9000 10100 9000 10150
Connection ~ 9000 10150
Wire Wire Line
	9000 10150 9400 10150
Wire Wire Line
	8600 10100 8600 10150
Connection ~ 8600 10150
Wire Wire Line
	8600 10150 9000 10150
Wire Wire Line
	8600 10150 8600 10200
Wire Wire Line
	8600 9650 8600 9750
Connection ~ 8600 9750
Wire Wire Line
	8600 9750 8200 9750
Wire Wire Line
	8600 9750 8600 9800
Wire Wire Line
	9000 9800 9000 9750
Connection ~ 9000 9750
Wire Wire Line
	9000 9750 8600 9750
$Comp
L Device:C C3
U 1 1 5DCD9162
P 7400 9950
F 0 "C3" H 7515 9996 50  0000 L CNN
F 1 "1u" H 7515 9905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7438 9800 50  0001 C CNN
F 3 "~" H 7400 9950 50  0001 C CNN
	1    7400 9950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 9800 7400 9750
Wire Wire Line
	7400 9750 7800 9750
Connection ~ 7800 9750
Wire Wire Line
	7400 10100 7400 10150
Wire Wire Line
	7400 10150 7800 10150
Connection ~ 7800 10150
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
	10200 10150 10600 10150
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
P 9800 9950
F 0 "C9" H 9915 9996 50  0000 L CNN
F 1 "10n" H 9915 9905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9838 9800 50  0001 C CNN
F 3 "~" H 9800 9950 50  0001 C CNN
	1    9800 9950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 10150 9800 10150
Wire Wire Line
	9800 10150 9800 10100
Wire Wire Line
	9800 9750 10200 9750
Wire Wire Line
	9800 9800 9800 9750
Wire Wire Line
	10200 9750 10600 9750
$Comp
L power:+3.3VA #PWR09
U 1 1 5DA37762
P 10200 9700
F 0 "#PWR09" H 10200 9550 50  0001 C CNN
F 1 "+3.3VA" H 10215 9873 50  0000 C CNN
F 2 "" H 10200 9700 50  0001 C CNN
F 3 "" H 10200 9700 50  0001 C CNN
	1    10200 9700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 9700 10200 9750
Connection ~ 10200 9750
Wire Wire Line
	10600 9750 10600 9800
Wire Wire Line
	10200 9750 10200 9800
Wire Wire Line
	6600 10150 6600 10100
Wire Wire Line
	7000 10150 7000 10100
Connection ~ 6600 10150
Wire Wire Line
	6600 10200 6600 10150
$Comp
L power:GNDA #PWR04
U 1 1 5DD008D1
P 6600 10200
F 0 "#PWR04" H 6600 9950 50  0001 C CNN
F 1 "GNDA" H 6605 10027 50  0000 C CNN
F 2 "" H 6600 10200 50  0001 C CNN
F 3 "" H 6600 10200 50  0001 C CNN
	1    6600 10200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5DD008DB
P 6600 9950
F 0 "C1" H 6715 9996 50  0000 L CNN
F 1 "100n" H 6715 9905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6638 9800 50  0001 C CNN
F 3 "~" H 6600 9950 50  0001 C CNN
	1    6600 9950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5DD008E5
P 7000 9950
F 0 "C2" H 7115 9996 50  0000 L CNN
F 1 "1u" H 7115 9905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7038 9800 50  0001 C CNN
F 3 "~" H 7000 9950 50  0001 C CNN
	1    7000 9950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 10150 7000 10150
Wire Wire Line
	6600 9750 7000 9750
Connection ~ 6600 9750
Wire Wire Line
	7000 9750 7000 9800
Wire Wire Line
	6600 9750 6600 9800
Text GLabel 6450 9550 0    50   Input ~ 0
VREF
Wire Wire Line
	6450 9550 6600 9550
Wire Wire Line
	6600 9550 6600 9750
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
P 4950 9550
F 0 "TP4" V 4904 9738 50  0000 L CNN
F 1 "TestPoint" V 4995 9738 50  0000 L CNN
F 2 "" H 5150 9550 50  0001 C CNN
F 3 "~" H 5150 9550 50  0001 C CNN
	1    4950 9550
	0    1    1    0   
$EndComp
Text GLabel 4950 9550 0    50   Input ~ 0
VREF
$Comp
L Device:Rotary_Encoder_Switch SW?
U 1 1 5DD70181
P 3100 7400
AR Path="/5DD41DD6/5DD70181" Ref="SW?"  Part="1" 
AR Path="/5DD70181" Ref="SW1"  Part="1" 
F 0 "SW1" H 3100 7767 50  0000 C CNN
F 1 "Rotary_Encoder_Switch" H 3100 7676 50  0000 C CNN
F 2 "Rotary_Encoder:RotaryEncoder_Alps_EC11E-Switch_Vertical_H20mm" H 2950 7560 50  0001 C CNN
F 3 "~" H 3100 7660 50  0001 C CNN
	1    3100 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD7018D
P 3100 7800
AR Path="/5DD41DD6/5DD7018D" Ref="#PWR?"  Part="1" 
AR Path="/5DD7018D" Ref="#PWR043"  Part="1" 
F 0 "#PWR043" H 3100 7550 50  0001 C CNN
F 1 "GND" H 3105 7627 50  0000 C CNN
F 2 "" H 3100 7800 50  0001 C CNN
F 3 "" H 3100 7800 50  0001 C CNN
	1    3100 7800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 7300 2800 7300
Wire Wire Line
	2700 7500 2800 7500
Text GLabel 2700 7500 0    50   Input ~ 0
ENC_CH1
Text GLabel 2700 7300 0    50   Input ~ 0
ENC_CH2
Text GLabel 3500 7300 2    50   Input ~ 0
ENC_SW
Wire Wire Line
	3400 7300 3500 7300
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
P 11550 7000
AR Path="/5DD41DD6/5DD88E60" Ref="U?"  Part="1" 
AR Path="/5DD88E60" Ref="U8"  Part="1" 
F 0 "U8" H 11550 7481 50  0000 C CNN
F 1 "AT25xxx" H 11550 7390 50  0000 C CNN
F 2 "Package_SO:TSSOP-8_4.4x3mm_P0.65mm" H 11550 7000 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8707-SEEPROM-AT25010B-020B-040B-Datasheet.pdf" H 11550 7000 50  0001 C CNN
	1    11550 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD88E66
P 11550 7400
AR Path="/5DD41DD6/5DD88E66" Ref="#PWR?"  Part="1" 
AR Path="/5DD88E66" Ref="#PWR056"  Part="1" 
F 0 "#PWR056" H 11550 7150 50  0001 C CNN
F 1 "GND" H 11555 7227 50  0000 C CNN
F 2 "" H 11550 7400 50  0001 C CNN
F 3 "" H 11550 7400 50  0001 C CNN
	1    11550 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	11550 7400 11550 7300
$Comp
L power:+3.3V #PWR?
U 1 1 5DD88E6D
P 11550 6450
AR Path="/5DD41DD6/5DD88E6D" Ref="#PWR?"  Part="1" 
AR Path="/5DD88E6D" Ref="#PWR055"  Part="1" 
F 0 "#PWR055" H 11550 6300 50  0001 C CNN
F 1 "+3.3V" H 11565 6623 50  0000 C CNN
F 2 "" H 11550 6450 50  0001 C CNN
F 3 "" H 11550 6450 50  0001 C CNN
	1    11550 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	11550 6700 11550 6550
Text GLabel 12150 6900 2    50   Input ~ 0
MEM_SCK
Wire Wire Line
	12150 6900 11950 6900
Text GLabel 12150 7000 2    50   Input ~ 0
MEM_MOSI
Text GLabel 12150 7100 2    50   Input ~ 0
MEM_MISO
Text GLabel 10900 7100 0    50   Input ~ 0
MEM_CS
Wire Wire Line
	10900 7100 11150 7100
Wire Wire Line
	11950 7000 12150 7000
Wire Wire Line
	11950 7100 12150 7100
Wire Wire Line
	11150 6900 11050 6900
Wire Wire Line
	11050 6900 11050 6550
Wire Wire Line
	11050 6550 11550 6550
Connection ~ 11550 6550
Wire Wire Line
	11550 6550 11550 6450
Wire Wire Line
	11150 7000 11050 7000
Wire Wire Line
	11050 7000 11050 6900
Connection ~ 11050 6900
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
	2800 7400 2750 7400
Wire Wire Line
	2750 7400 2750 7700
Wire Wire Line
	2750 7700 3100 7700
Wire Wire Line
	3100 7700 3100 7800
Wire Wire Line
	3100 7700 3450 7700
Wire Wire Line
	3450 7700 3450 7500
Wire Wire Line
	3450 7500 3400 7500
Connection ~ 3100 7700
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
Text Notes 8700 4100 0    50   ~ 0
FIXME: BOOT0
$Comp
L Device:C C?
U 1 1 5DE03D3B
P 4200 9950
AR Path="/5DD41DD6/5DE03D3B" Ref="C?"  Part="1" 
AR Path="/5DE03D3B" Ref="C39"  Part="1" 
F 0 "C39" H 4315 9996 50  0000 L CNN
F 1 "100n" H 4315 9905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4238 9800 50  0001 C CNN
F 3 "~" H 4200 9950 50  0001 C CNN
	1    4200 9950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DE03D41
P 4200 10250
AR Path="/5DD41DD6/5DE03D41" Ref="#PWR?"  Part="1" 
AR Path="/5DE03D41" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 4200 10000 50  0001 C CNN
F 1 "GND" H 4205 10077 50  0000 C CNN
F 2 "" H 4200 10250 50  0001 C CNN
F 3 "" H 4200 10250 50  0001 C CNN
	1    4200 10250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 10250 4200 10200
$Comp
L Switch:SW_Push SW?
U 1 1 5DE03D48
P 3750 9950
AR Path="/5DD41DD6/5DE03D48" Ref="SW?"  Part="1" 
AR Path="/5DE03D48" Ref="SW2"  Part="1" 
F 0 "SW2" V 3796 9902 50  0000 R CNN
F 1 "SW_Push" V 3705 9902 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 3750 10150 50  0001 C CNN
F 3 "~" H 3750 10150 50  0001 C CNN
	1    3750 9950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3750 10150 3750 10200
Wire Wire Line
	3750 10200 4200 10200
Connection ~ 4200 10200
Wire Wire Line
	4200 10200 4200 10100
Wire Wire Line
	3750 9750 3750 9700
Wire Wire Line
	3750 9700 4200 9700
Wire Wire Line
	4200 9700 4200 9800
Text GLabel 4100 9500 0    50   Input ~ 0
RESET
Wire Wire Line
	4100 9500 4200 9500
Wire Wire Line
	4200 9500 4200 9700
Connection ~ 4200 9700
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 5DE03D59
P 2500 10000
AR Path="/5DD41DD6/5DE03D59" Ref="J?"  Part="1" 
AR Path="/5DE03D59" Ref="J6"  Part="1" 
F 0 "J6" H 2608 10381 50  0000 C CNN
F 1 "SWD" H 2608 10290 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 2500 10000 50  0001 C CNN
F 3 "~" H 2500 10000 50  0001 C CNN
	1    2500 10000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 10200 2750 10200
Wire Wire Line
	2700 10100 2750 10100
Wire Wire Line
	2700 9900 2750 9900
Wire Wire Line
	3200 9800 3200 9650
Wire Wire Line
	2700 9800 3200 9800
Wire Wire Line
	3200 10000 2700 10000
Wire Wire Line
	3200 10150 3200 10000
$Comp
L power:GND #PWR?
U 1 1 5DE03D66
P 3200 10150
AR Path="/5DD41DD6/5DE03D66" Ref="#PWR?"  Part="1" 
AR Path="/5DE03D66" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 3200 9900 50  0001 C CNN
F 1 "GND" H 3205 9977 50  0000 C CNN
F 2 "" H 3200 10150 50  0001 C CNN
F 3 "" H 3200 10150 50  0001 C CNN
	1    3200 10150
	1    0    0    -1  
$EndComp
Text GLabel 2750 10200 2    50   Input ~ 0
RESET
Text GLabel 2750 10100 2    50   Input ~ 0
SWDIO
Text GLabel 2750 9900 2    50   Input ~ 0
SWCLK
$Comp
L power:+3.3V #PWR?
U 1 1 5DE03D6F
P 3200 9650
AR Path="/5DD41DD6/5DE03D6F" Ref="#PWR?"  Part="1" 
AR Path="/5DE03D6F" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 3200 9500 50  0001 C CNN
F 1 "+3.3V" H 3215 9823 50  0000 C CNN
F 2 "" H 3200 9650 50  0001 C CNN
F 3 "" H 3200 9650 50  0001 C CNN
	1    3200 9650
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
PB7
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
S 5800 7600 550  450 
U 5DE2B991
F0 "sheet5DE2B98D" 50
F1 "PushLED.sch" 50
F2 "LED" I L 5800 7750 50 
F3 "SW" I L 5800 7900 50 
$EndSheet
Text GLabel 5550 7750 0    50   Input ~ 0
PC6
Text GLabel 5550 7900 0    50   Input ~ 0
PC7
Wire Wire Line
	5550 7900 5800 7900
Wire Wire Line
	5800 7750 5550 7750
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
$EndSCHEMATC
