PrintString:
    pusha

Strloop:
   mov al, [bx]
   cmp al, 0
   jne PrintChar

   popa
   ret

PrintChar:
    mov ah, 0x0e
    int 0x10
    inc bx
    jmp Strloop

