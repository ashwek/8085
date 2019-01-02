;2-Digit BCD-to-Binary Conversion

;A BCD number between 0 & 99 is stored in an R/W memory location called
;the Input Buffer (INBUF). Write a program & a conversion subroutine (BCDBIN)
;to convert the BCD number into its equivalent binary number. Store the result
;in a memory location defined as the Output Buffer (OUTBUF)

;INBUF = 2050H
;OUTBUF = 2052H

LXI SP, 4000H   ;StackPointer = 4000H
LXI H, 2050H    ;HL = 2050H (Source address)
LXI D, 2052H    ;DE = 2052H (Destination address)

MOV A, M        ;A = M (Load from source addr)

CALL BCDBIN     ;Call BCDBIN Subrooutine

STAX D          ;Store A at D (Destination address)

HLT


;Function : This subroutine converts a BCD number into its binary equivalent
;Input : A 2-digit packed BCD number in the accumulator
;Output : A binary number in the accumulator
;No other register contents are destroyed

BCDBIN: PUSH D       ;Push D to stack
        MOV B, A     ;B = A

        ANI 0FH      ;A and 0FH (mask higher nibble)
        MOV C, A     ;C = A

        MOV A, B     ;A = B
        ANI 0F0H     ;A and F0H (Mask lower nibble)
        RRC          ;Rotate Right (Withour carry)
        RRC          ;Rotate Right (Withour carry)
        RRC          ;Rotate Right (Withour carry)
        RRC          ;Rotate Right (Withour carry)

        MVI D, 0AH   ;D = 0AH (Multiplier D = 10)
        MOV E, A     ;E = A
        XRA A        ;A xor A (A = 0)
   Mul: ADD E        ;A = A + E
        DCR D        ;D--
        JNZ Mul      ;If not zero, jump to Mul
        
        ADD C        ;A = A + C
        POP D        ;Pop stack and place in D
        RET          ;Return