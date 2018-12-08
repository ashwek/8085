;Sorting

;A set of 3 reading is stored in memory starting at XX50H. Sort
;the readings in ascending order.

;Assume XXH = 20H


Start: LXI H, 2050H   ;HL = 2050H (Source address)
       MVI D, 00H     ;D = 00H (Used as flag variable)
       MVI C, 02H     ;C = 02H (2 comparisions for 3 elements)

 Loop: MOV A, M       ;A = M (load a value)

       INX H          ;HL = HL + 1 (goto next address)

       CMP M          ;Compare A with next element

       JC Skip        ;if A < M (it is in sorted order), jump to skip

       MOV B, M       ;else, Swap the 2 values in memory
       MOV M, A
       DCX H
       MOV M, B
       INX H

       MVI D, 01H     ;D = 01H (Since swapping took place, set D = 1)

 Skip: DCR C          ;C = C - 1 (decrement)
       JNZ Loop       ;if C != 0, jump to Loop

       DCR D          ;D = D - 1 (if D == 1. swaping took place)
       JZ Start       ;if D == 0, jump to Start

       HLT