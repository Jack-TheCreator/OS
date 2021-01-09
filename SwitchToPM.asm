[bits 16]
SwitchToPM:
    cli ;turns off BIOS Interrupts since they only function on 16 bits
    lgdt[GDTDescriptor] ;loads our gdt descriptor
    mov eax, cr0
    or eax, 0x1 ;switch to protect mode on control register
    mov cr0, eax

    jmp CodeSegment:InitPM ;flushes cpu pipeline of 16 bit instructions

[bits 32]
InitPM:
    mov ax, DataSegment ;initialize our segment registers to our new data segment
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    ;init stack
    mov ebp, 0x90000
    mov esp, ebp

    call BeginPM
