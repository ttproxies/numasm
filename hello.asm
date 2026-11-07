section .bss
    input_len equ 24
    input_buf resb input_len

section .data
    prompt db 'Enter a number >'
    prompt_len equ $ - prompt                ;; $ current addr. has <len> from where msg points

section .text
    global _start

_start:
    ;; ---- PROMPT USER ----
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt
    mov rdx, prompt_len
    syscall

    ;; ---- READ INPUT ----
    mov rax, 0
    mov rdi, 0
    mov rsi, input_buf
    mov rdx, input_len
    syscall

    ;; --- EXIT ----
    mov rax, 60
    mov rdi, 0
    syscall