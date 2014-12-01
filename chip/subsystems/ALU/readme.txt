
=============================||Inputs & outputs||==================================
alu_A is the input of the ALU that comes from the Databus. 
This information may come directly from the instructioncode, 
from a register or from the output of the ALU.

alu_B is connected to the output of the ALU. This way, we can make calculations
based on previous calculations.

The opcode gives the ALU an instrunction on what calculation it should make. 
With every 4-bits value, a particular calculation is defined.

The alu_clk is connected to the clock of the processor. This will make the ALU 
synchronous with the rest of the processor. Every clockevent the ALU will make a
calculation (based on its opcode).

The alu_c is an output flag that represents weather we're dealing with an overflow
or not when the ALU is making an addition. alu_c will become high when there is an 
overflow and will stay low when there is no overflow.

Also the alu_z is an output flag. When we're dealing with an AND operation, alu_z 
becomes high when the result is entirely zero.

alu_y is the main output signal. The outcome of the operation will be set on alu_y.
===================================================================================
================================||Select opcode||==================================
