; empty asm file

title I love asm

data segment
    X  dw  3847h
    Y  dw  1138h
    Z  dw  ?
    W  dw  6113h
data ends

code segment
    assume cs:code, ds:data
    main    proc
        ; assign the data segment base address to DS
        mov   ax, data
        mov   ds, ax

        ; TODO ...
		; | add your code between arrows |
		; v ---------------------------- v
        mov ax, W
        sub ax, X
        mov bx, 05H
        idiv bx
        mul Y
        mov bx, 02H
        mul bx
        mov Z, ax

        
        ; ^ ---------------------------- ^
		; |          The END             |
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 