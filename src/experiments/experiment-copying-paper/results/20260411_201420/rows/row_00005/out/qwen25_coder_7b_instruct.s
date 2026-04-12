section .text
global main
extern __isoc99_scanf, __printf_chk, __stack_chk_fail

main:
    sub rsp, 24
    lea rdi, [LC1]
    call __isoc99_scanf
    mov ecx, eax
    test ecx, ecx
    js .L15
    mov edx, ecx
    add ecx, 1
    cmp ecx, 2
    jle .L16
    xor eax, eax
    xor ebx, ebx
.L5:
    xor ecx, ecx
    xor edx, edx
.L4:
    pxor xmm0, xmm0
    pxor xmm1, xmm1
    pxor xmm2, xmm2
    pxor xmm3, xmm3
    pxor xmm4, xmm4
    pxor xmm5, xmm5
    pxor xmm6, xmm6
    pxor xmm7, xmm7
    pxor xmm8, xmm8
    pxor xmm9, xmm9
    pxor xmm10, xmm10
    pxor xmm11, xmm11
    movdqa xmm7, [LC0]
    movdqa xmm8, [LC1]
    movdqa xmm9, [LC2]
    movdqa xmm10, [LC3]
    pshufd $0, xmm7, xmm11
    movdqa xmm4, xmm7
    movdqa xmm7, [LC4]
    pshufd $0, xmm7, xmm8
    movdqa xmm10, [LC5]
    pshufd $0, xmm10, xmm9
.L12:
    movdqa xmm0, xmm11
    movdqa xmm6, xmm10
    paddd xmm10, xmm9
    psubd xmm0, xmm6
    movdqa xmm3, xmm0
    movdqa xmm6, xmm5
    movdqa xmm4, xmm2
    add eax, 1
    psubd xmm0, xmm6
    paddd xmm7, xmm3
    movdqa xmm5, xmm0
    pcmpgtd xmm5, xmm2
    pcmpgtd xmm8, xmm0
    pcmpeqd xmm4, xmm2
    pcmpeqd xmm4, xmm0
    pand xmm2, xmm0
    psubd xmm0, xmm1
    cmp ecx, edx
    jne .L4
    add ecx, 1
    cmp esi, ecx
    jne .L5
    movdqa xmm1, xmm0
    mov eax, ecx
    psrldq $8, xmm0
    and ecx, -4
    paddd xmm0, xmm1
    movdqa xmm1, xmm0
    psrldq $4, xmm0
    paddd xmm0, xmm1
    mov edx, eax
    test al, 3
    je .L2
.L3:
    mov ecx, edx
    sub ecx, esi
    mov esi, ecx
    sub esi, edi
    sub esi, 1
.L8:
    cmp esi, eax
    jg .L10
    mov ecx, eax
    not ecx
    shr ecx, 31
    cmp cl, 1
    sbbl -1, edx
.L10:
    sub eax, 1
    cmp esi, eax
    jne .L8
    sub edx, 1
    mov eax, edx
    sub esi, 1
    sub eax, edx
    cmp eax, edi
    jge .L3
.L2:
    xor eax, eax
    lea rsi, [LC4]
    mov edi, 1
    call __printf_chk
    add rsp, 24
    ret
.L15:
    xor edx, edx
    jmp .L2
.L16:
    xor ecx, ecx
    xor edx, edx
    jmp .L3
