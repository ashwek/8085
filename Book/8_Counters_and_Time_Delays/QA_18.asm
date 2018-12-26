;Use clock frequency of your system in the following assignments

;A railway crossing signal has 2 flashing lights run by a microcomputer. One
;light is connected to data bit D7 & the second light is connected to data bit D6.
;Write a program to turn each signal light alternately on & off at an interval
;of 1 second.


       HLT            ;Add comment to run program (Runs in infinite loop)

       MVI B, 80H     ;Initially B = 80H (D7 = 1, D6 = 0)

 Loop: MOV A, B       ;A = B
       OUT 00H        ;Output at 00H

       LXI D, COUNT   ;DE = COUNT (Delay = 1 Sec) (calculate COUNT according to required Clock frequency)
Delay: DCX D          ;Decrement DE
       MOV A, E       ;A = E
       ORA D          ;A or D
       JNZ Delay      ;If Not Zero (D != 00 or E != 00), jump to Delay

       MOV A, B       ;A = B
       RAL            ;Rotate Left (D7 shifts to Carry bit)
       CMC            ;Complement Carry Bit (D7 bit)
       RAL            ;Rotate Left (D6 shifts to Carry Bit)
       CMC            ;Complement carry bit (D6 bit)
       RAR            ;Rotate Right (Carry shifts to D7) 
       RAR            ;Roatate Right (D7 shiftes to D6, Carry shifts to D7)
       MOV B, A       ;B = A
       
       JMP Loop       ;Jump to Loop


;T-States = 66 + (24)*Count
;Time_Delay = T-States * Clock_Period
;1 seconds = (66 + (24)*Count) * Clock_Period