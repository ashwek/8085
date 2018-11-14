;The contents of the accumulator are 93H and the content of register
;C are B7H. Add both content

MVI A, 93H    ;Load 93H in A
MVI C, 0B7H   ;Load B7H in C

ADD C         ;A = A + C

HLT           ;Halt Program
