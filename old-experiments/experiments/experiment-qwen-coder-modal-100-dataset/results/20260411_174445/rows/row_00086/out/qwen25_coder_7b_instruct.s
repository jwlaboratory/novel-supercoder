section .text
global calc
type calc, function
calc:
    push rbp
    mov rbp, rsp
    sub rsp, 288
    xor eax, eax
    mov ecx, 882
    lea rdi, [rbp-288]
    call memset
    lea rdi, [rbp-144]
    call memset
    lea rdi, [rbp-144]
    mov dword [rbp-144], 1
    fld1
    fstpt [rbp-144+8]
    lea rdi, [rbp-144+16]
    mov ecx, 28224
    rep stosq
    test ebp, ebp
    jle .L3
    lea eax, [rbp-144+4]
    mov ebx, edi
    fild qword [rbp-144+4]
    xor esi, esi
    mov edi, eax
    mov r10d, 172
    xor r15d, r15d
    xor r8d, r8d
    mov eax, [rbp-144+8]
    mov r9d, 688
    xor r13d, r13d
    mov rcx, -168
    mov r14, -672
    mov esi, 672
    mov r12d, 1
    add ebx, eax
    mov eax, ebx
    mov [rbp-144+12], eax
    jmp .L4
.L4:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L4
    jmp .L5
.L5:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    je .L6
    jmp .L5
.L6:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L6
    jmp .L7
.L7:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L7
    jmp .L8
.L8:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L8
    jmp .L9
.L9:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L9
    jmp .L10
.L10:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L10
    jmp .L11
.L11:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L11
    jmp .L12
.L12:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L12
    jmp .L13
.L13:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L13
    jmp .L14
.L14:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L14
    jmp .L15
.L15:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L15
    jmp .L16
.L16:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L16
    jmp .L17
.L17:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L17
    jmp .L18
.L18:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L18
    jmp .L19
.L19:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L19
    jmp .L20
.L20:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L20
    jmp .L21
.L21:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L21
    jmp .L22
.L22:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L22
    jmp .L23
.L23:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L23
    jmp .L24
.L24:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L24
    jmp .L25
.L25:
    lea rax, [rbp-288]
    add rax, rsi
    mov ecx, 32
    add rax, rcx
    cmp rax, [rbp-288+672]
    jne .L25
    jmp .L26
.L26:
    lea rax, [rbp-288]
