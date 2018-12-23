;Use clock frequency of your system in the following assignments

;Write a program to count 0 to 20H with a delay of 100 ms between each
;count. After the count 20H, the counter should reset itself & repeat the sequence.
;Use register pair DE as a delay register. Draw a flowchart & show your
;calculations to set up the delay 100 ms delay

       HLT            ;Add comment to run program (Runs in infinite loop)

Start: MVI B, 00H     ;Initially B = 0

 Loop: MOV A, B       ;A = B
       OUT 00H        ;Output at 00H

       LXI D, 0001H   ;DE = COUNT (calculate COUNT according to required Clock frequency)
Delay: DCX D          ;Decrement DE
       MOV A, E       ;A = E
       ORA D          ;A or D
       JNZ Delay      ;If Not Zero (D != 00 or E != 00), jump to Delay

       INR B          ;B = B + 1
 
       MOV A, B       ;A = B
       CPI 21H        ;Compare A with 21H
       JC Loop        ;If Carry (A < 21H), jump to Loop

       JMP Start      ;Jump to Start

;T-States = 42 + (24)*Count
;Time_Delay = T-States * Clock_Period
;100 ms = (42 + (24)*Count) * Clock_Period
