;A string of readings is stored in memory locations starting at XX70H, and the end
;of the string is indicated by the byte 0DH. Write a program to check each byte in
;the string, & save the bytes in the range of 30H to 39H (Both inclusive) in
;memory locations srating from XX90H

;Data (H) : 35, 2F, 30, 39, 3A, 37, 7F, 31, 0D, 32

;Assume XX = 20


      LXI H, 2070H   ;HL = 2070H (Source Address)
      LXI D, 2090H   ;DE = 2090H (Destination Address)

Loop: MOV A, M       ;A = M (Load data from source address)
      CPI 0DH        ;Compare A with 0DH
      JZ Exit        ;If zero (A == 0DH), jump to Exit

      CPI 30H        ;Compare A with 30H
      JC Skip        ;If Carry (A < 30H), jump to Skip

      CPI 3AH        ;Compare A with 3AH
      JNC Skip       ;If No Carry (A >= 3AH), jump to Skip
      
      STAX D         ;Store A at Destination Address
      INX D          ;Goto next Destination address

Skip: INX H          ;Goto next source address
      JMP Loop       ;Jump to Loop

Exit: HLT