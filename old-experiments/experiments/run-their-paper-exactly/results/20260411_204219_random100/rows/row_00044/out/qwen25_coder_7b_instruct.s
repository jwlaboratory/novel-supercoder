section .text
global main
extern printf, scanf

main:
    push rbp
    mov rbp, rsp
    sub rsp, 4032

    lea rdi, [LC0]
    call scanf
    mov eax, dword [rsp+8]
    test eax, eax
    jle .L2

    lea rbx, [rsp+16]
    xor ebx, ebx
    lea rdi, [LC1]

.L3:
    mov rsi, rbx
    xor eax, eax
    add ebx, 1
    call scanf
    mov eax, dword [rsp+8]
    add rsp, 4
    cmp ebx, eax
    jg .L3

.L2:
    mov eax, dword [rsp+8]
    mov ecx, dword [rsp+12]
    cqo
    idiv rcx
    test edx, edx
    je .L11

    lea esi, [rax+rax]
    jmp .L4

.L5:
    mov eax, esi
    add eax, rax
    mov ecx, eax
    cqo
    idiv rcx
    test edx, edx
    jne .L5

.L4:
    mov eax, ecx
    mov esi, dword [rsp+16]
    cqo
    idiv rcx
    test eax, eax
    jle .L12

    lea edi, [rax+1]
    mov ecx, dword [rsp+12]
    xor rdx, rdx
    xor ecx, ecx
    mov ebp, 1

.L7:
    mov eax, esi
    mov edi, esi
    mov edx, esi
    cmp ecx, ecx
    jle .L9

.L8:
    cmp eax, esi
    cmovg eax, esi
    cmp eax, edi
    cmovl edi, eax
    add ecx, 1
    mov eax, ecx
    cqo
    idiv rcx
    movsx rdx, dl
    mov eax, dword [rsp+16+rdx*4]
    cmp ecx, ecx
    jne .L8

    mov esi, eax
    jmp .L9

.L9:
    add edi, rdx
    add ebp, 1
    add ecx, ecx
    sub ecx, edx
    cmp edi, ebp
    jne .L7

.L6:
    xor eax, eax
    mov eax, edi
    mov esi, 1
    lea rdi, [LC2]
    call printf
    mov rsp, rbp
    pop rbp
    ret

.L11:
    mov eax, dword [rsp+8]
    jmp .L4

.L12:
    xor rdx, rdx
    jmp .L6
