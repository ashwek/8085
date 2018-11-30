;Load the data byte 8EH in register D & F7H in register E. Mask the high-order bits (D7-D4) from both data
;bytes, Exclusive-OR the low-order bits (D3-D0) and display the answer

MVI D, 8EH    ;Load 8EH in D
MOV A, D      ;Copy content of D to A
ANI 0FH       ;Mask high-order bits of A
MOV D, A      ;Copy content of A to D

MVI E, 0F7H   ;Load F7H in E
MOV A, E      ;Copy content of E to A
ANI 0FH       ;Mask High-order bits of A

XRA D         ;XOR A with D

OUT 00H       ;Display answer at port 00H

HLT
