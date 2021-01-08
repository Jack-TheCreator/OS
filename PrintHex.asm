PrintHex:
    pusha
    mov cx,4

CharLoop:
    dec cx

    mov ax, dx
    shr dx, 4
    and ax, 0xf ;This gets the last char

    mov bx, HexOut
    add bx, 2 ;skips 0x
    add bx, cx

    cmp ax,0xa ;to see if number
    jl SetChar
    add al, 0x27
    jl SetChar

SetChar:
    add al, 0x30
    mov byte [bx], al
    cmp cx,0
    je Done
    jmp CharLoop

Done:
    mov bx, HexOut
    call PrintString
    popa
    ret

HexOut:
    db '0x0000',0