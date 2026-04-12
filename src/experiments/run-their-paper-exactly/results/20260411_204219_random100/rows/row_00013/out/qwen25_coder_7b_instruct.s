section .text
global main

main:
    push rbp
    mov rbp, rsp
    sub rsp, 456

    lea rdi, [LC0]
    call read_int
    mov eax, edi
    test eax, eax
    jle .L12

    lea rsi, [L1]
    call read_array
    mov ecx, eax
    add ecx, 2
    cmp ecx, 2
    jle .L12

    lea rdi, [L2]
    xor eax, eax
    mov ebx, 2
    call calculate_count
    mov esi, eax

    lea rdi, [LC1]
    mov eax, esi
    call print_int
    call fflush

    jmp .L2

.L12:
    xor eax, eax
    jmp .L2

calculate_count:
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov ecx, [rbp+16]
    mov edx, [rbp+20]
    xor eax, eax

.L3:
    mov esi, [rbp+16]
    add esi, 4
    cmp esi, ecx
    jge .L4

    mov edi, [rbp+20]
    add edi, 4
    cmp edi, ecx
    jge .L4

    mov ebp, [rbp+16]
    add ebp, 8
    cmp ebp, ecx
    jge .L4

    mov eax, [rbp+16]
    add eax, 4
    mov esi, [rbp+20]
    add esi, 4
    mov edi, [rbp+24]
    add edi, 4
    call check_triangle
    add eax, eax
    jmp .L3

.L4:
    mov rsp, rbp
    pop rbp
    ret

check_triangle:
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov eax, [rbp+16]
    mov esi, [rbp+20]
    mov edi, [rbp+24]

    cmp eax, esi
    je .L5
    cmp eax, edi
    je .L5
    cmp esi, edi
    je .L5

    add eax, esi
    cmp eax, edi
    jl .L5

    add eax, edi
    cmp eax, esi
    jl .L5

    add esi, edi
    cmp esi, eax
    jl .L5

    mov eax, 1
    jmp .L6

.L5:
    xor eax, eax

.L6:
    mov rsp, rbp
    pop rbp
    ret

read_int:
    push rbp
    mov rbp, rsp
    sub rsp, 8

    lea rdi, [rbp-4]
    mov eax, 0
    call __isoc99_scanf
    mov eax, [rbp-4]
    mov rsp, rbp
    pop rbp
    ret

read_array:
    push rbp
    mov rbp, rsp
    sub rsp, 8

    mov ecx, [rbp+16]
    xor eax, eax

.L7:
    lea rdi, [rbp-4]
    mov eax, 0
    call __isoc99_scanf
    mov eax, [rbp-4]
    mov [rbp+16+rax*4], eax
    inc eax
    cmp eax, ecx
    jne .L7

    mov rsp, rbp
    pop rbp
    ret

print_int:
    push rbp
    mov rbp, rsp
    sub rsp, 8

    lea rdi, [rbp-4]
    mov eax, 0
    call __printf_chk
    mov rsp, rbp
    pop rbp
    ret

fflush:
    push rbp
    mov rbp, rsp
    sub rsp, 8

    mov rdi, [rbp+16]
    call fflush
    mov rsp, rbp
    pop rbp
    ret

section .rodata
LC0 db "%d", 0
LC1 db "%d\n", 0
L1 dd 101 dup(0)
L2 dd 101 dup(0)

section .bss
stdout resq 1
