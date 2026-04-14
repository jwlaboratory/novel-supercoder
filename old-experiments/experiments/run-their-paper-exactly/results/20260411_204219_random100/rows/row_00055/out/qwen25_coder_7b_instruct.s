section .text
global main
extern __isoc99_scanf, __printf_chk, __stack_chk_fail

main:
    push rbp
    mov rbp, rsp
    sub rsp, 100000
    lea rdi, [rbp-100000]
    call __isoc99_scanf
    xor eax, eax
    mov esi, [rbp-100000]
    test esi, esi
    je .L7
    mov ecx, [rbp-100000+1]
    xor edx, edx
    cmp byte [rbp-100000], cl
    je .L3
.L14:
    inc edx
    add rcx, 1
    test byte [rbp-100000], al
    je .L2
    mov esi, eax
.L15:
    movzx eax, byte [rcx]
    cmp byte [rbp-100000], al
    jne .L14
.L3:
    add rcx, 1
    mov esi, eax
    jmp .L15
.L7:
    xor edx, edx
.L2:
    dec edx
    xor eax, eax
    mov edi, 1
    lea rsi, [rip+.LC1]
    call __printf_chk
    leave
    ret
