SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1
KERNEL equ 0x80

section .text
    global _start
_start:
    mov al, 1       ; Load a
    mov bl, 2       ; Load b
    or al, bl       ; a or b, logical sum gives 3
    
    ; Convert to ascii and store to memory
    add al, '0'
    mov [res], al
    
    ; Print result from memory
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 1
    int KERNEL
    
    mov al, 1
    mov bl, 6
    xor al, bl  ; xor al by bl
    
    ; Convert to ascii and store to memory
    add al, '0'
    mov [res], al
    
    ; Print result from memory
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 1
    int KERNEL
    
    mov al, 5
    not al      ; not al
    
    ; Convert to ascii and store to memory
    add al, '0'
    mov [res], al
    
    ; Print result from memory
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 1
    int KERNEL
    
    ; Exit
    mov eax, SYS_EXIT
    int KERNEL
    
segment .bss
    res resb 1 ; Reserve one byte for result
    