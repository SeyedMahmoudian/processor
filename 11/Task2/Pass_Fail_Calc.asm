; Pass_Fail_Calc.asm

#include c:\68hcs12\registers.inc

; Author(s) and Student Numbers():
; Date:
; Purpose:      Calculate if a student has passed both the Theory and Practical
;               portions of the course. Display a 'P' if both portions passed;
;               otherwise, display an 'F'. Display the values for 1 second each
;               (e.g. 4 delay cycles of 250 ms each) Then, blank the display for
;               the same amount of time and then continue on with the values.
;                Once all of the result are displayed, blank the display
;
;               Note that there is only ONE 'P' or 'F' displayed per student
;
; Program Constants
DELAY_VALUE     equ     250
STACK           equ     $2000

DIGIT3_PP0      equ     %0111

BLANK           equ     1

PRACTICAL       equ     5       ; number of practical assesments
THEORY          equ     3       ; number of theory assesments


; data section
                org     $1000
; Read in Data File
Start_Course_Data
#include "Demo.txt"
;uncomment following line for final demo
; #include "Thu_10-12_Marks.txt"
End_Course_Data

Students_Marks
        ds      (End_Course_Data-Start_Course_Data)/(PRACTICAL+THEORY)
End_Students_Marks

; code section
        org     $2000           ; RAM address for Code
        lds     #STACK          ; Stack
        jsr     Config_Hex_Displays ; Configure HEX display by calling the subrotin
        ldy     #Start_Course_Data  ; Point y to the beginning of file
        ldx     #Students_Marks     ; Point x to the beginning of array

Next_Student
        cpx     #End_Students_Marks     ;End of students
        bhs     Display_Mark            ;pass/fail array?
        pshx
        
        ldab    #PRACTICAL
        jsr     Calculate_Average
        
        jsr     Pass_Fail
        pulx
        staa    0,x
        pshx
        
        ldab    #PRACTICAL      ; Move y to point to theory
        aby                     ; data for this student
        
        ldab    #THEORY         ; Theory calculation
        jsr     Calculate_Average
        
        jsr     Pass_Fail
        
        ldab    #THEORY         ; Move y to point the next
        aby                     ; students practical data
        
        pulx                    ; Save student final grades
        anda    0,x             ; AND the grade in A with the
        staa    1,x+            ; Student's practical grade
        pshx
        bra     Next            ; Move to next student

Display_Mark
        ldx     #Students_Marks
Next_Display
        ldab    #DIGIT3_PP0
        cpx     #End_Students_Marks
        bhs     Done
        
        ldaa    1,x+
        pshx
        jsr     PF_HEX_DISPLAY
        ;Keep pass or fail on display for 1 second
        ldaa    #DELAY_VALUE
        jsr     Delay_ms

        ldaa    #DELAY_VALUE
        jsr     Delay_ms

        ldaa    #DELAY_VALUE
        jsr     Delay_ms

        ldaa    #DELAY_VALUE
        jsr     Delay_ms
        ; blank display for 1 second
        ldaa    #BLANK
        jsr     PF_HEX_Display

        ldaa    #DELAY_VALUE
        jsr     Delay_ms

        ldaa    #DELAY_VALUE
        jsr     Delay_ms

        ldaa    #DELAY_VALUE
        jsr     Delay_ms

        ldaa    #DELAY_VALUE
        jsr     Delay_ms
        
        pulx
        bra     Next_Display
Done    bra     Done                            ; yes

#include Calculate_Average.asm
#include Pass_Fail.asm
#include PF_HEX_Display.asm
#include C:\68HCS12\\Lib\Config_Hex_Displays.asm
#include C:\68HCS12\Lib\Delay_ms.asm
        end