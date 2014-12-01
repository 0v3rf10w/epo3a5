De volgende variablen (registers) zullen gebruikt worden om pong te spelen;

BarA    :   R1  : 001   : Positie van bar player A
BarB    :   R2  : 002   : Positie van bar player B
W       :   R3  : 002   : Breedte van halve bar
Xb      :   R4  : 004   : X positie bal
Yb      :   R5  : 005   : Y positie bal
Xvb     :   R6  : 006   : Richtingsvector X bal
Yvb     :   R7  : 007   : Richtingsvector Y bal
ScoreA  :   R8  : 008   : Score Player A
ScoreB  :   R9  : 009   : Score Player B
GPU_buf :   R10 : 010   : GPU Buffer
IN      :   input       : input



        24px
     -----------
    |           |
    |           |32px
    |           |
    |           |
     ------------



-- INPUT VECTOR

L1  R1  L2  R2  ST  -   -   -
0/1 0/1 0/1 0/1 0/1 0/1 0/1 0/1

L1 Move bar left
R1 Move bar right
L2 Move bar2 left
R2 Move bar2 right
ST start command


-- INPUT VECTOR V2

L   L   L   L   R   R   R   R

1st 4 bits = position left bar (12 val)
2th 4 bits = position right bar (12 val)



-- INSTRUCTIONS

ld  load constant
ar  add register/input
lr  load register/input
cl  clear
xor xor operation
st  store in reg
