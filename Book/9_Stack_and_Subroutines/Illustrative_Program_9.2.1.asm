;Traffic Signal Controller

;Write a program to provide the given on/off time to traffic lights (Green,
;Yello, and Red) and two pedestrian signs (Walk & Dont Walk). The signal lights
;and signals are turned on/off by the data bits of an output port as shown below

;1. Green     D0   15 seconds
;2. Yellow    D2    5 seconds
;3. Red       D4   20 seconds
;4. WALK      D6   15 seconds
;5. Dont Walk D7   25 seconds

;The traffic and pedestrian flow are in same direction, the pedestrian should
;cross the road when Green light is on

;D7 D6 D5 D4 D3 D2 D1 D0
;0  1  0  0  0  0  1  0   =   41H
;   (15 second delay)
;1  0  0  0  0  1  0  0   =   84H
;   (5 second delay)
;1  0  0  1  0  0  0  0   =   90H


Start: MVI A, 41H   ;A = 41H (Green & Walk = On)
       OUT 00H      ;Output

       MVI B, 0FH   ;B = 15 (15 second delay)
       CALL DELAY   ;Call Delay

       MVI A, 84H   ;A = 84H (Yellow & Dont Walk = On)
       OUT 00H      ;Output

       MVI B, 05H   ;B = 05H (5 Second delay)
       CALL DELAY   ;Call Delay

       MVI A, 90H   ;A = 90H (Red & Dont Walk = On)
       OUT 00H      ;Output

       MVI B, 14H   ;B = 14H (20 Second delay)
       CALL DELAY   ;Call Delay

       JMP Start    ;jump to Start


;Generate 1-second delay "B" times
; ( "B" = value stored in B )
DELAY: LXI H, COUNT ;HL = COUNT (Counter for 1 second delay)(value calculated based on t-states & clock frequency)

 Loop: DCX H
       MOV A, L
       ORA H
       JNZ Loop

       DCR B
       JNZ Delay

       RET