;算术指令程序设计。
;编写完整程序，实现 Z = ( ( W – X ) / 5 * Y ) * 2
;其中X, Y, Z, W均为16位带符号数。

;为了叙述方便，将学号表示为9876543210，将变量X、Y、W的值分别初始化为学号中的第3210，5432，6543位。
;举例，某同学的学号为2186113465，则该同学在做实验时，变量X、Y、W的初始值值分别为3465h、1134h、6113h。
;初始值和学号不相符的可判定为抄袭。（说明：为简化编程，除法运算后不考虑余数）

title P1No1

data segment
    X  dw  3847h
    Y  dw  1138h
    Z  dw  ?
    W  dw  6113h
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
        mov ax, W
        sub ax, X
        mov bx, 05H
        idiv bx
        mul Y
        mov bx, 02H
        mul bx
        mov Z, ax

        
        ; ^ ---------------------------- ^
		; |          The END             |
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 
