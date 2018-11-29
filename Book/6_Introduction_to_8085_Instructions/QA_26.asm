;Load the data byte A8H in register C. Mask the high-order bits (D7-D4), &
;display the low-order bits (D3-D0) at an output port

MVI C, 0A8H   ;Load A8H in C
MOV A, C      ;Copy content of C to A
ANI 0FH       ;Mask High-order bits of A
OUT 00H       ;Display content of A at port 00H
HLT
