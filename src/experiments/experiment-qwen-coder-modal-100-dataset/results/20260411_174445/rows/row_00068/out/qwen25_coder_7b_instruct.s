section .text
global main

main:
    push rbp
    mov rbp, rsp
    sub rsp, 48

    lea rdi, [rbp-4]
    xor eax, eax
    call scanf
    lea rsi, [rbp-20]
    call scanf
    lea rsi, [rbp-36]
    call scanf
    lea rsi, [rbp-52]
    call scanf

    mov ecx, 1000
    lea rdx, [rbp-4000]
    mov eax, 100000000
    rep stosd

    mov ecx, 900
    lea rdx, [rbp-4000]
    lea rsi, [rbp-20]
    lea rdi, [rbp-52]

L1:
    mov ebx, 4
L2:
    add rsi, 4
    mov eax, [rsi]
    add rdi, 4
    mov ecx, [rdi]
    add rdx, 4
    mov edx, [rdx]
    add rax, [rdx]
    cmp rax, [rdx-4]
    cmovg [rdx-4], rax
    dec ebx
    jnz L2
    dec ecx
    jnz L1

    mov ecx, [rbp-4]
    mov eax, 1000000
L3:
    cmp ecx, 999
    ja L4
    mov eax, 1000
    sub eax, ecx
    sub eax, ecx
    cmp eax, 2
    jbe L5
    mov ebx, eax
    mov ecx, [rbp-4000+4*ecx]
    mov edx, [rbp-4000+4*(ecx+1)]
    mov esi, [rbp-4000+4*(ecx+2)]
    mov edi, [rbp-4000+4*(ecx+3)]

L6:
    mov eax, [rbp-4000+4*ecx]
    cmp eax, [rbp-4000+4*(ecx+1)]
    cmovg eax, [rbp-4000+4*(ecx+1)]
    cmp eax, [rbp-4000+4*(ecx+2)]
    cmovg eax, [rbp-4000+4*(ecx+2)]
    cmp eax, [rbp-4000+4*(ecx+3)]
    cmovg eax, [rbp-4000+4*(ecx+3)]
    mov [rbp-4000+4*ecx], eax
    inc ecx
    cmp ecx, 999
    jle L6

L5:
    mov eax, [rbp-4000+4*ecx]
    cmp eax, 1000000
    cmovg eax, 1000000
    mov [rbp-4000+4*ecx], eax
    inc ecx
    jmp L5

L4:
    mov eax, [rbp-4000+4*ecx]
    cmp eax, 1000000
    cmovg eax, 1000000
    mov [rbp-4000+4*ecx], eax

    mov rdi, [rbp-4]
    mov eax, 1000000
    call printf

    leave
    ret
