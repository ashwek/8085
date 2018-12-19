;A set of 10 bytes is stored in memory starting with the address XX50H. Write a
;program to check each byte, & save the bytes that are higher than (60)10 & lower
;than (100)10 in memory location starting from XX60H

;Data (H) : 6F, 28, 5A, 49, C7, 3F, 37, 4B, 78, 64

;Assyme XX = 20

      MVI C, 0AH     ;C = 0AH (Counter = 10 data bytes)
      LXI H, 2050H   ;HL = 2050H (Source address)
      LXI D, 2060H   ;DE = 2060H (Destination Address)

Loop: MOV A, M       ;A = M (Load data from source address)
      CPI 3CH        ;Compare A with 3CH (60)
      JC Skip        ;If Carry (A < 60), jump to Skip

      CPI 64H        ;Compare A with 64H (100)
      JNC Skip       ;If No Carry (A > 100), jump to Skip

      STAX D         ;Store A at destination address
      INX D          ;Increment destination address
      
Skip: INX H          ;Goto next source address
      DCR C          ;Decrement counter
      JNZ Loop       ;If not Zero, jump to Loops

      HLT