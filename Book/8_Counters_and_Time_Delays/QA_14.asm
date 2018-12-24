;Use clock frequency of your system in the following assignments

;Design an up-down counter to count from 0 to 9 and 9 to 0 continously with a
;1.5 second delay between each count, & display th count at one of the output
;ports. 


       HLT            ;Add comment to run program (Runs in infinite loop)

Start: MVI B, 00H     ;Initially B = 0
       MVI C, 01H     ;Update Value = 01H (0-9 Up Counter)

 Loop: MOV A, B       ;A = B
       OUT 00H        ;Output at 00H

       LXI D, COUNT   ;DE = COUNT (calculate COUNT according to required Clock frequency)
Delay: DCX D          ;Decrement DE
       MOV A, E       ;A = E
       ORA D          ;A or D
       JNZ Delay      ;If Not Zero (D != 00 or E != 00), jump to Delay

       MOV A, B       ;A = B
       ADD C          ;A = A + C
       MOV B, A       ;B = A
       
       CPI 0FFH       ;Compare A with 0FFH
       JZ Start       ;If Not Zero ( A == -1), jump to Start

       CPI 0AH        ;Compare A with 0AH (10)
       JC Loop        ;If Carry (A < 0AH), jump to Loop

       DCR B          ;B = B - 1
       MVI C, 0FFH    ;C = FFH (-1) (9-0 Down Counter)
       JMP Loop       ;Jump to Loop


;T-States = 80 + (24)*Count
;Time_Delay = T-States * Clock_Period
;1.5 s = (80 + (24)*Count) * Clock_Period