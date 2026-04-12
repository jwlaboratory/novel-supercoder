section .text
global main
extern __isoc99_scanf, puts, __printf_chk, __stack_chk_fail

main:
    sub rsp, 24
    lea rdi, [LC0]
    call __isoc99_scanf
    mov eax, [rsp+8]
    cmp eax, [rsp+12]
    jg .L2
    lea rdi, [LC1]
    call puts
    jmp .L3
.L2:
    sub [rsp+12], eax
    lea rsi, [LC2]
    xor edi, edi
    call __printf_chk
.L3:
    add rsp, 24
    ret
