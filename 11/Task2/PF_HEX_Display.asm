; PF_HEX_Display.asm

; Author:               D. Haley
; Student Number:       Faculty
; Date:                 24 March 2014
;
; Purpose:              Subroutine to display a value on a Hex Display
;
; Preconditions:
;                       HEX Displays configured for Output
;                       Value to Display is in Accumulator A
;                       Hex Display to use is in Accumulator B
;
; Postcondition:        X is destroyed
;                       A is destroyed
;
;                 Lookup table for LED segments
LEDSEG  db
;                 F,  P, <blank>
PF_Hex_Display
        ldx     #LEDSEG         ; Point to start of lookup table
        ldaa    a,x             ; Effective address is sum of contents
                                ; of registers A and X
        stab    PTP             ; Selected Hex Display (if this is after
                                ; staa PORTB
                                ; then ALL Hex Dislays will momentarily
                                ; flicker the value)
        staa    PORTB           ; Display value
        rts
; -----------------------------
;        END Hex_Display      -
;------------------------------