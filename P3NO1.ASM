; empty asm file

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