===================
Syatem Discription
===================


==
Components
==



==
1 Clock conditioning
==
Is a component that makes a usable clock signal.
Inputs:
- CLK - H
- CLK - L
Output:
- CLK

==
2 SPI Decoder Arduino
==
Is a component used to decode the incomming SPI signal from the arduino. 
The decoded signal will be available at the CPU's data bus. (Got to be some kind of buffer?)
Inputs:
- SPI pin 1
- SPI pin 2
- SPI pin 3
- SPI pin 4
- Reset
- CLK
Outputs
- 8 bit vector (description of output combinations @arduino_comminucations file)

==
3 SPI Decoder/Encoder SD Card
==
Is a component used to provide comminucation to the CD card via SPI. An 8 bit instruction will be send to
recieve a 12 bit response ( 4 bit opcode + 8 bit adress/value)
