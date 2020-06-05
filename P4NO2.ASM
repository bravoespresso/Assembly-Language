title P4No2

data segment
    I  dw  0
data ends

code segment
    assume cs:code, ds:data
    JOE MACRO TEXT,I
        TEXT&I db "MESSAGE NO.&I"
        mov ax, I
        inc ax
        mov I, ax
    ENDM
    main    proc
        ; assign the data segment base address to DS
        mov   ax, data
        mov   ds, ax
        
        ; TODO ...
		; | add your code between arrows |
		; v ---------------------------- v


        JOE "TEXT",I
        JOE "TEXT",I
        JOE "TEXT",I
        ; ^ ---------------------------- ^
		; |          The END             |
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 