; empty asm file

title I love asm

data segment
    X  dw  1234H
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
        mov ax, X
        mov bx, ax
        mov dx, ax
        mov di, ax

        mov cl, 4
        rol ax, cl
        and al, 00001111b
        
        mov cl, 8
        rol bx, cl
        and bl, 00001111b

        mov cl, 4
        ror di, cl
        and di, 000fH
        mov cx, di

        and dl, 00001111b 
        
        ; ^ ---------------------------- ^
		; |          The END             |
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 