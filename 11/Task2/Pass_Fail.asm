; Pass_Fail.asm
; Pass_Fail Subroutine
; Is it a Pass or Fail ?

; Author:
; Student Number:
; Date:
;

; Purpose:      The purpose of the Pass_Fail_Subroutine is to
;               determine if the supplied integer is a Pass or a Fail, given:
;               - a Pass is >= 5
;               - a Fail is < 5
;               and return a Pass or Fail indication

; Precondition:  Register X contains value to check for pass or fail
;
; Postcondition: Overwrite accumulator A with either 0 or 1
;                0 Indicates that the mark was fail
;                1 indicate that the mark was pass

; Constant
MIN     equ     5 ; Average must be at leas 50 to pass the class

;code
Pass_Fail
        cpx     #MIN
        bhs     Pass
Fail
        ldaa    #0
        bra     Return
Pass
        ldaa    #1
Return
        rts

