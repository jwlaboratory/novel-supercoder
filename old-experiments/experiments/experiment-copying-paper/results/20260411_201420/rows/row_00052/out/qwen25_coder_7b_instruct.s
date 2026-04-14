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
    mov rsi, rbp-0x1000
    jmp .L4

.L2:
    inc ecx
    cmp ecx, 0x2710
    je .L22
.L4:
    movzx eax, byte [rsi+rcx]
    test al, al
    jne .L2
    mov [rbp-0x1000+rbx*4], ecx
    lea rbx, [rbx+1]
    imul ecx, ecx
    cmp ecx, 0x270F
    jg .L14
    cltq
.L3:
    mov byte [rsi+rax], 1
    add rax, rcx
    cmp rax, 0x270F
    jle .L3
.L14:
    inc ecx
    movsx rax, ebx
    cmp rax, 0x2710
    jne .L4
.L22:
    mov dword [rbp-0x1000+rbx*4], 0x2710
    lea rbp, [rbp-0x1000]
    lea rdi, [rbp+0x1000]
    lea rsi, [rbp+0x1000+0x1000]
    jmp .L5

.L5:
    mov rdi, rbp
    mov rsi, rdi
    xor eax, eax
    call __isoc99_scanf
    mov ecx, [rbp]
    test ecx, ecx
    je .L11
    mov ebx, [rbp-0x1000]
    cmp ebx, 0x270F
    jg .L15
    lea rdx, [rbp-0x1000+0x20]
    xor esi, esi
    xor edx, edx
    xor ecx, ecx
.L12:
    lea eax, [rbp-0x1000+1]
    lea rdi, [rbp-0x1000]
    cltq
    cmp edx, ecx
    jle .L10
.L6:
    add eax, [rdi+rax*4]
    mov esi, eax
    add rax, 1
    cmp edx, ecx
    jg .L6
.L10:
    xor eax, eax
    cmp edx, ecx
    sete al
    add rdx, 4
    sub ebx, ecx
    mov ecx, [rdx-4]
    add eax, esi
    cmp ecx, 0x270F
    jle .L12
.L8:
    mov ecx, eax
    mov rdi, rsi
    mov eax, 1
    xor esi, esi
    call __printf_chk
    jmp .L5
.L11:
    mov rax, [rbp-0x1000+0x1000+0x1000]
    sub rsp, rax
    xor eax, eax
    pop rbx
    pop rbp
    ret
.L15:
    xor esi, esi
    jmp .L8
