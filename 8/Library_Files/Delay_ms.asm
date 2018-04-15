;--------------------------------------
; Delay_ms.asm                        -
;    Purpose:                         -
;       - A millisecond delay for the -
;         Dragon12-Plus HCS12 Trainer -
;         Rev F. Board running at     -
;         24 MHz with an 8 Mhz Crystal-
;                                     -
;   Source:                           -
;       - Wytec User's Manual for     -
;         Rev F board Revision 1.05   -
;       - page 21 .asm listing        -
;       - D. Haley - rewrote to       -
;         include stack operations    -
;       - updated 28 Feb 2013 to      -
;         have Accumulator A hold the -
;         number of milliseconds to   -
;         delay, versus using a       -
;         global label
;                                     -
;    Precondition:                    -
;       - Stack initialized at $2000  -
;       - Accumulator A loaded with   -
;         number of milliseconds to   -
;         delay ( 1 ms to 255 ms )    -
;         e.g. Accumulator A <- #250  -
;         will cause a 250 ms delay   -
;                                     -
;    Use:                             -
;       - Place Delay_ms.asm in       -
;         C:\68HCS12\Lib              -
;                                     -
;       - insert the following as your-
;         last line of source code    -
;         before "end"                -
;                                     -
; #include C:\68HCS12\Lib\Delay_ms.asm-
;                                     -
;       - to call the delay routine   -
;         (example for a 250 ms delay -
;                                     -
;        ldaa #250                    -
;        jsr Delay_ms                 -
;                                     -
;    Postcondition:                   -
;        - A destroyed                -
;        - Y destroyed                -
;--------------------------------------
Delay_ms
        ldy     #24000/6  ; 6000 x 4 = 24,000 cycles = 1ms
Delay   dey               ; this instruction takes 1 cycle
        bne     Delay     ; this instruction takes 3 cycles
        deca              ; Delayed 1 ms. Are we finished the total delay time?
        bne     Delay_ms  ; No, delay again
        rts
;- ------------------------------------
;            End Delay_ms             -
;--------------------------------------