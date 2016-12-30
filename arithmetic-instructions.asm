; Basic arithmetic operations:
; -----------------------------
; inc - increment by one
; dec - decrement by one
; add - sum
; sub - subtraction
; mul/imul - multiplication
; div/idiv - division

SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

segment .data
    msg1 db 'Enter first digit: ', 0xa, 0xd
    msg1Len equ $ - msg1
    
    msg2 db 'Please enter a second digit: ', 0xa, 0xd
    msg2Len equ $ - msg2
    
    msg3 db 'Sum is equal to: '
    msg3Len equ $ - msg3
    
segment .bss
    num1 resb 2     ; Reserve 2 bytes for number 1
    num2 resb 2     ; Reserve 2 bytes for number 2
    res resb 1      ; Reserve one byte for result

section .text
    global _start
_start:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, msg1Len
    int 0x80
    
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num1
    mov edx, 2
    int 0x80
    
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, msg2Len
    int 0x80
    
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num2
    mov edx, 2
    int 0x80
    
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, msg3Len
    int 0x80
    
    mov eax, [num1] ; Move number1 value to eax
    sub eax, '0'    ; subtract '0' to convert to decimal
    
    mov ebx, [num2] ; Move number2 to ebx
    sub ebx, '0'    ; subtract '0' to convert to decimal
    
    add eax, ebx    ; Add ebx to eax
    add eax, '0'    ; Add '0' to convert to ascii character
    
    mov [res], eax  ; Save eax to result variable
        
    ; Print result
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 1
    int 0x80

exit:
    mov eax, SYS_EXIT
    int 0x80