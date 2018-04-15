;Those_Were_The_Memories.asm

Value1  equ 128

        org  $1000
Value2  db   $3F
Value3  dw   3456
        
        
        org  $1030
Result1 ds   1
Result2 ds   2
Result3 ds   1
Result4 dw   1

        org  $2000
        ldaa #Value1
        staa Result1
        ldab Value2
        stab Result3
        ldd  #Value3
        stab Result2
        staa Result3
        ldab Value3+1
        ldaa Value3
        std  Result4
        swi
        end