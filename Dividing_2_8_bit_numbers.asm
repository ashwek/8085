;8085 Program to Divide
;(A/D) 2 8-bit numbers

     LDA 5001       ;Load value of divisor from address 5001 
     MOV D, A       ;move divisor from A to D

     LDA 5000       ;Load value of dividend from address 5000 

     MVI C, 0FFH    ;C is used to store the quotient, initial value is FF

Div: INR C          ;Increment quotient
     SUB D          ;Subtract D (divisor) from A (dividend)
     JNC Div        ;Jump if No Carry to label Div
     ADD D

     STA 5002       ;Store remainder at memory location 5002

     MOV A, C       ;copy content of C (quotient) into A
     STA 5003       ;Store quotient at location 5003

     HLT
