section .text
global main
extern scanf, printf

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    xor eax, eax
    lea rdi, [rbp-24]
    call memset
    lea rsi, [rbp-24]
    lea rdi, [LC0]
    xor eax, eax
    call scanf
    cmp qword [rbp-24], 2
    jne .L2
    mov r12, 2
    mov r13, 2
    lea rdx, [rbp-24]
    add rdx, 8
    mov ecx, 199999
.L3:
    mov rax, r12
    sub rax, 1
    cqo
    idiv qword [rdx]
    inc rax
    imul rax, qword [rdx]
    mov r12, rax
    mov rax, r13
    add rax, qword [rdx+8]
    dec rax
    cqo
    idiv qword [rdx]
    imul rax, qword [rdx]
    mov r13, rax
    cmp r13, r12
    jl .L2
    add r13, qword [rbp-24]
    dec r13
    lea rdi, [LC2]
    mov esi, dword 1
    xor eax, eax
    mov rdx, r12
    mov rcx, r13
    call printf
    jmp .L5
.L2:
    lea rdi, [LC1]
    mov esi, dword 1
    xor eax, eax
    call printf
.L5:
    mov rsp, rbp
    pop rbp
    ret
section .rodata
LC0 db "%lld", 0
LC1 db "-1", 0
LC2 db "%lld %lld", 0
