;8085 Program to add
;n 8-bit numbers

;addition of n 8-bit numbers can give 16-bit
;answer, so we use A register to store the
;lower order 8-bit and D to store the higher
;order 8-bit of the answer

      LXI H, 5000  ;starting address, stores size of array
      MOV C, M     ;store array size in C
      
      MVI D, 00    ;initialize D to 0
      
      INX H        ;increment address
      MOV A, M     ;store 1st value in A
      
Loop: DCR C        ;decrement counter
      JZ Exit      ;if counter = 0, jump to Exit
      INX H        ;increment address
      ADD M        ;add next value to A
      JNC Skip     ;if carry is not generated, jump to skip
      INR D        ;increment D (if carry is generated)
Skip: JMP Loop     ;jump to Loop

Exit: STA 5501     ;store A, lower order answer in memory location 5501

      MOV A, D     ;move higher order (D) into A
      STA 5500     ;store A, higher order answer in memory location 5500
      
      HLT          ;HALT program
