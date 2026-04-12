section .text
global main

main:
    sub rsp, 24
    lea rdi, [LC0]
    call scanf
    mov eax, dword [rsp+4]
    dec eax
    mov ecx, dword [rsp+8]
    dec ecx
    cdqe
    idiv rcx
    test edx, edx
    jz .L1
    inc eax
.L1:
    lea rsi, [LC1]
    xor edi, edi
    call printf
    add rsp, 24
    ret
