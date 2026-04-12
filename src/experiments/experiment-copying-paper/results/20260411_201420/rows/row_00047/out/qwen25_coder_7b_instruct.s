section .text
global main

main:
    push rbp
    mov rbp, rsp
    sub rsp, 24

    ; Read input
    lea rdi, [LC0]
    lea rsi, [rbp-4]
    call scanf

    ; Check if x >= 2000
    cmp dword [rbp-4], 1999
    jg found

    ; Brute force search
    xor eax, eax
    mov ecx, 20
    mov ebx, 0
outer_loop:
    inc ebx
    cmp ebx, ecx
    je next_outer
    mov edx, 0
inner_loop:
    inc edx
    cmp edx, ecx
    je next_inner
    mov esi, 0
middle_loop:
    inc esi
    cmp esi, ecx
    je next_middle
    mov edi, 0
innermost_loop:
    inc edi
    cmp edi, ecx
    je next_innermost
    imul eax, edi, 105
    add eax, esi * 104 + middle_loop_counter * 103 + inner_loop_counter * 102 + outer_loop_counter * 101
    cmp eax, [rbp-4]
    je found
    jmp innermost_loop
next_innermost:
    inc middle_loop_counter
    jmp middle_loop
next_middle:
    inc inner_loop_counter
    jmp inner_loop
next_inner:
    inc outer_loop_counter
    jmp outer_loop
next_outer:
    xor eax, eax
    jmp not_found

found:
    mov eax, '1'
    jmp print_result

not_found:
    mov eax, '0'

print_result:
    mov edi, eax
    call putchar
    jmp exit

exit:
    mov rsp, rbp
    pop rbp
    ret
