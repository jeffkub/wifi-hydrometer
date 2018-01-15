EESchema Schematic File Version 2
LIBS:main_board-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ESP8266
LIBS:wifi_hydrometer
LIBS:74xgxx
LIBS:ac-dc
LIBS:actel
LIBS:allegro
LIBS:Altera
LIBS:analog_devices
LIBS:battery_management
LIBS:bbd
LIBS:brooktre
LIBS:cmos_ieee
LIBS:dc-dc
LIBS:diode
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:ftdi
LIBS:gennum
LIBS:graphic
LIBS:hc11
LIBS:ir
LIBS:Lattice
LIBS:logo
LIBS:maxim
LIBS:mechanical
LIBS:microchip_dspic33dsc
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic32mcu
LIBS:motor_drivers
LIBS:motors
LIBS:msp430
LIBS:nordicsemi
LIBS:nxp_armmcu
LIBS:onsemi
LIBS:Oscillators
LIBS:Power_Management
LIBS:powerint
LIBS:pspice
LIBS:references
LIBS:relays
LIBS:rfcom
LIBS:sensors
LIBS:silabs
LIBS:stm8
LIBS:stm32
LIBS:supertex
LIBS:switches
LIBS:transf
LIBS:ttl_ieee
LIBS:video
LIBS:wiznet
LIBS:Worldsemi
LIBS:Xicor
LIBS:zetex
LIBS:Zilog
LIBS:main_board-cache
EELAYER 25 0
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
L GND #PWR01
U 1 1 58B8CB9B
P 6850 3500
F 0 "#PWR01" H 6850 3250 50  0001 C CNN
F 1 "GND" H 6850 3350 50  0000 C CNN
F 2 "" H 6850 3500 50  0000 C CNN
F 3 "" H 6850 3500 50  0000 C CNN
	1    6850 3500
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR02
U 1 1 58B8D0F3
P 6850 1200
F 0 "#PWR02" H 6850 1050 50  0001 C CNN
F 1 "+3.3V" H 6850 1340 50  0000 C CNN
F 2 "" H 6850 1200 50  0000 C CNN
F 3 "" H 6850 1200 50  0000 C CNN
	1    6850 1200
	1    0    0    -1  
$EndComp
$Comp
L MCP73831/2 U1
U 1 1 58B90C7F
P 2450 2400
F 0 "U1" H 2200 2750 60  0000 C CNN
F 1 "MCP73831/2" H 2450 2050 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 2450 2400 60  0001 C CNN
F 3 "" H 2450 2400 60  0001 C CNN
F 4 "DigiKey" H 2450 2400 60  0001 C CNN "Source"
F 5 "MCP73831T-2ACI/OTCT-ND" H 2450 2400 60  0001 C CNN "Part"
	1    2450 2400
	1    0    0    -1  
$EndComp
$Comp
L LED D3
U 1 1 58B90F6F
P 1750 6800
F 0 "D3" H 1750 6900 50  0000 C CNN
F 1 "RED" H 1750 6700 50  0000 C CNN
F 2 "LEDs:LED_0603" H 1750 6800 50  0001 C CNN
F 3 "" H 1750 6800 50  0000 C CNN
F 4 "DigiKey" H 1750 6800 60  0001 C CNN "Source"
F 5 "160-1447-1-ND" H 1750 6800 60  0001 C CNN "Part"
	1    1750 6800
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 58B910C6
P 1750 6400
F 0 "R3" V 1830 6400 50  0000 C CNN
F 1 "1k" V 1750 6400 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 1680 6400 50  0001 C CNN
F 3 "" H 1750 6400 50  0000 C CNN
F 4 "DigiKey" H 1750 6400 60  0001 C CNN "Source"
F 5 "311-1.00KHRCT-ND" H 1750 6400 60  0001 C CNN "Part"
	1    1750 6400
	-1   0    0    1   
$EndComp
$Comp
L LED D1
U 1 1 58B91303
P 1300 2600
F 0 "D1" H 1300 2700 50  0000 C CNN
F 1 "ORG" H 1300 2500 50  0000 C CNN
F 2 "LEDs:LED_0603" H 1300 2600 50  0001 C CNN
F 3 "" H 1300 2600 50  0000 C CNN
F 4 "DigiKey" H 1300 2600 60  0001 C CNN "Source"
F 5 "160-1434-1-ND" H 1300 2600 60  0001 C CNN "Part"
	1    1300 2600
	-1   0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 58B9146E
P 1700 2600
F 0 "R2" V 1780 2600 50  0000 C CNN
F 1 "1k" V 1700 2600 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 1630 2600 50  0001 C CNN
F 3 "" H 1700 2600 50  0000 C CNN
F 4 "DigiKey" H 1700 2600 60  0001 C CNN "Source"
F 5 "311-1.00KHRCT-ND" H 1700 2600 60  0001 C CNN "Part"
	1    1700 2600
	0    1    -1   0   
$EndComp
$Comp
L +5V #PWR03
U 1 1 58B9205A
P 1050 2100
F 0 "#PWR03" H 1050 1950 50  0001 C CNN
F 1 "+5V" H 1050 2240 50  0000 C CNN
F 2 "" H 1050 2100 50  0000 C CNN
F 3 "" H 1050 2100 50  0000 C CNN
	1    1050 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 58B9248D
P 3450 2700
F 0 "#PWR04" H 3450 2450 50  0001 C CNN
F 1 "GND" H 3450 2550 50  0000 C CNN
F 2 "" H 3450 2700 50  0000 C CNN
F 3 "" H 3450 2700 50  0000 C CNN
	1    3450 2700
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 58B92660
P 3200 2400
F 0 "R8" V 3280 2400 50  0000 C CNN
F 1 "10k" V 3200 2400 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 3130 2400 50  0001 C CNN
F 3 "" H 3200 2400 50  0000 C CNN
F 4 "DigiKey" H 3200 2400 60  0001 C CNN "Source"
F 5 "311-10.0KHRCT-ND" H 3200 2400 60  0001 C CNN "Part"
	1    3200 2400
	0    1    -1   0   
$EndComp
$Comp
L C C2
U 1 1 58B92ABD
P 3750 2450
F 0 "C2" H 3775 2550 50  0000 L CNN
F 1 "10u" H 3775 2350 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 3788 2300 50  0001 C CNN
F 3 "" H 3750 2450 50  0000 C CNN
F 4 "DigiKey" H 3750 2450 60  0001 C CNN "Source"
F 5 "311-1460-1-ND" H 3750 2450 60  0001 C CNN "Part"
	1    3750 2450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 58B92D2D
P 3750 2700
F 0 "#PWR05" H 3750 2450 50  0001 C CNN
F 1 "GND" H 3750 2550 50  0000 C CNN
F 2 "" H 3750 2700 50  0000 C CNN
F 3 "" H 3750 2700 50  0000 C CNN
	1    3750 2700
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR06
U 1 1 58B92FFF
P 3750 2100
F 0 "#PWR06" H 3750 1950 50  0001 C CNN
F 1 "+BATT" H 3750 2240 50  0000 C CNN
F 2 "" H 3750 2100 50  0000 C CNN
F 3 "" H 3750 2100 50  0000 C CNN
	1    3750 2100
	1    0    0    -1  
$EndComp
Text Label 6300 1500 0    60   ~ 0
RESET
$Comp
L R R11
U 1 1 58B9AE80
P 5950 1250
F 0 "R11" V 5850 1250 50  0000 C CNN
F 1 "10k" V 5950 1250 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 5880 1250 50  0001 C CNN
F 3 "" H 5950 1250 50  0000 C CNN
F 4 "DigiKey" H 5950 1250 60  0001 C CNN "Source"
F 5 "311-10.0KHRCT-ND" H 5950 1250 60  0001 C CNN "Part"
	1    5950 1250
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR07
U 1 1 58B9B31F
P 5950 1000
F 0 "#PWR07" H 5950 850 50  0001 C CNN
F 1 "+3.3V" H 5950 1140 50  0000 C CNN
F 2 "" H 5950 1000 50  0000 C CNN
F 3 "" H 5950 1000 50  0000 C CNN
	1    5950 1000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 58B97C34
P 2550 4500
F 0 "#PWR08" H 2550 4250 50  0001 C CNN
F 1 "GND" H 2550 4350 50  0000 C CNN
F 2 "" H 2550 4500 50  0000 C CNN
F 3 "" H 2550 4500 50  0000 C CNN
	1    2550 4500
	1    0    0    -1  
$EndComp
$Comp
L D_Schottky D2
U 1 1 58B97E5C
P 1300 4000
F 0 "D2" H 1300 4100 50  0000 C CNN
F 1 "MBR120" H 1300 3900 50  0000 C CNN
F 2 "footprint:SOD-123FL" H 1300 4000 50  0001 C CNN
F 3 "" H 1300 4000 50  0000 C CNN
F 4 "DigiKey" H 1300 4000 60  0001 C CNN "Source"
F 5 "MBR120VLSFT3GOSCT-ND" H 1300 4000 60  0001 C CNN "Part"
	1    1300 4000
	-1   0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 58B97F3E
P 1650 4250
F 0 "C1" H 1675 4350 50  0000 L CNN
F 1 "10u" H 1675 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1688 4100 50  0001 C CNN
F 3 "" H 1650 4250 50  0000 C CNN
F 4 "DigiKey" H 1650 4250 60  0001 C CNN "Source"
F 5 "311-1460-1-ND" H 1650 4250 60  0001 C CNN "Part"
	1    1650 4250
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 58B97FCA
P 4150 4250
F 0 "C4" H 4175 4350 50  0000 L CNN
F 1 "10u" H 4175 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 4188 4100 50  0001 C CNN
F 3 "" H 4150 4250 50  0000 C CNN
F 4 "DigiKey" H 4150 4250 60  0001 C CNN "Source"
F 5 "311-1460-1-ND" H 4150 4250 60  0001 C CNN "Part"
	1    4150 4250
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 58B98035
P 4450 4250
F 0 "C5" H 4475 4350 50  0000 L CNN
F 1 "1u" H 4475 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4488 4100 50  0001 C CNN
F 3 "" H 4450 4250 50  0000 C CNN
F 4 "DigiKey" H 4450 4250 60  0001 C CNN "Source"
F 5 "311-1444-1-ND" H 4450 4250 60  0001 C CNN "Part"
	1    4450 4250
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR09
U 1 1 58B982C0
P 1650 3450
F 0 "#PWR09" H 1650 3300 50  0001 C CNN
F 1 "+BATT" H 1650 3590 50  0000 C CNN
F 2 "" H 1650 3450 50  0000 C CNN
F 3 "" H 1650 3450 50  0000 C CNN
	1    1650 3450
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR010
U 1 1 58B9831F
P 1050 3450
F 0 "#PWR010" H 1050 3300 50  0001 C CNN
F 1 "+5V" H 1050 3590 50  0000 C CNN
F 2 "" H 1050 3450 50  0000 C CNN
F 3 "" H 1050 3450 50  0000 C CNN
	1    1050 3450
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR011
U 1 1 58B9837E
P 4450 3900
F 0 "#PWR011" H 4450 3750 50  0001 C CNN
F 1 "+3.3V" H 4450 4040 50  0000 C CNN
F 2 "" H 4450 3900 50  0000 C CNN
F 3 "" H 4450 3900 50  0000 C CNN
	1    4450 3900
	1    0    0    -1  
$EndComp
NoConn ~ 3850 4400
$Comp
L GND #PWR012
U 1 1 58B98815
P 4150 4500
F 0 "#PWR012" H 4150 4250 50  0001 C CNN
F 1 "GND" H 4150 4350 50  0000 C CNN
F 2 "" H 4150 4500 50  0000 C CNN
F 3 "" H 4150 4500 50  0000 C CNN
	1    4150 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 58B98874
P 4450 4500
F 0 "#PWR013" H 4450 4250 50  0001 C CNN
F 1 "GND" H 4450 4350 50  0000 C CNN
F 2 "" H 4450 4500 50  0000 C CNN
F 3 "" H 4450 4500 50  0000 C CNN
	1    4450 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 58B99288
P 1650 4500
F 0 "#PWR014" H 1650 4250 50  0001 C CNN
F 1 "GND" H 1650 4350 50  0000 C CNN
F 2 "" H 1650 4500 50  0000 C CNN
F 3 "" H 1650 4500 50  0000 C CNN
	1    1650 4500
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P1
U 1 1 58B9AFC5
P 4450 2400
F 0 "P1" H 4450 2550 50  0000 C CNN
F 1 "CONN_01X02" V 4550 2400 50  0001 C CNN
F 2 "footprint:S2B-PH-SM4-TB(LF)(SN)" H 4450 2400 50  0001 C CNN
F 3 "" H 4450 2400 50  0000 C CNN
F 4 "DigiKey" H 4450 2400 60  0001 C CNN "Source"
F 5 "455-1749-1-ND" H 4450 2400 60  0001 C CNN "Part"
	1    4450 2400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 58B9BDB1
P 4150 2700
F 0 "#PWR015" H 4150 2450 50  0001 C CNN
F 1 "GND" H 4150 2550 50  0000 C CNN
F 2 "" H 4150 2700 50  0000 C CNN
F 3 "" H 4150 2700 50  0000 C CNN
	1    4150 2700
	1    0    0    -1  
$EndComp
$Comp
L AP2112 U2
U 1 1 58BA0FAE
P 3250 4200
F 0 "U2" H 2900 4550 60  0000 C CNN
F 1 "AP2112" H 3000 3850 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 3250 4200 60  0001 C CNN
F 3 "" H 3250 4200 60  0001 C CNN
F 4 "DigiKey" H 3250 4200 60  0001 C CNN "Source"
F 5 "AP2112K-3.3TRG1DICT-ND" H 3250 4200 60  0001 C CNN "Part"
	1    3250 4200
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR016
U 1 1 58BA3506
P 4150 2100
F 0 "#PWR016" H 4150 1950 50  0001 C CNN
F 1 "+BATT" H 4150 2240 50  0000 C CNN
F 2 "" H 4150 2100 50  0000 C CNN
F 3 "" H 4150 2100 50  0000 C CNN
	1    4150 2100
	1    0    0    -1  
$EndComp
$Comp
L MCP9808 U4
U 1 1 58BACCE5
P 6650 5100
F 0 "U4" H 6400 5550 60  0000 C CNN
F 1 "MCP9808" H 6550 4650 60  0000 C CNN
F 2 "Housings_DFN_QFN:DFN-8-1EP_3x2mm_Pitch0.5mm" H 6650 5100 60  0001 C CNN
F 3 "" H 6650 5100 60  0001 C CNN
F 4 "DigiKey" H 6650 5100 60  0001 C CNN "Source"
F 5 "MCP9808T-E/MCCT-ND" H 6650 5100 60  0001 C CNN "Part"
	1    6650 5100
	1    0    0    -1  
$EndComp
$Comp
L MMA8451Q U6
U 1 1 58BAE024
P 9400 4700
F 0 "U6" H 9050 5200 60  0000 C CNN
F 1 "MMA8451Q" H 9250 3900 60  0000 C CNN
F 2 "footprint:MMA8451Q" H 9400 4700 60  0001 C CNN
F 3 "" H 9400 4700 60  0001 C CNN
F 4 "DigiKey" H 9400 4700 60  0001 C CNN "Source"
F 5 "MMA8451QR1CT-ND" H 9400 4700 60  0001 C CNN "Part"
	1    9400 4700
	1    0    0    -1  
$EndComp
$Comp
L C C9
U 1 1 58BAF20C
P 10650 4900
F 0 "C9" H 10675 5000 50  0000 L CNN
F 1 "0.1u" H 10675 4800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 10688 4750 50  0001 C CNN
F 3 "" H 10650 4900 50  0000 C CNN
F 4 "DigiKey" H 10650 4900 60  0001 C CNN "Source"
F 5 "311-1344-1-ND" H 10650 4900 60  0001 C CNN "Part"
	1    10650 4900
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR017
U 1 1 58BAF455
P 8700 4250
F 0 "#PWR017" H 8700 4100 50  0001 C CNN
F 1 "+3.3V" H 8700 4390 50  0000 C CNN
F 2 "" H 8700 4250 50  0000 C CNN
F 3 "" H 8700 4250 50  0000 C CNN
	1    8700 4250
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR018
U 1 1 58BAF4C0
P 7250 4700
F 0 "#PWR018" H 7250 4550 50  0001 C CNN
F 1 "+3.3V" H 7250 4840 50  0000 C CNN
F 2 "" H 7250 4700 50  0000 C CNN
F 3 "" H 7250 4700 50  0000 C CNN
	1    7250 4700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 58BAF52B
P 6050 5500
F 0 "#PWR019" H 6050 5250 50  0001 C CNN
F 1 "GND" H 6050 5350 50  0000 C CNN
F 2 "" H 6050 5500 50  0000 C CNN
F 3 "" H 6050 5500 50  0000 C CNN
	1    6050 5500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 58BAF596
P 8700 5450
F 0 "#PWR020" H 8700 5200 50  0001 C CNN
F 1 "GND" H 8700 5300 50  0000 C CNN
F 2 "" H 8700 5450 50  0000 C CNN
F 3 "" H 8700 5450 50  0000 C CNN
	1    8700 5450
	1    0    0    -1  
$EndComp
$Comp
L C C8
U 1 1 58BB0721
P 8400 5200
F 0 "C8" H 8425 5300 50  0000 L CNN
F 1 "0.1u" H 8425 5100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 8438 5050 50  0001 C CNN
F 3 "" H 8400 5200 50  0000 C CNN
F 4 "DigiKey" H 8400 5200 60  0001 C CNN "Source"
F 5 "311-1344-1-ND" H 8400 5200 60  0001 C CNN "Part"
	1    8400 5200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR021
U 1 1 58BB07AE
P 8400 5450
F 0 "#PWR021" H 8400 5200 50  0001 C CNN
F 1 "GND" H 8400 5300 50  0000 C CNN
F 2 "" H 8400 5450 50  0000 C CNN
F 3 "" H 8400 5450 50  0000 C CNN
	1    8400 5450
	1    0    0    -1  
$EndComp
NoConn ~ 10000 4350
NoConn ~ 10000 4450
NoConn ~ 10000 4550
NoConn ~ 10000 4650
NoConn ~ 10000 4750
NoConn ~ 10000 5250
NoConn ~ 10000 5350
$Comp
L +3.3V #PWR022
U 1 1 58BB1307
P 10650 4700
F 0 "#PWR022" H 10650 4550 50  0001 C CNN
F 1 "+3.3V" H 10650 4840 50  0000 C CNN
F 2 "" H 10650 4700 50  0000 C CNN
F 3 "" H 10650 4700 50  0000 C CNN
	1    10650 4700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR023
U 1 1 58BB1E75
P 10650 5100
F 0 "#PWR023" H 10650 4850 50  0001 C CNN
F 1 "GND" H 10650 4950 50  0000 C CNN
F 2 "" H 10650 5100 50  0000 C CNN
F 3 "" H 10650 5100 50  0000 C CNN
	1    10650 5100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 58BB568E
P 7250 5500
F 0 "#PWR024" H 7250 5250 50  0001 C CNN
F 1 "GND" H 7250 5350 50  0000 C CNN
F 2 "" H 7250 5500 50  0000 C CNN
F 3 "" H 7250 5500 50  0000 C CNN
	1    7250 5500
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 58BB5C80
P 7600 5100
F 0 "C7" H 7625 5200 50  0000 L CNN
F 1 "1u" H 7625 5000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 7638 4950 50  0001 C CNN
F 3 "" H 7600 5100 50  0000 C CNN
F 4 "DigiKey" H 7600 5100 60  0001 C CNN "Source"
F 5 "311-1444-1-ND" H 7600 5100 60  0001 C CNN "Part"
	1    7600 5100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR025
U 1 1 58BB641B
P 7600 5300
F 0 "#PWR025" H 7600 5050 50  0001 C CNN
F 1 "GND" H 7600 5150 50  0000 C CNN
F 2 "" H 7600 5300 50  0000 C CNN
F 3 "" H 7600 5300 50  0000 C CNN
	1    7600 5300
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR026
U 1 1 58BB6498
P 7600 4900
F 0 "#PWR026" H 7600 4750 50  0001 C CNN
F 1 "+3.3V" H 7600 5040 50  0000 C CNN
F 2 "" H 7600 4900 50  0000 C CNN
F 3 "" H 7600 4900 50  0000 C CNN
	1    7600 4900
	1    0    0    -1  
$EndComp
NoConn ~ 6150 5100
$Comp
L R R9
U 1 1 58BBB45B
P 5450 4550
F 0 "R9" V 5530 4550 50  0000 C CNN
F 1 "10k" V 5450 4550 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 5380 4550 50  0001 C CNN
F 3 "" H 5450 4550 50  0000 C CNN
F 4 "DigiKey" H 5450 4550 60  0001 C CNN "Source"
F 5 "311-10.0KHRCT-ND" H 5450 4550 60  0001 C CNN "Part"
	1    5450 4550
	-1   0    0    1   
$EndComp
$Comp
L R R10
U 1 1 58BBB4FC
P 5750 4550
F 0 "R10" V 5830 4550 50  0000 C CNN
F 1 "10k" V 5750 4550 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 5680 4550 50  0001 C CNN
F 3 "" H 5750 4550 50  0000 C CNN
F 4 "DigiKey" H 5750 4550 60  0001 C CNN "Source"
F 5 "311-10.0KHRCT-ND" H 5750 4550 60  0001 C CNN "Part"
	1    5750 4550
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #PWR027
U 1 1 58BBB70B
P 5450 4300
F 0 "#PWR027" H 5450 4150 50  0001 C CNN
F 1 "+3.3V" H 5450 4440 50  0000 C CNN
F 2 "" H 5450 4300 50  0000 C CNN
F 3 "" H 5450 4300 50  0000 C CNN
	1    5450 4300
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR028
U 1 1 58BBB78E
P 5750 4300
F 0 "#PWR028" H 5750 4150 50  0001 C CNN
F 1 "+3.3V" H 5750 4440 50  0000 C CNN
F 2 "" H 5750 4300 50  0000 C CNN
F 3 "" H 5750 4300 50  0000 C CNN
	1    5750 4300
	1    0    0    -1  
$EndComp
Text Label 5900 4900 0    60   ~ 0
SCL
Text Label 5900 4800 0    60   ~ 0
SDA
Text Label 10050 5050 0    60   ~ 0
SDA
Text Label 10050 4950 0    60   ~ 0
SCL
$Comp
L +BATT #PWR029
U 1 1 58BC0A32
P 2250 5600
F 0 "#PWR029" H 2250 5450 50  0001 C CNN
F 1 "+BATT" H 2250 5740 50  0000 C CNN
F 2 "" H 2250 5600 50  0000 C CNN
F 3 "" H 2250 5600 50  0000 C CNN
	1    2250 5600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR030
U 1 1 58BC0AB5
P 2250 7050
F 0 "#PWR030" H 2250 6800 50  0001 C CNN
F 1 "GND" H 2250 6900 50  0000 C CNN
F 2 "" H 2250 7050 50  0000 C CNN
F 3 "" H 2250 7050 50  0000 C CNN
	1    2250 7050
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 58BC1EF6
P 2250 5850
F 0 "R4" V 2330 5850 50  0000 C CNN
F 1 "1M" V 2250 5850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 2180 5850 50  0001 C CNN
F 3 "" H 2250 5850 50  0000 C CNN
F 4 "DigiKey" H 2250 5850 60  0001 C CNN "Source"
F 5 "311-1.00MHRCT-ND" H 2250 5850 60  0001 C CNN "Part"
	1    2250 5850
	-1   0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 58BC1F95
P 2250 6800
F 0 "R5" V 2330 6800 50  0000 C CNN
F 1 "220k" V 2250 6800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 2180 6800 50  0001 C CNN
F 3 "" H 2250 6800 50  0000 C CNN
F 4 "DigiKey" H 2250 6800 60  0001 C CNN "Source"
F 5 "311-220KHRCT-ND" H 2250 6800 60  0001 C CNN "Part"
	1    2250 6800
	-1   0    0    -1  
$EndComp
$Comp
L SW_DPDT_x2 SW1
U 1 1 58BC32A3
P 2250 4300
F 0 "SW1" H 2250 4470 50  0000 C CNN
F 1 "SW_DPDT_x2" H 2250 4100 50  0000 C CNN
F 2 "footprint:CL-SB-22A" H 2250 4300 50  0001 C CNN
F 3 "" H 2250 4300 50  0000 C CNN
F 4 "DigiKey" H 2250 4300 60  0001 C CNN "Source"
F 5 "563-1340-1-ND" H 2250 4300 60  0001 C CNN "Part"
	1    2250 4300
	1    0    0    -1  
$EndComp
$Comp
L SW_DPDT_x2 SW1
U 2 1 58BC3334
P 1050 5300
F 0 "SW1" H 1050 5470 50  0000 C CNN
F 1 "SW_DPDT_x2" H 1050 5100 50  0000 C CNN
F 2 "footprint:CL-SB-22A" H 1050 5300 50  0001 C CNN
F 3 "" H 1050 5300 50  0000 C CNN
F 4 "DigiKey" H 1050 5300 60  0001 C CNN "Source"
F 5 "563-1340-1-ND" H 1050 5300 60  0001 C CNN "Part"
	2    1050 5300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR031
U 1 1 58CE6D17
P 2750 7050
F 0 "#PWR031" H 2750 6800 50  0001 C CNN
F 1 "GND" H 2750 6900 50  0000 C CNN
F 2 "" H 2750 7050 50  0000 C CNN
F 3 "" H 2750 7050 50  0000 C CNN
	1    2750 7050
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR032
U 1 1 58CE7246
P 2750 5600
F 0 "#PWR032" H 2750 5450 50  0001 C CNN
F 1 "+5V" H 2750 5740 50  0000 C CNN
F 2 "" H 2750 5600 50  0000 C CNN
F 3 "" H 2750 5600 50  0000 C CNN
	1    2750 5600
	1    0    0    -1  
$EndComp
Text Label 2400 4000 0    60   ~ 0
VIN
$Comp
L +5V #PWR033
U 1 1 5A47C39D
P 2200 1000
F 0 "#PWR033" H 2200 850 50  0001 C CNN
F 1 "+5V" H 2200 1140 50  0000 C CNN
F 2 "" H 2200 1000 50  0000 C CNN
F 3 "" H 2200 1000 50  0000 C CNN
	1    2200 1000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR034
U 1 1 5A47C411
P 2900 1400
F 0 "#PWR034" H 2900 1150 50  0001 C CNN
F 1 "GND" H 2900 1250 50  0000 C CNN
F 2 "" H 2900 1400 50  0000 C CNN
F 3 "" H 2900 1400 50  0000 C CNN
	1    2900 1400
	1    0    0    -1  
$EndComp
Text Label 1750 1200 0    60   ~ 0
RESET
Text Label 1750 1300 0    60   ~ 0
GPIO0
Text Label 2850 1100 0    60   ~ 0
PROG_TXD
Text Label 2850 1200 0    60   ~ 0
PROG_RXD
Text Label 6300 2700 0    60   ~ 0
PROG_TXD
Text Label 6300 2800 0    60   ~ 0
PROG_RXD
$Comp
L Conn_02x03_Odd_Even J1
U 1 1 5A4811CB
P 2500 1200
F 0 "J1" H 2550 1400 50  0000 C CNN
F 1 "eConn_02x03_Odd_Even" H 2550 1000 50  0001 C CNN
F 2 "Socket_Strips:Socket_Strip_Angled_2x03_Pitch2.54mm" H 2500 1200 50  0001 C CNN
F 3 "" H 2500 1200 50  0001 C CNN
F 4 "DigiKey" H 2500 1200 60  0001 C CNN "Source"
F 5 "S5556-ND" H 2500 1200 60  0001 C CNN "Part"
	1    2500 1200
	1    0    0    -1  
$EndComp
$Comp
L ESP-WROOM-32D U5
U 1 1 5A484B62
P 7650 2350
F 0 "U5" H 7200 3550 60  0000 C CNN
F 1 "ESP-WROOM-32D" H 7600 1150 60  0000 C CNN
F 2 "footprint:ESP32-WROOM" H 6500 3100 60  0001 C CNN
F 3 "" H 6500 3100 60  0001 C CNN
F 4 "DigiKey" H 7650 2350 60  0001 C CNN "Source"
F 5 "1528-1801-ND" H 7650 2350 60  0001 C CNN "Part"
	1    7650 2350
	1    0    0    -1  
$EndComp
Text Label 2250 6550 1    60   ~ 0
BAT_SENSE
Text Label 2750 6550 1    60   ~ 0
5V_SENSE
Text Label 8400 3400 0    60   ~ 0
BAT_SENSE
Text Label 8400 3300 0    60   ~ 0
5V_SENSE
Text Label 8400 2700 0    60   ~ 0
SDA
Text Label 8400 2600 0    60   ~ 0
SCL
$Comp
L GND #PWR035
U 1 1 5A490D25
P 1750 7050
F 0 "#PWR035" H 1750 6800 50  0001 C CNN
F 1 "GND" H 1750 6900 50  0000 C CNN
F 2 "" H 1750 7050 50  0000 C CNN
F 3 "" H 1750 7050 50  0000 C CNN
	1    1750 7050
	1    0    0    -1  
$EndComp
Text Label 1750 5900 1    60   ~ 0
LED
Text Label 8400 1800 0    60   ~ 0
LED
$Comp
L Q_PMOS_GSD Q1
U 1 1 5A4979BE
P 1550 3750
F 0 "Q1" H 1750 3800 50  0000 L CNN
F 1 "DMG3415U" H 1750 3700 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 1750 3850 50  0001 C CNN
F 3 "" H 1550 3750 50  0001 C CNN
F 4 "DigiKey" H 1550 3750 60  0001 C CNN "Source"
F 5 "DMG3415UDICT-ND" H 1550 3750 60  0001 C CNN "Part"
	1    1550 3750
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5A498548
P 1050 4250
F 0 "R1" V 1130 4250 50  0000 C CNN
F 1 "100k" V 1050 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 980 4250 50  0001 C CNN
F 3 "" H 1050 4250 50  0000 C CNN
F 4 "DigiKey" H 1050 4250 60  0001 C CNN "Source"
F 5 "311-100KHRCT-ND" H 1050 4250 60  0001 C CNN "Part"
	1    1050 4250
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR036
U 1 1 5A49874A
P 1050 4500
F 0 "#PWR036" H 1050 4250 50  0001 C CNN
F 1 "GND" H 1050 4350 50  0000 C CNN
F 2 "" H 1050 4500 50  0000 C CNN
F 3 "" H 1050 4500 50  0000 C CNN
	1    1050 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 2200 1050 2200
Wire Wire Line
	1050 2100 1050 2600
Wire Wire Line
	1050 2600 1150 2600
Connection ~ 1050 2200
Wire Wire Line
	1450 2600 1550 2600
Wire Wire Line
	1850 2600 1950 2600
Wire Wire Line
	3350 2400 3450 2400
Wire Wire Line
	3450 2400 3450 2700
Wire Wire Line
	2950 2600 3450 2600
Connection ~ 3450 2600
Wire Wire Line
	3050 2400 2950 2400
Wire Wire Line
	3750 2100 3750 2300
Wire Wire Line
	3750 2600 3750 2700
Wire Wire Line
	6250 2700 6950 2700
Wire Wire Line
	3850 4000 4450 4000
Wire Wire Line
	4150 4000 4150 4100
Wire Wire Line
	4450 3900 4450 4100
Connection ~ 4150 4000
Connection ~ 4450 4000
Wire Wire Line
	4450 4500 4450 4400
Wire Wire Line
	4150 4500 4150 4400
Wire Wire Line
	1650 4500 1650 4400
Wire Wire Line
	1450 4000 2650 4000
Connection ~ 1650 4000
Connection ~ 1950 4000
Wire Wire Line
	2650 4400 2550 4400
Wire Wire Line
	2550 4400 2550 4500
Wire Wire Line
	3750 2200 2950 2200
Connection ~ 3750 2200
Wire Wire Line
	4250 2350 4150 2350
Wire Wire Line
	4150 2350 4150 2100
Wire Wire Line
	4250 2450 4150 2450
Wire Wire Line
	4150 2450 4150 2700
Wire Wire Line
	2650 4200 2450 4200
Wire Wire Line
	1950 4300 2050 4300
Wire Wire Line
	8800 5150 8700 5150
Wire Wire Line
	8700 5150 8700 5450
Wire Wire Line
	8800 5250 8700 5250
Connection ~ 8700 5250
Wire Wire Line
	8800 5350 8700 5350
Connection ~ 8700 5350
Wire Wire Line
	8700 4250 8700 4650
Wire Wire Line
	8700 4350 8800 4350
Wire Wire Line
	8700 4450 8800 4450
Connection ~ 8700 4350
Wire Wire Line
	8400 5450 8400 5350
Wire Wire Line
	8400 5050 8400 4950
Wire Wire Line
	8400 4950 8800 4950
Wire Wire Line
	10650 5100 10650 5050
Wire Wire Line
	10650 4700 10650 4750
Wire Wire Line
	7250 5400 7150 5400
Wire Wire Line
	7250 5200 7250 5500
Wire Wire Line
	7150 4800 7250 4800
Wire Wire Line
	7250 4800 7250 4700
Wire Wire Line
	6150 5300 6050 5300
Wire Wire Line
	6050 5300 6050 5500
Wire Wire Line
	7600 4900 7600 4950
Wire Wire Line
	7600 5250 7600 5300
Wire Wire Line
	5450 4300 5450 4400
Wire Wire Line
	5750 4300 5750 4400
Wire Wire Line
	2250 6950 2250 7050
Wire Wire Line
	2250 6650 2250 6000
Wire Wire Line
	2250 5700 2250 5600
Wire Wire Line
	7150 5200 7250 5200
Connection ~ 7250 5400
Wire Wire Line
	7150 5300 7250 5300
Connection ~ 7250 5300
Wire Wire Line
	8700 4650 8800 4650
Connection ~ 8700 4450
Wire Wire Line
	2750 6650 2750 6000
Wire Wire Line
	2750 7050 2750 6950
Wire Wire Line
	2750 5600 2750 5700
Wire Wire Line
	5950 1000 5950 1100
Wire Wire Line
	3400 1200 2800 1200
Wire Wire Line
	2300 1200 1700 1200
Wire Wire Line
	2300 1300 1700 1300
Wire Wire Line
	3400 1100 2800 1100
Wire Wire Line
	2800 1300 2900 1300
Wire Wire Line
	2900 1300 2900 1400
Wire Wire Line
	2200 1000 2200 1100
Wire Wire Line
	2200 1100 2300 1100
Wire Wire Line
	6250 2800 6950 2800
Wire Wire Line
	5950 1500 6950 1500
Wire Wire Line
	5750 4800 6150 4800
Wire Wire Line
	5450 4900 6150 4900
Wire Wire Line
	10000 4950 10300 4950
Wire Wire Line
	10000 5050 10300 5050
Wire Wire Line
	8350 2600 9050 2600
Wire Wire Line
	8350 2700 9050 2700
Wire Wire Line
	5750 4800 5750 4700
Wire Wire Line
	5450 4900 5450 4700
Wire Wire Line
	1750 7050 1750 6950
Wire Wire Line
	1750 6650 1750 6550
Wire Wire Line
	1750 5600 1750 6250
Wire Wire Line
	1950 4000 1950 4300
Wire Wire Line
	1050 3450 1050 4100
Wire Wire Line
	1050 4000 1150 4000
Wire Wire Line
	1350 3750 1050 3750
Connection ~ 1050 3750
Wire Wire Line
	1650 3450 1650 3550
Wire Wire Line
	1050 4500 1050 4400
Connection ~ 1050 4000
Wire Wire Line
	9050 3400 8350 3400
Wire Wire Line
	8350 1800 9050 1800
Wire Wire Line
	5950 1400 5950 1600
Connection ~ 5950 1500
$Comp
L GND #PWR037
U 1 1 5A4A31ED
P 5950 2000
F 0 "#PWR037" H 5950 1750 50  0001 C CNN
F 1 "GND" H 5950 1850 50  0000 C CNN
F 2 "" H 5950 2000 50  0000 C CNN
F 3 "" H 5950 2000 50  0000 C CNN
	1    5950 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2000 5950 1900
Text Label 8400 1300 0    60   ~ 0
GPIO0
Wire Wire Line
	8350 1300 9050 1300
NoConn ~ 8350 1700
$Comp
L R R6
U 1 1 5A47FE47
P 2750 5850
F 0 "R6" V 2830 5850 50  0000 C CNN
F 1 "10k" V 2750 5850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 2680 5850 50  0001 C CNN
F 3 "" H 2750 5850 50  0000 C CNN
F 4 "DigiKey" H 2750 5850 60  0001 C CNN "Source"
F 5 "311-10.0KHRCT-ND" H 2750 5850 60  0001 C CNN "Part"
	1    2750 5850
	-1   0    0    1   
$EndComp
$Comp
L R R7
U 1 1 5A47FED2
P 2750 6800
F 0 "R7" V 2830 6800 50  0000 C CNN
F 1 "15k" V 2750 6800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 2680 6800 50  0001 C CNN
F 3 "" H 2750 6800 50  0000 C CNN
F 4 "DigiKey" H 2750 6800 60  0001 C CNN "Source"
F 5 "311-15.0KHRCT-ND" H 2750 6800 60  0001 C CNN "Part"
	1    2750 6800
	-1   0    0    1   
$EndComp
$Comp
L C C6
U 1 1 5A48B9D9
P 5950 1750
F 0 "C6" H 5975 1850 50  0000 L CNN
F 1 "0.1u" H 5975 1650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5988 1600 50  0001 C CNN
F 3 "" H 5950 1750 50  0000 C CNN
F 4 "DigiKey" H 5950 1750 60  0001 C CNN "Source"
F 5 "311-1344-1-ND" H 5950 1750 60  0001 C CNN "Part"
	1    5950 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 1200 6850 1300
Wire Wire Line
	6850 1300 6950 1300
Wire Wire Line
	6950 3200 6850 3200
Wire Wire Line
	6850 3200 6850 3500
Wire Wire Line
	6950 3300 6850 3300
Connection ~ 6850 3300
Wire Wire Line
	6950 3400 6850 3400
Connection ~ 6850 3400
NoConn ~ 6950 3000
Wire Wire Line
	9050 3300 8350 3300
NoConn ~ 8350 1400
NoConn ~ 8350 1600
NoConn ~ 8350 2000
Text Notes 9800 1750 0    60   ~ 0
STRAPPING PINS:\nIO0\nIO2\nIO5\nIO12\nIO15
NoConn ~ 6950 2000
NoConn ~ 6950 2100
NoConn ~ 6950 2200
NoConn ~ 6950 2300
NoConn ~ 6950 2400
NoConn ~ 6950 2500
Wire Wire Line
	1650 3950 1650 4100
$Comp
L Si1145 U3
U 1 1 5A598AD2
P 5000 6600
F 0 "U3" H 4750 7150 60  0000 C CNN
F 1 "Si1145" H 5000 6050 60  0000 C CNN
F 2 "footprint:Si1145" H 4950 6600 60  0001 C CNN
F 3 "" H 4950 6600 60  0001 C CNN
F 4 "DigiKey" H 5000 6600 60  0001 C CNN "Source"
F 5 "336-2622-1-ND" H 5000 6600 60  0001 C CNN "Part"
	1    5000 6600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR038
U 1 1 5A599285
P 4400 7100
F 0 "#PWR038" H 4400 6850 50  0001 C CNN
F 1 "GND" H 4400 6950 50  0000 C CNN
F 2 "" H 4400 7100 50  0000 C CNN
F 3 "" H 4400 7100 50  0000 C CNN
	1    4400 7100
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR039
U 1 1 5A5992F9
P 4400 6100
F 0 "#PWR039" H 4400 5950 50  0001 C CNN
F 1 "+3.3V" H 4400 6240 50  0000 C CNN
F 2 "" H 4400 6100 50  0000 C CNN
F 3 "" H 4400 6100 50  0000 C CNN
	1    4400 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 7000 4400 7000
Wire Wire Line
	4400 7000 4400 7100
Wire Wire Line
	4500 6500 4400 6500
Wire Wire Line
	4400 6500 4400 6100
Wire Wire Line
	4500 6400 4400 6400
Connection ~ 4400 6400
Wire Wire Line
	4500 6200 4400 6200
Connection ~ 4400 6200
Text Label 5550 6500 0    60   ~ 0
SDA
Text Label 5550 6400 0    60   ~ 0
SCL
$Comp
L C C3
U 1 1 5A59A2EC
P 4050 6600
F 0 "C3" H 4075 6700 50  0000 L CNN
F 1 "0.1u" H 4075 6500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4088 6450 50  0001 C CNN
F 3 "" H 4050 6600 50  0000 C CNN
F 4 "DigiKey" H 4050 6600 60  0001 C CNN "Source"
F 5 "311-1344-1-ND" H 4050 6600 60  0001 C CNN "Part"
	1    4050 6600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR040
U 1 1 5A59A43E
P 4050 6400
F 0 "#PWR040" H 4050 6250 50  0001 C CNN
F 1 "+3.3V" H 4050 6540 50  0000 C CNN
F 2 "" H 4050 6400 50  0000 C CNN
F 3 "" H 4050 6400 50  0000 C CNN
	1    4050 6400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR041
U 1 1 5A59A4B5
P 4050 6800
F 0 "#PWR041" H 4050 6550 50  0001 C CNN
F 1 "GND" H 4050 6650 50  0000 C CNN
F 2 "" H 4050 6800 50  0000 C CNN
F 3 "" H 4050 6800 50  0000 C CNN
	1    4050 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 6750 4050 6800
Wire Wire Line
	4050 6400 4050 6450
Wire Wire Line
	5800 6400 5500 6400
Wire Wire Line
	5800 6500 5500 6500
Wire Wire Line
	6150 5400 6050 5400
Connection ~ 6050 5400
Text Notes 4700 7400 0    60   ~ 0
ADDR: 0x60
Text Notes 9000 5750 0    60   ~ 0
ADDR: 0x1D
Text Notes 6350 5800 0    60   ~ 0
ADDR: 0x18
$EndSCHEMATC
