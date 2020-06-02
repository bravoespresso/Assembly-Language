;设计一个程序，在数据段用自己的学号定义一个字符串，对该字符串中字符0~9字符出现的次数进行计数，计数结果存放在以COUNT为首地址的数组中。
;(最好能将计数结果显示出来)。

title P2No3

data segment
    id db '2186113847'
    count db 11 dup (?)
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
        lea bx, id
        mov cx, 0AH
comp:   mov al, [bx]
        cmp al, 30H
        je zero
        cmp al, 31H
        je one 
        cmp al, 32H
        je two
        cmp al, 33H
        je thre
        cmp al, 34H
        je four
        cmp al, 35H
        je five
        cmp al, 36H
        je six
        cmp al, 37H
        je seve
        cmp al, 38H
        je eigh
        cmp al, 39H
        je nine
nexpas: loop comp
        jmp final
zero:   add count[0], 1
        jmp next
one:    add count[1], 1
        jmp next
two:    add count[2], 1
        jmp next
thre:   add count[3], 1
        jmp next
four:   add count[4], 1
        jmp next
five:   add count[5], 1
        jmp next
six:    add count[6], 1
        jmp next
seve:   add count[7], 1
        jmp next
eigh:   add count[8], 1
        jmp next
nine:   add count[9], 1
        jmp next
next:   add bx, 1
        jmp nexpas
        ; ^ ---------------------------- ^
		; |          The END             |
        
        ; method 2: return to dos
final:  add count[0], 30H
        add count[1], 30H
        add count[2], 30H
        add count[3], 30H
        add count[4], 30H
        add count[5], 30H
        add count[6], 30H
        add count[7], 30H
        add count[8], 30H
        add count[9], 30H
        mov count[10], '$'
        mov dx, OFFSET count
        mov ah, 09H
        int 21h
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 
