;Data Transfer - From Register to Output Port

;Load the hexadecimal number 37H in register B, & display the number
;at the output port labeled PORT1

;Assume PORT1 = 01H

MVI B, 37H   ;Load 37H in B register
MOV A, B     ;copy content of B into A
OUT 01H      ;Output content of A at port 01H
HLT          ;HALT program
