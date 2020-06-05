title P4No3

data segment
    BUFF1 db "This is string1."
    BUFF2 db "This is string2."
data ends

code segment
    assume cs:code, ds:data
    main    proc
        ; assign the data segment base address to DS
        mov   ax, data
        mov   ds, ax

        xor bx, bx
        xor bp, bp

L1:     in ax, 0024H
        test ax, 10000000b
        je input_a
        test ax, 00010000b
        je quit
        in ax, 0036H
        test ax, 10000000b
        je input_b
        test ax, 00010000b
        je quit

input_a:
        mov al, BUFF1[bx]
        out 0026H, al
        inc bx
        jmp L1

input_b:
        mov al, BUFF2[bp]
        out 0038H, al
        inc bp
        jmp L1

quit:
        mov   ax, 4c00h
        int   21h

    main    endp
code ends
end main 