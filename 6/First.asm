; First.asm
;
;Author:        	Seyedamin SeyedMahmoudian
;Student Number:        040813340
;Date:                  2018-02-20
;
;Purpose:               Add the following values: $25 + $37 - $1
;
        org     $1000   ;Set current location to start of RAM --> memory location 1000
p:      db      $25     ;First addend is at location p --> memory location 1000
q:      db      $37     ;Second addend is at lcoation q --> memory location 1001
r:      ds      1       ;Sum will be stored at location r --> memory location 1002
        org     $2000   ;Set location to start in ROM
        ldaa    p       ;load value p into accumulator a
        adda    q       ;add value at q into accumulator a
        deca            ;decrement a
        staa    r       ;store accumulator a at location r
        end
