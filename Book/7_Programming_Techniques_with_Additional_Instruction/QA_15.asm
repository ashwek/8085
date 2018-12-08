;The following block if data is stored in the memory locations from XX55H to XX5AH. Transfer the
;data to the locations XX80H to XX85H in the reverse order (e.g. the data byte 22H should
;be stored at XX85H & 37H at XX80H)
;Data: 22H, A5H, B2H, 99H, 7FH, 37H

;Assume XXH = 20H

      LXI H, 2055H   ;HL = 2055H (Starting Source address)
      LXI D, 2085H   ;DE = 2085H (Ending destination address)
      MVI C, 06H     ;C = 06H (Counter = 6 elements)

Loop: MOV A, M       ;Load value from Source address
      STAX D         ;Write A to destination addresss

      INX H          ;HL = HL + 1
      DCX D          ;DE = DE - 1

      DCR C          ;C = C - 1
      JNZ Loop       ;if counter != 0, jump to Loop

      HLT
