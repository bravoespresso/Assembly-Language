title P4No1

data segment
    X  db  11H
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
        TRANSTR MACRO DST, SRC
        push bx
        push dx
        mov bx, SRC
        mov dx, DST
L1:     mov ax, [bx]
        mov [dx], ax
        add bx,2
        add dx,2
        cmp [bx], 04H
        JNE L1
        pop dx
        pop bx
        ENDM

        
        ; ^ ---------------------------- ^
		; |          The END             |
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 