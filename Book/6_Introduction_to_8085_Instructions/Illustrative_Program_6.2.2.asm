;Arithmetic Operations - Addition and Increment

;Write a program to perform the following, & verify output
;1. Load the number 8BH in register D
;2. Load the number 6FH in register C
;3. Increment the content of register C by one
;4. Add content of register C and D and display the sum at the output PORT1

;Assume PORT1 = 01H

MVI D,  8BH   ;Load 8BH in D
MVI C, 6FH    ;Load 6FH in C
INR C         ;Increment C

MOV A, C      ;Copy C into A 
ADD D         ;A = A + D
OUT 01H       ;display the sum at 01H

HLT           ;Halt program
