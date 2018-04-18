; Calculate_Average.asm
;
; Author:
; Student Number:
; Date:
;

; Purpose:      The purpose of the Calculate_Average_Subroutine is to
;               calculate the average of ANY number of values by dividing
;               the sum of the values by 5 and returning an integer value
;               between 0 and 10

; Precondition:  Y points to fist value
;                B contains numbuer value to average
;                Average out of 50%
;
; Postcondition: Accumulator A - Set to 0
;                Accumulator B - Set to 0
;                Accumulator X - Set to 0
;
;                Math as follow:
;               (sum of elements)/DIVISOR
;               Accumulator D - Contains reminder of the division
;               Accumulator X - Contains the result

DIVISOR equ     $05

Calculate_Average
        ldx     #DIVISOR

        pshy                 ; Save the value of y
        aby                  ; This loop starts at the end of the array
        dey                  ; and works its way to the beginning.

        clra
        clrb

Next
        cpy     0,sp         ; Have we reached Start of Array minus 1?
        blo     Divide       ; Go and divide if we reached the start.

        pshd                 ; Save the value of D

        ldab    1,y-         ; Retrieve the value.
        clra

        addd    0,sp
        ins                  ; Clear the stack
        ins

        bra     Next         ; Add the next value

Divide
        idiv
        puly                 ; Get back the original value of Y

        rts