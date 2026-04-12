section .text
global main
extern __isoc99_scanf, __printf_chk, __stack_chk_fail

main:
    endbr64
    push rbp
    mov rbp, rsp
    sub rsp, 48
    xor eax, eax
    call __isoc99_scanf
    mov ecx, eax
    lea rsi, [rbp-44]
    mov rdi, rsi
    call __isoc99_scanf
    mov ebx, 0
    mov esi, ecx
    xor edx, edx
L1:
    cmp ebx, esi
    jge L2
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax, ecx
    add eax, 1
    mov esi, eax
    mov eax, ebx
    add eax, 1
    mov edi, eax
    call __isoc99_scanf
    mov eax,
