section .text
global main
extern printf, scanf

main:
    push rbp
    mov rbp, rsp
    sub rsp, 0x1000

    lea rdi, [rbp-0x1000]
    xor eax, eax
    call scanf
    mov ecx, eax
    cmp ecx, 0
    jle .L2

    xor ebp, ebp
    xor ebx, ebx
    lea rsi, [rbp-0x1000+4]

.L3:
    xor eax, eax
    lea rdi, [rbp-0x1000+4]
    call scanf
    add ebx, eax
    inc ebp
    cmp ebp, ecx
    jl .L3

    cmp ecx, 1
    jle .L7
    dec ecx
    lea rsi, [rbp-0x1000+4]
    xor rdx, rdx
    mov rcx, 0xffffffffffffffff

.L4:
    xor eax, eax
    mov eax, dword [rsi]
    add rdx, rax
    shl rdx, 1
    sub rdx, rax
    sub rdx, ebx
    cmovl rdx, rax
    cmovg rdx, rcx
    add rsi, 4
    cmp rsi, rdi
    jne .L4

.L2:
    xor eax, eax
    mov rdi, rdx
    xor esi, esi
    lea rdi, [rbp-0x1000+8]
    call printf
    jmp .L12

.L7:
    mov rcx, 0xffffffffffffffff
    jmp .L2

.L12:
    mov eax, 1
    ret
