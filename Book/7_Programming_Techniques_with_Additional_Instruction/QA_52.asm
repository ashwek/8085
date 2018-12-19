;In Assignment 51, in addition to saving the bytes in the given range,
;display at PORT1 the number of bytes saved

      MVI C, 0AH     ;C = 0AH (Counter = 10 data bytes)
      LXI H, 2050H   ;HL = 2050H (Source address)
      LXI D, 2060H   ;DE = 2060H (Destination Address)
      MVI B, 00H     ;B = 00H (initial bytes saved = 0)

Loop: MOV A, M       ;A = M (Load data from source address)
      CPI 3CH        ;Compare A with 3CH (60)
      JC Skip        ;If Carry (A < 60), jump to Skip

      CPI 64H        ;Compare A with 64H (100)
      JNC Skip       ;If No Carry (A > 100), jump to Skip

      STAX D         ;Store A at destination address
      INX D          ;Increment destination address
      INR B          ;Increment bytes saved
      
Skip: INX H          ;Goto next source address
      DCR C          ;Decrement counter
      JNZ Loop       ;If not Zero, jump to Loops

      MOV A, B       ;A = B
      OUT 00H        ;Output at 00H

      HLT