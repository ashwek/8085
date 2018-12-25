;Use clock frequency of your system in the following assignments

;Write a program to generate a square wave with period of 400 microseconds. Use
;bits D0 to operate the square wave


;       HLT            ;Add comment to run program (Runs in infinite loop)

       MVI B, 00H     ;Initially B = 00H (D0 = 0)

 Loop: MOV A, B       ;A = B
       OUT 00H        ;Output at 00H

       LXI D, COUNT   ;DE = COUNT (Delay = 200 MicroSec) (calculate COUNT according to required Clock frequency)
Delay: DCX D          ;Decrement DE
       MOV A, E       ;A = E
       ORA D          ;A or D
       JNZ Delay      ;If Not Zero (D != 00 or E != 00), jump to Delay

       INR B          ;B = B + 1
       MOV A, B       ;A = B
       ANI 01H        ;A and 01H (mask D7-D1) 
       MOV B, A       ;B = A
       
       JMP Loop       ;Jump to Loop


;T-States = 53 + (24)*Count
;Time_Delay = T-States * Clock_Period
;200 microseconds = (53 + (24)*Count) * Clock_Period
