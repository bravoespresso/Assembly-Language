title P3No4

stack segment
    dw 128 dup (?)
    tos label word
stack ends

code segment
    assume cs:code, ss:stack
    main    proc
        ; assign the data segment base address to DS
    start:
        mov ax,stack
        mov ss,ax
        mov sp, offset tos

        push DS
        xor ax,ax
        push ax

        mov ax,4321H
        call htoa
        ret
    main    endp

    htoa proc near
    cmp ax,15
    jle lower
    push ax
    push bp
    mov bp,sp
    mov bx,[bp+2]
    and bx,00fh
    mov [bp+2],bx
    pop bp
    mov cl,4
    shr ax,cl
    call htoa
    pop ax
lower:
    add al, 30H
    cmp al,3ah
    jl printit
    add al,7h
printit:
    mov dl,al
    mov ah,2
    int 21h
    ret
    htoa endp
code ends
end main 