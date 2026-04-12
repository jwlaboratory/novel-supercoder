section .rodata
    LC0 db 0, 1, 3, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 0
    LC1 db ' ', 0
    LC2 db 'Yes', 0
    LC3 db 'No', 0

section .text
    global main
    extern fgets, strtok, atol, puts, __stack_chk_fail

main:
    push rbp
    mov rbp, rsp
    sub rsp, 208

    lea rdi, [LC0]
    mov ecx, 13
    rep stosb

    lea rdi, [LC1]
    call fgets
    lea rdi, [LC1]
    call strtok
    mov rsi, rax
    xor eax, eax
    call atol
    mov ebx, eax

    lea rdi, [LC1]
    call strtok
    xor eax, eax
    call atol
    mov ecx, eax

    cmp byte [LC0 + rbx], byte [LC0 + rcx]
    je .L7
    lea rdi, [LC3]
    jmp .L3

.L7:
    lea rdi, [LC2]

.L3:
    call puts
    add rsp, 208
    ret
