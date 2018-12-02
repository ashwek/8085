;Wrte instruction to clear the CY flag to load number FFH in register B, & increment (B). If the
;CY flag is set, display 01 at the output port; otherwise, display the contents of register B. Explain results

      STC           ;Set CY flag
      CMC           ;complement CY flag

      MVI B, 0FFH   ;Store FFH in B
      INR B         ;Increment B
      JNC Skip      ;if CY flag is not Set, jump to Skio
      MVI B, 01H    ;else, store 01H in B
Skip: MOV A, B      ;copy content of B to A
      OUT 01H       ;Display on port 00H
      HLT