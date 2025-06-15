; bootloader.asm - Simple bootloader that prints "Hello, I am a new OS !" on screen



[org 0x7C00]          ; BIOS loads bootloader here

start:



    mov si, msg       ; Point SI to the message string


print_loop:
    lodsb             ; Load byte at [SI] into AL, increment SI
    
    cmp al, 0         ; Check for null terminator
    
    je done           ; If zero, end printing
    
    mov ah, 0x0E      ; BIOS teletype function
    int 0x10          ; Call BIOS video interrupt
    
    jmp print_loop    ; Loop back

done:
    cli               ; Clear interrupts
    
    hlt               ; Halt CPU
    

msg db 'Hello, I am a new OS !', 0

times 510-($-$$) db 0 ; Fill up to 510 bytes with zeros


dw 0xAA55             ; Boot signature (magic number)
