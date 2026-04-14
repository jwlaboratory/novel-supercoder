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
    mov eax, [edi]
    mov ecx, ebx
    lea rdx, [dp]
    mov edx, eax
    sub ecx, eax
    neg edx
    movslq edx, rdx
.L7:
    test edx, edx
    js .L6
    mov eax, [rdx]
    mov ecx, [esi]
    add eax, [rdx + 4*edx]
    cmp eax, [rdx]
    cmovl eax, [rdx]
    cmp eax, [r]
    cmovl eax, [r]
    mov [rdx], eax
    mov [r], eax
    inc eax
.L6:
    add ecx, 4
    add rdx, 4
    cmp ecx, ebp
    jne .L7
    mov ecx, ebx
.L5:
    add esi, 4
    add edi, 4
    cmp rax, esi
    jne .L8
    mov ecx, ebx
    jmp .L3
.L10:
    xor ecx, ecx
    jmp .L5
.L3:
    mov eax, [r]
    lea rdi, [LC1]
    mov ecx, 1
    xor edx, edx
    call __printf_chk
    leave
    ret
