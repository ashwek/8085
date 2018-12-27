;Write a program to add the 2 Hex numbers 7A & 46 & to store the sum
;at memory location XX98H & the flag status at XX97H.

;Assume XX = 20

LXI SP, 3000H   ;Initialize StackPointer to 3000H

MVI A, 7AH      ;A = 7AH

ADI 46H         ;A = A + 46H

STA 2098H       ;Store A (Sum) at 2098H

PUSH PSW        ;Push A+PSW to Stack
POP H           ;Pop Stack to HL (H = A, L = Flag status)

MOV A, L        ;A = L
STA 2097H       ;Store A (Flag status) at 2098H

HLT