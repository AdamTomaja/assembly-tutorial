SYS_EXIT    equ 1
SYS_WRITE   equ 4
STDOUT      equ 1
KERNEL      equ 0x80

section .text
    global _start
_start:
    mov al, 3
    mov bl, 2
    
    mul bl          ; Multiply al by bl
    
    add al, '0'     ; Add '0' to convert it to char
        
    mov [res], al   ; Save result in memory
    
    ; Print result
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 1
    int KERNEL
   
    ; Exit
    mov eax, SYS_EXIT
    int KERNEL
    

segment .bss
    res resb 1  ; Reserve one byte for multiplication result