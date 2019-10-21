EESchema Schematic File Version 4
LIBS:Waves-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 10
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
L Audio:PCM5100 U?
U 1 1 5DAD8379
P 3550 3000
AR Path="/5DAD8379" Ref="U?"  Part="1" 
AR Path="/5DABD69F/5DAD8379" Ref="U4"  Part="1" 
F 0 "U4" H 3550 3781 50  0000 C CNN
F 1 "PCM5100" H 3550 3690 50  0000 C CNN
F 2 "Package_SO:TSSOP-20_4.4x6.5mm_P0.65mm" H 3500 3750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/pcm5100.pdf" H 3500 3750 50  0001 C CNN
	1    3550 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DAD837F
P 3550 4050
AR Path="/5DAD837F" Ref="#PWR?"  Part="1" 
AR Path="/5DABD69F/5DAD837F" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 3550 3800 50  0001 C CNN
F 1 "GND" H 3555 3877 50  0000 C CNN
F 2 "" H 3550 4050 50  0001 C CNN
F 3 "" H 3550 4050 50  0001 C CNN
	1    3550 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5DAD8385
P 4050 4050
AR Path="/5DAD8385" Ref="#PWR?"  Part="1" 
AR Path="/5DABD69F/5DAD8385" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 4050 3800 50  0001 C CNN
F 1 "GNDA" H 4055 3877 50  0000 C CNN
F 2 "" H 4050 4050 50  0001 C CNN
F 3 "" H 4050 4050 50  0001 C CNN
	1    4050 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DAD838B
P 2750 6700
AR Path="/5DAD838B" Ref="C?"  Part="1" 
AR Path="/5DABD69F/5DAD838B" Ref="C16"  Part="1" 
F 0 "C16" H 2865 6746 50  0000 L CNN
F 1 "100n" H 2865 6655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2788 6550 50  0001 C CNN
F 3 "~" H 2750 6700 50  0001 C CNN
	1    2750 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DAD8391
P 3300 6700
AR Path="/5DAD8391" Ref="C?"  Part="1" 
AR Path="/5DABD69F/5DAD8391" Ref="C17"  Part="1" 
F 0 "C17" H 3415 6746 50  0000 L CNN
F 1 "100n" H 3415 6655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3338 6550 50  0001 C CNN
F 3 "~" H 3300 6700 50  0001 C CNN
	1    3300 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DAD8397
P 3800 6700
AR Path="/5DAD8397" Ref="C?"  Part="1" 
AR Path="/5DABD69F/5DAD8397" Ref="C18"  Part="1" 
F 0 "C18" H 3915 6746 50  0000 L CNN
F 1 "100n" H 3915 6655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3838 6550 50  0001 C CNN
F 3 "~" H 3800 6700 50  0001 C CNN
	1    3800 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DAD839D
P 4350 3650
AR Path="/5DAD839D" Ref="C?"  Part="1" 
AR Path="/5DABD69F/5DAD839D" Ref="C22"  Part="1" 
F 0 "C22" H 4465 3696 50  0000 L CNN
F 1 "100n" H 4465 3605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4388 3500 50  0001 C CNN
F 3 "~" H 4350 3650 50  0001 C CNN
	1    4350 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3400 4350 3400
Wire Wire Line
	4350 3400 4350 3500
$Comp
L power:GND #PWR?
U 1 1 5DAD83A5
P 4350 4050
AR Path="/5DAD83A5" Ref="#PWR?"  Part="1" 
AR Path="/5DABD69F/5DAD83A5" Ref="#PWR048"  Part="1" 
F 0 "#PWR048" H 4350 3800 50  0001 C CNN
F 1 "GND" H 4355 3877 50  0000 C CNN
F 2 "" H 4350 4050 50  0001 C CNN
F 3 "" H 4350 4050 50  0001 C CNN
	1    4350 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 4050 4350 3800
$Comp
L power:GND #PWR?
U 1 1 5DAD83AC
P 2750 6950
AR Path="/5DAD83AC" Ref="#PWR?"  Part="1" 
AR Path="/5DABD69F/5DAD83AC" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 2750 6700 50  0001 C CNN
F 1 "GND" H 2755 6777 50  0000 C CNN
F 2 "" H 2750 6950 50  0001 C CNN
F 3 "" H 2750 6950 50  0001 C CNN
	1    2750 6950
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5DAD83B2
P 3300 6950
AR Path="/5DAD83B2" Ref="#PWR?"  Part="1" 
AR Path="/5DABD69F/5DAD83B2" Ref="#PWR043"  Part="1" 
F 0 "#PWR043" H 3300 6700 50  0001 C CNN
F 1 "GNDA" H 3305 6777 50  0000 C CNN
F 2 "" H 3300 6950 50  0001 C CNN
F 3 "" H 3300 6950 50  0001 C CNN
	1    3300 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 6950 2750 6900
Wire Wire Line
	3300 6950 3300 6900
$Comp
L power:+3.3V #PWR?
U 1 1 5DAD83BA
P 2750 6400
AR Path="/5DAD83BA" Ref="#PWR?"  Part="1" 
AR Path="/5DABD69F/5DAD83BA" Ref="#PWR039"  Part="1" 
F 0 "#PWR039" H 2750 6250 50  0001 C CNN
F 1 "+3.3V" H 2765 6573 50  0000 C CNN
F 2 "" H 2750 6400 50  0001 C CNN
F 3 "" H 2750 6400 50  0001 C CNN
	1    2750 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VA #PWR?
U 1 1 5DAD83C0
P 3650 2050
AR Path="/5DAD83C0" Ref="#PWR?"  Part="1" 
AR Path="/5DABD69F/5DAD83C0" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 3650 1900 50  0001 C CNN
F 1 "+3.3VA" H 3665 2223 50  0000 C CNN
F 2 "" H 3650 2050 50  0001 C CNN
F 3 "" H 3650 2050 50  0001 C CNN
	1    3650 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 2050 3650 2200
$Comp
L power:+3.3VA #PWR?
U 1 1 5DAD83C7
P 3300 6400
AR Path="/5DAD83C7" Ref="#PWR?"  Part="1" 
AR Path="/5DABD69F/5DAD83C7" Ref="#PWR042"  Part="1" 
F 0 "#PWR042" H 3300 6250 50  0001 C CNN
F 1 "+3.3VA" H 3315 6573 50  0000 C CNN
F 2 "" H 3300 6400 50  0001 C CNN
F 3 "" H 3300 6400 50  0001 C CNN
	1    3300 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 6400 3300 6450
Wire Wire Line
	2750 6400 2750 6450
Connection ~ 2750 6450
Wire Wire Line
	2750 6450 2750 6550
Connection ~ 2750 6900
Wire Wire Line
	2750 6900 2750 6850
$Comp
L Device:C C?
U 1 1 5DAD83D3
P 4050 3800
AR Path="/5DAD83D3" Ref="C?"  Part="1" 
AR Path="/5DABD69F/5DAD83D3" Ref="C19"  Part="1" 
F 0 "C19" H 4165 3846 50  0000 L CNN
F 1 "2u2" H 4165 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4088 3650 50  0001 C CNN
F 3 "~" H 4050 3800 50  0001 C CNN
	1    4050 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DAD83D9
P 4350 3050
AR Path="/5DAD83D9" Ref="C?"  Part="1" 
AR Path="/5DABD69F/5DAD83D9" Ref="C21"  Part="1" 
F 0 "C21" H 4465 3096 50  0000 L CNN
F 1 "2u2" H 4465 3005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4388 2900 50  0001 C CNN
F 3 "~" H 4350 3050 50  0001 C CNN
	1    4350 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2900 4350 2900
Wire Wire Line
	4050 3200 4350 3200
Wire Wire Line
	4050 3650 4050 3500
$Comp
L Device:R R?
U 1 1 5DAD83E2
P 5250 2600
AR Path="/5DAD83E2" Ref="R?"  Part="1" 
AR Path="/5DABD69F/5DAD83E2" Ref="R5"  Part="1" 
F 0 "R5" V 5043 2600 50  0000 C CNN
F 1 "470" V 5134 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5180 2600 50  0001 C CNN
F 3 "~" H 5250 2600 50  0001 C CNN
	1    5250 2600
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5DAD83F4
P 5650 2900
AR Path="/5DAD83F4" Ref="C?"  Part="1" 
AR Path="/5DABD69F/5DAD83F4" Ref="C23"  Part="1" 
F 0 "C23" H 5765 2946 50  0000 L CNN
F 1 "2n2" H 5765 2855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5688 2750 50  0001 C CNN
F 3 "~" H 5650 2900 50  0001 C CNN
	1    5650 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 2600 5650 2750
$Comp
L Device:CP C?
U 1 1 5DAD8400
P 2200 6700
AR Path="/5DAD8400" Ref="C?"  Part="1" 
AR Path="/5DABD69F/5DAD8400" Ref="C15"  Part="1" 
F 0 "C15" H 2318 6746 50  0000 L CNN
F 1 "10u" H 2318 6655 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.8" H 2238 6550 50  0001 C CNN
F 3 "~" H 2200 6700 50  0001 C CNN
	1    2200 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5DAD8406
P 4250 6700
AR Path="/5DAD8406" Ref="C?"  Part="1" 
AR Path="/5DABD69F/5DAD8406" Ref="C20"  Part="1" 
F 0 "C20" H 4368 6746 50  0000 L CNN
F 1 "10u" H 4368 6655 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.8" H 4288 6550 50  0001 C CNN
F 3 "~" H 4250 6700 50  0001 C CNN
	1    4250 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 6550 2200 6450
Wire Wire Line
	2200 6850 2200 6900
Wire Wire Line
	3300 6450 3800 6450
Wire Wire Line
	4250 6450 4250 6550
Connection ~ 3300 6450
Wire Wire Line
	3300 6450 3300 6550
Wire Wire Line
	3300 6900 3800 6900
Wire Wire Line
	4250 6900 4250 6850
Connection ~ 3300 6900
Wire Wire Line
	3300 6900 3300 6850
Wire Wire Line
	5650 3050 5650 3150
Wire Wire Line
	3650 3800 3650 3700
Wire Wire Line
	3450 3800 3450 3700
Wire Wire Line
	3450 3800 3650 3800
Wire Wire Line
	3550 3700 3550 4050
Wire Wire Line
	4050 4050 4050 4000
Wire Wire Line
	3650 3800 3650 4000
Wire Wire Line
	3650 4000 4050 4000
Connection ~ 3650 3800
Connection ~ 4050 4000
Wire Wire Line
	4050 4000 4050 3950
$Comp
L power:+3.3V #PWR?
U 1 1 5DAD842E
P 3550 2050
AR Path="/5DAD842E" Ref="#PWR?"  Part="1" 
AR Path="/5DABD69F/5DAD842E" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 3550 1900 50  0001 C CNN
F 1 "+3.3V" H 3565 2223 50  0000 C CNN
F 2 "" H 3550 2050 50  0001 C CNN
F 3 "" H 3550 2050 50  0001 C CNN
	1    3550 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 2050 3550 2400
Wire Wire Line
	3450 2400 3450 2200
Wire Wire Line
	3450 2200 3650 2200
Connection ~ 3650 2200
Wire Wire Line
	3650 2200 3650 2400
Wire Wire Line
	3800 6550 3800 6450
Connection ~ 3800 6450
Wire Wire Line
	3800 6450 4250 6450
Wire Wire Line
	3800 6850 3800 6900
Connection ~ 3800 6900
Wire Wire Line
	3800 6900 4250 6900
Wire Wire Line
	2200 6450 2750 6450
Wire Wire Line
	2200 6900 2750 6900
$Comp
L power:GND #PWR?
U 1 1 5DAD8441
P 2850 3550
AR Path="/5DAD8441" Ref="#PWR?"  Part="1" 
AR Path="/5DABD69F/5DAD8441" Ref="#PWR041"  Part="1" 
F 0 "#PWR041" H 2850 3300 50  0001 C CNN
F 1 "GND" H 2855 3377 50  0000 C CNN
F 2 "" H 2850 3550 50  0001 C CNN
F 3 "" H 2850 3550 50  0001 C CNN
	1    2850 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5DAD8447
P 2650 3000
AR Path="/5DAD8447" Ref="#PWR?"  Part="1" 
AR Path="/5DABD69F/5DAD8447" Ref="#PWR038"  Part="1" 
F 0 "#PWR038" H 2650 2850 50  0001 C CNN
F 1 "+3.3V" H 2665 3173 50  0000 C CNN
F 2 "" H 2650 3000 50  0001 C CNN
F 3 "" H 2650 3000 50  0001 C CNN
	1    2650 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 3100 3050 3100
Wire Wire Line
	2650 3100 2650 3300
Wire Wire Line
	2650 3300 3050 3300
Connection ~ 2650 3100
Wire Wire Line
	2850 3550 2850 3400
Wire Wire Line
	2850 2900 3050 2900
Wire Wire Line
	3050 3200 2850 3200
Connection ~ 2850 3200
Wire Wire Line
	2850 3200 2850 2900
Wire Wire Line
	3050 3400 2850 3400
Connection ~ 2850 3400
Wire Wire Line
	2850 3400 2850 3200
Wire Wire Line
	2650 3000 2650 3100
$Comp
L Amplifier_Operational:TL072 U5
U 1 1 5DADA35F
P 6650 2700
F 0 "U5" H 6650 2333 50  0000 C CNN
F 1 "TL072" H 6650 2424 50  0000 C CNN
F 2 "Package_SO:TSSOP-8_4.4x3mm_P0.65mm" H 6650 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 6650 2700 50  0001 C CNN
	1    6650 2700
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:TL072 U5
U 2 1 5DADC767
P 6650 4650
F 0 "U5" H 6650 4283 50  0000 C CNN
F 1 "TL072" H 6650 4374 50  0000 C CNN
F 2 "Package_SO:TSSOP-8_4.4x3mm_P0.65mm" H 6650 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 6650 4650 50  0001 C CNN
	2    6650 4650
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:TL072 U5
U 3 1 5DADEBFB
P 5450 6750
F 0 "U5" H 5408 6796 50  0000 L CNN
F 1 "TL072" H 5408 6705 50  0000 L CNN
F 2 "Package_SO:TSSOP-8_4.4x3mm_P0.65mm" H 5450 6750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 5450 6750 50  0001 C CNN
	3    5450 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DAE2470
P 5950 6550
AR Path="/5DAE2470" Ref="C?"  Part="1" 
AR Path="/5DABD69F/5DAE2470" Ref="C25"  Part="1" 
F 0 "C25" H 6065 6596 50  0000 L CNN
F 1 "100n" H 6065 6505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5988 6400 50  0001 C CNN
F 3 "~" H 5950 6550 50  0001 C CNN
	1    5950 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DAE2B79
P 5950 6950
AR Path="/5DAE2B79" Ref="C?"  Part="1" 
AR Path="/5DABD69F/5DAE2B79" Ref="C26"  Part="1" 
F 0 "C26" H 6065 6996 50  0000 L CNN
F 1 "100n" H 6065 6905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5988 6800 50  0001 C CNN
F 3 "~" H 5950 6950 50  0001 C CNN
	1    5950 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 7050 5350 7200
Wire Wire Line
	5350 7200 5950 7200
Wire Wire Line
	5950 7200 5950 7100
Wire Wire Line
	5950 6700 5950 6750
Wire Wire Line
	6400 6850 6400 6750
Wire Wire Line
	6400 6750 5950 6750
Connection ~ 5950 6750
Wire Wire Line
	5950 6750 5950 6800
Wire Wire Line
	5950 6400 5950 6300
Wire Wire Line
	5950 6300 5350 6300
Wire Wire Line
	5350 6300 5350 6450
$Comp
L power:+12V #PWR051
U 1 1 5DAF2B30
P 5950 6200
F 0 "#PWR051" H 5950 6050 50  0001 C CNN
F 1 "+12V" H 5965 6373 50  0000 C CNN
F 2 "" H 5950 6200 50  0001 C CNN
F 3 "" H 5950 6200 50  0001 C CNN
	1    5950 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 6200 5950 6300
Connection ~ 5950 6300
$Comp
L power:-12V #PWR052
U 1 1 5DAF4C60
P 5950 7300
F 0 "#PWR052" H 5950 7400 50  0001 C CNN
F 1 "-12V" H 5965 7473 50  0000 C CNN
F 2 "" H 5950 7300 50  0001 C CNN
F 3 "" H 5950 7300 50  0001 C CNN
	1    5950 7300
	-1   0    0    1   
$EndComp
Wire Wire Line
	5950 7300 5950 7200
Connection ~ 5950 7200
$Comp
L Device:R R9
U 1 1 5DAF9DEF
P 6650 2200
F 0 "R9" V 6443 2200 50  0000 C CNN
F 1 "33k" V 6534 2200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6580 2200 50  0001 C CNN
F 3 "~" H 6650 2200 50  0001 C CNN
	1    6650 2200
	0    1    1    0   
$EndComp
$Comp
L Device:C C27
U 1 1 5DAFAB4B
P 6650 1850
F 0 "C27" V 6398 1850 50  0000 C CNN
F 1 "100p" V 6489 1850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6688 1700 50  0001 C CNN
F 3 "~" H 6650 1850 50  0001 C CNN
	1    6650 1850
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5DAFB6B3
P 6000 2600
F 0 "R7" V 5793 2600 50  0000 C CNN
F 1 "18k" V 5884 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5930 2600 50  0001 C CNN
F 3 "~" H 6000 2600 50  0001 C CNN
	1    6000 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 2600 6250 2600
Wire Wire Line
	6250 3150 6250 2800
Wire Wire Line
	6250 2800 6350 2800
$Comp
L Device:R R11
U 1 1 5DAFFA21
P 7350 2700
F 0 "R11" V 7143 2700 50  0000 C CNN
F 1 "1k" V 7234 2700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7280 2700 50  0001 C CNN
F 3 "~" H 7350 2700 50  0001 C CNN
	1    7350 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	6800 1850 7000 1850
Wire Wire Line
	7000 1850 7000 2200
Wire Wire Line
	6950 2700 7000 2700
Connection ~ 7000 2700
Wire Wire Line
	7000 2700 7200 2700
Wire Wire Line
	6800 2200 7000 2200
Connection ~ 7000 2200
Wire Wire Line
	7000 2200 7000 2700
Wire Wire Line
	6500 1850 6250 1850
Wire Wire Line
	6250 1850 6250 2200
Connection ~ 6250 2600
Wire Wire Line
	6250 2600 6350 2600
Wire Wire Line
	6250 2200 6500 2200
Connection ~ 6250 2200
Wire Wire Line
	6250 2200 6250 2600
Wire Wire Line
	5650 2600 5850 2600
Text HLabel 7750 2700 2    50   Input ~ 0
OUTL
Wire Wire Line
	7500 2700 7750 2700
Wire Wire Line
	5400 2600 5650 2600
Connection ~ 5650 2600
$Comp
L Device:R R?
U 1 1 5DB62CC9
P 5250 4550
AR Path="/5DB62CC9" Ref="R?"  Part="1" 
AR Path="/5DABD69F/5DB62CC9" Ref="R6"  Part="1" 
F 0 "R6" V 5043 4550 50  0000 C CNN
F 1 "470" V 5134 4550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5180 4550 50  0001 C CNN
F 3 "~" H 5250 4550 50  0001 C CNN
	1    5250 4550
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5DB62CD3
P 5650 4850
AR Path="/5DB62CD3" Ref="C?"  Part="1" 
AR Path="/5DABD69F/5DB62CD3" Ref="C24"  Part="1" 
F 0 "C24" H 5765 4896 50  0000 L CNN
F 1 "2n2" H 5765 4805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5688 4700 50  0001 C CNN
F 3 "~" H 5650 4850 50  0001 C CNN
	1    5650 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4550 5650 4700
Wire Wire Line
	5650 5000 5650 5100
$Comp
L Device:R R10
U 1 1 5DB62CE9
P 6650 4150
F 0 "R10" V 6443 4150 50  0000 C CNN
F 1 "33k" V 6534 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6580 4150 50  0001 C CNN
F 3 "~" H 6650 4150 50  0001 C CNN
	1    6650 4150
	0    1    1    0   
$EndComp
$Comp
L Device:C C28
U 1 1 5DB62CF3
P 6650 3800
F 0 "C28" V 6398 3800 50  0000 C CNN
F 1 "100p" V 6489 3800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6688 3650 50  0001 C CNN
F 3 "~" H 6650 3800 50  0001 C CNN
	1    6650 3800
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5DB62CFD
P 6000 4550
F 0 "R8" V 5793 4550 50  0000 C CNN
F 1 "18k" V 5884 4550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5930 4550 50  0001 C CNN
F 3 "~" H 6000 4550 50  0001 C CNN
	1    6000 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 4550 6250 4550
Wire Wire Line
	6250 5100 6250 4750
Wire Wire Line
	6250 4750 6350 4750
$Comp
L Device:R R12
U 1 1 5DB62D14
P 7350 4650
F 0 "R12" V 7143 4650 50  0000 C CNN
F 1 "1k" V 7234 4650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7280 4650 50  0001 C CNN
F 3 "~" H 7350 4650 50  0001 C CNN
	1    7350 4650
	0    1    1    0   
$EndComp
Wire Wire Line
	6800 3800 7000 3800
Wire Wire Line
	7000 3800 7000 4150
Wire Wire Line
	6950 4650 7000 4650
Connection ~ 7000 4650
Wire Wire Line
	7000 4650 7200 4650
Wire Wire Line
	6800 4150 7000 4150
Connection ~ 7000 4150
Wire Wire Line
	7000 4150 7000 4650
Wire Wire Line
	6500 3800 6250 3800
Wire Wire Line
	6250 3800 6250 4150
Connection ~ 6250 4550
Wire Wire Line
	6250 4550 6350 4550
Wire Wire Line
	6250 4150 6500 4150
Connection ~ 6250 4150
Wire Wire Line
	6250 4150 6250 4550
Wire Wire Line
	5650 4550 5850 4550
Text HLabel 7750 4650 2    50   Input ~ 0
OUTR
Wire Wire Line
	7500 4650 7750 4650
Wire Wire Line
	5400 4550 5650 4550
Connection ~ 5650 4550
Wire Wire Line
	4050 2600 5100 2600
Wire Wire Line
	4900 2700 4900 4550
Wire Wire Line
	4900 4550 5100 4550
Wire Wire Line
	4050 2700 4900 2700
Text HLabel 2100 2600 0    50   Input ~ 0
WS
Text HLabel 2100 2700 0    50   Input ~ 0
SD
Text HLabel 2100 2800 0    50   Input ~ 0
CK
Wire Wire Line
	2100 2800 2350 2800
$Comp
L Connector:TestPoint TP5
U 1 1 5DB971FF
P 2550 2350
F 0 "TP5" H 2608 2468 50  0000 L CNN
F 1 "TestPoint" H 2608 2377 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2750 2350 50  0001 C CNN
F 3 "~" H 2750 2350 50  0001 C CNN
	1    2550 2350
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 5DB97C07
P 2750 2350
F 0 "TP6" H 2808 2468 50  0000 L CNN
F 1 "TestPoint" H 2808 2377 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2950 2350 50  0001 C CNN
F 3 "~" H 2950 2350 50  0001 C CNN
	1    2750 2350
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 5DB97CD5
P 2350 2350
F 0 "TP4" H 2408 2468 50  0000 L CNN
F 1 "TestPoint" H 2408 2377 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 2550 2350 50  0001 C CNN
F 3 "~" H 2550 2350 50  0001 C CNN
	1    2350 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2700 2550 2700
Wire Wire Line
	2100 2600 2750 2600
Wire Wire Line
	2350 2350 2350 2800
Connection ~ 2350 2800
Wire Wire Line
	2350 2800 3050 2800
Wire Wire Line
	2550 2350 2550 2700
Connection ~ 2550 2700
Wire Wire Line
	2550 2700 3050 2700
Wire Wire Line
	2750 2350 2750 2600
Connection ~ 2750 2600
Wire Wire Line
	2750 2600 3050 2600
$Comp
L power:GNDA #PWR?
U 1 1 5E3691B1
P 5650 3150
AR Path="/5E3691B1" Ref="#PWR?"  Part="1" 
AR Path="/5DABD69F/5E3691B1" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H 5650 2900 50  0001 C CNN
F 1 "GNDA" H 5655 2977 50  0000 C CNN
F 2 "" H 5650 3150 50  0001 C CNN
F 3 "" H 5650 3150 50  0001 C CNN
	1    5650 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5E36975A
P 6250 3150
AR Path="/5E36975A" Ref="#PWR?"  Part="1" 
AR Path="/5DABD69F/5E36975A" Ref="#PWR053"  Part="1" 
F 0 "#PWR053" H 6250 2900 50  0001 C CNN
F 1 "GNDA" H 6255 2977 50  0000 C CNN
F 2 "" H 6250 3150 50  0001 C CNN
F 3 "" H 6250 3150 50  0001 C CNN
	1    6250 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5E3699D1
P 5650 5100
AR Path="/5E3699D1" Ref="#PWR?"  Part="1" 
AR Path="/5DABD69F/5E3699D1" Ref="#PWR050"  Part="1" 
F 0 "#PWR050" H 5650 4850 50  0001 C CNN
F 1 "GNDA" H 5655 4927 50  0000 C CNN
F 2 "" H 5650 5100 50  0001 C CNN
F 3 "" H 5650 5100 50  0001 C CNN
	1    5650 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5E369DF7
P 6250 5100
AR Path="/5E369DF7" Ref="#PWR?"  Part="1" 
AR Path="/5DABD69F/5E369DF7" Ref="#PWR054"  Part="1" 
F 0 "#PWR054" H 6250 4850 50  0001 C CNN
F 1 "GNDA" H 6255 4927 50  0000 C CNN
F 2 "" H 6250 5100 50  0001 C CNN
F 3 "" H 6250 5100 50  0001 C CNN
	1    6250 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5E36A81C
P 6400 6850
AR Path="/5E36A81C" Ref="#PWR?"  Part="1" 
AR Path="/5DABD69F/5E36A81C" Ref="#PWR055"  Part="1" 
F 0 "#PWR055" H 6400 6600 50  0001 C CNN
F 1 "GNDA" H 6405 6677 50  0000 C CNN
F 2 "" H 6400 6850 50  0001 C CNN
F 3 "" H 6400 6850 50  0001 C CNN
	1    6400 6850
	1    0    0    -1  
$EndComp
$EndSCHEMATC
