section .text
global main

main:
    push rbp
    mov rbp, rsp
    sub rsp, 0x1000

    lea rdi, [rbp-0x1000]
    mov ecx, 0x1000
    xor eax, eax
    call memset

    mov ecx, 2
    mov ebx, 0
    jmp .L2

.L1:
    cmp ecx, 0x2710
    jge .L3
    cmp byte [rdi+rcx], 0
    je .L1
    mov [rbp-0x1000+rbx*4], ecx
    inc rbx
    imul ecx, ecx
    cmp ecx, 0x270F
    jg .L4
    cltq
.L5:
    mov byte [rdi+rax], 1
    add rax, rcx
    cmp rax, 0x270F
    jle .L5
.L4:
    inc ecx
    jmp .L1

.L3:
    mov [rbp-0x1000+rbx*4], 0x2710
    lea rsi, [rbp-0x1000]
    lea rdi, [rbp-0x1000+rbx*4]
    xor eax, eax
    call scanf
    test eax, eax
    je .L6
    mov ecx, [rbp-0x1000+rbx*4]
    cmp ecx, 0x270F
    jg .L7
    lea rdx, [rbp-0x1000+rbx*4]
    xor eax, eax
    xor esi, esi
    xor edi, edi
.L8:
    inc esi
    cmp esi, ecx
    jle .L9
    jmp .L10
.L9:
    add eax, [rdx+esi*4]
    inc esi
    jmp .L8
.L10:
    xor eax, eax
    cmp eax, ecx
    sete al
    add rdi, 4
    sub ecx, eax
    mov ecx, [rdi-4]
    add eax, esi
    cmp ecx, 0x270F
    jle .L8
.L7:
    mov eax, esi
    mov rdi, rax
    xor eax, eax
    call printf
    jmp .L6

.L6:
    leave
    ret
