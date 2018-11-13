;Load the accumulator A with the data byte 82H and save the data in register B

MVI A, 82H   ;Load 82H in A
MOV B, A     ;Copy content of A to B
HLT          ;Halt program
