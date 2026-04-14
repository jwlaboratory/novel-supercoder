section .text
global main

main:
    sub rsp, 40
    lea rdi, [LC0]
    call __isoc99_scanf
    mov rdx, qword [rsp+8]
    xor ecx, ecx
    cmp rsi, rdx
    jg .L2
.L3:
    inc ecx
    mov rax, rdx
    shl rax, cl
    cmp rax, rsi
    jle .L3
.L2:
    mov rdi, 1
    lea rsi, [LC1]
    mov rdx, rcx
    call __printf_chk
    add rsp, 40
    ret
