;Write an instruction to load the accumulator with the data byte 64H, & verify whether the data byte in memory location
;2050H is equal to the accumulator contents. If both data bytes are equal, jump to memory location BUFFER

;BUFFER = 2000H

      LXI H, 2050H   ;HL = 2050H
      MVI A, 64H     ;A = 64H

      CMP M          ;Compare A with M
      JNZ Skip       ;if A != M, jump to Skip
      JMP 2000H      ;JUMP to BUFFER (2000H)
Skip: HLT