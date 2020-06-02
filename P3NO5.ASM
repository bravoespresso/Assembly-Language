title P3No5

    NAMELIST    STRUC
        MAXLEN DB 100
        ACTLEN DB ?
        NAMEIN DB 100 dup (?)
    NAMELIST    ends

data segment
    BUFFER DB  100				    
        DB  ?				    
        DB  100  DUP(0) 

    DISPFILE NAMELIST <>

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
        xor ax,ax


        LEA DX,BUFFER                        ;接收字符串
        MOV AH, 0AH
        INT 21H

        mov bx, offset BUFFER+2
        mov ax, [bx]
        mov cx, offset DISPFILE+2
        mov [cx], ax

        ; ^ ---------------------------- ^
		; |          The END             |
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 