;Register B has 65H and the accumulator has 97H. Subtract teh contents of register
;B from the contents of the accumulator

MVI B, 65H   ;Load 65H in B
MVI A, 97H   ;Load 97H in A

SUB B        ;A = A - B

HLT          ;Halt Program
