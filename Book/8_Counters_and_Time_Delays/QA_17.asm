;Use clock frequency of your system in the following assignments

;Write a program to generate a square wave with period of 400 microseconds. Use
;bits D0 to operate the square wave


;           HLT             ;Add comment to run program (Runs in infinite loop)

     Loop: MVI A, 01H      ;A = 01H (on-period)
           OUT 00H         ;Output at 00H

           LXI D, On_Cnt   ;DE = On_Cny (Delay = 200 MicroSec) (calculate COUNT according to required Clock frequency)
 On_Delay: DCX D           ;Decrement DE
           MOV A, E        ;A = E
           ORA D           ;A or D
           JNZ On_Delay    ;If Not Zero (D != 00 or E != 00), jump to Delay

           MVI A, 00H      ;A = 00H (off-period)
           OUT 00H         ;Output at 00H

           LXI D, Off_Cnt  ;DE = Off_Cnt (Delay = 400 MicroSec) (calculate COUNT according to required Clock frequency)
Off_Delay: DCX D           ;Decrement DE
           MOV A, E        ;A = E
           ORA D           ;A or D
           JNZ Off_Delay   ;If Not Zero (D != 00 or E != 00), jump to Delay

           JMP Loop        ;Jump to Loop


;T-States = 14 + (24)*Count
;Time_Delay = T-States * Clock_Period
;200 microseconds = (14 + (24)*Count) * Clock_Period
;400 microseconds = (14 + (24)*Count) * Clock_Period