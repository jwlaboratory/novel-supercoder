section .text
global main
extern __isoc99_scanf, __printf_chk, __stack_chk_fail

main:
    endbr64
    push rbp
    mov rbp, rsp
    sub rsp, 24
    xor eax, eax
    lea rdi, [LC0]
    call __isoc99_scanf
    test eax, eax
    jle .L2
    xor ebx, ebx
    lea rdi, [LC1]
.L3:
    xor eax, eax
    add ebx, 1
    call __isoc99_scanf
    cmp ebx, eax
    jg .L3
.L2:
    mov ecx, [rsp+4]
    sub ecx, 2
    mov edi, 1
    lea rsi, [LC2]
    cltd
    sub ecx, 1
    idiv ecx
    lea edx, [rax+1]
    xor eax, eax
    call __printf_chk
    mov rsp, rbp
    pop rbp
    ret
