;Write instructions to read data at input PORT 07H adn at PORT 08H. Display the input data from
;PORT 07H at PORT 00H, & store the inut data from PORT 08H in regoster B

IN 07H     ;Read from port 07H
OUT 00H    ;Output at port 00H

IN 08H     ;Read from port 08H
MOV B, A   ;Copy content of A to B

HLT
