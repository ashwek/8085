;8085 Program to add 2 16-bit numbers
;Number 1 is stored on mem location 5000 (low-order) and 5001 (high-order)
;Number 2 is stored on mem location 5002 (low-order) and 5003 (high-order)
;Result is stored on mem location 5004 (low-order) and 5005 (high-order)


;Load 1st Number in HL register pair
LDA 5000   ;Load low-order
MOV L, A   ;copy low-oder in L
LDA 5001   ;Load high-order
MOV H, A   ;copy high-oder in H

;Load 2nd Number in DE register pair
LDA 5002   ;Load low-order
MOV E, A   ;copy low-oder in E
LDA 5003   ;Load high-order
MOV D, A   ;copy high-oder in D

DAD D      ;HL = HL + DE (Add 16 bit value)

;Store result
MOV A, L   ;copy low-oder in A
STA 5004   ;Store low-order
MOV A, H   ;copy high-oder in A
STA 5005   ;Store high-order

HLT        ;Halt Program
