;Wrte instruction to clear the CY flag to load number FFH in register C, & to add 0 to (C). If the CY
;flag is set, display 01H at an output port; otherwise, display the content of register C. Explain your
;result

      STC           ;CY = 1
      CMC           ;complement CY flag

      MVI C, 0FFH   ;B =  FFH
      INR C         ;C = C + 1
      JNC Skip      ;if CY flag is not Set, jump to Skio
      MVI C, 01H    ;else, C = 01H
Skip: MOV A, C      ;A = C
      OUT 01H       ;Display on port 00H
      HLT