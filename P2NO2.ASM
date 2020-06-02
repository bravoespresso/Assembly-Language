; empty asm file

title I love asm

data segment
    A dw 47H, 32H, 21H, 28H, 38H, 26H, 24H, 20H, 27H, 18H, 16H, 11H, 14H, 17H, 86H
    B dw 97H, 34H, 77H, 13H, 63H, 64H, 67H, 87H, 03H, 02H, 01H, 73H, 11H, 38H, 47H, 93H, 43H, 37H, 46H, 21H
    C dw 15 dup (?)
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
        lea si, A
        lea di, C
        mov cx, 15 ;init outter loop counter
L1:     mov ax, [si]
        push cx

        lea bx, B
        mov cx, 20 ;init inner loop counter
L2:     mov dx, [bx]
        cmp ax, dx ;compare
        jne neq

        mov [di], ax ;save the same number
        add di, 2H

neq:    
        add bx, 2H ;compare next number in B[]
        loop L2

        pop cx
        add si, 2H
        loop L1
        ; ^ ---------------------------- ^
		; |          The END             |
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 