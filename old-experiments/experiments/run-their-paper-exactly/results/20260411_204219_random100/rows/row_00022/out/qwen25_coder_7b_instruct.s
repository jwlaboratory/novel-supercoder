section .text
global main

main:
    sub rsp, 40
    lea rdi, [LC0]
    call scanf
    mov eax, dword [rsp + 12]
    imul eax, dword [rsp + 16]
    cmp eax, dword [rsp + 20]
    jle .L6
    mov eax, dword [rsp + 20]
.L6:
    lea rsi, [LC1]
    xor edi, edi
    call printf
    add rsp, 40
    ret
