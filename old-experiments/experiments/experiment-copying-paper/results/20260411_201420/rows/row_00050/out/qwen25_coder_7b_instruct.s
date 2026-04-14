section .text
global main
extern printf, scanf, fflush

main:
    push rbp
    mov rbp, rsp
    sub rsp, 4096
    xor eax, eax
    lea rdi, [rbp-4096]
    call malloc
    mov r12, rax
    lea rdi, [rbp-4]
    lea rsi, [LC0]
    xor eax, eax
    call scanf
    mov ecx, eax
    test ecx, ecx
    jle .L5
.L4:
    lea rdi, [rbp-8]
    lea rsi, [LC0]
    xor eax, eax
    add ecx, 1
    call scanf
    mov eax, dword [rbp-8]
    add r12d, 4
    cmp ecx, eax
    jge .L4
    test ecx, ecx
    jle .L5
    xor eax, eax
.L7:
    mov ebx, 1
    jmp .L9
.L9:
    mov edx, eax
.L7:
    mov esi, eax
    lea edi, [rax+1]
    cmp eax, [r12+esi*4]
    jne .L6
    inc eax
    cmp eax, ecx
    jle .L6
    mov esi, eax
    add eax, 2
    cmp esi, [r12+esi*4]
    cmove eax, esi
.L6:
    cmp eax, ecx
    jge .L9
.L3:
    mov edi, 1
    xor eax, eax
    mov eax, ebx
    lea rsi, [LC1]
    call printf
    mov rdi, stdout
    call fflush
    leave
    ret
.L5:
    xor eax, eax
    jmp .L3
