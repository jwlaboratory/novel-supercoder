	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d%d%d%d%d"
.LC1:
	.string	"%d "
.LC2:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -36(%rbp)
	leaq	-32(%rbp), %rax
	leaq	16(%rax), %rdi
	leaq	-32(%rbp), %rax
	leaq	12(%rax), %rsi
	leaq	-32(%rbp), %rax
	leaq	8(%rax), %rcx
	leaq	-32(%rbp), %rax
	leaq	4(%rax), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -48(%rbp)
	jmp	.L2
.L6:
	movl	$0, -44(%rbp)
	jmp	.L3
.L5:
	movl	-48(%rbp), %eax
	cltq
	movl	-32(%rbp,%rax,4), %edx
	movl	-44(%rbp), %eax
	cltq
	movl	-32(%rbp,%rax,4), %eax
	cmpl	%eax, %edx
	jle	.L4
	movl	-48(%rbp), %eax
	cltq
	movl	-32(%rbp,%rax,4), %eax
	movl	%eax, -36(%rbp)
	movl	-44(%rbp), %eax
	cltq
	movl	-32(%rbp,%rax,4), %edx
	movl	-48(%rbp), %eax
	cltq
	movl	%edx, -32(%rbp,%rax,4)
	movl	-44(%rbp), %eax
	cltq
	movl	-36(%rbp), %edx
	movl	%edx, -32(%rbp,%rax,4)
.L4:
	addl	$1, -44(%rbp)
.L3:
	cmpl	$4, -44(%rbp)
	jle	.L5
	addl	$1, -48(%rbp)
.L2:
	cmpl	$4, -48(%rbp)
	jle	.L6
	movl	$0, -40(%rbp)
	jmp	.L7
.L8:
	movl	-40(%rbp), %eax
	cltq
	movl	-32(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -40(%rbp)
.L7:
	cmpl	$3, -40(%rbp)
	jle	.L8
	movl	-16(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0"
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
