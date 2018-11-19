;Data Masking with Logic AND

;To conserve energy & to avoid an electrical overload on a hot afternoon, implement the following procedures
;to control the appliances throughout the houses. Assume that the control switches are located
;in the kitchen, & they are available to anyone in the house. Write a set of instruction to
;1. turn on the air conditioner if switch S7 of the input port 00H is on
;2. ignore all other switches of the input port even if someone attempts to turn on other appliances


IN 00H    ;Read Switches
ANI 80H   ;Mask D6-D0
OUT 01H   ;Turn on Airconditioner if S7 is On

HLT       ;Halt Program
