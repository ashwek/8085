;Write a program to clear the intial flags. Load data byte FFH into the accumulator
;and add 01H to the byte FFH by using the instruction ADI. Mask all the flags except
;the CY flag and display the CY flag at PORT0. Repeat the program by replacing the ADI
;instruction with the INR instruction and the byte 01H with the NOP instruction. Display
;the flag at PORT1.


LXI SP, 3000H   ;StackPointer = 3000H
LXI H, 0000H    ;HL = 0000H

PUSH H          ;Push HL to stack
POP PSW         ;Pop stack to PSW (clearing A & Flags)

MVI A, 0FFH     ;A = FFH
ADI 01H         ;A = A + 01H

PUSH PSW        ;Push PSW (A + Flags) to Stack
POP H           ;Pop Stack to HL, (H = A, L = Flags)
MOV A, L        ;A = L
ANI 01H         ;Mask all bits except D0 (CY)

OUT 00H         ;Output A at port 00H

LXI H, 0000H    ;HL = 0000H

PUSH H          ;Push HL to stack
POP PSW         ;Pop stack to PSW (clearing A & Flags)

MVI A, 0FFH     ;A = FFH
INR A           ;A = A + 1

PUSH PSW        ;Push PSW (A + Flags) to Stack
POP H           ;Pop Stack to HL, (H = A, L = Flags)
MOV A, L        ;A = L
ANI 01H         ;Mask all bits except D0 (CY)

OUT 01H         ;Output at Port 01H

HLT