section .text
global main

main:
    sub rsp, 24
    lea rdi, [LC0]
    call __isoc99_scanf
    mov eax, dword [rsp+4]
    xor ebx, ebx
    test eax, eax
    je .L2
.L4:
    xor ecx, ecx
    mov ecx, eax
    shr ecx, 31
    imul eax, 1717986919
    sar eax, 34
    sub eax, ecx
    lea ecx, [rax+rax*4]
    add ecx, ecx
    sub eax, ecx
    cmp eax, 2
    sete al
    movzx eax, al
    add ebx, eax
    shr eax, 31
    jne .L4
.L2:
    xor eax, eax
    mov eax, ebx
    lea rdi, [LC1]
    call __printf_chk
    add rsp, 24
    ret
