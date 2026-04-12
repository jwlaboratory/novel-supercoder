section .text
global main

main:
    push rbp
    mov rbp, rsp
    sub rsp, 40

    lea rdi, [rbp-4]
    xor eax, eax
    call read_int

    mov ecx, eax
    cmp ecx, 0
    jle end

    lea rsi, [rbp-8]
    xor ebx, ebx
    lea rdx, [rbp-12]

init_loop:
    xor eax, eax
    lea rdi, [rbp-8]
    add ebx, 1
    call read_int
    xor eax, eax
    cmp ebx, ecx
    sete al
    add rdx, 4
    mov byte [rdx-1], al
    jmp init_loop

end_init:
    xor eax, eax
    mov ecx, 0

count_loop:
    xor eax, eax
    movzx eax, byte [rbp-12]
    test eax, eax
    je count_done
    inc ecx
    mov byte [rbp-12], 0
    inc byte [rbp-12+1]
    jmp count_loop

count_done:
    mov eax, ecx
    lea rdi, [rbp-4]
    xor esi, esi
    call print_int

    mov rsp, rbp
    pop rbp
    ret

read_int:
    push rbp
    mov rbp, rsp
    sub rsp, 8

    lea rdi, [rbp-4]
    xor eax, eax
    call __isoc99_scanf
    mov eax, dword [rbp-4]
    leave
    ret

print_int:
    push rbp
    mov rbp, rsp
    sub rsp, 8

    lea rdi, [rbp-4]
    xor esi, esi
    call __printf_chk
    leave
    ret
