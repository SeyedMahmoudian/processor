;Exchange_Elemenets_temp.asm

            org $1000
Elements    db  033, 110, 117, 070, 032, 115, 105, 032, 101, 103, 097
            db  117, 103, 110, 097, 076, 032, 121, 108, 098, 109, 101
            db  115, 115, 065 ;array called elements, ends at endelements
EndElements
Len         equ EndElements-Elements ; sizeof() = Length of the array

STACK       equ $2000
            org STACK
            lds #STACK
            ldx #Elements
            ldy #Elements+Len-1
START       ldab 0,x
            ldaa 0,y
            staa 1,x+
            stab 1,y-
            clra
            clrb
CHECK       equ  $100c
            cpx #CHECK
            bne START
            end
