;Write a program to simulate a flashing yellow light with 750 ms on time.
;Use bit D7 to control the light


Start: MVI B, 80H   ;B = 80H (D7 = 1)
       MOV A, B     ;A = B
       OUT 00H      ;Output

       CALL DELAY   ;Call 750ms delay

       MOV A, B     ;A = B
       CMA          ;Complement A
       ANI 80H      ;Mask all bits except D7
       MOV B, A     ;B = A

       OUT 00H      ;Output at port 00H

       CALL DELAY   ;Call 750ms delay

       JMP Start    ;Jump to Start

;SubRoutine for Generate 750-milisecond delay
DELAY: LXI H, COUNT ;HL = COUNT (Counter for 750-milisecond delay)(value calculated based on t-states & clock frequency)

 Loop: DCX H
       MOV A, L
       ORA H
       JNZ Loop

       RET