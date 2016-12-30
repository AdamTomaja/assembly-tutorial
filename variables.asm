section .text
    global _start
_start:
    mov edx, 1          ; Length of text to print
    mov ecx, character  ; Pointer to text
    mov ebx, 1          ; stdout
    mov eax, 4          ; sys_write
    int 0x80            ; Kernel interrupt
    
    mov eax, 1          ; sys_exit
    int 0x80            ; Kernel interrupt
    
section .data
character DB   'A'      ; Declare one character

; Syntax for storage allocation statement
; [variable-name] define-directive initial-value [,initial-value]...

; Define directives:
; -------------------
; DB    Define Byte         1 byte
; DW    Define word         2 bytes
; DD    Define doubleword   4 bytes
; DQ    Define Quadword     8 bytes
; DT    Define Ten Bytes    10 bytes

; Examples:
; -------------------
; ch            DB  'a'         
; number        DW  12345
; neg_number    DW  -12345
; big_number    DQ  123456789
; real_number1  DD  1.234
; real_number2  DQ  123.456 