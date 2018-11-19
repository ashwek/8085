;Subtraction of 2 Unsigned Numbers

;Write a program to do the following
;1. Load the number 30H in register B & 39H in register C
;2. Subtract 39H from 30H
;3. Display asnwer at PORT1

;Assume PORT1 = 01H

MVI B, 30H   ;Load 30H in B
MVI C, 39H   ;Load 39H in C

MOV A, B     ;Copy B into A
SUB C        ;A = A - C

OUT 01H      ;Display asnwer at 01H

HLT          ;Halt program
