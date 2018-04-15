; Unsigned_Selection_Sort.asm
; ;group Members
;Todd Hakvoort, Seyedamin Seyedmahmoudian, Ryan Brooks
; Course:
; S/N:
; Date:
; Purpose

; Program Constants
STACK              equ     $2000


; Program data
                   org     $1000
Start_Array       db      $08, $04, $05, $0e, $09, $05, $08, $08, $0d
End_Array

Holder            dw       $0000

;program start

                   org     $2000
                   lds     #STACK

                   ldx     #Start_Array;x will be the value we are checking
                   ldy     #Start_Array;y will be the place in the array

;swap x with y
Start_Swap         ldaa    0,x
                   ldab    0,y
                   staa    0,y
                   stab    0,x
End_Swap

Start_Loop
;if x is smaller then y so swap, increment x after,
                   ldaa    0,x
                   cmpa    0,y
                   blo     #Start_Swap
                   inx
;if x != End_Array bring x to Start_Loop else increment y and bring x to y
                   cpx     #End_Array
                   blo     #Start_Loop
                   iny
                   sty     Holder
                   ldx     Holder
;if y = End_Array end, else go back to start of loop
                   cpy     #End_Array
                   blo     #Start_Loop

                   swi
                   end