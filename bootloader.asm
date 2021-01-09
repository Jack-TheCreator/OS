[org 0x7c00]
;set stack
mov bp, 0x9000
mov sp, bp

mov bx, MSGReal
call PrintString

;Switch to Protected Mode......and never return....hopefully
call SwitchToPM

jmp $ ;hang

%include 'PrintString.asm'
%include 'PrintHex.asm'
%include 'GDT.asm'
%include 'PrintStringPM.asm'
%include 'SwitchToPM.asm'
%include 'DiskReader.asm'

;landed in 32-bit PM
BeginPM:
    mov ebx, MSGProt
    call PrintStringPM
    jmp $ ;hang


MSGReal db "Successfully Started in 16-bit",0
MSGProt db "Successfully Started in 32-bit",0

;padding and magic number
times 510-($-$$) db 0
dw 0xaa55

