section .text
global main
extern __isoc99_scanf, __printf_chk, __stack_chk_fail

main:
    sub rsp, 24
    lea rdi, [LC0]
    call __isoc99_scanf
    cmp eax, 1
    jne .L1
    mov rdi, rsp
    test rdi, rdi
    je .L11
    mov ecx, 1
    xor r9, r9
    xor r10, r10
.L6:
    mov rax, rdi
    xor edx, edx
    div rcx
    test rdx, rdx
    jne .L4
    sub rax, 1
    mov rsi, rax
    je .L5
    xor edx, edx
    mov rax, rdi
    div rsi
    add r10, rsi
    cmp rax, rdx
    cmove rsi, r10
.L5:
    test rcx, rcx
    je .L8
    test r9, r9
    je .L4
    mov rax, rdi
    xor edx, edx
    div r9
    cmp rax, rdx
    jne .L4
    add r9, r10
.L4:
    mov rax, rdi
    imul rdi, rax
    cmp rdi, rax
    ja .L3
.L8:
    add r9, 1
    add rcx, 1
    add rdi, 1
    jmp .L6
.L11:
    xor r10, r10
.L3:
    mov rdx, r10
    lea rsi, [LC1]
    mov edi, 1
    xor eax, eax
    call __printf_chk
    xor eax, eax
.L1:
    mov rdx, rsp
    sub rsp, [fs:40]
    jne .L21
    add rsp, 24
    ret
.L21:
    call __stack_chk_fail
