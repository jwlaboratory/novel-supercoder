.endbr64
pushq	%r13
pushq	%r12
pushq	%rbp
pushq	%rbx
subq	$40, %rsp
movq	%fs:40, %rax
movq	%rax, 24(%rsp)
xorl	%eax, %eax
leaq	16(%rsp), %rdx
leaq	8(%rsp), %rsi
call	__isoc99_scanf@PLT
movl	$2000004, %edx
xorl	%esi, %esi
movq	%r12, %rdi
call	memset@PLT
movq	8(%rsp), %rbp
movq	16(%rsp), %r13
cmpq	$1, %rbp
je	.L26
cmpq	$1, %r13
je	.L28
pxor	%xmm0, %xmm0
pxor	%xmm1, %xmm1
cvtsi2sdq	%r13, %xmm0
ucomisd	%xmm0, %xmm1
ja	.L24
sqrtsd	%xmm0, %xmm0
.L7:
cvttsd2sil	%xmm0, %eax
cmpl	$1, %eax
jle	.L10
leal	1(%rax), %r8d
movl	$2, %ecx
xorl	%esi, %esi
.L9:
movq	%r13, %rax
cqto
idivq	%rcx
testq	%rdx, %rdx
jne	.L14
movl	(%r12,%rcx,4), %eax
leal	1(%rax), %esi
.L11:
movq	%r13, %rax
movl	%esi, %edi
addl	$1, %esi
cqto
idivq	%rcx
cqto
movq	%rax, %r13
idivq	%rcx
testq	%rdx, %rdx
je	.L11
movl	%edi, (%r12,%rcx,4)
movl	$1, %esi
.L14:
addq	$1, %rcx
cmpq	%rcx, %r8
jne	.L9
testb	%sil, %sil
je	.L10
movq	%r13, 16(%rsp)
.L10:
movl	$2, %ebx
movl	$1, %r13d
.L15:
movslq	(%r12,%rbx,4), %rax
pxor	%xmm0, %xmm0
pxor	%xmm1, %xmm1
cvtsi2sdl	%ebx, %xmm0
addq	$1, %rbx
cqto
idivq	%rbp
cvtsi2sdq	%rax, %xmm1
call	pow@PLT
movapd	%xmm0, %xmm1
pxor	%xmm0, %xmm0
cvtsi2sdq	%r13, %xmm0
mulsd	%xmm1, %xmm0
cvttsd2siq	%xmm0, %r13
cmpq	$500001, %rbx
jne	.L15
.L26:
movq	%r13, %rdx
leaq	.LC1(%rip), %rsi
movl	$1, %edi
xorl	%eax, %eax
call	__printf_chk@PLT
.L3:
movq	24(%rsp), %rax
subq	%fs:40, %rax
jne	.L29
addq	$40, %rsp
xorl	%eax, %eax
popq	%rbx
popq	%rbp
popq	%r12
popq	%r13
ret
.L28:
movl	$1, %edx
leaq	.LC1(%rip), %rsi
movl	$1, %edi
xorl	%eax, %eax
call	__printf_chk@PLT
jmp	.L3
.L29:
call	__stack_chk_fail@PLT
.L24:
call	sqrt@PLT
jmp	.L7
