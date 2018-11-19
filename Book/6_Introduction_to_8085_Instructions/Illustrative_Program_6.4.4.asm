;Testing of the Carry Flag

;Load the hex number 9BH and A7H in register D & E, respectively, & add the numbers. If the
;sum is greater than FFH, display 01H at output PORT0; otherwise, display the sum
         
         MVI D, 9BH    ;Load 9BH in D
         MVI E, 0A7H   ;Load A7H in E

         MOV A, D      ;Copy D to A
         ADD E         ;A = A + E

         JNC Display   ;if Sum is not larger than FF (Carry is not gerated) jump to Display
         MVI A, 01H    ;else store 01H in A

Display: OUT 00H       ;Display content of A on port 00H

         HLT           ;Halt program
