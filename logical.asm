SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1
KERNEL equ 0x80

section .text
    global _start
_start:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, text
    mov edx, textLen
    int KERNEL
    
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num
    mov edx, 2
    int KERNEL
    
    mov ax, [num]
    sub ax, '0'
    and ax, 1       ; and ax by 1 to check if odd or even
    jz number_even  ; if even jump to number_even
    
number_odd:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, oddMsg
    mov edx, oddMsgLen
    int KERNEL
    jmp exit
  
number_even:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, evenMsg
    mov edx, evenMsgLen
    int KERNEL

exit:
    mov eax, SYS_EXIT
    int KERNEL

section .data
    text db 'Please enter digit: ', 0xa
    textLen equ $ - text
    
    evenMsg db 'Number is even!', 0xa
    evenMsgLen equ $ - evenMsg
    
    oddMsg db 'Number is odd'
    oddMsgLen equ $ - oddMsg

section .bss
    num resb 2 ; Reserve two bytes for number