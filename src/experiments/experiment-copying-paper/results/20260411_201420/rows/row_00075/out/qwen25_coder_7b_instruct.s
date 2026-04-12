section .text
global main

main:
    push rbp
    mov rbp, rsp
    sub rsp, 40
    xor eax, eax
    mov [rbp-4], eax
    xor eax, eax
    mov [rbp-8], eax
    xor eax, eax
    mov [rbp-12], eax
    lea rdi, [rbp-4]
    mov ecx, 100001
    jmp .L2

.L1:
    cmp byte [rbp-4], 98
    je .L3
    cmp byte [rbp-4], 99
    jne .L4
    add dword [rbp-12], 1
    jmp .L5

.L2:
    mov rsi, rdi
    call __isoc99_scanf@PLT
    movzx eax, byte [rbp-4]
    cmp al, 97
    jne .L1
    add dword [rbp-8], 1
    jmp .L5

.L3:
    add dword [rbp-16], 1

.L4:
    sub ecx, 1
    jnz .L2

.L5:
    cmp ecx, 0
    jz .L6
    jmp .L1

.L6:
    mov eax, [rbp-8]
    pxor xmm0, xmm0
    movaps xmm2, [LC1]
    cvtsi2ss xmm0, eax
    andps xmm0, xmm2
    ucomiss xmm0, [LC2]
    ja .L7
    mov eax, [rbp-12]
    pxor xmm0, xmm0
    cvtsi2ss xmm0, eax
    andps xmm0, xmm2
    ucomiss xmm0, [LC2]
    jbe .L8
    jmp .L7

.L7:
    lea rdi, [LC3]
    xor eax, eax
    call printf@PLT
    jmp .L9

.L8:
    sub eax, [rbp-16]
    pxor xmm0, xmm0
    cvtsi2ss xmm0, eax
    andps xmm0, xmm2
    ucomiss xmm0, [LC2]
    ja .L7
    lea rdi, [LC4]
    xor eax, eax
    call printf@PLT

.L9:
    mov rsp, rbp
    pop rbp
    ret

section .rodata
LC1:
    dd -1
    dd 2147483647
    dd 0
    dd 0
LC2:
    dd 0
    dd 1072693248
