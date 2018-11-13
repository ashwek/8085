;Write instructions to read 8 ON/OFF switches connected to the input port with
;the address 00H, & turn the devices connected to the output port with the
;address 01H.

IN 00H    ;Read input port 00H into Accumulator
OUT 01H   ;Write content of Accumulator to output port 01H
HLT       ;Halt program
