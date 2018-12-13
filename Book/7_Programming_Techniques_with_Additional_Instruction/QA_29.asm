;A set of 8 data bytes is stored in memory locations starting from XX70H
;Write a program to add 2 bytes at a time & store the sum in the same memory
;locations, low-order sum replacing the first byte and a carry replacing the second
;byte. If any pair does not generate a carry, the memory location of the second byte
;should be cleared 

;Data (H) : F9, 38, A7, 56, 98, 52, 8F, F2

;Assume XX = 20

      MVI D, 04H     ;D = 04H (Counter  = 4 pairs)
      LXI H, 2070H   ;HL = 2070H (Starting address)

Loop: MVI C, 00H     ;Initially carry = 0

      MOV A, M       ;Load First byte from pair
      INX H          ;Goto next byte
      ADD M          ;A = A + M (Add bfirst & second byte)

      JNC Skip       ;if No Carry, jump to Skip

      INR C          ;increment carry, C = 01H

Skip: MOV M, C       ;Store carry at 2nd byte in pair
      DCX H          ;Goto previous (1st) byte in pair
      MOV M, A       ;Store answer at ist byte in pair

      INX H          ;Goto 2nd byte in pair
      INX H          ;Goto next pair

      DCR D          ;decrement counter
      JNZ Loop       ;if not zero, jump to Loop

      HLT