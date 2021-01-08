[org 0x7c00]

mov [BOOT_DRIVE], dl

;set stack
mov bp, 0x8000
mov sp, bp

mov bx, 0x9000 ;sets offset
mov dh, 5 ;number of sectors
mov dl, [BOOT_DRIVE]
call DiskReader

mov dx, [0x9000]
call PrintHex ;This should print DAAD

mov dx, [0x9000+512]
call PrintHex ;This should print ADAD

jmp $ ;hang

%include 'PrintString.asm'
%include 'PrintHex.asm'
%include 'DiskReader.asm'

BOOT_DRIVE:
    db 0

;padding and magic number
times 510-($-$$) db 0
dw 0xaa55

times 256 dw 0xdaad
times 256 dw 0xadad
