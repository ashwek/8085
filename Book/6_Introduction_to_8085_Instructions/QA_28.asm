;Load the bit pattern 91H in register B & 87H in C. Mask all bits except D0 from register B & C.
;if D0 is at logic 1 in both registers, turn on the light connected to the D0 postition of output
;port 01H; otherwise turn off the light.

MVI B, 91H   ;Load 91H in B
MOV A, B     ;Copy content of B to A
ANI 01H     ;mask all bits except D0 in A
MOV B, A     ;copy content of A to B

MVI C, 87H   ;Load 87H in C
MOV A, C     ;copy content of C to A
ANI 01H     ;mask all bits excpet D0 in A

ANA B        ;AND B with A

;if D0 in both is logic 1, A will be 01H. else A will be 00H

OUT 01H      ;Output A at port 01H

HLT
