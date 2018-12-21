;Sort the following set of marks stored by 10 students in a circuit
;course in descending order

;Data (H) : 63, 41, 56, 62, 48, 5A, 4F, 4C, 56, 56

;Assume data is stored at 2050H

Start: MVI C, 09H     ;C = 09H (9 comparisions)
       LXI H, 2050H   ;HL = 2050H (Source Address)
       MVI D, 01H     ;D = 01H (Flag = 1)

 Loop: MOV A, M       ;A = M (Load from source address)
       INX H          ;goto next source address

       CMP M          ;Compare A with Source address data

       JNC Skip       ;if no carry (A > M), jump to Skip

       MOV B, M       ;Swap A & M
       MOV M, A
       DCX H
       MOV M, B
       INX H
       INR D          ;Increment Flag

 Skip: DCR C          ;Decrement Counter
       JNZ Loop       ;If not zero, jump to Loop
       
       DCR D          ;Decrement flag
       JNZ Start      ;If not zero, jump to Start

       HLT