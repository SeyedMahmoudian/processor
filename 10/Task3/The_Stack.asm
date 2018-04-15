;The_Stack.asm
Stack   equ     $2000

        org     $1000
Data    db      $19, $FE, $32, $C4, $65

        org     $2000
        lds     #Stack

        ldy     #Data
        ldaa    1,y
        ldab    1,y+
        pshb
        psha
        pshy
        jsr     Here
        puly
        puld
        bra     Finish
Here    ldab    Data+3
        dey
        rts
Finish  swi
        end