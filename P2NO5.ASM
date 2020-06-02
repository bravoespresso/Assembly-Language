; empty asm file

title I love asm

data segment
    MEM dw 0h,2h,3h,4h,5h,6h,7h,8h,9h,10h,11h,0h,13h,14h,0h,16h,17h,18h,19h,20h,21h,0h,23h,24h,0h,26h,27h,28h,29h,30h,31h,32h
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
        mov di, offset MEM
        mov cx, 32
L1:     mov bx, [di]; get the value of MEM
        cmp bx, 0
        jnz next; not zero, goto next number
        
        sub cx, 1
        push cx
        push di
L2:     ;move 0 to the tail
        mov ax, [di]
        mov dx, [di+2]
        mov [di+2], ax
        mov [di], dx
        add di, 2
        loop L2

        pop di
        pop cx

next:   add di, 2
        loop L1

        
        ; ^ ---------------------------- ^
		; |          The END             |
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 