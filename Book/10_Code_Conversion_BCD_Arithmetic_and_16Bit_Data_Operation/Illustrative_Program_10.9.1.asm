;16-Bit Subtraction

;A set of five 16-bit readings of the current consumption of industrial control units is
;monitored by meters & stored at memory locations starting at XX50H. The low-order byte
;is stored first, followed by the higher-order byte (XX51H). The
;corresponding maximum limits for each control unit are stored starting at XX90H.
;Subtract each reading from its specified limit, & store the difference in place of the
;readings. If any readings exceeds the maximum limit, call the indicator
;routine and continue checking.


      LXI D, 2050H   ;DE = 2050H
      LXI H, 2080H   ;HL = 2080H
      MVI B, 05H     ;B = 05H

Loop: CALL MINUS     ;Call MINUS

      INX D          ;DE++
      INX H          ;HL++

      DCR B          ;B--
      JNZ Loop       ;If Not Zero, jump to Loop

      HLT


MINUS: MOV A, M     ;A = M
       XCHG         ;Exchange DE and HL
       SUB M        ;A = A - M
       MOV M, A     ;M = A
       XCHG         ;Exchange DE and HL
       INX H        ;HL++
       INX D        ;DE++
       MOV A, M     ;A = M
       XCHG         ;exchange DE and HL
       SBB M        ;A = A - M - Borrow (Carry Bit)
       CC INDIKET   ;Call on Carry INDIKET
       MOV M, A     ;M = A
       RET          ;Return