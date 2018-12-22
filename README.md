# 8085

[![HitCount](http://hits.dwyl.io/ashwek/8085.svg)](http://hits.dwyl.io/ashwek/8085)

[Wikipedia : Intel 8085](https://en.wikipedia.org/wiki/Intel_8085 "Wikipedia : Intel 8085")

The Intel 8085 is an 8-bit microprocessor produced by Intel.
The 8085 is a conventional von Neumann design based on the Intel 8080.


### Programming model

The processor has _7 8-bit_ registers accessible to the programmer, named __A, B, C, D, E, H, L__. Registers can be used as 16-bit register pairs, BC, DE, and HL. Some instructions use HL as a (limited) 16-bit accumulator.

The contents of the memory address pointed to by HL can be accessed as pseudo register M. It also has a 16-bit program counter and a 16-bit stack pointer to memory. Instructions such as PUSH PSW, POP PSW affect the Program Status Word (accumulator and flags). 

The accumulator stores the results of arithmetic and logical operations, and the flags register bits (sign, zero, auxiliary carry, parity, and carry flags) are set or cleared according to the results of these operations.

The sign flag is set if the result has a negative sign (i.e. it is set if bit 7 of the accumulator is set).
The zero flag is set if the result of the operation was 0.
The auxiliary or half carry flag is set if a carry-over from bit 3 to bit 4 occurred.
The parity flag is set according to the parity (odd or even) of the accumulator.
The carry flag is set if a carry-over from bit 7 of the accumulator (the MSB) occurred. 


# [GNUSim8085](https://en.wikipedia.org/wiki/GNUSim8085 "GNUSim8085")
	
[GitHub : GNUSim8085](https://github.com/GNUSim8085/GNUSim8085)

It is a graphical **_simulator_, _assembler_ and _debugger_ for the Intel 8085 microprocessor** in Linux and Windows. It is among the 20 winners of the FOSS India Awards announced on February, 2008. GNUSim8085 was originally written by Sridhar Ratnakumar in fall 2003 when he realized that no proper simulators existed for Linux. Several patches, bug fixes and software packaging have been contributed by the GNUSim8085 community. GNUSim8085 users are encouraged to contribute to the simulator through coding, documenting, testing, translating and porting the simulator.
