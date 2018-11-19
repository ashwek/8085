;An additional input port with 8 switches and the address 01H is connected to the microcomputer to
;control the same appliances & lights from the bedroom as well as from the kitchen. Write
;instructions to turn on the device for any of the input ports.

;Assume PORT1 = 02H

IN 01H    ;Read switches from port 01H
MOV B, A  ;Copy switch data to B
IN 00H    ;Read Switches from port 00H
ORA B     ;A = A OR B, combine the switch positions

OUT 02H   ;Turn on appliances 

HLT       ;Halt Program
