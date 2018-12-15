;In assignment 38, in addition to modification a & b, count the number of
;possitive readings in the set & display the count at PORT3


          LXI H, 2060H   ;HL = 2060H (Source addr)
          MVI C, 0AH     ;C = 0AH (counter = 10 bytes)
          MVI B, 00H     ;B = 00H (initial sum = 0)
          MVI D, 00H     ;Initial carry = 00H
          MVI E, 00H     ;Initial count of +ve numbers = 0

    Loop: MOV A, M       ;A = M (load data from HL (source addr))

          ORA A          ;A or A (to modify flags)
          JM Skip        ;If Minus, jump to Skip

          INR E          ;Increment +ve number count

          ADD B          ;A = A (new value) + B (previous sum)
          JNC Overload   ;If no carry, jump to Overload

          INR D          ;Incermenet carry

Overload: MOV B, A       ;B = A (B = new sum)

    Skip: INX H          ;HL = HL + 1 (next addr)
          DCR C          ;Decrement counter
          JNZ Loop       ;if counter != 0, jump to Loop

          MOV A, B       ;A = B (B = sum)
          OUT 00H        ;Output Sum

          MOV A, D       ;A = D (D = Carry)
          OUT 01H        ;Output Carry

          MOV A, E       ;A = E (E = +ve number count)
          OUT 02H        ;Output Carry

          HLT