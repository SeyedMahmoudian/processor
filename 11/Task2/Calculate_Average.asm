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
        
        pshy            ;Save value y
        aby             ;loop from the end of array
        dey             ;loop back to the beginning
        
        clra
        clrb

Next
        cpy     0,sp    ;are we at start of array -1 ?
        blo     Divide  ;divide if so
        
        pshd
        
        ldab    1,y-    ;Get the value
        clra
        
        addd     0,sp
        ins             ;clear up the stack
        ins
        
        bra     Next    ;Add the next value

Divide
        idiv
        puly            ;Get back the orginal value of Y

        rts