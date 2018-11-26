;Write a program using the ADI instruction to add the two hex numbers
;3AH and 48H & to display the answer at output port

MVI A, 3AH   ;Load 3AH in A

ADI 48H      ;Add 48H with A

OUT 00H      ;Output Sum at port 00H

HLT
