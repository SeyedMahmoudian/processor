;--------------------------------------
; Config_SWs_and_LEDs.asm             -
;    Purpose:                         -
;        Configure the Wytec Rev F    -
;       board to use the LEDs mapped  -
;       on port B and the SWITCHES    -
;       mapped on port H
;                                     -
;    Source:                          -
;       - Wytec User's Manual for     -
;         Rev F board Revision 1.05   -
;         page 21 .asm listing        -
;       - 28 Feb 2013 - D. Haley      -
;         rewrote as a                -
;         Library Subroutine          -
;                                     -
;    Precondition:                    -
;       - A library file that defines -
;         the register mapping must   -
;         be included in the source   -
;         code because this library   -
;         subroutine is dependent     -
;         upon the register mapping   -
;                                     -
;    Use:                             -
;    - Place Config_SWs_and_LEDs.asm  -
;      in C:\68HCS12\Lib              -
;                                     -
;       - insert the following after  -
;         your last line of source    -
;         and before "end"            -
;                                     -
;          #include C:\68HCS12\Lib\   -
;         Config_SWs_and_LEDs.asm     -
;                                     -
;         (Type the above on ONE line -
;                                     -
;       - to call the config routine  -
;                                     -
;         jsr Config_SWs_and_LEDs     -
;                                     -
;    Postcondition:                   -
;        - A destroyed                -
;--------------------------------------
Config_SWs_and_LEDs
        ldaa    #$FF    ; port configuration value
        staa    DDRJ    ; make port J an output port
        staa    DDRB    ; make port B an output port
        staa    DDRP    ; make port P an output port
        staa    PTP     ; turn off 7-segment LED display
        clr     PTJ     ; make PJ1 low to enable LEDs
        clr     PORTB   ; turn off all of the LEDs
        clr     DDRH    ; make port H an input for the switches
        rts
;- ------------------------------------
;    End Config_SWs_and_LEDs.asm      -
;--------------------------------------