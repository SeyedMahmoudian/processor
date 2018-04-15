;18W_Trace1.asm

         org  $1000
Data1    db   $55,$19,$35,$08
Data2    db   $00,$FF,$10,$01,$E7,$9E,$8F,$31

         org  $2000
         lds  #$2000
         ldy  #Data1
         
         ldab  4,y
         ldaa  1,y+
         ldab  0,y
         ldx   #Data2
         ldd   6,x+
         std   2,x+
         swi
         end
