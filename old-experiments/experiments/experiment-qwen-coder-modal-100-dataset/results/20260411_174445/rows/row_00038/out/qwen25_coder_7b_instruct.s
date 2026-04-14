section .text
global main
extern printf, scanf

section .data
    LC0 db "%d", 0
    LC1 db "%d\n", 0
    LC2 db "%d%d", 0
    mv dd -1, 0, 0, 1, 1, 0, 0, -1
    mk resb 700
    map resb 100
    end dd 0
    top dd 0
    q resb 11200

section .text
main:
    push rbp
    mov rbp, rsp
    sub rsp, 72
    xor eax, eax
    lea rdx, [rbp-72]
    lea rsi, [rbp-68]
    mov edi, LC2
    call scanf
    test eax, eax
    je .L39
    mov eax, [rbp-68]
    test eax, eax
    jle .L39
    mov esi, mk
    mov ecx, 87
    xor eax, eax
    xor ebx, ebx
    mov rdi, esi
    mov eax, [rbp-72]
    xor ebp, ebp
    rep stosq
    mov dword [esi], 0
    test eax, eax
    jle .L4
.L62:
    xor r12d, r12d
    jmp .L3
.L5:
    cmp eax, 3
    mov eax, [rbp-68]
    cmovz r12d, r13d
    cmovz ebp, r14d
    add r12, 1
    cmp r12, eax
    jle .L64
.L3:
    lea rsi, [rbp-64]
    mov edi, LC0
    xor eax, eax
    call scanf
    mov eax, [rbp-64]
    mov byte [map+r12*2+rbx], al
    cmp eax, 2
    jne .L5
    mov eax, [rbp-68]
    mov r15d, r12d
    mov ebp, [rbp-68]
    mov byte [map+r12*2+rbx], 1
    add r12, 1
    cmp r12, eax
    jg .L3
.L64:
    mov eax, [rbp-72]
    add ebp, 1
    cmp ebp, eax
    jge .L4
    add rbx, 10
    test eax, eax
    jg .L62
.L4:
    mov rax, [rbp-72]
    mov rsi, [rbp-68]
    mov [rbp-68], eax
    xor r9d, r9d
    mov rcx, LC1
    mov byte [rbp-66], 0
    mov ebp, 1
    mov [rbp-72], eax
    imul rax, 70
    mov [rbp-72], rax
    mov [rbp-72], rcx
    lea rcx, [rbp-72]
    sub rsi, rax
    mov eax, [rbp-68]
    mov [rbp-72], eax
    xor esi, esi
    mov byte [mk+6+rbx*8+rax], 1
    mov eax, [rbp-68]
    mov [rbp-72], eax
    mov [rbp-72], eax
    mov [rbp-72], eax
    mov [rbp-72], eax
    mov [rbp-72], eax
    mov [rbp-72], eax
    jmp .L9
.L22:
    mov eax, [rdi]
    mov edx, [rdi+4]
    add esi, 1
    mov ecx, [rdi+8]
    mov r13d, [rdi+12]
    cmp eax, r14d
    jne .L10
    mov ebx, [rbp-68]
    cmp edx, ebx
    je .L65
.L10:
    add rdi, 16
    mov r9d, 1
    cmp ecx, 1
    jle .L13
    mov ebx, [rbp-68]
    lea edi, [rax+rbx]
    mov ebx, [rdi+4]
    lea r8d, [rdx+rbx]
    mov ebx, edi
    or r8d, ebx
    js .L14
    cmp edi, r11d
    jle .L14
    cmp r15d, r8d
    jge .L14
    mov r9, rdi
    mov r10, rdx
    lea rbx, [r9+r9*4]
    movzx bl, byte [map+r10*2+rbx*2]
    test bl, bl
    je .L14
    imul r9, 70
    lea r12, [r10+r10*8]
    sub r10, r12
    lea ebx, [r9-1]
    lea r9, [mk+r9+r12]
    mov r12, ebx
    add r9, r12
    cmp byte [r9], 0
    jne .L14
    mov byte [r9], 1
    mov r9, rdi
    lea rdi, [r9+4]
    mov [r9], esi
    mov [r9+4], r13d
    mov eax, 6
    cmovz eax, ecx
    mov [r9+8], eax
    mov [r9+12], r15d
    jmp .L14
.L14:
    mov eax, [rbp-68]
    add rdi, eax
    add rsi, eax
    mov ebx, eax
    or rsi, ebx
    js .L20
    cmp edi, r11d
    jle .L20
    cmp r15d, rsi
    jge .L20
    mov r9, rdi
    mov r8, rsi
    lea rax, [r9+r9*4]
    movzx eax, byte [map+r8*2+rax*2]
    test al, al
    je .L20
    imul r9, 70
    lea r12, [r8+r8*8]
    sub r8, r12
    dec ecx
    sub r8, r12
    mov r9, rdi
    lea rdi, [mk+r9+r12]
    add r9, r8
    cmp byte [r9], 0
    jne .L20
    mov byte [r9], 1
    mov r9, rdi
    lea rdi, [r9+4]
    mov [r9], esi
    mov [r9+4], r13d
    mov eax, 6
    cmovz eax, ecx
    mov [r9+8], eax
    mov [r9+12], r15d
    jmp .L20
.L20:
    mov r9d, 1
.L9:
    mov esi, [rbp-68]
    shl esi, 4
    add rdi, q
.L13:
    cmp esi, ebp
    jg .L22
    cmp byte [rbp-66], 0
    mov eax, [rbp-68]
    mov [rbp-68], eax
    mov [rbp-68], eax
    je .L23
    mov ebp, [rbp-68]
.L23:
    test r9d, r9d
    je .L24
    mov esi, [rbp-68]
    mov [rbp-68], eax
.L24:
    mov ecx, -1
.L12:
    mov esi, ecx
    mov edi, LC1
    xor eax, eax
    call printf
    jmp .L2
.L65:
    cmp byte [rbp-66], 0
    mov eax, [rbp-68]
    mov [rbp-68], eax
    mov [rbp-68], eax
    je .L11
    mov ebp, [rbp-68]
.L11:
    mov esi, [rbp-68]
    mov [rbp-
