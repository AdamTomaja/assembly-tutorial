section .text
    global _start               ; Declare _start as global for linker
            
_start:                         ; Entry point
    ; Print name    
    mov edx, nameLen            ; Pass length of string
    mov ecx, name               ; Pass pointer to name
    mov ebx, 1                  ; Select file descriptor - stdout
    mov eax, 4                  ; Select syscall - sys_write
    int 0x80                    ; Call kernel interrupt
    
    mov [name], dword 'Jan '    ; Put new name to effective 
                                ; address of name  
    
    ; Print name again
    mov  edx, nameLen           ; Pass length of string
    mov ecx, name               ; Pass pointer to name
    mov ebx, 1                  ; Select file descriptor - stdout
    mov eax, 4                  ; Select syscall - sys_write
    int 0x80                    ; Call kernel interrupt
    
    ; Exit
    mov eax, 1                  ; Select syscall - sys_exit
    int 0x80                    ; Call kernel interrupt
    
section .data
name db 'Adam Kowalski '        ; Declare name
nameLen equ $ - name            ; Calculate name length