;Data Transfer to control Output Devices

;A microcomputer is designed to control various appliances and lights in your house.
;The system has an output port with the address 01H, and various units are connected
;to the bits D7 to D0 as given below. On a cool morning you want to turn on the radio,
;the coffeepot, and the space heater. Write appropriate instructions for the microcomputer.
;Assume R/W memory in your system begins at 2000H

;D7 - Air Conditioner
;D6 - Space Heater
;D5 - CoffeePot
;D4 - Radio
;D3 - Light 1
;D2 - Light 2
;D1 - Light 3
;D0 - LIght 4

MVI A, 70H   ;Load 70H in Accumulator

;0111 0000 = 70H is the bit pattern required
;to turn ON the specific devices

OUT 01H      ;send bit-pattern to the port 01H
HLT          ;Halt Program
