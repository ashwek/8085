;Checking Sign with Rotate Instruction

;A set of ten readings is stored in memory locations starting at XX60H. The readings are expected to
;be positive (<128). Write a program to
;1. Check each reading to determine whether it is +ve or -ve
;2. reject all -ve readings
;3. add all positive readings
;4. output FFH to PORT1 at any time when the sum exceds 8 bits to indicate overload; otherwise, display
;the sum. If no output port is availabel in the system, goto step 5.
;5. store FFH in the memory location XX70H when the sum exceds 8 bits; otherwise store the sum

;Assume XXH = 20H


          LXI H, 2060H   ;HL = 2060H (Source addr)
          MVI C, 0AH     ;C = 0AH (counter = 10 bytes)
          MVI B, 00H     ;B = 00H (initial sum = 0)

    Loop: MOV A, M       ;A = M (load data from HL (source addr))

          RAL            ;Rotate Left (send D7 (Sign bit) to Carry flag)
          JC Skip        ;If carry is set (number is -ve) jump to Skip

          RAR            ;Rotate right (get D8 (sign bit) back from Carry flag)
          ADD B          ;A = A (new value) + B (previous sum)
          JC Overload    ;If carry is generated (Sum > FFH) jump to Overload

          MOV B, A       ;B = A (B = new sum)

    Skip: INX H          ;HL = HL + 1 (next addr)
          DCR C          ;Decrement counter
          JNZ Loop       ;if counter != 0, jump to Loop

          MOV A, B       ;A = A + B (A = sum)
          STA 2070H      ;Store Sum
          HLT

Overload: MVI A, 0FFH    ;A = FFH (if overload)
          STA 2070H
          HLT
