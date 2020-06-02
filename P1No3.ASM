; empty asm file

title I love asm

data segment

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
        mov BH, 00H
        mov BL, 38H
        mov CH, 00H
        mov CL, 11H
        mov AH, 00H
        mov AL, BL
        div CL
        mov AH, 00H
        mov CX, 02H
        mul CX
        mov DX, AX
        ; ^ ---------------------------- ^
		; |          The END             |
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 