;Write a program to meet the following specification:
;A. intitialize the stack pointer register at XX99H
;B. Clear the memory locations starting from XX90H to XX9FH
;C. Load register pairs B, D and H with data 0237H, 1242H,
;   and 4087H, respectively
;D. Push the contenets of the register pairs B, D and H on the stack
;E. Execute the program and verify the memory locations from XX90H to XX9FH

;Assume XX = 20

       LXI SP, 2099H   ;StackPointer = 2099H

       MVI A, 10H      ;A = 10H (16) (bytes from 2090H to 209FH)
       LXI H, 2090H    ;HL = 2090H

Clear: MVI M, 00H      ;Clear Memory (pointed by HL)
       INX H           ;Goto next address
       DCR A           ;Decrement Counter
       JNZ Clear       ;If Not Zero, jump to Clear

       LXI B, 0237H    ;BC = 0237H
       LXI D, 1242H    ;DE = 1242H
       LXI H, 4087H    ;DL = 4087H

       PUSH B          ;Push BC to stack
       PUSH D          ;Push DE to stack
       PUSH H          ;Push DL to stack

       HLT