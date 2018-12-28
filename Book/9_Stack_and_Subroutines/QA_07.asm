;In Assignment 6, display the sum and the flag status at
;2 different output ports


LXI SP, 3000H   ;Initialize StackPointer to 3000H

MVI A, 7AH      ;A = 7AH

ADI 46H         ;A = A + 46H

OUT 01H         ;Output A (Sum) at 01H

PUSH PSW        ;Push A+PSW to Stack
POP H           ;Pop Stack to HL (H = A, L = Flag status)

MOV A, L        ;A = L
OUT 00H         ;Output A (Flag status) at 01H

HLT