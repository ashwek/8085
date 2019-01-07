;Multiplication of 2 8-bit unsigned numbers

;A multiplication is stored in memory location XX50H & a multiplier is stored
;in location XX51H. Write a main program to

;1. transfer the 2 numbers from memory locations to the HL register
;2. store the product in the Output buffer at XX90H

;Write a subroutine to

;1. multiply two unsigned number placed in register H & L
;2. return the result into the HL pair


LXI SP, 4000H   ;StackPointer = 4000H
LHLD 2050H      ;Load A from address 2050H

XCHG            ;Exchange HL & DE

CALL MLTPLY     ;Call MLTPLY

SHLD 2090H      ;Store A at 2090H

HLT


;This subroutine multiplies 2 8-bit unsigned numbers
;Input : Multiplicand in register E & multiplier in register D
;Output : Results in HL Register

MLTPLY: MVI D, 00H     ;D = 00H
        LXI H, 0000H   ;HL = 0000H
        MVI B, 08H     ;B = 08H

  Loop: RAR            ;Rotata A Right

        JNC Skip       ;If no carry (D0 == 0), jump to Skip

        DAD D          ;HL = HL + DE (16-bit addition)
  Skip: XCHG           ;Exchange DE and HL

        DAD H          ;HL = HL + DE
        XCHG           ;Exchange DE and HL

        DCR B          ;B = B - 1
        JNZ Loop       ;If Not Zero, jump to Loop

        RET            ;Return