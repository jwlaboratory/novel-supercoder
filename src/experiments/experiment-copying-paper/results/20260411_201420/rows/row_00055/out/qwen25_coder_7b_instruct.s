section .data
    LC0 db "%d%d", 0
    LC1 db "%d\n", 0

section .bss
    N resd 1
    W resd 1
    v resd 105
    w resd 105
    dp resd 10005
    r resd 1
    i resd 1
    j resd 1

section .text
global main
extern __isoc99_scanf
extern __printf_chk

main:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    lea rdi, [LC0]
    call __isoc99_scanf
    mov eax, [N]
    xor ecx, ecx
    cmp eax, ecx
    jle .L3
    xor eax, eax
    lea rsi, [w]
    lea rdx, [v]
.L2:
    mov rdi, rsi
    sal rcx, 2
    add rdi, rcx
    mov rsi, rdx
    add rsi, rcx
    xor eax, eax
    call __isoc99_scanf
    inc dword [i]
    cmp dword [i], eax
    jl .L2
    mov eax, [r]
    xor ecx, ecx
    cmp dword [N], ecx
    jle .L3
    mov ebp, [W]
    lea esi, [v]
    dec ebp
    lea edi, [w + 4]
    lea rax, [dp + 4]
    lea ebx, [esi + 4]
.L8:
    test ebp, ebp
    js .L10
    mov ecx, [edi]
    mov edx, ebx
    sub edx, edi
    neg edx
    movsxd r9, edx
    lea r10, [rax + r9*4]
.L7:
    test edx, edx
    js .L6
    mov eax, [r10]
    mov ecx, [esi]
    add eax, [r10 + 4]
    cmp eax, [r14]
    cmovl eax, [r14]
    cmp eax, [r13]
    cmovl eax, [r13]
    mov [r10], eax
    mov [r13], eax
    inc eax
.L6:
    inc edx
    add r10, 4
    cmp edi, edx
    jne .L7
    mov edx, ebx
.L5:
    add rsi, 4
    add rdi, 4
    cmp rax, rsi
    jne .L8
    mov [j], edx
    mov eax, [N]
    cmp eax, ecx
    je .L3
    mov eax, [r13]
    mov [r], eax
.L3:
    mov eax, [r]
    lea rdi, [LC1]
    mov ecx, 1
    xor edx, edx
    call __printf_chk
    leave
    ret
.L10:
    xor edx, edx
    jmp .L5
