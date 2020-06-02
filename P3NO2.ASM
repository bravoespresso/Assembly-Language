title P3No2

data segment
    ID db 11H, 38H, 47H
    num db 5
    result db ?
data ends

code segment
    assume cs:code, ds:data

    fibo proc near
        ;judge if number is 1 or 2
        cmp ax,1
        je is_1_2
        cmp ax,2
        je is_1_2

        push bx
        push cx
        push dx

        mov dx,ax ;dx copy ax
        sub ax,1 ;ax=ax-1
        call fibo ;get Fibo(ax-1)
        mov bx,ax ;bx=Fibo(ax-1) 
        mov ax,dx ;get the origin ax
        sub ax,2 ;ax=ax-2
        call fibo ;get Fibo(ax-2)
        mov cx,ax ;cx=Fibo(ax-2)
        mov ax,bx ;ax=Fibo(ax-1)
        add ax,cx ;ax=Fibo(ax-1)+Fibo(ax-2)

        pop dx
        pop cx
        pop bx

        ret
is_1_2:
        mov ax,1 ;Fibo(1)=Fibo(2)=1
        ret

    fibo endp

    main    proc
        mov   ax, data
        mov   ds, ax
    
        mov bx,offset num
        mov ax,[bx]
        xor bx,bx
        call fibo  
        mov bx, offset result 
        mov [bx], ax   
        mov   ax, 4c00h
        int   21h
    main    endp

   
code ends
end main 