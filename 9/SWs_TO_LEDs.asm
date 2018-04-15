; SWs_To_LEDs.asm
#include C:\68HCS12\registers.inc

; Author:       D. Haley
; Course:       CST8216 Processor Architectural
; S/N:          Faculty
; Date          17 Mar 2018

; Purpose:      To read Port H Switch values and display them
;               on Port B LEDs in the Dragon 12+ Trainer/Simulator

;               This program also permits students to determine what values
;               are associated with the switches so that they can use this
;               information in another program that they have to write.
;
;               To do so, assemble the program and run it in the simulator.
;               Press SW2, SW3, SW4 and SW5 and read the values off the
;               Display or in Accumulator A (must single step for this)
;		for each of the four switches.
;

        org     $2000
        lds     #$2000
        jsr     Config_SWs_and_LEDs
Get_SW  ldaa    PTH     ; get data from Switches
        staa    PORTB   ; send same data to LEDs
        bra Get_SW

#include C:\68HCS12\Lib\Config_SWs_and_LEDs.asm

        end