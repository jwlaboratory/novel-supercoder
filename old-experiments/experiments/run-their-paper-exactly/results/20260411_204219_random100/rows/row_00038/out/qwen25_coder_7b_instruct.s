section .text
global main

main:
    push rbp
    mov rbp, rsp
    sub rsp, 4096
    xor eax, eax
    lea rdi, [rbp-4096]
    call memset
    lea rdi, [rbp-4096]
    lea rsi, [LC0]
    xor eax, eax
    call __isoc99_scanf
    mov ecx, 1
L1:
    cmp ecx, [rbp-4096]
    jg L2
    mov ebx, 1
L3:
    cmp ebx, 101
    jg L4
    mov edx, 1
L5:
    cmp edx, 101
    jg L6
    mov esi, ecx
    imul esi, ebx
    add esi, edx
    imul esi, esi
    add esi, ecx
    add esi, ebx
    add esi, edx
    cmp esi, 10000
    ja L6
    lea rdx, [rbp-4096+esi*4]
    inc dword [rdx]
L6:
    inc edx
    jmp L5
L4:
    inc ebx
    jmp L3
L2:
    mov ecx, 1
L7:
    cmp ecx, [rbp-4096]
    jg L8
    lea rdi, [LC1]
    mov eax, [rbp-4096+ecx*4]
    xor esi, esi
    call __printf_chk
    inc ecx
    jmp L7
L8:
    leave
    ret
