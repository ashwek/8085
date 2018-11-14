;Add the number 35H directly to the sum in the previous example (6.3)
;when the CY flas is set

;Previous Example

MVI A, 93H    ;Load 93H in A
MVI C, 0B7H   ;Load B7H in C

ADD C         ;A = A + C

;This Example 

JNC Skip      ;if C == 0, jump to Skip

ADI 35H       ;Add 35H to A

Skip: HLT     ;Halt program
