section .text
global main
extern scanf, printf, fmin

main:
    push rbp
    mov rbp, rsp
    sub rsp, 24

    lea rdi, [LC0]
    lea rsi, [N]
    call scanf
    lea rdi, [LC0]
    lea rsi, [M]
    call scanf

    lea rdi, [X]
    xor ecx, ecx
count_loop:
    cmp ecx, [N]
    jge count_done
    lea rsi, [X + ecx * 4]
    call scanf
    mov eax, [rsi]
    add dword [cnt + eax * 4], 1
    inc ecx
    jmp count_loop
count_done:

    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    xor esi, esi
    xor edi, edi
    xor ebp, ebp
    xor r8d, r8d
    xor r9d, r9d
    xor r10d, r10d
    xor r11d, r11d
    xor r12d, r12d
    xor r13d, r13d
    xor r14d, r14d
    xor r15d, r15d

    lea rdi, [cnt]
    lea rsi, [mcnt]
    lea rdx, [p]
    xor ecx, ecx
sum_loop:
    cmp ecx, 131072
    jge sum_done
    mov eax, [rdi + ecx * 4]
    cdq
    idiv dword [M]
    mov ebx, eax
    sar eax, 31
    sar ebx, 31
    add eax, ebx
    sar ebx
    and eax, 1
    sub ebx, eax
    add ebx, eax
    add ecx, ebx
    mov [rsi + rdx * 4], ecx
    mov [rsi + rdx * 4 + 4], ebx
    add ecx, [rdi + ecx * 4]
    mov [rdx + r15 * 4], ecx
    inc rdx
    inc ecx
    jmp sum_loop
sum_done:

    lea rdi, [mcnt]
    xor ecx, ecx
    xor edx, edx
    xor ebx, ebx
    xor eax, eax
    xor esi, esi
    xor r8d, r8d
    xor r9d, r9d
    xor r10d, r10d
    xor r11d, r11d
    xor r12d, r12d
    xor r13d, r13d
    xor r14d, r14d
    xor r15d, r15d

balance_loop:
    cmp ecx, [M / 2]
    jge balance_done
    cmp ecx, [M - ecx]
    je balance_equal
    lea rdi, [mcnt + ecx * 4]
    lea rsi, [mcnt + (M - ecx) * 4]
    call fmin
    mov eax, eax
    add [rdi], eax
    sub [rsi], eax
    lea rdi, [p + ecx * 4]
    lea rsi, [p + (M - ecx) * 4]
    call fmin
    mov eax, eax
    add [rdi], eax
    add [rsi], eax
    jmp balance_loop
balance_equal:
    lea rdi, [mcnt + ecx * 4]
    call fmin
    add [rdi], eax
    jmp balance_loop
balance_done:

    lea rdi, [LC2]
    xor eax, eax
    call printf

    leave
    ret
