;Keep the radio on (D4) continously without affecting the other
;appliances, even if someone turns off the switch S4


IN 00H    ;Read Switches
ORI 10H   ;D4 = 1, other Bits remain unchanged
OUT 01H   ;Turn on Radio

HLT       ;Halt Program
