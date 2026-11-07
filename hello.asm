%define STDOUT 1
%define SYS_WRITE 1
%define STDIN 0
%define SYS_READ 0

;;----------------------------------

section .bss
    input_len equ 24
    num1_buf resb input_len
    num2_buf resb input_len

;;----------------------------------

section .data
    prompt_msg db 'Enter a number >'
    prompt_len equ $ - prompt_msg         ;; $ = current addr. has <len> from where msg points
    
;;----------------------------------

section .text
    global _start

_start:
    ;; ---- PROMPT FUNCTION ----
    call prompt

    ;; ---- WRITE TO STDOUT
    mov rax, 1
    mov rdi, 1
    mov rsi, num1_buf
    mov rdx, input_len
    syscall

    ;; --- EXIT ----
    mov rax, 60
    mov rdi, 0
    syscall

prompt:
    ;; ---- FUNCTION PROLOGUE ----
    push rbp
    mov rbp, rsp
    
    ;; ---- PROMPT USER ----
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt_msg
    mov rdx, prompt_len
    syscall
    
    ;; ---- READ INPUT ----
    mov rax, 0
    mov rdi, 0
    mov rsi, num1_buf
    mov rdx, input_len
    syscall

    ;; ---- FUNCTION EPILOGUE ----
    pop rbp
    ret
