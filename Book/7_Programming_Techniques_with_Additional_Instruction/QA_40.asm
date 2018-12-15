;A set of 8 data bytes is stored in the memory location starting at XX50H.
;Check each data byte for buts D7 & D0. If D7 & D0 is 1, reject the data byte;
;otherwise, store the data byte at memory location starting at XX60H

;Data (H) : 80, 52, E8, 78, F2, 67, 35, 62

;Assume XX = 20


      MVI C, 08H     ;C = 08H (Counter = 8 data bytes)
      LXI H, 2050H   ;HL = 2050H (Source address)
      LXI D, 2060H   ;DE = 2060H (destination Address)

Loop: MOV A, M       ;Load value from source
      RAL            ;Rotate Left (D7 goes to Carry Bit)
      JC Skip        ;If Carry (D7 = 1), jump to Skip
      
      RAR            ;Rotate Right (carry goes back to D7)
      RAR            ;Rotate Right (D0 goes to Carry bit)
      JC Skip        ;If Carry (D0 = 1), jump to Skip
      
      RAL            ;Rotate Left, (Carry goes back to D0)
      STAX D         ;Store A at destination address
      INX D          ;Increment Destination address

Skip: INX H          ;Increment source address

      DCR C          ;Decrement counter
      JNZ Loop       ;If Not Zero, jump to Loop

      HLT