EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 10
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
L Device:R R?
U 1 1 5E0B9041
P 3300 2750
AR Path="/5DD41DD6/5E0B9041" Ref="R?"  Part="1" 
AR Path="/5E0B9041" Ref="R?"  Part="1" 
AR Path="/5E0AD457/5E0B9041" Ref="R24"  Part="1" 
AR Path="/5E1FC1E7/5E0B9041" Ref="R36"  Part="1" 
F 0 "R36" V 3093 2750 50  0000 C CNN
F 1 "100k" V 3184 2750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3230 2750 50  0001 C CNN
F 3 "~" H 3300 2750 50  0001 C CNN
	1    3300 2750
	0    1    1    0   
$EndComp
Text GLabel 3050 2300 0    50   Input ~ 0
VRef-10
$Comp
L Device:R R?
U 1 1 5E0B9048
P 3300 2300
AR Path="/5DD41DD6/5E0B9048" Ref="R?"  Part="1" 
AR Path="/5E0B9048" Ref="R?"  Part="1" 
AR Path="/5E0AD457/5E0B9048" Ref="R23"  Part="1" 
AR Path="/5E1FC1E7/5E0B9048" Ref="R35"  Part="1" 
F 0 "R35" V 3093 2300 50  0000 C CNN
F 1 "169k" V 3184 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3230 2300 50  0001 C CNN
F 3 "~" H 3300 2300 50  0001 C CNN
	1    3300 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	3050 2300 3150 2300
Wire Wire Line
	3450 2750 3550 2750
Wire Wire Line
	3450 2300 3550 2300
Wire Wire Line
	3550 2300 3550 2750
Connection ~ 3550 2750
Wire Wire Line
	3550 2750 3650 2750
$Comp
L Device:R R?
U 1 1 5E0B905A
P 3950 2300
AR Path="/5DD41DD6/5E0B905A" Ref="R?"  Part="1" 
AR Path="/5E0B905A" Ref="R?"  Part="1" 
AR Path="/5E0AD457/5E0B905A" Ref="R27"  Part="1" 
AR Path="/5E1FC1E7/5E0B905A" Ref="R39"  Part="1" 
F 0 "R39" V 3743 2300 50  0000 C CNN
F 1 "33k" V 3834 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3880 2300 50  0001 C CNN
F 3 "~" H 3950 2300 50  0001 C CNN
	1    3950 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 2300 3800 2300
Connection ~ 3550 2300
Wire Wire Line
	4100 2300 4350 2300
Wire Wire Line
	4350 2300 4350 2850
Wire Wire Line
	4350 2850 4250 2850
$Comp
L Device:C C?
U 1 1 5E0B9065
P 3950 1900
AR Path="/5DD41DD6/5E0B9065" Ref="C?"  Part="1" 
AR Path="/5E0B9065" Ref="C?"  Part="1" 
AR Path="/5E0AD457/5E0B9065" Ref="C43"  Part="1" 
AR Path="/5E1FC1E7/5E0B9065" Ref="C49"  Part="1" 
F 0 "C49" V 3698 1900 50  0000 C CNN
F 1 "470p" V 3789 1900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3988 1750 50  0001 C CNN
F 3 "~" H 3950 1900 50  0001 C CNN
	1    3950 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 2300 3550 1900
Wire Wire Line
	3550 1900 3800 1900
Wire Wire Line
	4100 1900 4350 1900
Wire Wire Line
	4350 1900 4350 2300
Connection ~ 4350 2300
Wire Wire Line
	3550 3050 3550 2950
Wire Wire Line
	3550 2950 3650 2950
Wire Wire Line
	4350 2850 4600 2850
Connection ~ 4350 2850
Wire Wire Line
	2550 2750 3150 2750
$Comp
L Amplifier_Operational:MCP6004 U8
U 1 1 5E0B9732
P 3950 2850
AR Path="/5E0AD457/5E0B9732" Ref="U8"  Part="1" 
AR Path="/5E1FC1E7/5E0B9732" Ref="U9"  Part="1" 
F 0 "U9" H 3950 2483 50  0000 C CNN
F 1 "MCP6004" H 3950 2574 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 3900 2950 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 4000 3050 50  0001 C CNN
	1    3950 2850
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:MCP6004 U8
U 2 1 5E0BAD3D
P 3950 5050
AR Path="/5E0AD457/5E0BAD3D" Ref="U8"  Part="2" 
AR Path="/5E1FC1E7/5E0BAD3D" Ref="U9"  Part="2" 
F 0 "U9" H 3950 4683 50  0000 C CNN
F 1 "MCP6004" H 3950 4774 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 3900 5150 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 4000 5250 50  0001 C CNN
	2    3950 5050
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:MCP6004 U8
U 3 1 5E0BCA12
P 7900 2850
AR Path="/5E0AD457/5E0BCA12" Ref="U8"  Part="3" 
AR Path="/5E1FC1E7/5E0BCA12" Ref="U9"  Part="3" 
F 0 "U9" H 7900 2483 50  0000 C CNN
F 1 "MCP6004" H 7900 2574 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 7850 2950 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 7950 3050 50  0001 C CNN
	3    7900 2850
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:MCP6004 U8
U 4 1 5E0BE838
P 7900 5100
AR Path="/5E0AD457/5E0BE838" Ref="U8"  Part="4" 
AR Path="/5E1FC1E7/5E0BE838" Ref="U9"  Part="4" 
F 0 "U9" H 7900 4733 50  0000 C CNN
F 1 "MCP6004" H 7900 4824 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 7850 5200 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 7950 5300 50  0001 C CNN
	4    7900 5100
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:MCP6004 U8
U 5 1 5E0C00DF
P 1600 6550
AR Path="/5E0AD457/5E0C00DF" Ref="U8"  Part="5" 
AR Path="/5E1FC1E7/5E0C00DF" Ref="U9"  Part="5" 
F 0 "U9" H 1558 6596 50  0000 L CNN
F 1 "MCP6004" H 1558 6505 50  0000 L CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 1550 6650 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 1650 6750 50  0001 C CNN
	5    1600 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C41
U 1 1 5E0C25D7
P 2000 6400
AR Path="/5E0AD457/5E0C25D7" Ref="C41"  Part="1" 
AR Path="/5E1FC1E7/5E0C25D7" Ref="C47"  Part="1" 
F 0 "C47" H 2115 6446 50  0000 L CNN
F 1 "100n" H 2115 6355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2038 6250 50  0001 C CNN
F 3 "~" H 2000 6400 50  0001 C CNN
	1    2000 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C42
U 1 1 5E0C286E
P 2000 6700
AR Path="/5E0AD457/5E0C286E" Ref="C42"  Part="1" 
AR Path="/5E1FC1E7/5E0C286E" Ref="C48"  Part="1" 
F 0 "C48" H 2115 6746 50  0000 L CNN
F 1 "100n" H 2115 6655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2038 6550 50  0001 C CNN
F 3 "~" H 2000 6700 50  0001 C CNN
	1    2000 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 6250 2000 6250
Wire Wire Line
	1500 6850 2000 6850
Wire Wire Line
	2350 6950 2350 6550
Wire Wire Line
	2350 6550 2000 6550
Connection ~ 2000 6550
$Comp
L power:+12V #PWR078
U 1 1 5E0C7D6F
P 1500 6150
AR Path="/5E0AD457/5E0C7D6F" Ref="#PWR078"  Part="1" 
AR Path="/5E1FC1E7/5E0C7D6F" Ref="#PWR085"  Part="1" 
F 0 "#PWR085" H 1500 6000 50  0001 C CNN
F 1 "+12V" H 1515 6323 50  0000 C CNN
F 2 "" H 1500 6150 50  0001 C CNN
F 3 "" H 1500 6150 50  0001 C CNN
	1    1500 6150
	1    0    0    -1  
$EndComp
$Comp
L power:-12V #PWR079
U 1 1 5E0C8347
P 1500 6950
AR Path="/5E0AD457/5E0C8347" Ref="#PWR079"  Part="1" 
AR Path="/5E1FC1E7/5E0C8347" Ref="#PWR086"  Part="1" 
F 0 "#PWR086" H 1500 7050 50  0001 C CNN
F 1 "-12V" H 1515 7123 50  0000 C CNN
F 2 "" H 1500 6950 50  0001 C CNN
F 3 "" H 1500 6950 50  0001 C CNN
	1    1500 6950
	-1   0    0    1   
$EndComp
Wire Wire Line
	1500 6950 1500 6850
Connection ~ 1500 6850
Wire Wire Line
	1500 6250 1500 6150
Connection ~ 1500 6250
Text HLabel 2550 2750 0    50   Input ~ 0
VOCT
Text HLabel 4600 2850 2    50   Input ~ 0
VOCT_ADC
$Comp
L Device:R R?
U 1 1 5E0D4E4E
P 3300 4950
AR Path="/5DD41DD6/5E0D4E4E" Ref="R?"  Part="1" 
AR Path="/5E0D4E4E" Ref="R?"  Part="1" 
AR Path="/5E0AD457/5E0D4E4E" Ref="R26"  Part="1" 
AR Path="/5E1FC1E7/5E0D4E4E" Ref="R38"  Part="1" 
F 0 "R38" V 3093 4950 50  0000 C CNN
F 1 "100k" V 3184 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3230 4950 50  0001 C CNN
F 3 "~" H 3300 4950 50  0001 C CNN
	1    3300 4950
	0    1    1    0   
$EndComp
Text GLabel 3050 4500 0    50   Input ~ 0
VRef-10
$Comp
L Device:R R?
U 1 1 5E0D4E59
P 3300 4500
AR Path="/5DD41DD6/5E0D4E59" Ref="R?"  Part="1" 
AR Path="/5E0D4E59" Ref="R?"  Part="1" 
AR Path="/5E0AD457/5E0D4E59" Ref="R25"  Part="1" 
AR Path="/5E1FC1E7/5E0D4E59" Ref="R37"  Part="1" 
F 0 "R37" V 3093 4500 50  0000 C CNN
F 1 "200k" V 3184 4500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3230 4500 50  0001 C CNN
F 3 "~" H 3300 4500 50  0001 C CNN
	1    3300 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	3050 4500 3150 4500
Wire Wire Line
	3450 4950 3550 4950
Wire Wire Line
	3450 4500 3550 4500
Wire Wire Line
	3550 4500 3550 4950
Connection ~ 3550 4950
Wire Wire Line
	3550 4950 3650 4950
$Comp
L Device:R R?
U 1 1 5E0D4E69
P 3950 4500
AR Path="/5DD41DD6/5E0D4E69" Ref="R?"  Part="1" 
AR Path="/5E0D4E69" Ref="R?"  Part="1" 
AR Path="/5E0AD457/5E0D4E69" Ref="R28"  Part="1" 
AR Path="/5E1FC1E7/5E0D4E69" Ref="R40"  Part="1" 
F 0 "R40" V 3743 4500 50  0000 C CNN
F 1 "56k" V 3834 4500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3880 4500 50  0001 C CNN
F 3 "~" H 3950 4500 50  0001 C CNN
	1    3950 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 4500 3800 4500
Connection ~ 3550 4500
Wire Wire Line
	4100 4500 4350 4500
Wire Wire Line
	4350 4500 4350 5050
Wire Wire Line
	4350 5050 4250 5050
$Comp
L Device:C C?
U 1 1 5E0D4E78
P 3950 4100
AR Path="/5DD41DD6/5E0D4E78" Ref="C?"  Part="1" 
AR Path="/5E0D4E78" Ref="C?"  Part="1" 
AR Path="/5E0AD457/5E0D4E78" Ref="C44"  Part="1" 
AR Path="/5E1FC1E7/5E0D4E78" Ref="C50"  Part="1" 
F 0 "C50" V 3698 4100 50  0000 C CNN
F 1 "470p" V 3789 4100 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3988 3950 50  0001 C CNN
F 3 "~" H 3950 4100 50  0001 C CNN
	1    3950 4100
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 4500 3550 4100
Wire Wire Line
	3550 4100 3800 4100
Wire Wire Line
	4100 4100 4350 4100
Wire Wire Line
	4350 4100 4350 4500
Connection ~ 4350 4500
Wire Wire Line
	3550 5250 3550 5150
Wire Wire Line
	3550 5150 3650 5150
Wire Wire Line
	4350 5050 4600 5050
Connection ~ 4350 5050
Wire Wire Line
	2550 4950 3150 4950
Text HLabel 2550 4950 0    50   Input ~ 0
CV1
Text HLabel 4600 5050 2    50   Input ~ 0
CV1_ADC
$Comp
L Device:R R?
U 1 1 5E0EF104
P 7250 2750
AR Path="/5DD41DD6/5E0EF104" Ref="R?"  Part="1" 
AR Path="/5E0EF104" Ref="R?"  Part="1" 
AR Path="/5E0AD457/5E0EF104" Ref="R30"  Part="1" 
AR Path="/5E1FC1E7/5E0EF104" Ref="R42"  Part="1" 
F 0 "R42" V 7043 2750 50  0000 C CNN
F 1 "100k" V 7134 2750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7180 2750 50  0001 C CNN
F 3 "~" H 7250 2750 50  0001 C CNN
	1    7250 2750
	0    1    1    0   
$EndComp
Text GLabel 7000 2300 0    50   Input ~ 0
VRef-10
$Comp
L Device:R R?
U 1 1 5E0EF10F
P 7250 2300
AR Path="/5DD41DD6/5E0EF10F" Ref="R?"  Part="1" 
AR Path="/5E0EF10F" Ref="R?"  Part="1" 
AR Path="/5E0AD457/5E0EF10F" Ref="R29"  Part="1" 
AR Path="/5E1FC1E7/5E0EF10F" Ref="R41"  Part="1" 
F 0 "R41" V 7043 2300 50  0000 C CNN
F 1 "200k" V 7134 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7180 2300 50  0001 C CNN
F 3 "~" H 7250 2300 50  0001 C CNN
	1    7250 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	7000 2300 7100 2300
Wire Wire Line
	7400 2750 7500 2750
Wire Wire Line
	7400 2300 7500 2300
Wire Wire Line
	7500 2300 7500 2750
Connection ~ 7500 2750
Wire Wire Line
	7500 2750 7600 2750
$Comp
L Device:R R?
U 1 1 5E0EF11F
P 7900 2300
AR Path="/5DD41DD6/5E0EF11F" Ref="R?"  Part="1" 
AR Path="/5E0EF11F" Ref="R?"  Part="1" 
AR Path="/5E0AD457/5E0EF11F" Ref="R33"  Part="1" 
AR Path="/5E1FC1E7/5E0EF11F" Ref="R45"  Part="1" 
F 0 "R45" V 7693 2300 50  0000 C CNN
F 1 "56k" V 7784 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7830 2300 50  0001 C CNN
F 3 "~" H 7900 2300 50  0001 C CNN
	1    7900 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	7500 2300 7750 2300
Connection ~ 7500 2300
Wire Wire Line
	8050 2300 8300 2300
Wire Wire Line
	8300 2300 8300 2850
Wire Wire Line
	8300 2850 8200 2850
$Comp
L Device:C C?
U 1 1 5E0EF12E
P 7900 1900
AR Path="/5DD41DD6/5E0EF12E" Ref="C?"  Part="1" 
AR Path="/5E0EF12E" Ref="C?"  Part="1" 
AR Path="/5E0AD457/5E0EF12E" Ref="C45"  Part="1" 
AR Path="/5E1FC1E7/5E0EF12E" Ref="C51"  Part="1" 
F 0 "C51" V 7648 1900 50  0000 C CNN
F 1 "470p" V 7739 1900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7938 1750 50  0001 C CNN
F 3 "~" H 7900 1900 50  0001 C CNN
	1    7900 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	7500 2300 7500 1900
Wire Wire Line
	7500 1900 7750 1900
Wire Wire Line
	8050 1900 8300 1900
Wire Wire Line
	8300 1900 8300 2300
Connection ~ 8300 2300
Wire Wire Line
	7500 3050 7500 2950
Wire Wire Line
	7500 2950 7600 2950
Wire Wire Line
	8300 2850 8550 2850
Connection ~ 8300 2850
Wire Wire Line
	6500 2750 7100 2750
Text HLabel 8550 2850 2    50   Input ~ 0
CV2_ADC
$Comp
L Device:R R?
U 1 1 5E0F7214
P 7250 5000
AR Path="/5DD41DD6/5E0F7214" Ref="R?"  Part="1" 
AR Path="/5E0F7214" Ref="R?"  Part="1" 
AR Path="/5E0AD457/5E0F7214" Ref="R32"  Part="1" 
AR Path="/5E1FC1E7/5E0F7214" Ref="R44"  Part="1" 
F 0 "R44" V 7043 5000 50  0000 C CNN
F 1 "100k" V 7134 5000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7180 5000 50  0001 C CNN
F 3 "~" H 7250 5000 50  0001 C CNN
	1    7250 5000
	0    1    1    0   
$EndComp
Text GLabel 7000 4550 0    50   Input ~ 0
VRef-10
$Comp
L Device:R R?
U 1 1 5E0F721F
P 7250 4550
AR Path="/5DD41DD6/5E0F721F" Ref="R?"  Part="1" 
AR Path="/5E0F721F" Ref="R?"  Part="1" 
AR Path="/5E0AD457/5E0F721F" Ref="R31"  Part="1" 
AR Path="/5E1FC1E7/5E0F721F" Ref="R43"  Part="1" 
F 0 "R43" V 7043 4550 50  0000 C CNN
F 1 "200k" V 7134 4550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7180 4550 50  0001 C CNN
F 3 "~" H 7250 4550 50  0001 C CNN
	1    7250 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	7000 4550 7100 4550
Wire Wire Line
	7400 5000 7500 5000
Wire Wire Line
	7400 4550 7500 4550
Wire Wire Line
	7500 4550 7500 5000
Connection ~ 7500 5000
Wire Wire Line
	7500 5000 7600 5000
$Comp
L Device:R R?
U 1 1 5E0F722F
P 7900 4550
AR Path="/5DD41DD6/5E0F722F" Ref="R?"  Part="1" 
AR Path="/5E0F722F" Ref="R?"  Part="1" 
AR Path="/5E0AD457/5E0F722F" Ref="R34"  Part="1" 
AR Path="/5E1FC1E7/5E0F722F" Ref="R46"  Part="1" 
F 0 "R46" V 7693 4550 50  0000 C CNN
F 1 "56k" V 7784 4550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7830 4550 50  0001 C CNN
F 3 "~" H 7900 4550 50  0001 C CNN
	1    7900 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	7500 4550 7750 4550
Connection ~ 7500 4550
Wire Wire Line
	8050 4550 8300 4550
Wire Wire Line
	8300 4550 8300 5100
Wire Wire Line
	8300 5100 8200 5100
$Comp
L Device:C C?
U 1 1 5E0F723E
P 7900 4150
AR Path="/5DD41DD6/5E0F723E" Ref="C?"  Part="1" 
AR Path="/5E0F723E" Ref="C?"  Part="1" 
AR Path="/5E0AD457/5E0F723E" Ref="C46"  Part="1" 
AR Path="/5E1FC1E7/5E0F723E" Ref="C52"  Part="1" 
F 0 "C52" V 7648 4150 50  0000 C CNN
F 1 "470p" V 7739 4150 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7938 4000 50  0001 C CNN
F 3 "~" H 7900 4150 50  0001 C CNN
	1    7900 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	7500 4550 7500 4150
Wire Wire Line
	7500 4150 7750 4150
Wire Wire Line
	8050 4150 8300 4150
Wire Wire Line
	8300 4150 8300 4550
Connection ~ 8300 4550
Wire Wire Line
	7500 5300 7500 5200
Wire Wire Line
	7500 5200 7600 5200
Wire Wire Line
	8300 5100 8550 5100
Connection ~ 8300 5100
Wire Wire Line
	6500 5000 7100 5000
Text HLabel 6500 5000 0    50   Input ~ 0
CV3
Text HLabel 8550 5100 2    50   Input ~ 0
CV3_ADC
Text HLabel 6500 2750 0    50   Input ~ 0
CV2
$Comp
L power:GNDA #PWR081
U 1 1 5E36E0A6
P 3550 3050
AR Path="/5E0AD457/5E36E0A6" Ref="#PWR081"  Part="1" 
AR Path="/5E1FC1E7/5E36E0A6" Ref="#PWR088"  Part="1" 
F 0 "#PWR088" H 3550 2800 50  0001 C CNN
F 1 "GNDA" H 3555 2877 50  0000 C CNN
F 2 "" H 3550 3050 50  0001 C CNN
F 3 "" H 3550 3050 50  0001 C CNN
	1    3550 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR083
U 1 1 5E36E74B
P 7500 3050
AR Path="/5E0AD457/5E36E74B" Ref="#PWR083"  Part="1" 
AR Path="/5E1FC1E7/5E36E74B" Ref="#PWR090"  Part="1" 
F 0 "#PWR090" H 7500 2800 50  0001 C CNN
F 1 "GNDA" H 7505 2877 50  0000 C CNN
F 2 "" H 7500 3050 50  0001 C CNN
F 3 "" H 7500 3050 50  0001 C CNN
	1    7500 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR084
U 1 1 5E36ECC2
P 7500 5300
AR Path="/5E0AD457/5E36ECC2" Ref="#PWR084"  Part="1" 
AR Path="/5E1FC1E7/5E36ECC2" Ref="#PWR091"  Part="1" 
F 0 "#PWR091" H 7500 5050 50  0001 C CNN
F 1 "GNDA" H 7505 5127 50  0000 C CNN
F 2 "" H 7500 5300 50  0001 C CNN
F 3 "" H 7500 5300 50  0001 C CNN
	1    7500 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR082
U 1 1 5E36F0D1
P 3550 5250
AR Path="/5E0AD457/5E36F0D1" Ref="#PWR082"  Part="1" 
AR Path="/5E1FC1E7/5E36F0D1" Ref="#PWR089"  Part="1" 
F 0 "#PWR089" H 3550 5000 50  0001 C CNN
F 1 "GNDA" H 3555 5077 50  0000 C CNN
F 2 "" H 3550 5250 50  0001 C CNN
F 3 "" H 3550 5250 50  0001 C CNN
	1    3550 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR080
U 1 1 5E36F6CA
P 2350 6950
AR Path="/5E0AD457/5E36F6CA" Ref="#PWR080"  Part="1" 
AR Path="/5E1FC1E7/5E36F6CA" Ref="#PWR087"  Part="1" 
F 0 "#PWR087" H 2350 6700 50  0001 C CNN
F 1 "GNDA" H 2355 6777 50  0000 C CNN
F 2 "" H 2350 6950 50  0001 C CNN
F 3 "" H 2350 6950 50  0001 C CNN
	1    2350 6950
	1    0    0    -1  
$EndComp
$EndSCHEMATC
