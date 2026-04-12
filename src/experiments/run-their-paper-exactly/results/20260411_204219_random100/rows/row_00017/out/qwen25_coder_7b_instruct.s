section .text
global main
extern __isoc99_scanf, puts, __stack_chk_fail

main:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    xor eax, eax
    call __isoc99_scanf
    mov ecx, eax
    lea rsi, [rbp-60]
    mov eax, ecx
    imul eax, 4
    add eax, 15
    and eax, -4096
    sub rsp, eax
    and rsp, -16
    test rsp, rsp
    je .L3
.L22:
    sub rsp, 4096
    or qword [rsp+4088], 0
    cmp rsp, rsi
    jne .L22
.L3:
    and rsp, 4095
    sub rsp, rdx
    test rdx, rdx
    jne .L23
.L4:
    test ecx, ecx
    jle .L6
    xor r14d, r14d
    xor r12d, r12d
    xor r15d, r15d
.L10:
    lea rbx, [rbp-60]
    add rbx, r14
    mov eax, dword [rbx]
    test al, 3
    je .L25
    test al, 1
    jne .L9
    inc r12d
    inc r14d
    jmp .L8
.L25:
    inc r14d
.L8:
    add rbx, 4
    cmp r14d, ecx
    jle .L10
.L6:
    lea eax, [r12+1]
    cmp eax, r15d
    jge .L13
    cmp r12d, r15d
    jle .L13
    lea rdi, [rel .LC2]
    call puts
    jmp .L13
.L9:
    inc r15d
    jmp .L8
.L23:
    or qword [rsp+rdx*8], 0
    jmp .L4
.L13:
    mov rsp, rbp
    pop rbp
    ret
.L26:
    call __stack_chk_fail
