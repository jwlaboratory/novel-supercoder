.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d %d"
.LC1:
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
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L11:
	movl	$0, -12(%rbp)
	leaq	-28(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-32(%rbp), %eax
	testl	%eax, %eax
	jne	.L2
	movl	-28(%rbp), %eax
	testl	%eax, %eax
	je	.L15
.L2:
	movl	$1, -24(%rbp)
	jmp	.L4
.L10:
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.L5
.L9:
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.L6
.L8:
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	addl	%eax, %edx
	movl	-16(%rbp), %eax
	addl	%eax, %edx
	movl	-28(%rbp), %eax
	cmpl	%eax, %edx
	jne	.L7
	addl	$1, -12(%rbp)
.L7:
	addl	$1, -16(%rbp)
.L6:
	movl	-32(%rbp), %eax
	cmpl	%eax, -16(%rbp)
	jle	.L8
	addl	$1, -20(%rbp)
.L5:
	movl	-32(%rbp), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L9
	addl	$1, -24(%rbp)
.L4:
	movl	-32(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -24(%rbp)
	jl	.L10
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L11
.L15:
	nop
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
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
