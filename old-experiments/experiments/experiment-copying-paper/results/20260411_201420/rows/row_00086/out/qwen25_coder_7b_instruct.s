section .text
global main

main:
    push rbp
    mov rbp, rsp
    sub rsp, 48

    lea rdi, [LC0]
    lea rsi, [rbp-48]
    call scanf

    mov eax, dword [rbp-48+12]
    dec eax
    cmp eax, 0
    jge .L2

.L2:
    xor eax, eax
    jmp .L15

.L3:
    cmp byte [rbp-48], 't'
    je .L5
    cmp byte [rbp-48], 'k'
    jne .L13
    xor eax, eax
    jmp .L4

.L4:
    add eax, dword [rbp-48+16]
    jmp .L6

.L5:
    add eax, dword [rbp-48+20]
    jmp .L6

.L6:
    cmp eax, 0
    jl .L7
    jmp .L8

.L7:
    xor eax, eax

.L8:
    lea rdi, [LC2]
    xor esi, esi
    call printf

    mov rsp, rbp
    pop rbp
    ret

.L13:
    add eax, dword [rbp-48+12]
    jmp .L4

.L15:
    add rsp, 48
    ret
