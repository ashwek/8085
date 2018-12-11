;A string of 6 data bytes is stored starting from memory location 2050H. The string
;includes some blanks (bytes with zero value). Write a program to eliminate the blanks
;from the string.

;Data (H) F2, 00, 00, 4A, 98, 00


      MVI C, 06H     ;C = 06H (Counter = 6 bytes of data)
      LXI H, 2050H   ;HL = 2050H (Source address)
      LXI D, 2050H   ;DE = 2050H (Destination address)

Loop: MOV A, M       ;A = M (load A from source address)
      ORA A          ;A or A (if A == 0, set Zero flag)
      JZ Skip        ;if Zero, jump to Skip

      STAX D         ;Store A at destination address
      INX D          ;Goto next Destination address

Skip: INX H          ;Goto next source address

      DCR C          ;Decrement counter
      JNZ Loop       ;If Not Zero, jump to Loop

      XRA A          ;A xor A (A = 0)
      STAX D         ;store 0 at destination address to mark end of string
      
      HLT