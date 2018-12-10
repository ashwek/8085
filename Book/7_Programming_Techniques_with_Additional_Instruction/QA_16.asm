;Data bytes are stored in memory locations from XX50H to XX5FH. To insert an additional 5
;bytes of data, it is necessary to shift the data string by 5 memory locations. Write a
;program to store the data string XX55H to XX64H. Use any 16 bytes of data to verify your
;program

;Assume XX = 20

        MVI C, 10H     ;C = 10H (Counter = 16, elements in 2050H-205FH)
        LXI H, 205FH   ;HL = 205FH (last address of source)
        LXI D, 2064H   ;DE = 2064H (last address of destination)
        
        ;Move existing data 5 bytes 
 Shift: MOV A, M       ;A = M (read data from source (HL)
        STAX D         ;Store contenet of A at destination (DE)
        
        DCX H          ;HL = HL - 1
        DCX D          ;DE = DE - 1
        
        DCR C          ;Decrement Counter
        JNZ Shift      ;If not zero, jump to Shift
        
        ; Add 5 bytes, from 2050H - 2054H
        MVI A, 00H     ;A = 00H
Insert: INX H          ;Goto next address
        MOV M, A       ;M = A
        INR A          ;A = A + 1
        CPI 05H        ;Compare with 05H
        JNZ Insert     ;if not zero (A != 05H) jump to Insert
        
        HLT