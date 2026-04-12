section .text
global main
extern scanf, printf

main:
    sub rsp, 24
    lea rdi, [LC0]
    call scanf
    mov eax, dword [rsp + 16]
    add eax, 1
    shr eax, 1
    lea rdi, [LC1]
    mov esi, eax
    xor eax, eax
    call printf
    add rsp, 24
    ret
section .rodata
LC0 db "%d", 0
LC1 db "%d\n", 0
