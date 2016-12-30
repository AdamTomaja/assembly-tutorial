section .data
    msg db 'Hello World!', 0xa  ; Declare Hello World string
    msgLen equ $ - msg          ; Calculate and store string length as msgLen const

section .text
    global _start               ; Declare entry point for linker

_start:
    mov edx, msgLen             ; Set string length to edx register
    mov ecx, msg                ; Set string pointer to ecx register
    mov ebx, 1                  ; Select file descriptor - stdout
    mov eax, 4                  ; Select system call - sys_write
    int 0x80                    ; Invoke kernel interrupt

    mov eax, 1                  ; Select system call - sys_exit
    int 0x80                    ; Invoke kernel interrupt again
