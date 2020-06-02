;循环程序设计-1
;数据段中已定义了一个有n个字数据的数组M，试编写一程序求出M中绝对值最大的数，
;把它放在数据段的M+2n单元中，并将该数的偏移地址存放在M+2(n+1)单元中。
;（要求： n不小于16，把自己学号每2位一组，至少4组，分别定义为4个字的初始值）


title P2No1

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
