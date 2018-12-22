;Hexadecimal Counter

;Write a program to count continiously in hexadecimal form FFH to 00h
;in a system with a 0.5 MicroSecond clock period. Use register C to set
;up a one millisecond delay between each count and display the number at
;one of the output ports.


       HLT            ;Add comment to run program (Runs in infinite loop)
       
       MVI A, 0FFH    ;A = FFH (Initially count start from FFH)

 Loop: OUT 00H        ;Display at output port

       MVI C, 8DH     ;COUNT = 8DH (Calculated according to Delay required, Clock Period & T-States)
Delay: DCR C          ;Decrement counter
       JNZ Delay      ;If Not Zero, jump to Delay

       DCR A          ;Decrement Value
       JMP Loop       ;Goto Start


;T-States = 31 + (14) Count
;Time_Delay = T-States * Clock_Period
;Count = (141)10 => (8D)16
