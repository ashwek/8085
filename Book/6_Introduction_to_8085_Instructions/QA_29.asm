;Figure 6.15 shows an input port with an 8-key DIP switch. When all switches are off, the microprocessor reads
;the data FFH. When a switch is turned on, it goes to logic 0. Write instruction to read the input port and, if 
;all switches are open, set the Zero flag. (Use the instruction CMA to complement the input reading & ORA A to
;set zero flag)

IN 00H   ;Read switches
CMA      ;Complement A
ORA A    ;OR A with A
HLT
