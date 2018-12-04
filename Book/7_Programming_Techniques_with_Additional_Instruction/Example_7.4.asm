;1. Register B contains 32H. Illustrate the instructions MOV & STAX to copy the content of register
;B into memory location 8000H using indirect addressing
;
;2. The accumulator contains F2H. Copy (A) into memory location 8000H, using direct addressing
;
;3. Load F2H directly in memory location 8000H using indirect addressing


;1.
;Using MOV
MVI B, 32H
LXI H, 8000H
MOV M, B

;Using STAX
MVI B, 32H
LXI D, 8000H
MOV A, B
STAX D


;2.
MVI A, 0F2H
STA 8000H


;3.
LXI H, 8000H
MVI M, 0F2H

HLT