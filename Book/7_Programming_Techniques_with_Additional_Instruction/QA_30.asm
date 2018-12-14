;A set of 8 bytes is stored in memory locations starting from XX70H.
;Write a program to subtract 2 byts at a time & store the result in a sequential
;order in memory locations starting from XX70H

;Data (H) : F9, 38, A7, 56, 98, A2, F4, 67

;Assume XX = 20


      MVI D, 04H     ;D = 04H (Counter = 4 pairs)
      LXI H, 2070H   ;HL = 2070H (Source Address)
      LXI B, 2070H   ;BC = 2070H (Destination Address)

Loop: MOV A, M       ;Load ist byte from pair
      INX H          ;goto 2nd byte
      SUB M          ;A = A - B (subtract 2nd byte from 1st)
      STAX B         ;Store result at Destination address

      INX H          ;Goto next pair
      INX B          ;goto next address
      
      DCR D          ;decrement counter
      JNZ Loop       ;If Not Zero, jump to Loop

      HLT