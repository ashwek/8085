;A bar code scanner scans the boxed being shipped from the loading dock &
;records all the codes in computer memory; the end of the data is indicated by the
;byte 00. The code 1010 0011 (A3H) is assigned to 19`` television sets. Write a
;program to count the number of 19`` television sets that were shipped from the
;following data set

;Data (H) : FA, 67, A3, B8, A3, A3, FA, 00

;Assume Data is stored at 2020H


      MVI C, 00H     ;C = 00H (initial Count = 0)
      LXI H, 2020H   ;HL = 2020H (Source address)

Loop: MOV A, M       ;A = M (load from source address)

      CPI 00H        ;Compare A with 00H
      JZ Exit        ;If Zero (A == 00H), jump to Exit

      CPI 0A3H       ;Compare A with A3H
      JNZ Skip       ;If Not Zero (A != A3H), jump to Skip

      INR C          ;Increment count

Skip: INX H          ;Goto next source address
      JMP Loop       ;Jump to Loop

Exit: MOV A, C       ;A = C (Count)
      OUT 00H        ;Output at 00H port

      HLT