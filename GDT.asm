GDTStart:

GDTNull:
    dd 0x0
    dd 0x0 ;first 8 bytes are null 

GDTCode:
    dw 0xffff ; Limit
    dw 0x0 ;Base
    db 0x0 ;Base
    db 10011010b ;flags -> presnt 1, privlege 00, descriptor type 1 1001b
    db 11001111b ;flags -> granularity(multiplies limit by 4k), 32-bit 1, 64-bit 0, AVL 0 -> 1111b
    db 0x0 ;Base

GDTData:
    dw 0xffff ; Limit
    dw 0x0 ;Base
    db 0x0 ;Base
    db 10010010b ;flags -> presnt 1, privlege 00, writable
    db 11001111b ;flags -> granularity(multiplies limit by 4k), 32-bit 1, 64-bit 0, AVL 0 -> 1111b
    db 0x0

GDTEnd:

GDTDescriptor:
    dw GDTEnd - GDTStart - 1
    dd GDTStart

;Handy constants for offsets
CodeSegment equ GDTCode - GDTStart
DataSegment equ GDTData - GDTStart