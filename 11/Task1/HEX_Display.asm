; HEX_Display.asm

; Author:               D. Haley
; Student Number:       Faculty
; Date:                 31 March 2018
;
; Purpose:              A Subroutine to display a value on a Hex Display
;
; Preconditions:        HEX Displays configured for Output
;                       - Value to Display is in Accumulator A
;                       - Hex Display to use is in Accumulator B
;
; Notes:                Select the Hex Display and then display the value;
;                       otherwise, excessive flicker will occur if this order
;                       of operations is not followed
;
; Use:                  First, place this subroutine in your source code folder

;                       and then type #include HEX_Display.asm
;                       in your source code just before the assembler end directive
;
;                       to call, use jsr Hex_Display
;
; Postcondition:        X is destroyed
;                       A is destroyed
;
;                 Lookup table for LED segments
LEDSEG  db        $3f,$06,$5b,$4f,$66,$6d,$7d,$07,$7f,$6f,$77,$7C,$39,$5E,$79,$71
;                  0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  A,  b,  C, d,  E,  F
;
Hex_Display
        ldx     #LEDSEG         ; Point to start of lookup table
        ldaa    a,x             ; Effective address is sum of contents of registers A and X
        stab    PTP             ; Selected Hex Display (if this is after staa PORTB
                                ; then ALL Hex Dislays will momentarily flicker the value)
        staa    PORTB           ; Display value
        rts
; -----------------------------
;        END Hex_Display      -
;------------------------------