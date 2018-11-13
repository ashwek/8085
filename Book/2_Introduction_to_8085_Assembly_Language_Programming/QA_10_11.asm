;10. Write logical steps to add the following Hex numbers. Both the numbers
;should be saved for future use. Save the sum in the accumulator
;      Numbers : A2H and 18H

;11. Translate the program in Question 10 into the 8085 assembly language


MVI A, 0A2H  ;Stor A2H in Accumulator
STA 2051H    ;Store A2H in memory location 2051H (For future use)

MVI A, 18H   ;Stor 18H in Accumulator
STA 2052H    ;Store 18H in memory location 2052H (For future use)

MOV B, A     ;Copy 18H into B register

LDA 2051H    ;Load content of 2051H (A2H) into A

ADD B        ;A = A + B

STA 2053H    ;Store result at memory location 2053H

HLT          ;Halt program
