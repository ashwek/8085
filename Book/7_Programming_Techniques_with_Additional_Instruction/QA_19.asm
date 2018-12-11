;Write a program to add the following data bytes stored in memory locations starting from XX60H,
;& display the sum. (The sum does not generate a carry. Use register pair DE as a memory popinter
;to transfer a byte from memory into a register)

;Data (H) 1A, 32, 4F, 12, 27

;Assume XX = 20


      MVI C, 05H     ;C = 05H (Counter = 5 data bytes)
      MVI H, 00H     ;H = 00H (initial sum = 0)
      LXI D, 2060H   ;DE = 2060H (Source address)

Loop: LDAX D         ;Load data from source address in A

      ADD H          ;A = A + H (H = previous sum)
      MOV H, A       ;H = A

      INX D          ;Goto next address

      DCR C          ;Decrement Counter
      JNZ Loop       ;If not zero, jump to Loop

      MOV A, H       ;A = H (Sum)
      OUT 00H        ;Display Sum at port 00H

      HLT