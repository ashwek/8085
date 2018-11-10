;Program to check if a number at 5000 is Even
;or Odd. Store result at location 5001. 0 if Odd
;and 1 if Even


      MVI B, 01H   ;Load initial result as 1 (Even)

      LDA 5000     ;Load value from memory location 5000 into A

 Div: SBI 02H      ;Subtract 2 from A. A = A - 2
      JNC Div      ;if No Carry, jump to Div label
      ADI 02H      ;Add 2 to A. A = A + 2

      JZ Skip      ;if A = 0, jumo to Skip

      DCR B        ;if A != 0, Number is odd. decrement B

Skip: MOV A, B     ;copy result in A
      STA 5001     ;store result at memory location 5001

      HLT          ;HALT program
