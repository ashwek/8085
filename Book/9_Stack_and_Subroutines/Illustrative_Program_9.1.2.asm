;Resetting and Displaying Flags

;Write a program to perform the following functions:
;1. Clear all the flags
;2. Load 00H in the accumulator, & demonstarate that the Zero flag is not
;   affected by the data transfer instruction
;3. Logically OR the accumulator with itself to set the Zero flag, & display
;   the flag at PORT1 or store all the flags on the stack


LXI SP, 3000H   ;StackPointer = 3000H
LXI H, 0000H    ;HL = 0000H

PUSH H          ;Push HL to stack (Low-order on Top)
POP PSW         ;Pop stack & place data in PSW (A + Flag)

MVI A, 00H      ;A = 00H
PUSH PSW        ;Push (A + Flag) to stack
POP H           ;Pop stack into HL
MOV A, L        ;A = L
OUT 00H         ;Output at 00H

ORA A           ;A or A
PUSH PSW        ;Store flags in stack

HLT