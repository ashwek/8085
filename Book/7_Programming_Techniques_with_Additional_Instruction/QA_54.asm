;In Assignment 53, display the number of bytes accepted from the string
;between 30H and 39H


      LXI H, 2070H   ;HL = 2070H (Source Address)
      LXI D, 2090H   ;DE = 2090H (Destination Address)
      MVI C, 00H     ;C = 00H (Initial number of bytes accepted = 0)

Loop: MOV A, M       ;A = M (Load data from source address)
      CPI 0DH        ;Compare A with 0DH
      JZ Exit        ;If zero (A == 0DH), jump to Exit

      CPI 30H        ;Compare A with 30H
      JC Skip        ;If Carry (A < 30H), jump to Skip

      CPI 3AH        ;Compare A with 3AH
      JNC Skip       ;If No Carry (A >= 3AH), jump to Skip
      
      STAX D         ;Store A at Destination Address
      INX D          ;Goto next Destination address
      INR C          ;Increment bytes accepted

Skip: INX H          ;Goto next source address
      JMP Loop       ;Jump to Loop

Exit: MOV A, C       ;A = C (bytes accepted)
      OUT 00H        ;Output at port 00H
      HLT