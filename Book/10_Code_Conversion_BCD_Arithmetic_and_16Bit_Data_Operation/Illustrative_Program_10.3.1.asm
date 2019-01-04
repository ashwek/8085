;BCD-to-Common-Cathode-LED code conversion

;A set of 3 packed BCD numbers representing time & temperature are
;stored in memory locations starting at XX50H. The seven-segment codes
;of the digits 0 to 9 for a common-cathode LED are stored in memory locations
;starting at XX70H, & the Output-Buffer memory is reserved at XX90H

;Write a main program and 2 subroutines, called UNPAK and LEDCOD, to
;unpack the BCD numbers and select an appropriate 7-segment code for each digit.
;The code should be stored in the Output-Buffer

;Assume XX = 20

;Common-Cathode LED codes:
;0 - 3FH    1 - 06H    2 - 5BH
;3 - 4FH    4 - 66H    5 - 6DH
;6 - 7DH    7 - 07H    8 - 7FH
;9 - 6FH    Invalid Number - 00H


LXI SP, 4000H
LXI H, 2050H
MVI D, 03H
CALL UNPACK
HLT

UNPACK: NOP
LXI B, 2090H
Loop: MOV A, M
ANI 0F0H
RRC
RRC
RRC
RRC
CALL LEDCODE
INX B
MOV A, M
ANI 0FH
CALL LEDCODE
INX B
INX H
DCR D
JNZ Loop
RET

LEDCODE: NOP
PUSH H
LXI H, 2070H
ADD L
MOV L, A
MOV A, M
STAX B
POP H
RET