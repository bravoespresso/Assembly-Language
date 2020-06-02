; empty asm file

title I love asm

data segment
    TABLE dw 1,2,2,3,3,3,4,4,4,4,4,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,7,7,7,7,7,8,0
    max dw ? ; d 42 43
    max_count dw ? ; d 44 45
    curr dw ? ; d 46 47
    count dw ? ; d 48 49
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
        mov di, offset TABLE
        mov cx, 33

L1:
        mov ax, [di]
        cmp ax, curr
        je plus1 ;the number is the same as last one, just +1 
        
        ;not the same
        mov dx, max_count;compare current_count with max_count
        cmp dx, count 
        jnb reset ;max is still max, jump reset
        ;current_count is bigger
        push di
        push ax
        sub di, 2
        mov ax, [di]
        mov max, ax ;change the max&max_count
        pop ax
        pop di
        mov dx, count
        mov max_count, dx

reset:
        mov curr, ax
        mov count, 0 ;reset the counter
plus1:
        inc count ;current_count+1
        add di, 2
        loop L1

        mov ax, max
        mov cx, max_count
        
        ; ^ ---------------------------- ^
		; |          The END             |
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 