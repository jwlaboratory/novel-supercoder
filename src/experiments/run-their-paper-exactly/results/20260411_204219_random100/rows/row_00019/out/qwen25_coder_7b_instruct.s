section .text
global partition
global main

partition:
    endbr64
    leaq X(%rip), %rcx
    movslq %esi, %r11
    leal -1(%rdi), %r8d
    movl (%rcx,%r11,4), %r9d
    cmpl %edi, %esi
    jle .L5
    subl %edi, %esi
    movslq %edi, %r10
    leal -1(%rsi), %eax
    leaq 4(%rcx), %rsi
    addq %r10, %rax
    leaq (%rcx,%r10,4), %rdx
    leaq (%rsi,%rax,4), %rdi
.L4:
    movl (%rdx), %eax
    cmpl %r9d, %eax
    jg .L3
    addl $1, %r8d
    movslq %r8d, %rsi
    movl (%rcx,%rsi,4), %r10d
    movl %eax, (%rcx,%rsi,4)
    movl %r10d, (%rdx)
.L3:
    addq $4, %rdx
    cmpq %rdi, %rdx
    jne .L4
    leal 1(%r8), %eax
    movl (%rcx,%r11,4), %r9d
    movslq %eax, %rdx
    movl (%rcx,%rdx,4), %esi
    movl %r9d, (%rcx,%rdx,4)
    movl %esi, (%rcx,%r11,4)
    ret
.L5:
    movl %edi, %eax
    movslq %eax, %rdx
    movl (%rcx,%rdx,4), %esi
    movl %r9d, (%rcx,%rdx,4)
    movl %esi, (%rcx,%r11,4)
    ret

main:
    endbr64
    pushq %r13
    leaq num(%rip), %rsi
    xorl %eax, %eax
    pushq %r12
    leaq .LC0(%rip), %r12
    pushq %rbp
    movq %r12, %rdi
    pushq %rbx
    subq $8, %rsp
    call __isoc99_scanf@PLT
    movl num(%rip), %esi
    testl %esi, %esi
    jle .L9
    leaq X(%rip), %rbp
    xorl %ebx, %ebx
.L10:
    movq %rbp, %rsi
    movq %r12, %rdi
    xorl %eax, %eax
    addl $1, %ebx
    call __isoc99_scanf@PLT
    movl num(%rip), %esi
    addq $4, %rbp
    cmlq %ebx, %esi
    jg .L10
.L9:
    subl $1, %esi
    xorl %edi, %edi
    leaq X(%rip), %r13
    xorl %ebx, %ebx
    call partition
    movl %eax, %ebp
    movl num(%rip), %eax
    testl %eax, %eax
    jg .L11
    jmp .L14
.L12:
    movl 0(%r13,%rbx,4), %edx
    xorl %eax, %eax
    movq %r12, %rsi
    movl $1, %edi
    addq $1, %rbx
    call __printf_chk@PLT
    cmlq %ebx, num(%rip)
    jle .L14
.L13:
    movl $32, %edi
    call putchar@PLT
.L11:
    cmlq %ebx, %ebp
    jne .L12
    movl $91, %edi
    call putchar@PLT
    movl 0(%r13,%rbx,4), %edx
    xorl %eax, %eax
    movq %r12, %rsi
    movl $1, %edi
    addq $1, %rbx
    call __printf_chk@PLT
    movl $93, %edi
    call putchar@PLT
    cmlq %ebx, num(%rip)
    jg .L13
.L14:
    movl $10, %edi
    call putchar@PLT
    addq $8, %rsp
    popq %rbx
    popq %rbp
    popq %r12
    popq %r13
    ret
