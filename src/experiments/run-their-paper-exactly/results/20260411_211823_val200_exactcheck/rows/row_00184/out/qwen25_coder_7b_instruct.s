.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lld%lld"
.LC1:
	.string	"%lld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %rdx
	leaq	8(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movq	8(%rsp), %rax
	movq	16(%rsp), %rdx
	leaq	1(%rax), %rcx
	cmpq	%rcx, %rdx
	jg	.L5
	leaq	2(%rax), %r9
	xorl	%edi, %edi
	leaq	1(%rax,%rax), %r8
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%r8, %rcx
	leaq	-1(%rdx), %rsi
	subq	%rdx, %rcx
	imulq	%rdx, %rsi
	imulq	%rdx, %rcx
	addq	$1, %rdx
	movq	%rcx, %rax
	shrq	$63, %rax
	addq	%rcx, %rax
	movq	%rsi, %rcx
	shrq	$63, %rcx
	sarq	%rax
	addq	%rsi, %rcx
	sarq	%rcx
	subq	%rcx, %rax
	leaq	1(%rdi,%rax), %rdi
	cmpq	%r9, %rdx
	jne	.L3
.L2:
	movq	%rdi, %rax
	leaq	.LC1(%rip), %rsi
	movabsq	$-8543223828751151131, %rdx
	imulq	%rdx
	leaq	(%rdx,%rdi), %rax
	movq	%rdi, %rdx
	sarq	$63, %rdx
	sarq	$29, %rax
	subq	%rdx, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rdi
	xorl	%eax, %eax
	movq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L9
	xorl	%eax, %eax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	xorl	%edi, %edi
	jmp	.L2
.L9:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
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
