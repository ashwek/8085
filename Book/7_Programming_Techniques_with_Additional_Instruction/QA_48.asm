;A set of 8 readings is stored in memory starting at location XX50H. Write a program
;to check whether a byte 40H exists in the set. If it does, stop checking
;& display its memory location; otherwise output FFH

;Data (H) : 48, 32, F2, 38, 37, 40, 82, 8A

;Assume XX = 20

      MVI C, 08H     ;C = 08H (Counter = 8 data bytes)
      LXI H, 2050H   ;HL = 2050H (SOurce address)

Loop: MOV A, M       ;A = M (load value from source address)
      CPI 40H        ;Compare with 40H

      JNZ Skip       ;If not Zero (A != 40H), jump to Skip

      MOV A, L       ;A = L (low-order address)
      OUT 00H        ;Output low-order at 00H
      MOV A, H       ;A = H (high-order address)
      OUT 01H        ;Output high-order at 01H
      HLT

Skip: INX H          ;Goto next address

      DCR C          ;Decrement counter
      JNZ Loop       ;If not Zero, jump to Loop
      
      MVI A, 0FFH    ;If 40H not found in data, A = FFH
      OUT 00H        ;Otput FFH at 00H

      HLT