;Repeat the Illustrative program 7.5.2, but include the following modifications:
;clear register D & use CMP D to check a byte in the memory location. If a byte is not
;zero, add the byte & countinue adding; otherwise, go to the output

      LXI H, 2050H   ;HL = 2050H (Source addr)
      MVI B, 00H     ;B = 00H (initial sum = 0)
      MOV C, B       ;C = B (initial carry = 0)

Loop: MOV A, M       ;A = M (load value from source address)

      MVI D, 00H     ;D = 00H
      CMP D          ;Compare A with D
      JZ Exit        ;if A == 0, jump to Exit

      ADD B          ;A = A (new value) + B (previous sum)
      JNC Skip       ;If carry is not generated, jump to Skip

      INR C          ;C = C + 1 (increment carry)

Skip: MOV B, A       ;B = A (new sum)
      INX H          ;HL = HL + 1 (goto next addr)
      JMP Loop       ;Jump to Loop

Exit: MOV A, B       ;A = B (Sum)
      STA 2070H      ;Store A at 2070H
      MOV A, C       ;A = C (Carry)
      STA 2071H      ;Store A at 2071H
      HLT