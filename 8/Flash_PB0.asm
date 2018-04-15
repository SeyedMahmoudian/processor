; Flash_PB0.asm
;
; Author:         SeyedAmin SeyedMahmoudian
; Student Number: 040-813-340
; Date:           21 March 2018
;
;  Purpose:        To Flash PB0 LED on Dragon 12+ Trainer

; Program Flash PB0
#include C:\68HCS12\registers.inc
STACK   equ     $2000
PB0ON   equ     %00000001         ; 1 turns on LED, 0 turns off LED
PB0OFF  equ     %00000000         ; 1 turns on LED, 0 turns off LED

        org     $2000           ; program code
Start   lds #STACK          ; stack location

; Configure the Ports
        jsr     Config_SWs_and_LEDs

; Continually Flash LED
Back    ldaa    #PB0ON
        staa    portb           ; PB0 ON
        ldaa    #250            ; 250 ms delay
        jsr     Delay_ms
        ldaa    #PB0OFF
        staa    portb           ; PB7 OFF
        ldaa    #250            ; 250 ms delay
        jsr     Delay_ms        ; call 250ms delay routine
        bra     Back            ; endless loop

; Library Files
#include C:\68HCS12\Lib\Config_SWs_and_LEDs.asm
#include C:\68HCS12\Lib\Delay_ms.asm

        end