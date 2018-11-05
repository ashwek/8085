;8085 Program to sort an
;array in ascending order

         LXI H, 5000   ;Starting address of array, stores array size
         MOV C, M      ;Store array size in C, used as Counter for OuterLoop
         DCR C         ;Decrement OutLoop counter

OutLoop: MOV D, C      ;Copy counter in D, used as InLoop counter

         LXI H, 5001   ;5001 stores 1st element of array

 InLoop: MOV A, M      ;store element of array in A
         INX H         ;goto next address
         CMP M         ;compare A (element) with next element

         JC Skip       ;if A < M, jump to skip
         MOV B, M      ;Swap elements
         MOV M, A
         DCX H
         MOV M, B
         INX H

   Skip: DCR D         ;Decrement InLoop counter
         JNZ InLoop    ;if D!=0 jump to InLoop

         DCR C         ;Decrement OutLoop counter
         JNZ OutLoop   ;if C!=0 jump to OutLoop

         HLT           ;HALT program