[bits 32]

VideoMemory equ 0xb8000 ;start of video memory
FontColor equ 0x0f ;white on black

PrintStringPM:
    pusha
    mov edx, VideoMemory ;set to adress at start of video memory

StrloopPM:
   mov al, [ebx]
   mov ah, FontColor
   cmp al, 0
   jne PrintCharPM

   popa
   ret

PrintCharPM:
    mov [edx], ax ;store the char and font
    add ebx, 1
    add edx, 2   ;adds 2 since first is character and second is font
    jmp StrloopPM