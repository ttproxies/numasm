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
    prompt_msg db 'Enter a number > '
    prompt_len equ $ - prompt_msg         ;; length is offset of current ($) from pointer to prompt_msg
    str1 db 'dfjsnhjfd', 10
    
;;----------------------------------

section .text
    global _start

_start:
    ;; ---- CALL PROMPT ----
    mov r8, num1_buf
    call prompt
    ;; mov r8, num2_buf
    ;; call prompt

    ;; ---- WRITE TO STDOUT ----
    ;; mov rax, SYS_WRITE
    ;; mov rdi, STDOUT
    ;; mov rsi, num1_buf
    ;; mov rdx, input_len
    ;; syscall

    ;; mov rax, SYS_WRITE
    ;; mov rdi, STDOUT
    ;; mov rsi, num2_buf
    ;; mov rdx, input_len
    ;; syscall

    ;; ---- PERFORM ADDITION ----
    mov r10, 15
    mov r11, 30
    add r10, r11

    mov r12, str1

    ;; mov rax, SYS_WRITE
    ;; mov rdi, STDOUT
    ;; mov rsi, r12
    ;; mov rdx, input_len
    ;; syscall
    
    ;; ---- EXIT ----
    jmp exit

prompt:
    ;; ;; ---- FUNCTION PROLOGUE ----
    ;; push rbp
    ;; mov rbp, rsp
    
    ;; ---- PROMPT USER ----
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, prompt_msg
    mov rdx, prompt_len
    syscall
    
    ;; ---- READ INPUT ----
    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, r8                           ;; Save the input to the location passed into r8
    mov rdx, input_len
    syscall

    ;; ---- FUNCTION EPILOGUE ----
    ;; leave                                 ;; Restore rbp                
    ret

exit:
    mov rax, 60
    mov rdi, 0
    syscall
