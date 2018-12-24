;Use clock frequency of your system in the following assignments

;Write a program to turn a ligh on and off every 5 seconds. Use data bit
;D7 to operate the light


       HLT            ;Add comment to run program (Runs in infinite loop)

Start: MVI B, 80H     ;Initially B = 80H (D7 = 1)

 Loop: MOV A, B       ;A = B
       OUT 00H        ;Output at 00H

       LXI D, 0001H   ;DE = COUNT (calculate COUNT according to required Clock frequency)
Delay: DCX D          ;Decrement DE
       MOV A, E       ;A = E
       ORA D          ;A or D
       JNZ Delay      ;If Not Zero (D != 00 or E != 00), jump to Delay

       MOV A, B       ;A = B
       RAL            ;Rotate Left (D7 bit goes to carry bit) 
       CMC            ;Complement Carry Bit
       RAR            ;Rotate Right (carry bit shifts to D7 bit)
       MOV B, A       ;B = A
       
       JMP Loop       ;Jump to Loop


;T-States = 54 + (24)*Count
;Time_Delay = T-States * Clock_Period
;5 s = (54 + (24)*Count) * Clock_Period