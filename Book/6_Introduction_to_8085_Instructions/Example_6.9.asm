;Assume it is winter, turn off the air conditioner without
;affecting the other appliances


IN 00H    ;Read Switches
ANI 7FH   ;D7 = 0, other Bits remain unchanged
OUT 01H   ;Turn off Air Conditioner

HLT       ;Halt Program
