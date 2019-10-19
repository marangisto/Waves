EESchema Schematic File Version 4
LIBS:CordicVCO-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+12V #PWR?
U 1 1 5B5C945C
P 5350 4300
F 0 "#PWR?" H 5350 4150 50  0001 C CNN
F 1 "+12V" H 5350 4440 50  0000 C CNN
F 2 "" H 5350 4300 50  0001 C CNN
F 3 "" H 5350 4300 50  0001 C CNN
	1    5350 4300
	1    0    0    -1  
$EndComp
$Comp
L power:-12V #PWR?
U 1 1 5B5C94D1
P 5350 5500
F 0 "#PWR?" H 5350 5600 50  0001 C CNN
F 1 "-12V" H 5350 5650 50  0000 C CNN
F 2 "" H 5350 5500 50  0001 C CNN
F 3 "" H 5350 5500 50  0001 C CNN
	1    5350 5500
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5B5DAB7A
P 5100 4300
F 0 "#FLG?" H 5100 4375 50  0001 C CNN
F 1 "PWR_FLAG" H 5100 4450 50  0000 C CNN
F 2 "" H 5100 4300 50  0001 C CNN
F 3 "" H 5100 4300 50  0001 C CNN
	1    5100 4300
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5B5DABCD
P 5100 5500
F 0 "#FLG?" H 5100 5575 50  0001 C CNN
F 1 "PWR_FLAG" H 5100 5650 50  0000 C CNN
F 2 "" H 5100 5500 50  0001 C CNN
F 3 "" H 5100 5500 50  0001 C CNN
	1    5100 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	5100 4850 5100 4900
Connection ~ 5100 4900
Connection ~ 5100 4550
Connection ~ 5100 5250
Wire Wire Line
	5350 5250 5350 5500
Wire Wire Line
	5350 4300 5350 4550
Wire Wire Line
	5100 5250 5100 5500
Wire Wire Line
	5100 4550 5100 4300
Wire Wire Line
	5100 4900 5100 4950
Wire Wire Line
	5100 4550 5350 4550
Wire Wire Line
	5100 5250 5350 5250
$Comp
L Device:CP C?
U 1 1 5B8C4452
P 5100 4700
F 0 "C?" H 5218 4746 50  0000 L CNN
F 1 "22u" H 5218 4655 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_5x5.4" H 5138 4550 50  0001 C CNN
F 3 "~" H 5100 4700 50  0001 C CNN
	1    5100 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5B8C4492
P 7400 2000
F 0 "C?" H 7518 2046 50  0000 L CNN
F 1 "10u" H 7518 1955 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.8" H 7438 1850 50  0001 C CNN
F 3 "~" H 7400 2000 50  0001 C CNN
	1    7400 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5B8C943A
P 6250 5250
F 0 "D?" V 6288 5133 50  0000 R CNN
F 1 "LED" V 6197 5133 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Castellated" H 6250 5250 50  0001 C CNN
F 3 "~" H 6250 5250 50  0001 C CNN
	1    6250 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5B8CA688
P 5750 5250
F 0 "R?" H 5820 5296 50  0000 L CNN
F 1 "1k" H 5820 5205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5680 5250 50  0001 C CNN
F 3 "~" H 5750 5250 50  0001 C CNN
	1    5750 5250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5B8CB2C3
P 6600 5500
F 0 "#PWR?" H 6600 5250 50  0001 C CNN
F 1 "GND" H 6605 5327 50  0000 C CNN
F 2 "" H 6600 5500 50  0001 C CNN
F 3 "" H 6600 5500 50  0001 C CNN
	1    6600 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5D1A7951
P 7800 1700
F 0 "#PWR?" H 7800 1550 50  0001 C CNN
F 1 "+3.3V" H 7815 1873 50  0000 C CNN
F 2 "" H 7800 1700 50  0001 C CNN
F 3 "" H 7800 1700 50  0001 C CNN
	1    7800 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 1800 7400 1850
Wire Wire Line
	7800 1800 7800 1700
Wire Wire Line
	6700 1800 6950 1800
$Comp
L power:GND #PWR?
U 1 1 5D1A7963
P 6400 2300
F 0 "#PWR?" H 6400 2050 50  0001 C CNN
F 1 "GND" H 6405 2127 50  0000 C CNN
F 2 "" H 6400 2300 50  0001 C CNN
F 3 "" H 6400 2300 50  0001 C CNN
	1    6400 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2300 6400 2200
Connection ~ 7400 1800
Connection ~ 6400 2200
Wire Wire Line
	6400 2200 6400 2100
Wire Wire Line
	6400 2200 6950 2200
Wire Wire Line
	7400 2200 7400 2150
$Comp
L Regulator_Linear:LM1117-3.3 U?
U 1 1 5D1A798F
P 6400 1800
F 0 "U?" H 6400 2042 50  0000 C CNN
F 1 "LM1117-3.3" H 6400 1951 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 6400 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 6400 1800 50  0001 C CNN
	1    6400 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5D1A794B
P 5100 5100
F 0 "C?" H 5218 5146 50  0000 L CNN
F 1 "22u" H 5218 5055 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_5x5.4" H 5138 4950 50  0001 C CNN
F 3 "~" H 5100 5100 50  0001 C CNN
	1    5100 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4800 3100 4900
Connection ~ 3100 4900
Wire Wire Line
	3100 5000 3100 4900
Wire Wire Line
	2600 4900 2600 5000
Connection ~ 2600 4900
Wire Wire Line
	2600 4800 2600 4900
Wire Wire Line
	2600 4700 3100 4700
Wire Wire Line
	2600 4800 3100 4800
Wire Wire Line
	2600 5000 3100 5000
Wire Wire Line
	2600 5100 3100 5100
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J?
U 1 1 5B8C48A5
P 2800 4900
F 0 "J?" H 2850 5317 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 2850 5226 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 2800 4900 50  0001 C CNN
F 3 "~" H 2800 4900 50  0001 C CNN
	1    2800 4900
	1    0    0    1   
$EndComp
$Comp
L Device:D D?
U 1 1 5B8C45A3
P 3800 5250
F 0 "D?" H 3800 5466 50  0000 C CNN
F 1 "DFLR1400-7" H 3800 5375 50  0000 C CNN
F 2 "Diode_SMD:D_PowerDI-123" H 3800 5250 50  0001 C CNN
F 3 "~" H 3800 5250 50  0001 C CNN
	1    3800 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:D D?
U 1 1 5B8C4538
P 3800 4550
F 0 "D?" H 3800 4334 50  0000 C CNN
F 1 "DFLR1400-7" H 3800 4425 50  0000 C CNN
F 2 "Diode_SMD:D_PowerDI-123" H 3800 4550 50  0001 C CNN
F 3 "~" H 3800 4550 50  0001 C CNN
	1    3800 4550
	-1   0    0    1   
$EndComp
Wire Wire Line
	2400 4900 2400 4950
Connection ~ 2400 4900
Wire Wire Line
	2400 4850 2400 4900
Wire Wire Line
	3950 4550 4100 4550
Wire Wire Line
	2400 4900 2600 4900
Wire Wire Line
	3950 5250 4350 5250
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5B5DABA7
P 2400 4850
F 0 "#FLG?" H 2400 4925 50  0001 C CNN
F 1 "PWR_FLAG" H 2400 5000 50  0000 C CNN
F 2 "" H 2400 4850 50  0001 C CNN
F 3 "" H 2400 4850 50  0001 C CNN
	1    2400 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5B5C92CF
P 2400 4950
F 0 "#PWR?" H 2400 4700 50  0001 C CNN
F 1 "GND" H 2400 4800 50  0000 C CNN
F 2 "" H 2400 4950 50  0001 C CNN
F 3 "" H 2400 4950 50  0001 C CNN
	1    2400 4950
	1    0    0    -1  
$EndComp
Connection ~ 2600 4800
Connection ~ 2600 5000
Connection ~ 3100 4800
Connection ~ 3100 5000
$Comp
L Device:Ferrite_Bead FB?
U 1 1 5DBD1577
P 4500 4550
F 0 "FB?" V 4226 4550 50  0000 C CNN
F 1 "Ferrite_Bead" V 4317 4550 50  0000 C CNN
F 2 "Inductor_SMD:L_0603_1608Metric" V 4430 4550 50  0001 C CNN
F 3 "~" H 4500 4550 50  0001 C CNN
	1    4500 4550
	0    1    1    0   
$EndComp
$Comp
L Device:Ferrite_Bead FB?
U 1 1 5DBD27F7
P 4500 5250
F 0 "FB?" V 4226 5250 50  0000 C CNN
F 1 "Ferrite_Bead" V 4317 5250 50  0000 C CNN
F 2 "Inductor_SMD:L_0603_1608Metric" V 4430 5250 50  0001 C CNN
F 3 "~" H 4500 5250 50  0001 C CNN
	1    4500 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 5250 5100 5250
Wire Wire Line
	3100 4900 5100 4900
Wire Wire Line
	4650 4550 5100 4550
Wire Wire Line
	7400 1800 7800 1800
$Comp
L Device:C C?
U 1 1 5D1A796C
P 5850 2000
F 0 "C?" H 5965 2046 50  0000 L CNN
F 1 "100n" H 5965 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5888 1850 50  0001 C CNN
F 3 "~" H 5850 2000 50  0001 C CNN
	1    5850 2000
	1    0    0    -1  
$EndComp
Connection ~ 5850 1800
Wire Wire Line
	5850 2200 6400 2200
Wire Wire Line
	5850 2150 5850 2200
Wire Wire Line
	5850 1800 6100 1800
Wire Wire Line
	5850 1850 5850 1800
$Comp
L Device:C C?
U 1 1 5DBE066A
P 6950 2000
F 0 "C?" H 7065 2046 50  0000 L CNN
F 1 "100n" H 7065 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6988 1850 50  0001 C CNN
F 3 "~" H 6950 2000 50  0001 C CNN
	1    6950 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1800 5400 1800
Wire Wire Line
	5400 1850 5400 1800
Connection ~ 5400 1800
Wire Wire Line
	5400 1800 5850 1800
Wire Wire Line
	5400 2150 5400 2200
Wire Wire Line
	5400 2200 5850 2200
Connection ~ 5850 2200
Wire Wire Line
	6950 1850 6950 1800
Connection ~ 6950 1800
Wire Wire Line
	6950 1800 7400 1800
Wire Wire Line
	6950 2150 6950 2200
Connection ~ 6950 2200
Wire Wire Line
	6950 2200 7400 2200
Wire Wire Line
	4100 1800 4100 3250
Connection ~ 4100 4550
Wire Wire Line
	4100 4550 4350 4550
$Comp
L Device:CP C?
U 1 1 5DC262C9
P 7400 3450
F 0 "C?" H 7518 3496 50  0000 L CNN
F 1 "10u" H 7518 3405 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.8" H 7438 3300 50  0001 C CNN
F 3 "~" H 7400 3450 50  0001 C CNN
	1    7400 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 3250 7400 3300
Wire Wire Line
	7800 3250 7800 3150
Wire Wire Line
	6700 3250 6950 3250
$Comp
L power:GND #PWR?
U 1 1 5DC262E0
P 6400 3750
F 0 "#PWR?" H 6400 3500 50  0001 C CNN
F 1 "GND" H 6405 3577 50  0000 C CNN
F 2 "" H 6400 3750 50  0001 C CNN
F 3 "" H 6400 3750 50  0001 C CNN
	1    6400 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3750 6400 3650
Connection ~ 7400 3250
Connection ~ 6400 3650
Wire Wire Line
	6400 3650 6400 3550
Wire Wire Line
	6400 3650 6950 3650
Wire Wire Line
	7400 3650 7400 3600
$Comp
L Regulator_Linear:LM1117-3.3 U?
U 1 1 5DC262F0
P 6400 3250
F 0 "U?" H 6400 3492 50  0000 C CNN
F 1 "LM1117-3.3" H 6400 3401 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 6400 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 6400 3250 50  0001 C CNN
	1    6400 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 3250 7800 3250
$Comp
L Device:C C?
U 1 1 5DC262FB
P 5850 3450
F 0 "C?" H 5965 3496 50  0000 L CNN
F 1 "100n" H 5965 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5888 3300 50  0001 C CNN
F 3 "~" H 5850 3450 50  0001 C CNN
	1    5850 3450
	1    0    0    -1  
$EndComp
Connection ~ 5850 3250
Wire Wire Line
	5850 3650 6400 3650
Wire Wire Line
	5850 3600 5850 3650
Wire Wire Line
	5850 3250 6100 3250
Wire Wire Line
	5850 3300 5850 3250
$Comp
L Device:C C?
U 1 1 5DC2630A
P 6950 3450
F 0 "C?" H 7065 3496 50  0000 L CNN
F 1 "100n" H 7065 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6988 3300 50  0001 C CNN
F 3 "~" H 6950 3450 50  0001 C CNN
	1    6950 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 3250 5400 3250
$Comp
L Device:Ferrite_Bead FB?
U 1 1 5DC2631F
P 5050 3250
F 0 "FB?" V 4776 3250 50  0000 C CNN
F 1 "Ferrite_Bead" V 4867 3250 50  0000 C CNN
F 2 "Inductor_SMD:L_0603_1608Metric" V 4980 3250 50  0001 C CNN
F 3 "~" H 5050 3250 50  0001 C CNN
	1    5050 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	5400 3300 5400 3250
Connection ~ 5400 3250
Wire Wire Line
	5400 3250 5850 3250
Wire Wire Line
	5400 3600 5400 3650
Wire Wire Line
	5400 3650 5850 3650
Connection ~ 5850 3650
Wire Wire Line
	6950 3300 6950 3250
Connection ~ 6950 3250
Wire Wire Line
	6950 3250 7400 3250
Wire Wire Line
	6950 3600 6950 3650
Connection ~ 6950 3650
Wire Wire Line
	6950 3650 7400 3650
Wire Wire Line
	4900 3250 4100 3250
Wire Wire Line
	4100 3250 4100 4550
Connection ~ 4100 3250
$Comp
L power:+3.3VA #PWR?
U 1 1 5DC2F8AA
P 7800 3150
F 0 "#PWR?" H 7800 3000 50  0001 C CNN
F 1 "+3.3VA" H 7815 3323 50  0000 C CNN
F 2 "" H 7800 3150 50  0001 C CNN
F 3 "" H 7800 3150 50  0001 C CNN
	1    7800 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 1850 4450 1800
Connection ~ 4450 1800
Wire Wire Line
	4450 1800 4100 1800
Wire Wire Line
	4450 2150 4450 2200
Wire Wire Line
	4450 2200 5400 2200
Connection ~ 5400 2200
$Comp
L pspice:INDUCTOR L?
U 1 1 5DC3FD6D
P 4950 1800
F 0 "L?" H 4950 2015 50  0000 C CNN
F 1 "33u" H 4950 1924 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric" H 4950 1800 50  0001 C CNN
F 3 "~" H 4950 1800 50  0001 C CNN
	1    4950 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 1800 4450 1800
$Comp
L Device:C C?
U 1 1 5DC604B5
P 4450 2000
F 0 "C?" H 4565 2046 50  0000 L CNN
F 1 "22u" H 4565 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4488 1850 50  0001 C CNN
F 3 "~" H 4450 2000 50  0001 C CNN
	1    4450 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DC60C05
P 5400 2000
F 0 "C?" H 5515 2046 50  0000 L CNN
F 1 "22u" H 5515 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5438 1850 50  0001 C CNN
F 3 "~" H 5400 2000 50  0001 C CNN
	1    5400 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DC61435
P 5400 3450
F 0 "C?" H 5515 3496 50  0000 L CNN
F 1 "22u" H 5515 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5438 3300 50  0001 C CNN
F 3 "~" H 5400 3450 50  0001 C CNN
	1    5400 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 5250 5600 5250
Connection ~ 5350 5250
Wire Wire Line
	5900 5250 6100 5250
Wire Wire Line
	6400 5250 6600 5250
Wire Wire Line
	6600 5250 6600 5500
Wire Wire Line
	3100 4700 3400 4700
Wire Wire Line
	3400 4700 3400 4550
Wire Wire Line
	3400 4550 3650 4550
Connection ~ 3100 4700
Wire Wire Line
	3400 5250 3650 5250
Wire Wire Line
	3100 5100 3400 5100
Wire Wire Line
	3400 5100 3400 5250
Connection ~ 3100 5100
$EndSCHEMATC
