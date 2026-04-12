section .text
global main

main:
    sub rsp, 24
    lea rdi, [LC0]
    call __isoc99_scanf
    mov ecx, eax
    test ecx, ecx
    jz .L2
    cmp ecx, 1000
    ja .L4
    mov eax, dword [rsp + 8]
    xor edx, edx
    div dword [rsp + 12]
    cmp edx, ecx
    jbe .L5
.L3:
    lea rsi, [LC2]
    jmp .L4
.L5:
    lea rsi, [LC1]
.L4:
    mov edi, 1
    xor eax, eax
    call __printf_chk
    add rsp, 24
    ret
.L2:
    mov eax, dword [rsp + 8]
    xor edx, edx
    div dword [rsp + 12]
    test edx, edx
    jz .L5
    jmp .L3
