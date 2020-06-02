; empty asm file

title I love asm

data segment
    M  dw  15H,56H,21H,2FH
    max  dw  ?
    addr dw  ?
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
        mov cx, 4H
        lea DI, M 
        mov bx, 00H ;bx save max

comp:   mov ax, [DI]
        cmp bx, ax
        JNB next ;bx>ax 
        mov bx, ax ;bx<ax
        mov addr, DI
        mov max, bx

next:   add DI, 2H
        loop comp

        ; ^ ---------------------------- ^
		; |          The END             |
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 