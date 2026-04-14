section .text
global main
extern __isoc99_scanf, __printf_chk, __stack_chk_fail

main:
    sub rsp, 24
    lea rdi, [LC0]
    call __isoc99_scanf
    mov eax, dword [rsp+4]
    test eax, eax
    jle .L5
    lea r8d, [rax+1]
    mov esi, 1
    mov edx, 1
    movabs rdi, -8543223828751151131
.L3:
    imul rcx, rsi, rdx
    add esi, 1
    imul rax, rdi
    sar rax, 63
    add rdx, rcx
    sar rdx, 29
    sub rdx, rax
    imul rax, rdx, 1000000007
    sub rcx, rax
    mov rdx, rcx
    cmp r8d, esi
    jne .L3
.L2:
    xor eax, eax
    lea rsi, [LC1]
    mov edi, 1
    call __printf_chk
    add rsp, 24
    ret
.L5:
    mov eax, 1
    jmp .L2
