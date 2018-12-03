;The memory location 2050H holds the data byte F7H. Write instructions to transfer the data byte
;to the accumulator using 3 different opcodes: MOV, LDAX, & LDA

;Using MOV
LXI H, 2050H
MOV A, M


;Using LDAX
LXI B, 2050H
LDAX B


;Using LDA
LDA 2050H

HLT