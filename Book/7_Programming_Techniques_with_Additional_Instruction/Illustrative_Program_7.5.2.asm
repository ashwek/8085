;Use of Compare Instruction to Indicate End of Data String

;A set of current readings is stored in memory locations starting at XX50H. The end of the data
;string is indicated by the data byte 00H. Add the set of readings. The answer may be larger than
;FFH. Display the entire sum at PORT1 & PORT2 or store the answer in the memory location XX70H & XX71H.

;Assume XX = 20H

      LXI H, 2050H   ;HL = 2050H (Source addr)
      MVI B, 00H     ;B = 00H (initial sum = 0)
      MOV C, B       ;C = B (initial carry = 0)

Loop: MOV A, M       ;A = M (load value from source address)

      CPI 00H        ;Compare A with 00H
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