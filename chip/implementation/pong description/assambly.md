-- Assambly code pong
-- Inititalisation


    128 64  32  16  8   4   2   1
    0   0   0   0   0   0   0   0


-- INIT

init:   ld  00001100
        st  R1
        ld  00001100
        st  R2
        ld  00000110
        st  R3
        ld  00001100
        st  R4
        ld  00010000
        st  R5
        ld  00000001
        st  R6
        ld  00000001
        st  R7
        ld  11111111
        st  R10
        jp  hold

-- PRINT

-- komt later

-- HOLD

hold:   cl  carry
        lr  input
        xor 00001000
        add 11111000
        bc  start
        jp  hold


-- START

start:  
        
            
        
        



