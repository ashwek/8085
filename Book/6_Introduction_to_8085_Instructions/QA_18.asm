;Write a program to
;a. clear the accumulator
;b. add 47H (use ADI)
;c. subtract 92H
;d. add 64H
;e. display result after subtracting 92H & after adding 64H

XRA A   ;clear the accumulator
ADI 47H      ;add 47H
SBI 92H      ;subtract 92H
ADI 64H      ;add 64H
OUT 00H      ;display result
HLT
