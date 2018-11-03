;8085 Program to sub
;2 8-bit numbers

          MVI C, 00      ;Store 00 as initial value of borrow
          
          LDA 5000       ;Load 1st value from 5000 memory address in A register
          MOV B, A       ;Copy value of A to B
          
          LDA 5001       ;Load 2nd value from 5001 memory address in A register
          
          SUB B          ;Sub B from A and store result in A
          
          STA 5003       ;Store content of A (Result) at memory location 5003
          
          JNC NoBorrow    ;if Borrow is not generated, jump to NoBorrow Label
          INR C          ;If borrow is generated, increment C. (C=0 -> C=1)
          
NoBorrow: MOV A, C       ;Copy content of C to A

          STA 5002       ;Store content of A (Borrow) at memory location 5002
          
          HLT
