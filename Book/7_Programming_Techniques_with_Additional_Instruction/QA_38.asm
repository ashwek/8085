;Repeat the Illustritative Program in Section 7.4.2 with the following modifications:
;a. Check the sign of a number by using the instruction JM, instead
;of the RAL
;b. If the sum of the positive readings exceeds 8 bits, continue the addition,
;save the generated carry, & display the total sum at 2 different ports.

;Data (H) : 48, 72, 8F, 7F, 6B, F5, 98, 7C, 67, 19


          LXI H, 2060H   ;HL = 2060H (Source addr)
          MVI C, 0AH     ;C = 0AH (counter = 10 bytes)
          MVI B, 00H     ;B = 00H (initial sum = 0)
          MVI D, 00H     ;Initial carry = 00H

    Loop: MOV A, M       ;A = M (load data from HL (source addr))

          ORA A          ;A or A (to modify flags)
          JM Skip        ;If Minus, jump to Skip

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

          HLT