SYS_EXIT    equ 1
SYS_WRITE   equ 4
STDOUT      equ 1
KERNEL      equ 0x80

section .text
    global _start

_start:
    ; Load input data
    mov ax, 16
    mov bl, 2
   
    div bl          ; Divide ax by bl
    
    add bl, '0'     ; Convert to ascii
    mov [res], bl   ; Store to memory
    
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
    res resb 1      ; Reserve one byte for result
