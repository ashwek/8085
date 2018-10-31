;find largest number
;in an array

      LXI H, 5000    ;Staring address of array (Contains Array size)
      MOV B, M       ;Store array size in B (Counter) 

      INX H          ;goto next address
      MOV A, M       ;copy content of 1st element of array in A

Loop: DCR B          ;decrement counter
      JZ Exit        ;while counter is not 0, continue loop
      INX H          ;goto next address
      CMP M          ;compare Max (A) with new element
      JNC Skip       ;if new element is smaller than Max, jump to Skip
      MOV A, M       ;if new element is larger, store it in A
Skip: JMP Loop       ;jump to loop

Exit: STA 4999       ;store max value (A) at memory location 4999
      HLT
