;Generating Pulse Waveforms

;Write a program to generate a continous square wave with the period of 500 microseconds.
;Assume the system clock period is 325 nanosecond, and use bit D0 to output square wave


       HLT            ;Add comment to run program (Runs in infinite loop)

       MVI A, 00H   ;A = 00H
Start: OUT 00H      ;Output to 00H

Delay: MVI B, 35H   ;COUNT = 35H(for 250 MicroSec) (Calculated according to Delay required, Clock Period & T-States)
       DCR B        ;Decrement COUNT
       JNZ Delay    ;If Not Zero, jump to delay

       INR A        ;A = A + 1
       ANI 01H      ;A and 01 ( switch between 0 and 1 - for square wave )

       JMP Start    ;Jump to Start


;T-States = 31 + (14)*Count
;Time_Delay = T-States * Clock_Period
;Count = (53)10 => (35)16
