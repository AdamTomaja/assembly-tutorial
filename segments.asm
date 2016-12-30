segment .data ; Sections can be declared also as segments
msg db 'Hello World!', 0xa
msgLen equ $ - msg

segment .text
    global _start

_start:
    mov edx, msgLen
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80
    
    mov eax, 1
    int 0x80