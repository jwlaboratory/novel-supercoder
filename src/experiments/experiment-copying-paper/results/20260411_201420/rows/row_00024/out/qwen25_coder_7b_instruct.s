section .text
global main
extern printf, scanf

main:
    push rbp
    mov rbp, rsp
    sub rsp, 40

    lea rdi, [LC1]
    xor eax, eax
    call scanf
    mov [rbp-4], eax

    lea rdi, [LC1]
    xor eax, eax
    call scanf
    mov [rbp-8], eax

    lea rdi, [LC1]
    xor eax, eax
    call scanf
    mov [rbp-12], eax

    lea rdi, [LC1]
    xor eax, eax
    call scanf
    mov [rbp-16], eax

    mov eax, [rbp-4]
    test eax, eax
    jle .L14

    mov ecx, [rbp-8]
    mov edi, [rbp-12]
    mov r8d, [rbp-16]

    test ecx, ecx
    jle .L15

    cmp eax, ecx
    mov r9d, 1
    cmovg ecx, eax
    test ecx, ecx
    cmovg ecx, r9d

    cmp ecx, 4
    jle .L16

    lea rax, [r8+r8]
    movd xmm6, r8d
    movdqa xmm3, [LC0]
    lea r10d, [rax+r8]
    movd eax, rax
    pxor xmm0, xmm0
    shrl $2, rdx
    movd r10d, xmm5
    punpckldq xmm6, xmm0
    pshufd $0, xmm6, xmm7
    movdqa [LC2], xmm6
    lea eax, [rax*4]
    punpckldq xmm5, xmm1
    movdqa [LC3], xmm5
    movd ebx, eax
    punpcklqdq xmm1, xmm0
    xor eax, eax
    pshufd $0, ebx, ebx
    punpcklqdq xmm0, xmm1

.L5:
    movdqa xmm2, xmm3
    movdqa xmm1, xmm0
    paddd xmm6, xmm3
    add eax, 1
    paddd xmm4, xmm0
    paddd xmm7, xmm1
    paddd xmm5, xmm2
    cmp edx, eax
    jne .L5

    mov r11d, r9d
    pshufd $255, xmm2, xmm2
    pshufd $255, xmm1, xmm1
    mov ebx, r8d
    and r11d, -4
    movd eax, xmm2
    movd edx, xmm1
    imul ebx, r11d
    lea r10d, [r11+1]
    cmp r11d, r9d
    je .L7

.L4:
    lea rax, [r10+1]
    lea rdx, [r8+rbx]
    cmp eax, ecx
    jl .L7
    lea rax, [r10+2]
    add rdx, r8d
    cmp eax, ecx
    jl .L7
    lea rax, [r10+3]
    add rdx, r8d
    cmp eax, ecx
    jl .L7
    add rdx, r8d
    lea rax, [r10+4]
.L7:
    cmp eax, [rbp-4]
    jl .L2
.L3:
    mov ecx, [rbp-4]
    mov r8d, 1
    sub eax, ecx
    cmp eax, [rbp-4]
    lea r9d, [rcx+1]
    cmovl r8d, r9d
    jl .L8
    cmp ecx, 2
    jbe .L8
    lea r10d, [rdi+rdx]
    movd edx, rdx
    movd edi, rdi
    mov r8d, r9d
    lea ecx, [rdi+r10d]
    movd r10d, ecx
    lea ebx, [rdi*4]
    shr r8d, 2
    lea r11d, [rdi+rcx]
    movd ecx, r10d
    punpckldq xmm5, xmm1
    xor ecx, ecx
    movd r11d, ebx
    punpckldq xmm4, xmm0
    pshufd $0, ebx, ebx
    punpcklqdq xmm0, xmm1

.L9:
    movdqa xmm1, xmm0
    add eax, 1
    paddd xmm2, xmm1
    paddd xmm3, xmm0
    cmp r8d, eax
    jne .L9

    mov r8d, r9d
    mov r10d, edi
    pshufd $255, xmm0, xmm0
    and r8d, -4
    movd eax, xmm0
    imul r10d, r8d
    add eax, r8d
    add edx, r10d
    cmp r8d, r9d
    je .L17

.L8:
    lea ecx, [rax+1]
    add edx, edi
    cmp ecx, [rbp-4]
    jg .L2
    add eax, 2
    add edx, edi
    cmp eax, [rbp-4]
    jl .L2
    add edx, edi
.L2:
    xor eax, eax
    mov rsi, rbp
    mov edi, 1
    call printf
    jmp .L24

.L15:
    mov eax, 1
    xor edx, edx
    jmp .L3

.L17:
    mov edx, ecx
    jmp .L2

.L14:
    xor edx, edx
    jmp .L2

.L16:
    mov r10d, 1
    xor ebx, ebx
    jmp .L4

.L24:
    ret

section .rodata
LC1 db "%d", 0
LC0 dd 1, 2, 3, 4
LC2 dd 4, 4, 4, 4
LC3 dd 1, 1, 1, 1
