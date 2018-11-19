;Write instructions to load hex number 65H in register C, and 92H in accumulator A.
;Display number 65H at PORT0 and 92H in PORT1

MVI C, 65H   ;Load 65H in C
MVI A, 92H   ;Load 92H in A

OUT 01H      ;Output A on PORT1 01H

MOV A, C     ;Copy content of C to A
OUT 00H      ;Output A on PORT1 01H

HLT
