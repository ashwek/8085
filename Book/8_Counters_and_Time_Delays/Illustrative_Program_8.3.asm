;Zero-To-Nine (Modulo Ten)* Counter

;Write a program to count from 0-9 with a 1-second delay between each count. At the
;count of 9, the counter should reset itself to 0 & repeat the sequence continously. Use
;register pair HL to set up the delay, & display each count at 1 of the output
;ports. Assume clock frequency of the microcomputer is 1 MHz.


       HLT            ;Add comment to run program (Runs in infinite loop)
       
Start: MVI B, 00H     ;B = 00H (Initially count start from 00H)

 Loop: MOV A, B       ;A = B
       OUT 00H        ;Display at output port

       LXI H, 42C2H   ;COUNT = 42C2HH (Calculated according to Delay required, Clock Period & T-States)
Delay: DCX H          ;Decrement COUNT
       MOV A, H       ;A = H
       ORA L          ;A or L
       JNZ Delay      ;If Not Zero, jump to Delay

       INR B          ;Increment Value

       MOV A, B       ;A = B
       CPI 0AH        ;Compare A with 0AH (10)
       JNZ Loop       ;if not zero (A != 10), jump to Loop
       
       JMP Start      ;Jump to Start


;T-States = 49 + (24)*Count
;Time_Delay = T-States * Clock_Period
;Count = (41665)10 => (A2C2)16
