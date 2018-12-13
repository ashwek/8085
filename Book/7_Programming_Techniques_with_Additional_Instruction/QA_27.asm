;The temperature of two furnaces are being monitored by a microcomputer. A set of 5 readings
;of the first furnace, recorded by five thermal sensors, is stored at the memory location
;starting at XX50H. A corresponding set of 5 readings from the 2nd furnace is stored at the
;memory location starting at XX60H. Each reading from the first set is expected to be higher
;than the corresponding reading from the second set. For example, the temperature reading at
;the location 54H is expected to be higher than temperature reading ar location 64H.

;Write a program to check whether each reading from the 1st set is higher than the corresponding
;reading from the 2nd set. If all readings from the first set are higher than the corresponding
;reading from the second set, turn on the bit D. of the output PORT1. If any one of the readings
;of the first set is lower than the corresponding reading of the second set, stop
;the process & output FF as an emergency signal to the Output PORT1.

;Data (H) First set : 82, 89, 78, 8A, 8F
;        Second set : 71, 78, 79, 82, 7F


;Assume PORT1 = 00H, XX = 20

      MVI C, 05H     ;C = 05H (Counter = 5 data bytes)
      MVI B, 01H     ;B = 01H (D0 = 1)
      LXI H, 2050H   ;HL = 2050H (1st furnace)
      LXI D, 2060H   ;DE = 2060H (2nd furnace)

Loop: LDAX D         ;Load A with data from 2nd furnace

      CMP M          ;Compare A with M (1st Furnace)

      JC Skip        ;if Carry, jump to Skip. if [T1 (M) > T2 (A). carry  = 1]
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