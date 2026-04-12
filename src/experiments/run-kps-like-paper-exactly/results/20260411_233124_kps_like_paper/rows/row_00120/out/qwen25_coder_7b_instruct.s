.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d %d\n"
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
	subq	$128, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -112(%rbp)
	movl	$0, -108(%rbp)
	movl	$0, -120(%rbp)
.L2:
	leaq	-96(%rbp), %rdx
	movl	-120(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -120(%rbp)
	cmpl	$9, -120(%rbp)
	jle	.L2
	movl	$0, -116(%rbp)
.L3:
	leaq	-48(%rbp), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -116(%rbp)
	cmpl	$9, -116(%rbp)
	jle	.L3
	movl	$0, -120(%rbp)
.L4:
	leaq	-96(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	Robmax
	movl	%eax, -104(%rbp)
	movl	-104(%rbp), %eax
	addl	%eax, -112(%rbp)
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	Robmax
	movl	%eax, -100(%rbp)
	movl	-100(%rbp), %eax
	addl	%eax, -108(%rbp)
	addl	$1, -120(%rbp)
	cmpl	$2, -120(%rbp)
	jle	.L4
	movl	-108(%rbp), %edx
	movl	-112(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	Robmax
	.type	Robmax, @function
Robmax:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -8(%rbp)
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	$0, -12(%rbp)
.L11:
	movl	-12(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.L12
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jge	.L12
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
.L12:
	addl	$1, -12(%rbp)
	jmp	.L11
.L13:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, (%rax)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	Robmax, .-Robmax
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
