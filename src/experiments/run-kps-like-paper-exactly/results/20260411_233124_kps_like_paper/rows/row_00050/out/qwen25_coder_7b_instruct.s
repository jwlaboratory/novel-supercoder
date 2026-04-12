.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"Yes"
.LC2:
	.string	"No"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
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
	leaq	-44(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-44(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movl	$0, -36(%rbp)
.L2:
	movl	-36(%rbp), %eax
	cmpl	%eax, -44(%rbp)
	jge	.L3
	movl	-36(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -36(%rbp)
	jmp	.L2
.L3:
	movl	$0, -32(%rbp)
.L4:
	movl	-32(%rbp), %eax
	cmpl	%eax, -44(%rbp)
	jge	.L5
	movl	-32(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-32(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-16(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jge	.L6
	movl	-32(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -20(%rbp)
	movl	-32(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	-20(%rbp), %eax
	movl	%eax, (%rax)
	movl	-32(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	-44(%rbp), %eax
	movl	%eax, (%rax)
.L6:
	addl	$1, -32(%rbp)
	jmp	.L4
.L5:
	movl	$1, -24(%rbp)
.L7:
	movl	-24(%rbp), %eax
	cmpl	%eax, -44(%rbp)
	jge	.L8
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	addl	%eax, -40(%rbp)
	addl	$1, -24(%rbp)
	jmp	.L7
.L8:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -40(%rbp)
	jle	.L9
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L10
.L9:
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L10:
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
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
