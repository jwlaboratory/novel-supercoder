.file	"temp.c"
	.text
	.p2align 4
	.globl	f
	.type	f, @function
f:
.LFB51:
	.cfi_startproc
	endbr64
	movl	(%rsi), %r8d
	movq	%rdi, %rcx
	movslq	4(%rsi), %rdi
	movslq	%r8d, %rsi
	imull	4(%rdx), %r8d
	movq	%rdi, %rax
	imull	(%rdx), %eax
	cmpl	%eax, %r8d
	jle	.L2
	movq	8(%rcx), %rax
	addq	%rdi, %rax
	subq	$1, %rax
	cqto
	idivq	%rdi
	imulq	%rax, %rsi
	imulq	%rax, %rdi
	movq	%rsi, (%rcx)
	movq	%rdi, 8(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	movq	(%rcx), %rax
	addq	%rsi, %rax
	subq	$1, %rax
	cqto
	idivq	%rsi
	imulq	%rax, %rsi
	imulq	%rax, %rdi
	movq	%rsi, (%rcx)
	movq	%rdi, 8(%rcx)
	ret
	.cfi_endproc
.LFE51:
	.size	f, .-f
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d%d"
.LC2:
	.string	"%ld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC0(%rip), %rdi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	leaq	28(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movl	28(%rsp), %eax
	testl	%eax, %eax
	jle	.L11
	leaq	36(%rsp), %rax
	movl	$1, %r14d
	movl	$1, %ebp
	movl	$1, %ebx
	movq	%rax, 8(%rsp)
	movl	$1, %r12d
	xorl	%r13d, %r13d
	leaq	32(%rsp), %r15
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L14:
	movslq	%r14d, %rsi
	movslq	%ebp, %r12
	addl	$1, %r13d
	leaq	-1(%rbx,%rsi), %rax
	movq	%rsi, %rbx
	cqto
	idivq	%rsi
	imulq	%rax, %r12
	imulq	%rax, %rbx
	cmpl	%r13d, 28(%rsp)
	jle	.L6
.L9:
	movq	8(%rsp), %rdx
	movq	%r15, %rsi
	leaq	.LC1(%rip), %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	%ebp, %eax
	movl	%r14d, %edx
	movl	32(%rsp), %ebp
	movl	36(%rsp), %r14d
	imull	%ebp, %edx
	imull	%r14d, %eax
	cmpl	%eax, %edx
	jg	.L14
	movslq	%ebp, %rsi
	movslq	%r14d, %rbx
	addl	$1, %r13d
	leaq	-1(%r12,%rsi), %rax
	cqto
	idivq	%rsi
	imulq	%rax, %rsi
	imulq	%rax, %rbx
	movq	%rsi, %r12
	cmpl	%r13d, 28(%rsp)
	jg	.L9
.L6:
	xorl	%eax, %eax
	leaq	(%r12,%rbx), %rdx
	movl	$1, %edi
	leaq	.LC2(%rip), %rsi
	call	__printf_chk@PLT
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L15
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L11:
	.cfi_restore_state
	movl	$1, %ebx
	movl	$1, %r12d
	jmp	.L6
.L15:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE52:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4: