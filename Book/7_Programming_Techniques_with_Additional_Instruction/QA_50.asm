;Refer to assignment 48. Write a program to find the lowest reading in the set,
;& display the reading at output port.

      MVI C, 08H     ;C = 08H (Counter = 8 data bytes)
      LXI H, 2050H   ;HL = 2050H (SOurce address)
      MVI B, 0FFH     ;Initial lowest = FFH

Loop: MOV A, M       ;A = M (load value from source address)
      CMP B          ;Compare A with B

      JNC Skip        ;If Carry (A > B), jump to Skip

      MOV B, A       ;B = A (A = current Lowest)

Skip: INX H          ;Goto next address

      DCR C          ;Decrement counter
      JNZ Loop       ;If not Zero, jump to Loop
      
      MOV A, B       ;A = B (Max)
      OUT 00H        ;Otput Lowest at 00H

      HLT