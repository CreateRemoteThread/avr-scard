EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L MCU_Microchip_ATmega:ATmega328P-AU U1
U 1 1 6100FA40
P 3650 3300
F 0 "U1" H 3650 1711 50  0000 C CNN
F 1 "ATmega328P-AU" H 3650 1620 50  0000 C CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 3650 3300 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 3650 3300 50  0001 C CNN
	1    3650 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 6101091C
P 5150 2900
F 0 "Y1" H 5150 3168 50  0000 C CNN
F 1 "Crystal" H 5150 3077 50  0000 C CNN
F 2 "Crystal:Crystal_HC49-4H_Vertical" H 5150 2900 50  0001 C CNN
F 3 "~" H 5150 2900 50  0001 C CNN
	1    5150 2900
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 61010F0D
P 4900 3750
F 0 "R1" H 4830 3704 50  0000 R CNN
F 1 "R" H 4830 3795 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 4830 3750 50  0001 C CNN
F 3 "~" H 4900 3750 50  0001 C CNN
	1    4900 3750
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 6101254F
P 5100 3600
F 0 "SW1" H 5100 3415 50  0000 C CNN
F 1 "SW_Push" H 5100 3506 50  0000 C CNN
F 2 "avr_demo:SW_6x6" H 5100 3800 50  0001 C CNN
F 3 "~" H 5100 3800 50  0001 C CNN
	1    5100 3600
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR0101
U 1 1 61014D36
P 3650 1300
F 0 "#PWR0101" H 3650 1150 50  0001 C CNN
F 1 "VCC" H 3665 1473 50  0000 C CNN
F 2 "" H 3650 1300 50  0001 C CNN
F 3 "" H 3650 1300 50  0001 C CNN
	1    3650 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 610153DA
P 3650 5350
F 0 "#PWR0102" H 3650 5100 50  0001 C CNN
F 1 "GND" H 3655 5177 50  0000 C CNN
F 2 "" H 3650 5350 50  0001 C CNN
F 3 "" H 3650 5350 50  0001 C CNN
	1    3650 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1300 3650 1650
Wire Wire Line
	3750 1800 3750 1650
Wire Wire Line
	3750 1650 3650 1650
Connection ~ 3650 1650
Wire Wire Line
	3650 1650 3650 1800
Wire Wire Line
	3650 5350 3650 4800
Wire Wire Line
	4250 3600 4500 3600
$Comp
L power:GND #PWR0103
U 1 1 6101983E
P 5400 3600
F 0 "#PWR0103" H 5400 3350 50  0001 C CNN
F 1 "GND" H 5405 3427 50  0000 C CNN
F 2 "" H 5400 3600 50  0001 C CNN
F 3 "" H 5400 3600 50  0001 C CNN
	1    5400 3600
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 61019B30
P 4900 4000
F 0 "#PWR0104" H 4900 3850 50  0001 C CNN
F 1 "VCC" H 4915 4173 50  0000 C CNN
F 2 "" H 4900 4000 50  0001 C CNN
F 3 "" H 4900 4000 50  0001 C CNN
	1    4900 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 3900 4900 4000
Wire Wire Line
	5300 3600 5400 3600
Text GLabel 4650 3300 2    50   Input ~ 0
ISP_RST
Wire Wire Line
	4650 3300 4500 3300
Wire Wire Line
	4500 3300 4500 3600
Text GLabel 5600 3500 2    50   Input ~ 0
SC_TRIG
Wire Wire Line
	5600 3500 4250 3500
Wire Wire Line
	5150 2700 5150 2750
Wire Wire Line
	4250 2800 5000 2800
Wire Wire Line
	5000 2800 5000 3050
Wire Wire Line
	5000 3050 5150 3050
Text GLabel 4400 2100 2    50   Input ~ 0
SC_DATA
Text GLabel 4400 2200 2    50   Input ~ 0
SC_CLK
Text GLabel 4400 2300 2    50   Input ~ 0
SC_RST
Wire Wire Line
	4250 2700 5150 2700
Wire Wire Line
	4250 2100 4400 2100
Wire Wire Line
	4250 2200 4400 2200
Wire Wire Line
	4250 2300 4400 2300
$Comp
L Connector_Generic:Conn_01x03 CONN_TOP1
U 1 1 6104E299
P 9200 4700
F 0 "CONN_TOP1" H 9280 4742 50  0000 L CNN
F 1 "Conn_01x03" H 9280 4651 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9200 4700 50  0001 C CNN
F 3 "~" H 9200 4700 50  0001 C CNN
	1    9200 4700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 CONN_BOT1
U 1 1 6104F427
P 9200 5500
F 0 "CONN_BOT1" H 9280 5542 50  0000 L CNN
F 1 "Conn_01x03" H 9280 5451 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9200 5500 50  0001 C CNN
F 3 "~" H 9200 5500 50  0001 C CNN
	1    9200 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 6104F815
P 8100 5400
F 0 "#PWR0107" H 8100 5150 50  0001 C CNN
F 1 "GND" H 8105 5227 50  0000 C CNN
F 2 "" H 8100 5400 50  0001 C CNN
F 3 "" H 8100 5400 50  0001 C CNN
	1    8100 5400
	-1   0    0    1   
$EndComp
$Comp
L Device:R R_SHUNT_GND1
U 1 1 6104FBE6
P 8550 5400
F 0 "R_SHUNT_GND1" V 8757 5400 50  0000 C CNN
F 1 "R" V 8666 5400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 8480 5400 50  0001 C CNN
F 3 "~" H 8550 5400 50  0001 C CNN
	1    8550 5400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8700 5400 9000 5400
Wire Wire Line
	8400 5400 8100 5400
Text GLabel 8500 5600 0    50   Input ~ 0
SC_DATA
Wire Wire Line
	8500 5600 9000 5600
$Comp
L Device:R R_SHUNT_VCC1
U 1 1 61052152
P 8550 4600
F 0 "R_SHUNT_VCC1" V 8757 4600 50  0000 C CNN
F 1 "R" V 8666 4600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 8480 4600 50  0001 C CNN
F 3 "~" H 8550 4600 50  0001 C CNN
	1    8550 4600
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR0108
U 1 1 6105251E
P 8200 4600
F 0 "#PWR0108" H 8200 4450 50  0001 C CNN
F 1 "VCC" H 8215 4773 50  0000 C CNN
F 2 "" H 8200 4600 50  0001 C CNN
F 3 "" H 8200 4600 50  0001 C CNN
	1    8200 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 4600 8400 4600
Wire Wire Line
	8700 4600 9000 4600
Text GLabel 8850 4700 0    50   Input ~ 0
SC_RST
Text GLabel 8850 4800 0    50   Input ~ 0
SC_CLK
Wire Wire Line
	8850 4800 9000 4800
Wire Wire Line
	9000 4700 8850 4700
Text GLabel 4400 3800 2    50   Input ~ 0
USART_RX
Text GLabel 4400 3900 2    50   Input ~ 0
USART_TX
Wire Wire Line
	4400 3800 4250 3800
Wire Wire Line
	4400 3900 4250 3900
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 610566EC
P 5700 900
F 0 "J2" H 5780 892 50  0000 L CNN
F 1 "Conn_01x04" H 5780 801 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 5700 900 50  0001 C CNN
F 3 "~" H 5700 900 50  0001 C CNN
	1    5700 900 
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0109
U 1 1 6105727E
P 5100 800
F 0 "#PWR0109" H 5100 650 50  0001 C CNN
F 1 "VCC" H 5115 973 50  0000 C CNN
F 2 "" H 5100 800 50  0001 C CNN
F 3 "" H 5100 800 50  0001 C CNN
	1    5100 800 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 610574F1
P 5100 1100
F 0 "#PWR0110" H 5100 850 50  0001 C CNN
F 1 "GND" H 5105 927 50  0000 C CNN
F 2 "" H 5100 1100 50  0001 C CNN
F 3 "" H 5100 1100 50  0001 C CNN
	1    5100 1100
	1    0    0    -1  
$EndComp
Text GLabel 5100 1000 0    50   Input ~ 0
USART_RX
Text GLabel 5100 900  0    50   Input ~ 0
USART_TX
Wire Wire Line
	5100 900  5500 900 
Wire Wire Line
	5100 1000 5500 1000
Wire Wire Line
	5500 800  5100 800 
Wire Wire Line
	5500 1100 5100 1100
Text GLabel 4900 2500 2    50   Input ~ 0
ISP_MISO
Text GLabel 4900 2400 2    50   Input ~ 0
ISP_MOSI
Text GLabel 4900 2600 2    50   Input ~ 0
ISP_SCK
Wire Wire Line
	4250 2400 4900 2400
Wire Wire Line
	4900 2500 4250 2500
Wire Wire Line
	4250 2600 4900 2600
$Comp
L Device:LED D1
U 1 1 61067996
P 5000 4800
F 0 "D1" H 4993 4545 50  0000 C CNN
F 1 "LED" H 4993 4636 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 5000 4800 50  0001 C CNN
F 3 "~" H 5000 4800 50  0001 C CNN
	1    5000 4800
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 6106821A
P 5500 4800
F 0 "R2" V 5293 4800 50  0000 C CNN
F 1 "R" V 5384 4800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5430 4800 50  0001 C CNN
F 3 "~" H 5500 4800 50  0001 C CNN
	1    5500 4800
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0111
U 1 1 6106861D
P 4550 4800
F 0 "#PWR0111" H 4550 4650 50  0001 C CNN
F 1 "VCC" H 4565 4973 50  0000 C CNN
F 2 "" H 4550 4800 50  0001 C CNN
F 3 "" H 4550 4800 50  0001 C CNN
	1    4550 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 61068C56
P 5650 4800
F 0 "#PWR0112" H 5650 4550 50  0001 C CNN
F 1 "GND" H 5655 4627 50  0000 C CNN
F 2 "" H 5650 4800 50  0001 C CNN
F 3 "" H 5650 4800 50  0001 C CNN
	1    5650 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4800 5150 4800
Wire Wire Line
	4900 3600 4500 3600
Connection ~ 4900 3600
Connection ~ 4500 3600
Wire Wire Line
	4550 4800 4850 4800
Text GLabel 6900 1400 2    50   Input ~ 0
SC_TRIG
Wire Wire Line
	6900 1400 6550 1400
$Comp
L Device:C C_BIG1
U 1 1 61062DA7
P 8800 1800
F 0 "C_BIG1" H 8915 1846 50  0000 L CNN
F 1 "C" H 8915 1755 50  0000 L CNN
F 2 "avr_demo:SW_6x6" H 8838 1650 50  0001 C CNN
F 3 "~" H 8800 1800 50  0001 C CNN
	1    8800 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C_LITTLE1
U 1 1 610633B4
P 9200 1800
F 0 "C_LITTLE1" H 9315 1846 50  0000 L CNN
F 1 "C" H 9315 1755 50  0000 L CNN
F 2 "avr_demo:SW_6x6" H 9238 1650 50  0001 C CNN
F 3 "~" H 9200 1800 50  0001 C CNN
	1    9200 1800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0113
U 1 1 61063D3C
P 8550 1650
F 0 "#PWR0113" H 8550 1500 50  0001 C CNN
F 1 "VCC" H 8565 1823 50  0000 C CNN
F 2 "" H 8550 1650 50  0001 C CNN
F 3 "" H 8550 1650 50  0001 C CNN
	1    8550 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 610645C8
P 8550 1950
F 0 "#PWR0114" H 8550 1700 50  0001 C CNN
F 1 "GND" H 8555 1777 50  0000 C CNN
F 2 "" H 8550 1950 50  0001 C CNN
F 3 "" H 8550 1950 50  0001 C CNN
	1    8550 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 1950 8800 1950
Wire Wire Line
	8800 1950 9200 1950
Connection ~ 8800 1950
Wire Wire Line
	9200 1650 8800 1650
Wire Wire Line
	8800 1650 8550 1650
Connection ~ 8800 1650
$Comp
L Connector:Conn_01x01_Male J3
U 1 1 6108EC2D
P 6350 1400
F 0 "J3" H 6458 1581 50  0000 C CNN
F 1 "Conn_01x01_Male" H 6458 1490 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 6350 1400 50  0001 C CNN
F 3 "~" H 6350 1400 50  0001 C CNN
	1    6350 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 2700 8600 2850
Wire Wire Line
	8600 3850 8600 3750
$Comp
L power:GND #PWR0106
U 1 1 6101B9DE
P 8600 3850
F 0 "#PWR0106" H 8600 3600 50  0001 C CNN
F 1 "GND" H 8605 3677 50  0000 C CNN
F 2 "" H 8600 3850 50  0001 C CNN
F 3 "" H 8600 3850 50  0001 C CNN
	1    8600 3850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0105
U 1 1 6101B6B3
P 8600 2700
F 0 "#PWR0105" H 8600 2550 50  0001 C CNN
F 1 "VCC" H 8615 2873 50  0000 C CNN
F 2 "" H 8600 2700 50  0001 C CNN
F 3 "" H 8600 2700 50  0001 C CNN
	1    8600 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 3150 9400 3150
Wire Wire Line
	9100 3250 9400 3250
Wire Wire Line
	9100 3350 9400 3350
Wire Wire Line
	9100 3450 9400 3450
Text GLabel 9400 3450 2    50   Input ~ 0
ISP_RST
Text GLabel 9400 3350 2    50   Input ~ 0
ISP_SCK
Text GLabel 9400 3250 2    50   Input ~ 0
ISP_MOSI
Text GLabel 9400 3150 2    50   Input ~ 0
ISP_MISO
$Comp
L Connector:AVR-ISP-6 J1
U 1 1 6101325F
P 8700 3350
F 0 "J1" H 8371 3446 50  0000 R CNN
F 1 "AVR-ISP-6" H 8371 3355 50  0000 R CNN
F 2 "avr_demo:AVRISP_2x3" V 8450 3400 50  0001 C CNN
F 3 " ~" H 7425 2800 50  0001 C CNN
	1    8700 3350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J4
U 1 1 61072F42
P 6350 1750
F 0 "J4" H 6458 1931 50  0000 C CNN
F 1 "Conn_01x01_Male" H 6458 1840 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 6350 1750 50  0001 C CNN
F 3 "~" H 6350 1750 50  0001 C CNN
	1    6350 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 610737B7
P 6550 1750
F 0 "#PWR0115" H 6550 1500 50  0001 C CNN
F 1 "GND" H 6555 1577 50  0000 C CNN
F 2 "" H 6550 1750 50  0001 C CNN
F 3 "" H 6550 1750 50  0001 C CNN
	1    6550 1750
	1    0    0    -1  
$EndComp
$EndSCHEMATC
