;Wrte instruction to load 2 unsigned numbers in register B & register C, respectively. Subtract
;(C) from (B). If the result in 2's complement, convert the result in absolute magnitude & display
;it at PORT1; otherwise display the +ve result. Execute the program with following set of data
;       Set 1 : (B) = 42H, (C) = 69H
;       Set 2 : (B) = 69H, (C) = 42H
;       Set 3 : (B) = F8H, (C) = 23H


         MVI B, 69H   ;B = 69H
         MVI C, 42H   ;C = 42H

         MOV A, B     ;A = B
         SUB C        ;A = A - C

         JP Display   ;if Answer is +ve, jump to Display

         CMA          ;Else, complement A (1's complement)
         INR A        ;A = A + 1 (2's complement)

Display: OUT 01H      ;Display answer at port 01H

         HLT