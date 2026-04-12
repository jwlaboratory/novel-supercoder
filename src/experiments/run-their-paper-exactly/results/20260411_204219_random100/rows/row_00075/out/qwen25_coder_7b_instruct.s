section .text
global main

main:
    push rbp
    mov rbp, rsp
    sub rsp, 0x20

    lea rdi, [LC0]
    lea rsi, [rbp-0x18]
    call read_int

    mov ecx, dword [rbp-0x18]
    lea rdx, [rbp-0x14]
    imul rdx, rcx, 4
    add rsp, rdx
    and rsp, -16

    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

read_loop:
    cmp ecx, ecx
    jge end_read_loop
    lea rdi, [LC0]
    lea rsi, [rbp-0x14+ecx*4]
    call read_int
    add ecx, 1
    jmp read_loop

end_read_loop:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

calc_loop:
    cmp ecx, ecx
    jge end_calc_loop
    mov eax, dword [rbp-0x14+ecx*4]
    imul eax, ebx
    add eax, ecx
    imul eax, -8543223828751151131
    sar eax, 63
    add eax, ecx
    sar eax, 29
    sub eax, ecx
    imul eax, 1000000007
    sar eax, 60
    sub eax, ecx
    imul eax, 1000000007
    sub eax, ecx
    add eax, ebx
    mov ebx, eax
    add ecx, 1
    jmp calc_loop

end_calc_loop:
    mov eax, ebx
    lea rdi, [LC1]
    call print_int

    mov rsp, rbp
    pop rbp
    ret

read_int:
    push rbp
    mov rbp, rsp
    sub rsp, 0x10

    mov rdi, rsi
    call __isoc99_scanf
    mov eax, dword [rbp-0x10]

    mov rsp, rbp
    pop rbp
    ret

print_int:
    push rbp
    mov rbp, rsp
    sub rsp, 0x10

    mov rdi, rsi
    call __printf_chk
    mov eax, 0

    mov rsp, rbp
    pop rbp
    ret
