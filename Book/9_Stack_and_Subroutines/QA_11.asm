;Write a program to control a railway crossing signal that has two
;alternately flashing red lights, with a 1-second delay on time for
;each light

;Assuming 1st light At D7 and 2nd at D6


Start: MVI B, 80H   ;B = 80H (D7 = 1)
       MOV A, B     ;A = B
       OUT 00H      ;Output

       CALL DELAY   ;Call 1 second delay

       MOV A, B     ;A = B
       CMA          ;Complement A
       ANI 0C0H      ;Mask all bits except D7 & D6
       MOV B, A     ;B = A

       OUT 00H      ;Output at port 00H

       CALL DELAY   ;Call 1-second delay

       JMP Start    ;Jump to Start

;SubRoutine for Generate 1-second delay
DELAY: LXI H, COUNT ;HL = COUNT (Counter for 1 second delay)(value calculated based on t-states & clock frequency)

 Loop: DCX H
       MOV A, L
       ORA H
       JNZ Loop

       RET
