;子程序设计
;设有10个学生的成绩分别是76,69,84,90,73,88,99,63,100和80分。
;试编制一个子程序统计60~69分，70~79分，80~89分，90~99分和100分的人数并分别存放到S6, S7, S8, S9和S10单元中。
;数据段中至少需要定义以下内容：
;（1）	ID  db  xxH, yyH, zzH  (说明：以学号2186123456为例，其中的xx为12，yy为34，zz为56)
;（2）	array  db  ...   (存放10个学生的成绩)
;（3）	定义S6，S7，S8，S9，S10的内存单元


title P3No1

data segment
    ID db 11H, 38H, 47H
    array db 76,69,84,90,73,88,99,63,100,80 ;d 3 c
    S6 db ? ;d d
    S7 db ? ;d e
    S8 db ? ;d f
    S9 db ? ;d 10
    S10 db ? ;d 11
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
        call count
        jmp finish
    count proc near
        mov bx, offset array
        mov cx, 10
        xor ax, ax
L1:
        mov al, [bx]
        cmp al, 100
        je score100
        cmp al, 90
        jnb score90
        cmp al, 80
        jnb score80
        cmp al, 70
        jnb score70
        cmp al, 60
        jnb score60
score100:
        inc S10
        jmp next
score90:
        inc S9
        jmp next
score80:
        inc S8
        jmp next
score70:
        inc S7
        jmp next
score60:
        inc S6
        jmp next
next:
        add bx, 1
        loop L1

        ret
    count endp
        
        ; ^ ---------------------------- ^
		; |          The END             |
        
        ; method 2: return to dos
finish:  
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 
