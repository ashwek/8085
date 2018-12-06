;Addition with Carry
;
;Six bytes are stored in memory locations starting at XX50H. Add all the data bytes. Use register B to save
;any carries generated, while adding the data bytes. Display the entire sumat 2 output ports, or store the
;sum at two consecutive memory locations, XX70H and XX71H.

;Assume XXH = 20H

      LXI H, 2050H   ;HL = 2050H
      MVI C, 06H     ;C = 06H (Counter - 6 bytes)
      XRA A          ;A = 0 (initial sum = 0)
      MOV B, A       ;B = A (initial carry = 0)

Loop: ADD M          ;A = A + M (M = data at memory location in HL)
      JNC Skip       ;if carry is not generated, jump to Skip
      INR B          ;B = B + 1 (if carry is generated)
Skip: INX H          ;HL = HL + 1 (goto next addr)
      DCR C          ;Decrement counter
      JNZ Loop       ;if Counter != 0, jump to Loop

      STA 2070H      ;Store A (sum) at location 2070H
      MOV A, B       ;A = B
      STA 2071H      ;Store A (carry) at location 2071H

      HLT