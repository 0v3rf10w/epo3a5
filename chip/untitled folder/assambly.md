ms_sate     clr     c
            ld      input
            xor     00101111
            add     00000001
            bc      add_state
            ld      input
            xor     00011111
            add     00000001
            bc      sub_state
            ld      input
            xor     00001111
            add     00000001
            bc      mul_state
            jp      ms_state
add_state   clr     c
            ld      input
            xor     00101111
            add     00000001
            bc      add_state
            clr     c
            ld      input
            and     00001111
            st      R2
            ld      input
            and     00010000
            bz      bit_2
            ld      00000001
            st      R3
bit_2       ld      input
            and     00100000
            bz      bit_3
            ld      R3
            add     00000010
            st      R3
bit_3       ld      input
            and     01000000
            bz      bit_4
            ld      R3
            add     00000100
            st      R3
bit_4       ld      input
            and     10000000
            bz      calc_state
            ld      R3
            add     00001000
            st      R3
calc_state  ld      R2
            add     R3
            st      R1
            jp      ms_state
sub_state   clr     c
            ld      input
            xor     00011111
            add     00000001
            bc      sub_state
            clr     c
            ld      input
            and     00001111
            st      R2
            ld      input
            and     00010000
            bz      bit_22
            ld      00000001
            st      R3
bit_22      ld      input
            and     00100000
            bz      bit_23
            ld      R3
            add     00000001
            st      R3
bit_23      ld      input
            and     01000000
            bz      bit_24
            ld      R3
            add     00000001
            st      R3
bit_24      ld      input
            and     10000000
            bz      calc_state1
            ld      R3
            add     00000001
            st      R3
calc_state1 ld      R3
            xor     11111111
            set     c
            add     R2
            st      R1
            clr     c
            jmp     ms_state
mul_state   clr     c
            ld      input
            xor     00001111
            add     00000001
            bc      mul_state
            ld      input
            and     00001111
            st      R2
            ld      input
            and     00010000
            bz      bit_32
            ld      00000001
            st      R3
bit_32      ld      input
            and     00100000
            bz      bit_33
            ld      R3
            add     00000001
            st      R3
bit_33      ld      input
            and     01000000
            bz      bit_34
            ld      R3
            add     00000001
            st      R3
bit_34      ld      input
            and     10000000
            bz      calc_state2
            ld      R3
            add     00000001
            st      R3
calc_state2 ld      R2
            and     00000001
            bz      ref1
            ld      R3
            st      R4
bit_42      ld      R2
            and     00000010
            bz      ref2
            ld      R2
            add     R3
            st      R5
bit_43      ld      R2
            and     00000100
            bz      ref3
            ld      R3
            add     R3
            st      R8
            ld      R8
            add     R8
            st      R6
bit_44      ld      R2
            and     00001000
            bz      ref4
            ld      R3
            add     R3
            st      R8
            ld      R8
            add     R8
            st      R8
            ld      R8
            add     R8
            st      R7
calc_mul    ld      R4
            add     R5
            st      R8
            ld      R6
            add     R7
            st      R9
            ld      R8
            add     R9
            st      R1
            jmp     ms_state
ref1        ld      00000000
            st      R4
            jmp     bit_42
ref2        ld      00000000
            st      R5
            jmp     bit_43
ref3        ld      00000000
            st      R6
            jmp     bit_44
ref4        ld      00000000
            st      R7
            jmp     calc_mul


            

            
