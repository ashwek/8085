;8085 Program to add
;2 8-bit numbers

         MVI C, 00      ;Store 00 as initial value of carry
         LDA 5000       ;Load 1st value from 5000 memory address in A register
         MOV B, A       ;Copy value of A to B
         LDA 5001       ;Load 2nd value from 5001 memory address in A register
         ADD B          ;Add B to A and store result in A
         STA 5003       ;Store content of A (Result) at memory location 5003
         JNC NoCarry    ;if Carry is not generated, jump to NoCarry Label
         INR C          ;If carry is generated, increment C. (C=0 -> C=1)
NoCarry: MOV A, C       ;Copy content of C to A
         STA 5002       ;Store content of A (Carry) at memory location 5002
         HLT
