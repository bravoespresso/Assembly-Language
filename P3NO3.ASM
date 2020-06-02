;高级汇编语言技术
;试使用条件汇编编写一段程序，完成以下功能：若给定名为X的字符串长度不小于10时，下列指令将汇编5次。
;ADD	  AX, AX
;数据段中至少需要定义以下内容：
;X  db  ‘2186123456‘  (说明：字符串的内容是你的学号，这里以学号2186123456为例)


title P3No3

data segment
    X  db  '2186113847'
    len equ $-X
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
        mov ax,1
        if len-9
        rept 5
        add ax,ax
        endm
        endif
        ; ^ ---------------------------- ^
		; |          The END             |
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 
