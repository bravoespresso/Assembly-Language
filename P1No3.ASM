;寄存器使用程序设计。
;编写完整程序，要求把BL中的数除以CL中的数，并把其商乘以2，最后结果存入DX寄存器中。
;为了叙述方便，将学号表示为9876543210，
;将寄存器BL、CL的值分别初始化为学号中的第32，54位。
;举例，某同学的学号为2186113465，则该同学在做实验时，寄存器BL、CL的值分别初始化为34h、11h。
;初始值和学号不相符的可判定为抄袭。（说明：为简化编程，除法运算后不考虑余数）

title P1No3

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
