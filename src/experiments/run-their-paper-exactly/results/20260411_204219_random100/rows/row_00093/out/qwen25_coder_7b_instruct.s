.endbr64
movl (%rdi), %eax
movq %rsi, %r8
movl %eax, (%rdx)
testl %edi, %edi
jle .L10
leal -1(%rdi), %edx
movl $1, %r10d
leaq 4(%rsi,%rdx,4), %r11
jmp .L9
.p2align 4,,10
.p2align 3
.L12:
movslq %r10d, %rax
addq $4, %rsi
addl $1, %r10d
movl %edi, (%r8,%rax,4)
cmpq %rsi, %r11
je .L1
.L13:
movslq %r10d, %rax
movl -4(%r8,%rax,4), %eax
.L9:
movl (%rsi), %edi
cmpl %eax, %edi
jg .L12
leal -1(%r10), %ecx
xorl %edx, %edx
.p2align 4,,10
.p2align 3
.L8:
leal (%rcx,%rdx), %eax
sarl %eax
movslq %eax, %r9
cmpl (%r8,%r9,4), %edi
jg .L5
leal -1(%rax), %ecx
cmpl %edx, %ecx
jge .L8
movslq %edx, %rdx
movl %edi, (%r8,%rdx,4)
.L14:
addq $4, %rsi
cmpq %rsi, %r11
jne .L13
.L1:
movl %r10d, %eax
ret
.p2align 4,,10
.p2align 3
.L5:
leal 1(%rax), %edx
cmpl %ecx, %edx
jle .L8
movslq %edx, %rdx
movl %edi, (%r8,%rdx,4)
jmp .L14
.L10:
movl $1, %r10d
movl %r10d, %eax
ret
