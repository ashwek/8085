;In QA_20.asm, modify the program to count the number of dat abytes that have been added
;& display the count at the second output port


      MVI C, 05H     ;C = 05H (Counter = 5 data bytes)
      MVI B, 00H     ;B = 00H (0 values added - initially)
      LXI H, 2060H   ;HL = 2060H (Source address)
      XRA A          ;A xor A (A = 0)

Loop: ADD M          ;A = A + M
      
      JNC Skip       ;If No Carry, jump to skip
                     ;Else:
      MVI A, 01H     ;A = 01H
      JMP Exit       ;Jump to Exit

Skip: INX H          ;HL = HL + 1

      INR B          ;increment number of values added

      DCR C          ;Decrement Counter
      JNZ Loop       ;If Not Zero, jump to loop

Exit: OUT 00H        ;Display content of A at port 00H

      MOV A, B       ;A = B
      OUT 01H        ;Display content of A at port 01H

      HLT