section .text
global cmp
global main

cmp:
    endbr64
    mov rdx, [rsi]
    mov rcx, [rdi]
    cmp rdx, rcx
    je .L5
    ret
.L5:
    sub rbx, [rsi + 8]
    ret

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    xor eax, eax
    lea rdi, [LC0]
    call scanf
    mov rsi, rsp
    test rsi, rsi
    jle .L7
    mov rdi, rsp
    lea rsi, [LC1]
    xor ebx, ebx
.L8:
    mov rdi, rsp
    mov rsi, rsi
    xor eax, eax
    add rsp, 16
    call scanf
    mov rsi, rsp
    mov [rbp - 8], rbx
    inc rbx
    cmp rbx, rsi
    jg .L8
.L7:
    lea rdi, [cmp]
    mov ecx, 16
    mov rsi, rsp
    xor eax, eax
    call qsort
    mov r9, rsp
    mov rdi, rsp
    test r9, r9
    jle .L9
    mov rsi, rsp
    lea rdi, [s]
    cmp r9, 1
    je .L10
    lea rsi, [rsp + 16]
    xor edx, edx
.L12:
    mov rax, [rsi]
    cmp rdi, rax
    je .L11
    mov r8, [rsi + 8]
    sub rax, rdi
    imul rax, rdx
    add [rdi + rax*8], rax
    mov rdi, rax
    cmp rdi, r8
    jge .L11
    mov rdi, r8
    mov edx, 1
.L11:
    inc rdx
    add rsi, 16
    cmp r9, rdx
    jne .L12
    test dl, dl
    je .L10
    mov rdi, r8
.L10:
    imul rax, r9
    add [rdi + rax*8], rax
    xor ebx, ebx
    lea rdi, [LC2]
.L14:
    mov rsi, [rbp - 8 + rbx*8]
    mov rdi, rdi
    xor eax, eax
    add rbx, 1
    call printf
    cmp rbx, r9
    jg .L14
.L9:
    add rsp, 32
    ret
