;递归子程序设计
;给定一个正数N≥1存放在NUM单元中，试编制一递归子程序计算FIB（N），并将结果存入RESULT单元中。
;Fibonacci数的定义如下：
;     FIB（1）= 1
;     FIB（2）= 1
;     FIB（n）= FIB（n-2）+ FIB（n-1）  n>2
;数据段中至少需要定义以下内容：
;（1）	ID  db  xxH, yyH, zzH  (说明：以学号2186123456为例，其中的xx为12，yy为34，zz为56)
;（2）	定义NUM、RESULT的内存单元



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
