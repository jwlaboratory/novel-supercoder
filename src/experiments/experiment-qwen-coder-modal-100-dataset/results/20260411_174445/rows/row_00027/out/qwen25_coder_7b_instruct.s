section .text
global pow2
global com
global g
global main

pow2:
movabsq $-8543223828751151131, %r9
movq %rdi, %rax
movq %rsi, %r8
movl $1, %esi
imulq %r9
movq %rdi, %rax
sarq $63, %rax
leaq (%rdx,%rdi), %rcx
sarq $29, %rcx
subq %rax, %rcx
imulq $1000000007, %rcx, %rax
movq %rdi, %rcx
subq %rax, %rcx
testq %r8, %r8
je .L1
.L4:
testb $1, %r8b
je .L3
imulq %rcx, %rsi
movq %rsi, %rax
movq %rsi, %rdi
imulq %r9
movq %rdi, %rax
sarq $63, %rax
leaq (%rdx,%rsi), %rsi
sarq $29, %rsi
subq %rax, %rsi
imulq $1000000007, %rsi, %rax
movq %rdi, %rsi
subq %rax, %rsi
.L3:
imulq %rcx, %rcx
movq %rcx, %rax
movq %rcx, %rdi
mulq %r9
shrq $29, %rdx
imulq $1000000007, %rdx, %rax
subq %rax, %rdi
movq %r8, %rax
shrq $63, %rax
movq %rdi, %rcx
addq %r8, %rax
sarq %rax
movq %rax, %r8
jne .L4
.L1:
movq %rsi, %rax
ret

com:
testl %esi, %esi
jle .L16
pushq %rbp
movslq %esi, %r11
movl $1, %eax
movabsq $-8543223828751151131, %r9
pushq %rbx
movslq %edi, %rbx
subq %r11, %rbx
.L15:
leaq (%rbx,%r11), %rcx
movl $30, %r8d
movl $1, %esi
movl $1000000005, %ebp
imulq %rax, %rcx
movq %rcx, %rax
imulq %r9
movq %rcx, %rax
sarq $63, %rax
leaq (%rdx,%rcx), %r10
sarq $29, %r10
subq %rax, %r10
imulq $1000000007, %r10, %rax
subq %rax, %rcx
movq %r11, %rax
mulq %r9
movq %rcx, %r10
movq %r11, %rcx
shrq $29, %rdx
imulq $1000000007, %rdx, %rax
subq %rax, %rcx
.L14:
testb $1, %bpl
je .L13
imulq %rcx, %rsi
movq %rsi, %rax
movq %rsi, %rdi
imulq %r9
movq %rdi, %rax
sarq $63, %rax
leaq (%rdx,%rsi), %rsi
sarq $29, %rsi
subq %rax, %rsi
imulq $1000000007, %rsi, %rax
movq %rdi, %rsi
subq %rax, %rsi
.L13:
imulq %rcx, %rcx
movq %rcx, %rax
movq %rcx, %rdi
mulq %r9
shrq $29, %rdx
imulq $1000000007, %rdx, %rax
subq %rax, %rdi
movq %rdi, %rcx
movq %rbp, %rdi
shrq $63, %rdi
addq %rbp, %rdi
sarq %rdi
movq %rdi, %rbp
subl $1, %r8d
jne .L14
imulq %rsi, %r10
movq %r10, %rax
imulq %r9
leaq (%rdx,%r10), %rax
movq %r10, %rdx
sarq $63, %rdx
sarq $29, %rax
subq %rdx, %rax
imulq $1000000007, %rax, %rdx
movq %r10, %rax
subq %rdx, %rax
subq $1, %r11
jne .L15
popq %rbx
popq %rbp
ret
.L16:
movl $1, %eax
ret

g:
leal 1(%rdi), %edx
leal (%rdx,%rsi), %eax
testl %edx, %edx
jle .L31
leal 1(%rax), %r11d
cltq
pushq %r12
movl $1, %ecx
movabsq $-8543223828751151131, %r9
pushq %rbp
movq %rax, %rbp
movslq %r11d, %r11
pushq %rbx
movslq %edi, %rbx
subq %rbx, %rbp
subq %rax, %rbx
.L30:
imulq %r11, %rcx
leaq (%rbx,%r11), %rsi
movl $30, %r8d
movl $1000000005, %r12d
movq %rcx, %rax
imulq %r9
movq %rcx, %rax
sarq $63, %rax
leaq (%rdx,%rcx), %r10
sarq $29, %r10
subq %rax, %r10
imulq $1000000007, %r10, %rax
subq %rax, %rcx
movq %rsi, %rax
imulq %r9
movq %rcx, %r10
movq %rsi, %rax
sarq $63, %rax
leaq (%rdx,%rsi), %rcx
sarq $29, %rcx
subq %rax, %rcx
imulq $1000000007, %rcx, %rax
subq %rax, %rsi
movq %rsi, %rcx
movl $1, %esi
.L29:
testb $1, %r12b
je .L28
imulq %rcx, %rsi
movq %rsi, %rax
movq %rsi, %rdi
imulq %r9
movq %rdi, %rax
sarq $63, %rax
leaq (%rdx,%rsi), %rsi
sarq $29, %rsi
subq %rax, %rsi
imulq $1000000007, %rsi, %rax
movq %rdi, %rsi
subq %rax, %rsi
.L28:
imulq %rcx, %rcx
movq %rcx, %rax
movq %rcx, %rdi
mulq %r9
shrq $29, %rdx
imulq $1000000007, %rdx, %rax
subq %rax, %rdi
movq %rdi, %rcx
movq %r12, %
