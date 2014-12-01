
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
The operation is selected based on the opcode input signal. In the table below you
can see what opcode represents what operation.
|--------|------------|
| opcode | operation  |
|--------|------------|
|  000   | pass alu_A |
|  001   | XOR        |
|  010   | AND        |
|  011   | Set alu_c  |
|  100   | Clr alu_c  |
|  101   | ADD        |
|--------|------------|

pass alu_A: the input alu_A is directly set to the output alu_y.

XOR: the ALU makes an XOR operation on the inputs alu_A and alu_B. That means that
when input A and B are not the same, the output will be high. When the same, the
output will be low.

AND: the ALU makes an AND operation on the inputs alu_A and alu_B. That means that
when input A and B are both high, the output will be high. Else way the output is 
low. When inputs A and B are never both high entirely, which means that the output
is all zero, the Z flag alu_z is set to high. 

Set alu_c: set the alu_c on high.

Clr alu_c: clear the alu_c, thus put it on low.

ADD: the final goal is to add inputs alu_A and alu_B to each other. First the inputs
are transformed to naturals. Then they get add up and finally the natural addition
is transformed back into a 8 bits string, which is assigned to the output alu_y. 
When the natural after addition is to big to fit in the available 8 bits, there'll
be an overflow. This will be indicated by the Carry, alu_c.
====================================================================================
===================================||The flags||====================================
The flags are separately defined in their own processes, which are synchronous to 
the clock signal.

The value of carry alu_c will be checked when the opcode is 100 (Clr alu_c), 011 
(Set alu_c) or 101 (ADD). alu_c will be set zero when opcode 100 or when there is an
addition that will not overflow, so when the natural outcome is smaller than the 
natural that the 8 bits can store which is 256.
alu_c will be put on high when opcode 011 or when there is an addition that does
overflow, what means that the natural outcome does not fit in the provided 8 bits,
and thus is bigger than 255. 256 will not fit because also 0 takes a possibility. 

The output alu_z wil be put on high when the outcome of the AND 
operation is "00000000"
====================================================================================

 

