-- Assambly code pong
-- Inititalisation


    128 64  32  16  8   4   2   1
    0   0   0   0   0   0   0   0


-- INIT

init:   ld  00001100            deafult w1 = 12
        st  R1
        ld  00001100            default w2 = 12
        st  R2
        ld  00000110            barw = 6
        st  R3
        ld  00001100            default x = 12
        st  R4
        ld  00010000            default y = 16
        st  R5
        ld  00000001            default xv = 1
        st  R6
        ld  00000001            default yv = 1
        st  R7
        ld  11111111            clear screen
        st  R10
        jp  hold

-- PRINT

-- komt later

-- HOLD

hold:   cl  carry               clear carry
        lr  input               load inputvector
        xor 00001000            only keep start bit
        add 11111000            set carry if start is 1
        bc  start               goto start
        jp  hold                restart hold


-- START

start:  cl  carry
        ld  input               load inputvector
        xor 10000000            only keep L1 bit
        add 00000001            set carry if L1 is high
        bc  w1_left             goto set w1_left
st1:    cl  carry
        ld  input
        xor 01000000
        add 10000000
        bc  w1_right
st2:    cl  carry
        ld  input
        xor 00100000
        add 11000000
        bc  w2_left
st3:    cl  carry
        ld  input  
        xor 00010000
        add 11100000
        bc  w2_right
st4:    cl  carry
        lr  R4
        ar  R6
        st  R4
        cl  carry
        lr  R5
        ar  R7
        st  R5
        cl  carry

        

        
        
            
        
        



