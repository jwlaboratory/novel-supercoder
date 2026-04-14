section .text
global main
extern __isoc99_scanf, __printf_chk, __stack_chk_fail

main:
    push rbp
    mov rbp, rsp
    sub rsp, 24

    lea rdi, [LC0]
    xor eax, eax
    call __isoc99_scanf
    test eax, eax
    jle .L2

    mov ecx, 1
    lea rsi, [rsp+4]
    jmp .L3

.L3:
    xor eax, eax
    mov rdi, rsi
    call __isoc99_scanf
    add [rsp], eax
    cmp eax, ecx
    cmovl eax, ecx
    inc ecx
    cmp ecx, [rsp]
    jl .L3

.L2:
    sub ecx, [rsp]
    sar ecx
    lea edx, [rcx + [rsp]]
    lea rsi, [LC1]
    mov edi, 1
    call __printf_chk

    mov rsp, rbp
    pop rbp
    ret
