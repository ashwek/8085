;Write a program to add the following bytes stored in memory locations starting at XX60H & display
;the sum at the output port if the sum does not generate carry. If a result generates carry, stop
;the addition, & display 01H at the output port.

;Data (H). First Set: 37, A2, 14, 78, 97
;         Second Set: 12, 1B, 39, 42, 07

;Assume XX = 20


      MVI C, 05H     ;C = 05H (Counter = 5 data bytes)
      LXI H, 2060H   ;HL = 2060H (Source address)
      XRA A          ;A xor A (A = 0)

Loop: ADD M          ;A = A + M
      
      JNC Skip       ;If No Carry, jump to skip
                     ;Else:
      MVI A, 01H     ;A = 01H
      JMP Exit       ;Jump to Exit

Skip: INX H          ;HL = HL + 1

      DCR C          ;Decrement Counter
      JNZ Loop       ;If Not Zero, jump to loop

Exit: OUT 00H        ;Display content of A at port 00H

      HLT