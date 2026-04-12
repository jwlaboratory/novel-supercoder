section .text
global main
extern printf, scanf

main:
    sub rsp, 24
    lea rdi, [LC0]
    call scanf
    mov eax, dword [rsp+8]
    test eax, eax
    js .L2
    imul eax, 1000
    mov esi, dword [rsp+12]
    xor ecx, ecx
.L3:
    add ecx, 1
    add eax, 4000
    cmp ecx, esi
    jg .L2
    mov ebx, esi
    sub ebx, ecx
    cmp eax, ebx
    je .L4
    jmp .L3
.L4:
    lea rdi, [LC1]
    mov esi, 1
    xor eax, eax
    call printf
    jmp .L5
.L2:
    or eax, -1
    or ecx, -1
    or edx, -1
    lea rdi, [LC1]
    xor eax, eax
    call printf
.L5:
    add rsp, 24
    ret
section .rodata
LC0 db "%d%d", 0
LC1 db "%d %d %d\n", 0
