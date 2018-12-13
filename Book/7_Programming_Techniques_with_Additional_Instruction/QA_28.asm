;Repeat assignment 27 with the following modifications. Check whether any 2 readings
;are equal, & if they are equal, turn on D7 of PORT1 & continue checking
;(Hint : Check for zero flag when two readings are equal)

;Data (H) : First Set : 80, 85, 8F, 82, 87
;          Second Set : 71, 74, 7A, 82, 77


;Assume PORT1 = 00H, XX = 20

      MVI C, 05H     ;C = 05H (Counter = 5 data bytes)
      MVI B, 01H     ;B = 01H (D0 = 1)
      LXI H, 2050H   ;HL = 2050H (1st furnace)
      LXI D, 2060H   ;DE = 2060H (2nd furnace)

Loop: LDAX D         ;Load A with data from 2nd furnace

      CMP M          ;Compare A with M (1st Furnace)

      JNZ NZer       ;if not zero ( T1 != T2)

      MVI A, 80H     ;D7 = 1
      OUT 00H        ;Output at Port

NZer: JC Skip        ;if Carry, jump to Skip. if [T1 (M) > T2 (A). carry  = 1]
                     ;Else
      MVI B, 0FFH    ;B = FFH
      JMP Exit       ;jump to Exit

Skip: INX H          ;HL = HL + 1
 
      INX D          ;DE = DE + 1

      DCR C          ;decrement C
      JNZ Loop       ;Jump if No Zero, to Loop

Exit: MOV A, B       ;A = B
      OUT 00H        ;output A at port 00H

      HLT