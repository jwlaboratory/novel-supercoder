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
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$100, -16(%rbp)
	movl	$0, -12(%rbp)
	leaq	-28(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-28(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L2
.L4:
	movl	-20(%rbp), %eax
	cltd
	idivl	-16(%rbp)
	movl	%eax, -20(%rbp)
	cmpl	$7, -20(%rbp)
	jne	.L3
	movl	$1, -12(%rbp)
.L3:
	movl	-28(%rbp), %edx
	movl	-20(%rbp), %eax
	imull	-16(%rbp), %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$1717986919, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$2, %edx
	sarl	$31, %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	movl	%eax, -16(%rbp)
	addl	$1, -24(%rbp)
.L2:
	cmpl	$2, -24(%rbp)
	jle	.L4
	cmpl	$1, -12(%rbp)
	jne	.L5
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L6
.L5:
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L6:
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
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
