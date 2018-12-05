;Write instructions to
;
;1. Load 59H in memory location 2040H, & increment the contents of the
;memory location
;2. Load 90H in memory location 2041H, & decrement the content of the
;memory location.


LXI H, 2040H   ;HL = 2040H

MVI M, 59H     ;M = 59H (value in 2040H = 59H)
INR M          ;M = M + 1

INX H          ;HL = HL + 1

MVI M, 90H     ;M = 90H (value in 2041H = 90H)
DCR M          ;M = M - 1

HLT