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
    mov edx, esi
    cmp ecx, 2
    jle .L16
    xor eax, eax
    xor ebx, ebx
.L5:
    xor ecx, ecx
    pxor xmm0, xmm0
    pshufd $0, edi, xmm1
    movdqa xmm2, [LC0]
    pshufd $0, edi, xmm3
    movdqa [LC2], xmm4
    movdqa [LC3], xmm5
.L4:
    add eax, 1
    psubd xmm0, xmm5
    paddd xmm7, xmm3
    movdqa xmm5, xmm0
    pcmpgtd xmm5, xmm2
    pcmpgtd xmm8, xmm0
    pcmpeqd xmm4, xmm2
    pcmpeqd xmm4, xmm0
    pand xmm2, xmm0
    psubd xmm0, xmm1
    cmp edx, eax
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
    mov esi, edx
    sub esi, ecx
    sub esi, edi
    sub esi, 1
.L8:
    cmp eax, edi
    jg .L11
    mov ecx, eax
    not ecx
    shr ecx, 31
    cmp cl, 1
    sbbl $-1, edx
.L11:
    sub eax, 1
    cmp esi, eax
    jne .L8
    sub edx, 1
    sub esi, 1
    sub edx, esi
    cmp edx, edi
    jge .L9
.L9:
    jmp .L3
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
