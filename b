section .data
    result db "Result of addition is stored in register:", 10
    len equ $ - result

section .bss
    res resb 1

section .text
    global _start

_start:
    mov rax, 5
    mov rbx, 3
    add rax, rbx        ; rax = rax + rbx

    add rax, '0'        ; convert number to ASCII
    mov [res], rax

    ; display message
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, len
    syscall

    ; display result
    mov rax, 1
    mov rdi, 1
    mov rsi, res
    mov rdx, 1
    syscall

    ; exit program
    mov rax, 60
    xor rdi, rdi
    syscall