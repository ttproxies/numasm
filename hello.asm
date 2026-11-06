section .data
    msg db 'Hai', 10
    len equ $ - msg ;; $ current addr. has <len> from where msg points

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    mov rax, 60
    mov rdi, 0
    syscall