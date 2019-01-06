;Addition of Unsigned BCD Numbers

;1. Write a program with a subroutine to add these numbers in BCD. If a
;   carry is generated, save it in register B, & adjust it for BCD. The
;   final sum will be less than (9999)BCD
;2. Write a second subroutine to unpack the BCD sum stored in register A & B
;   & store them in the output-buffer memory starting at XX60H. The most
;   significant digit (BCD4) should be stored at XX60H & the least
;   significant digit (BCD1) at XX63H.

;Assume XX = 20


 Start: LXI SP, 4000H   ;StackPointer = 4000H
        LXI H, 2050H    ;HL = 2050H
        MVI C, 02H      ;C = 02H
        XRA A           ;A xor A (A = 0)

        MOV B, A        ;B = A
NxtBCD: CALL BCDADD     ;Call BCDADD

        INX H           ;HL + 1

        DCR C           ;C - 1
        JNZ NxtBCD      ;If not zero, jump to NxtBCD

        LXI H, 2063H    ;HL = 2063H

        CALL UNPACK     ;Call UNPACK

        MOV A, B        ;A = B

        CALL UNPACK     ;Call UNPACK

        HLT


;This subroutine adds the BCD number from the memory to the accumulator & decimal
;adjust it. If the sum is larger than 8-bits, it saves the carry & decimal-adjusts
;the carry sum
;Input : The memory address in HL register where the BCD number is stored
;Output : Decimal-adjust BCD number in the accumulator & the caay in register B

BCDADD: ADD M      ;A = A + M

        DAA        ;Decimal Adjust Accumulator (Convert A from Hex to BCD)
        RNC        ;Return if No Carry

        MOV D, A   ;D = A
        MOV A, B   ;A = B
        ADI 01H    ;A = A + 01
        DAA        ;Decimal Adjust Accumulator (Convert A from Hex to BCD)
        MOV B, A   ;B = A
        MOV A, D   ;A = D
        RET        ;Return


;This subroutine unpacks the BCD in the accumulator & the carry register & stores
;them in the output buffer
;Input : BCD number in the accumulator, & the buffer address in HL registers
;Output : Unpacked BCD in the output buffer

UNPACK: MOV D, A   ;D = A
        ANI 0FH    ;A and 0FH (Mask Higher nibble)
        MOV M, A   ;M = A
        DCX H      ;HL - 1
        MOV A, D   ;A = D
        ANI 0F0H   ;A and F0H (Mask lower nibble)
        RRC        ;Rotate Right without Carry (4 times)
        RRC
        RRC
        RRC
        MOV M, A   ;M = A
        DCX H      ;HL - 1
        RET        ;Return