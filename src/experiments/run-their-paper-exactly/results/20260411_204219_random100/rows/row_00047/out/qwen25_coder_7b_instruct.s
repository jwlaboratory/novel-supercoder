section .text
global main
extern __isoc99_scanf, strlen, puts, __stack_chk_fail

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    xor eax, eax
    lea rdi, [rbp-32]
    call __isoc99_scanf
    call strlen
    test rax, rax
    je .L2
    cmp byte [rbp-32], 104
    jne .L3
    cmp byte [rbp-31], 105
    jne .L3
    cmp qword [rax], 2
    jb .L2
    cmp byte [rbp-29], 104
    jne .L3
    cmp byte [rbp-28], 105
    jne .L3
    cmp qword [rax], 4
    jb .L2
    cmp byte [rbp-26], 104
    jne .L3
    cmp byte [rbp-25], 105
    jne .L3
    cmp qword [rax], 6
    jb .L2
    cmp byte [rbp-23], 104
    jne .L3
    cmp byte [rbp-22], 105
    jne .L3
    cmp qword [rax], 8
    jb .L2
    cmp byte [rbp-20], 104
    jne .L3
    cmp byte [rbp-19], 105
    jne .L3
.L2:
    lea rdi, [rel .LC2]
    call puts
    jmp .L4
.L3:
    lea rdi, [rel .LC1]
    call puts
.L4:
    add rsp, 32
    pop rbp
    ret
