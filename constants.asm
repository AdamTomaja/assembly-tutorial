; Define constants of sys calls
SYS_EXIT    equ 1
SYS_WRITE   equ 2 * 2 ; It evaluates to 4
%define STDIN   0
%assign STDOUT  1
%define HELLO_PROGRAMMERS 'Hello programmers!'

section .text
    global _start

_start:
    mov eax, SYS_WRITE  ; Use declared constant
    mov ebx, STDOUT
    mov ecx, message1
    mov edx, message1Len
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, message2
    mov edx, message2Len
    int 0x80
    
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, message3
    mov edx, message3Len
    int 0x80
    
    mov eax, SYS_EXIT
    int 0x80
    
section .data
message1 db HELLO_PROGRAMMERS, 0xa, 0xd
message1Len equ $ - message1

message2 db 'Welcome to the world of, ', 0xa, 0xd
message2Len equ $ - message2

message3 db 'Linux assembly programming!', 0xa
message3Len equ $ - message3