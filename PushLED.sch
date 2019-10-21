EESchema Schematic File Version 4
LIBS:Waves-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 10
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
L power:GND #PWR?
U 1 1 5DA98203
P 6250 4250
AR Path="/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DA90748/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DAF110B/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DB16B82/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DB16B86/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DB3CAB0/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DB3CAB4/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DB3CAB8/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DB3CABC/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DB87BB5/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DB87BB9/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DB87BBD/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DA90748/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DAF110B/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB16B82/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB16B86/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB3CAB0/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB3CAB4/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB3CAB8/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB3CABC/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB87BB5/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB87BB9/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB87BBD/5DA98203" Ref="#PWR?"  Part="1" 
AR Path="/5DE2B991/5DA98203" Ref="#PWR071"  Part="1" 
AR Path="/5E016F8F/5DA98203" Ref="#PWR075"  Part="1" 
AR Path="/5E023019/5DA98203" Ref="#PWR077"  Part="1" 
F 0 "#PWR077" H 6250 4000 50  0001 C CNN
F 1 "GND" H 6255 4077 50  0000 C CNN
F 2 "" H 6250 4250 50  0001 C CNN
F 3 "" H 6250 4250 50  0001 C CNN
	1    6250 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 4250 6250 3750
Wire Wire Line
	6250 3750 6050 3750
Wire Wire Line
	6050 3750 6050 3900
Wire Wire Line
	6050 3900 5950 3900
Connection ~ 6050 3750
Wire Wire Line
	6050 3750 5950 3750
$Comp
L Device:R R?
U 1 1 5DA98210
P 5100 3900
AR Path="/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DA90748/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DAF110B/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DB16B82/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DB16B86/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DB3CAB0/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DB3CAB4/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DB3CAB8/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DB3CABC/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DB87BB5/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DB87BB9/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DB87BBD/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DD41DD6/5DA90748/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DD41DD6/5DAF110B/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DD41DD6/5DB16B82/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DD41DD6/5DB16B86/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DD41DD6/5DB3CAB0/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DD41DD6/5DB3CAB4/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DD41DD6/5DB3CAB8/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DD41DD6/5DB3CABC/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DD41DD6/5DB87BB5/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DD41DD6/5DB87BB9/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DD41DD6/5DB87BBD/5DA98210" Ref="R?"  Part="1" 
AR Path="/5DE2B991/5DA98210" Ref="R18"  Part="1" 
AR Path="/5E016F8F/5DA98210" Ref="R21"  Part="1" 
AR Path="/5E023019/5DA98210" Ref="R22"  Part="1" 
F 0 "R18" V 4893 3900 50  0000 C CNN
F 1 "47" V 4984 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5030 3900 50  0001 C CNN
F 3 "~" H 5100 3900 50  0001 C CNN
	1    5100 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 3900 5350 3900
$Comp
L Local:SW_Push_LED SW?
U 1 1 5DA98217
P 5650 3750
AR Path="/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DA90748/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DAF110B/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DB16B82/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DB16B86/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DB3CAB0/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DB3CAB4/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DB3CAB8/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DB3CABC/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DB87BB5/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DB87BB9/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DB87BBD/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DD41DD6/5DA90748/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DD41DD6/5DAF110B/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DD41DD6/5DB16B82/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DD41DD6/5DB16B86/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DD41DD6/5DB3CAB0/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DD41DD6/5DB3CAB4/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DD41DD6/5DB3CAB8/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DD41DD6/5DB3CABC/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DD41DD6/5DB87BB5/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DD41DD6/5DB87BB9/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DD41DD6/5DB87BBD/5DA98217" Ref="SW?"  Part="1" 
AR Path="/5DE2B991/5DA98217" Ref="SW3"  Part="1" 
AR Path="/5E016F8F/5DA98217" Ref="SW4"  Part="1" 
AR Path="/5E023019/5DA98217" Ref="SW5"  Part="1" 
F 0 "SW3" H 5650 4065 50  0000 C CNN
F 1 "SW_Push_LED" H 5650 3974 50  0000 C CNN
F 2 "Local:SW_PUSH_LED_6mm" H 5650 3950 50  0001 C CNN
F 3 "~" H 5650 3950 50  0001 C CNN
	1    5650 3750
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC847 Q?
U 1 1 5DA9821D
P 4400 3300
AR Path="/5C756F9B/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5C763CB7/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5C7644B3/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5C7644B9/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5C188821/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5C192077/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5C19208D/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5C24C2D4/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5D78C3C7/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5D7C6377/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DA90748/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DAF110B/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DB16B82/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DB16B86/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DB3CAB0/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DB3CAB4/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DB3CAB8/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DB3CABC/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DB87BB5/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DB87BB9/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DB87BBD/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DD41DD6/5DA90748/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DD41DD6/5DAF110B/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DD41DD6/5DB16B82/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DD41DD6/5DB16B86/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DD41DD6/5DB3CAB0/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DD41DD6/5DB3CAB4/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DD41DD6/5DB3CAB8/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DD41DD6/5DB3CABC/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DD41DD6/5DB87BB5/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DD41DD6/5DB87BB9/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DD41DD6/5DB87BBD/5DA9821D" Ref="Q?"  Part="1" 
AR Path="/5DE2B991/5DA9821D" Ref="Q2"  Part="1" 
AR Path="/5E016F8F/5DA9821D" Ref="Q4"  Part="1" 
AR Path="/5E023019/5DA9821D" Ref="Q5"  Part="1" 
F 0 "Q2" H 4591 3346 50  0000 L CNN
F 1 "BC847" H 4591 3255 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4600 3225 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 4400 3300 50  0001 L CNN
	1    4400 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3500 4500 3900
Wire Wire Line
	4500 3900 4950 3900
Text HLabel 3900 3300 0    50   Input ~ 0
LED
Wire Wire Line
	3900 3300 4200 3300
Text HLabel 3900 3750 0    50   Input ~ 0
SW
Wire Wire Line
	3900 3750 5350 3750
$Comp
L power:+12V #PWR?
U 1 1 5DA99988
P 4500 2850
AR Path="/5DA90748/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DAF110B/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DB16B82/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DB16B86/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DB3CAB0/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DB3CAB4/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DB3CAB8/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DB3CABC/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DB87BB5/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DB87BB9/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DB87BBD/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DA90748/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DAF110B/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB16B82/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB16B86/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB3CAB0/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB3CAB4/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB3CAB8/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB3CABC/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB87BB5/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB87BB9/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DD41DD6/5DB87BBD/5DA99988" Ref="#PWR?"  Part="1" 
AR Path="/5DE2B991/5DA99988" Ref="#PWR070"  Part="1" 
AR Path="/5E016F8F/5DA99988" Ref="#PWR074"  Part="1" 
AR Path="/5E023019/5DA99988" Ref="#PWR076"  Part="1" 
F 0 "#PWR076" H 4500 2700 50  0001 C CNN
F 1 "+12V" H 4515 3023 50  0000 C CNN
F 2 "" H 4500 2850 50  0001 C CNN
F 3 "" H 4500 2850 50  0001 C CNN
	1    4500 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2850 4500 3100
$EndSCHEMATC
