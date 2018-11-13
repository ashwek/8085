;Subtracting 2 hex numbers and storing the result in memory

;Write instructions to subtract 2 bytes stored in memory locations
;2051H and 2052H. Location 2051H holds the byte 49H & location 2052H
;holds the byte 9FH. Subtract the first byte, 49H, from the second
;byte, 9FH, and store the asnwer in memory location 2053H. Write
;instructios beginning at memory location 2030H.

LDA 2051H   ;Load 1st value (49H) in A
MOV B, A    ;copy 49H to B register

LDA 2052H   ;Load 2nd value (9FH) in A

SUB B       ;A = A - B

STA 2053H   ;Store result in memory

HLT         ;HALT program
