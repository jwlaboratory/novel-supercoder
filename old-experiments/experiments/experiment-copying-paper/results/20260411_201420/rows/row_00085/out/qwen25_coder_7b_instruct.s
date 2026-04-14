section .text
global main
extern __isoc99_scanf, __printf_chk, __stack_chk_fail

main:
    endbr64
    push rbp
    mov rbp, rsp
    sub rsp, 48
    xor eax, eax
    call __isoc99_scanf
    mov rcx, rax
    lea rsi, [rsp+16]
    mov rdx, [rsp+8]
    and rdx, -4096
    sub rsp, rdx
    and rsp, -16
    test rdx, rdx
    je .L4
.L19:
    sub rsp, 4096
    or qword [rsp+4088], 0
    cmp rsp, rdx
    jne .L19
.L4:
    and edx, 4095
    sub rsp, rdx
    test rdx, rdx
    jne .L20
.L5:
    lea rbx, [rsp+8]
    mov r13, rbx
    and rbx, -8
    shr rbx, 3
    test rcx, rcx
    jle .L6
    mov r15, rbx
    xor r12d, r12d
.L6:
    mov rsi, r15
    mov rdi, r14
    xor eax, eax
    add r12, 1
    call __isoc99_scanf
    mov rax, [rsp+8]
    add r15, 8
    cmp r12, rax
    jg .L6
    mov rdx, [r13]
    mov r8, rdx
    mov rcx, rdx
    shr rcx, 63
    shr r8, 63
    add rdx, r8
    add rcx, rdx
    and eax, 1
    sar r8
    sub rcx, rdx
    mov [r13], rdx
    cmp rax, 1
    jle .L7
    mov ecx, 1
    jmp .L9
.L8:
    mov rdx, [r13]
    shr rdx, 63
    add rdx, r13
    sar rdx
    add rdx, r8
    mov rsi, [r13]
    shr rsi, 63
    add rsi, r13
    and eax, 1
    sub rsi, r13
    mov [r13], rsi
    add r13, 1
    cmp r13, rax
    je .L7
.L9:
    cmp byte [r13], 1
    mov rdx, [r13]
    jne .L8
    test rdx, rdx
    jle .L8
    add r8, 1
    sub rdx, 1
    jmp .L8
.L7:
    xor eax, eax
    mov rdx, r8
    mov edi, 1
    lea rsi, [LC1]
    call __printf_chk
    mov rax, [rbp-56]
    sub rsp, [fs:40]
    jne .L21
    lea rsp, [rbp-40]
    xor eax, eax
    pop rbx
    pop r12
    pop r13
    pop r14
    pop r15
    pop rbp
    ret
.L20:
    or qword [rsp+rax*8], 0
    jmp .L5
.L21:
    call __stack_chk_fail
