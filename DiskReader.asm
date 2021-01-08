DiskReader:
    push dx ;Store number of requested sectors
    mov ah, 0x02 ;denoted read fucntion when calling INT
    mov al, dh 
    mov ch, 0x00 ;cylinder select
    mov dh, 0x00 ;head select
    mov cl, 0x02 ;start sector select
    int 0x13 ;read
    jc DiskError

    pop dx
    cmp dh, al ;dh expected number of sector, al actual number of sectors read
    jne DiskError ;expected is not equal to actual, error occured
    ret

DiskError:
    mov bx, DiskErrorMessage
    call PrintString
    jmp $


DiskErrorMessage:
    db 'Disk Read Error!',0

