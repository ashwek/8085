;Write instruction to add the contents of the memory location 2040H to (A), & subtract the content of
;the memory location 2041H from the first sum. Assume the accumulator has 30H, the memory location 2040H
;has 68H, & the location 2041H has 7FH.

MVI A, 30H     ;A = 30H
LXI H, 2040H   ;HL = 2040H

ADD M          ;A = A + M (M = data at HL (2040H))

INX H          ;HL = HL + 1

SUB M          ;A = A - M (M = data at HL (2041H))

HLT