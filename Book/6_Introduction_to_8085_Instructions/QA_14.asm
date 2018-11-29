;Write instruction to
;a. Load 00H in the accumulator
;b. decrement the accumulator
;c. display the answer

MVI A, 00H   ;Load 00H in A
DCR A        ;Decrement A
OUT 00H      ;Display A at port 00H
HLT
