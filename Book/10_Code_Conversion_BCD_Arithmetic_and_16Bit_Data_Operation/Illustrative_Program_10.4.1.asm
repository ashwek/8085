;Binary-to-ASCII Hex code Conversion

;An 8-bit binary number is stored in memory location XX50H
;1. Write a program to
; a. Transfer the bytes to the accumulator
; b. Separate the 2 nibbles
; c. Call the subroutine to convert each nibble into ASCII Hex code
; d. Store the codes in memory location XX60H and XX61H
;2. Write a subroutine to convert a binary digit (0 to F) into ASCII Hex code

;Assume XX = 20


LXI SP, 3000H   ;StackPointer = 3000H
LXI H, 2050H    ;HL = 2050H (Source address)
LXI D, 2060H    ;DE = 2060H (Destination address)

MOV A, M        ;A = M
MOV B, A        ;B = A
RRC             ;Rotate Right without carry (4 times)
RRC
RRC
RRC
CALL ASCII      ;Call ASCII
STAX D          ;Store A at DE
INX D           ;DE ++
MOV A, B        ;A = B
CALL ASCII      ;call ASCII
STAX D          ;Store A at DE
HLT


;This subroutine converts a binary digit between 0 & F to ASCII Hex code
;Input : Single binary number 0 to F in the accumulator
;Output : ASCII Hex code in the accumulator

ASCII: ANI 0FH   ;Mast Upper Nibble
       CPI 0AH   ;Compare A with 10
       JC Skip   ;if carry (A < 10). jump to Skip
       ADI 07H   ;A = A + 07H
 Skip: ADI 30H   ;A = A + 30H
       RET       ;Return