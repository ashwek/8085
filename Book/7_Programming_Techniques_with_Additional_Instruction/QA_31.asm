;In Assignment 30, if any one of the results of the subtraction is in the 2's
;complement, it should be discarded


      MVI D, 04H     ;D = 04H (Counter = 4 pairs)
      LXI H, 2070H   ;HL = 2070H (Source Address)
      LXI B, 2070H   ;BC = 2070H (Destination Address)

Loop: MOV A, M       ;Load ist byte from pair
      INX H          ;goto 2nd byte
      SUB M          ;A = A - B (subtract 2nd byte from 1st)

      JM Skip        ;If Minus (D7 = 1, 2's complement) jump to Skip

      STAX B         ;Store result at Destination address
      INX B          ;goto next address

Skip: INX H          ;Goto next pair
      
      DCR D          ;decrement counter
      JNZ Loop       ;If Not Zero, jump to Loop

      HLT