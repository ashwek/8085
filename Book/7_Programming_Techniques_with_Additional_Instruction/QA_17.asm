;A system is designed to monitor the temperature of a furnace. Temperature readings are
;recorded in 16-bits & stored in memory location starting at XX60H. The high-order byte
;is stored first & the low-order byte is stored in the next consecutive memory location.
;However, the high-order byte of all the temperature reading is constant.

;Write a program to transfer low-order readings to consecutive memory locations starting
;at XX80H & discard the high-order bytes

;Temp Readings (H) 0581, 0595, 0578, 057A, 0598

;Assume XX = 20

      MVI C, 05H     ;C = 05H (Counter = 5 temperature readings)
      LXI H, 2061H   ;HL = 2061H (Source address - Low-Order)
      LXI D, 2080H   ;DE = 2080H (Destination address)

Loop: MOV A, M       ;A = M (load A from Source Address in HL)
      STAX D         ;Store A at destination address (DE)

      INX D          ;Goto next Destination address

      INX H          ;Goto next Source Address
      INX H          ;Goto next source address (Skip High-Order of next temp reading)

      DCR C          ;Decrement counter
      JNZ Loop       ;If not zero, jump to Loop

      HLT