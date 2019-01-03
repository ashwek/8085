;Binary to Unpacked BCD Conversion

;A binary number is stored in memory location BINBYT. Convert the number into BCD
;& store each BCD as two unpacked digits in the OUTPUT buffer. To perform this
;task, write a main program & two subroutines: one to supply the powers of ten, & the
;other to perform the conversion

;BINBYT = 2050H
;Output Buffer = 2055H

LXI SP, 4000H   ;StackPointer = 4000H
LXI H, 2055H    ;HL = 2055H (destination address)

LDA 2050H       ;Load A with value in 2050H

CALL POWTEN     ;Call POWTEN

HLT


;This subroutine loads the power of 10 in register B & calls the
;Convert conversion routine
;Input : Binary number in A
;Output : Powers of ten & stores BCD in the output buffer memory
;Calls CONVERT routine and modifies register B & A

POWTEN: MVI B, 64H     ;B = 64H (B = 100, divide by 100)
        CALL CONVERT   ;Call CONVERT
        MVI B, 0AH     ;B = 0AH (B = 10, divide by 10)
        CALL CONVERT   ;Call CONVERT
        MOV M, A       ;M = A
        RET            ;Return


;This subroutine converts a binary number into BCD1 & stores BCD2 & BCD3
;in the conversion routine
;Input : Binary number in A and powers of 10 in B
;Output L BCD2 and BCD3 in Output Buffer
;Modifies A contents

CONVERT: MVI M, 0FFH   ;M = FFH
    Div: INR M         ;M = M + 1
         SUB B         ;A = A - B
         JNC Div       ;If No Carry, jump to Div
         ADD B         ;A = A + B
         INX H         ;HL = HL + 1
         RET           ;Return