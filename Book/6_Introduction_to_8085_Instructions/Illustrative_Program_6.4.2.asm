;Modify the program in Example 6.2 to read the switch position continusly
;and turn in the application accordngly

; Example 6.2
Start: IN 00H    ;Read input port 00H into Accumulator
       OUT 01H   ;Write content of Accumulator to output port 01H

;Current Program
       JMP Start ;Jump to Start
