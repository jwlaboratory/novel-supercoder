section .text
global _start

_start:
    ; Read number of elements
    mov rdi, 0
    call read_int
    mov ecx, eax

    ; Allocate memory for array
    imul ecx, 4
    push rcx
    call malloc
    pop rdi
    test rdi, rdi
    jz error_exit

    ; Read array elements
    lea rsi, [rdi]
    mov ecx, eax
    call read_array

    ; Initialize variables
    xor rdx, rdx
    xor r8, r8
    xor r9, r9

read_loop:
    cmp ecx, r9
    je end_read_loop
    mov eax, [rdi + r9*4]
    test eax, rdx
    jnz next_element
    add r9, 1
    jmp continue_read_loop

next_element:
    xor eax, rdx
    inc r8
    jmp continue_read_loop

continue_read_loop:
    cmp ecx, r9
    jl read_loop

end_read_loop:
    ; Print result
    mov rdi, r8
    call print_uint64

    ; Free allocated memory
    mov rdi, rdi
    call free

    ; Exit program
    mov eax, 60
    xor edi, edi
    syscall

error_exit:
    mov eax, 60
    mov edi, 1
    syscall

read_int:
    sub rsp, 24
    mov rdi, rsp
    mov esi, 1
    call read_number
    add rsp, 24
    ret

read_array:
    sub rsp, 24
    mov rdi, rsp
    mov esi, ecx
    call read_numbers
    add rsp, 24
    ret

print_uint64:
    sub rsp, 24
    mov rdi, rsp
    mov esi, 1
    call print_number
    add rsp, 24
    ret

read_number:
    mov rax, 0
    mov rbx, 0
read_digit:
    mov rdi, 0
    mov esi, 1
    mov rdx, rsp
    call read_char
    cmp al, 10
    je end_read_digit
    sub al, '0'
    imul rbx, 10
    add rbx, al
    jmp read_digit
end_read_digit:
    mov [rdi], rbx
    ret

read_numbers:
    mov ecx, esi
read_next_number:
    cmp ecx, 0
    je end_read_numbers
    dec ecx
    lea rdi, [rdi + ecx*4]
    call read_number
    jmp read_next_number
end_read_numbers:
    ret

read_char:
    mov rax, 0
    mov rdi, 0
    mov rsi, rsp
    mov rdx, 1
    syscall
    ret

print_number:
    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 1
    syscall
    ret

malloc:
    mov rax, 9
    syscall
    ret

free:
    mov rax, 11
    syscall
    ret
