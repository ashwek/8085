;Block Transfer of Data Bytes

;16 bytes of data are stored in mem loc at XX50H to XX5FH. Transfer
;the entire block of data to new mem loc starting at XX70H.

;Assume XXH = 20H

      LXI H, 2050H   ;HL = 2050H (Source Address)
      MVI B, 10H     ;B = 10H (Counter - 16 bytes to be transfered)
      LXI D, 2070H   ;DE = 2070H (Destination Address)

Loop: MOV A, M       ;Read data from source address indirectly into A
      STAX D         ;Store content of A at destination address

      INX H          ;HL = HL + 1
      INX D          ;DE = DE + 1

      DCR B          ;Decrement Counter

      JNZ Loop       ;If B != 0 (all bytes are not transfered) jump to Loop

      HLT