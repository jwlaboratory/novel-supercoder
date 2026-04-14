.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d\n%d\n%d\n%d\n%d\n%d\n%d\n"
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
.L13:
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-48(%rbp), %eax
	testl	%eax, %eax
	je	.L17
	movl	$0, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -24(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, -32(%rbp)
	movl	$0, -36(%rbp)
	jmp	.L4
.L12:
	leaq	-44(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-44(%rbp), %eax
	testl	%eax, %eax
	js	.L5
	movl	-44(%rbp), %eax
	cmpl	$9, %eax
	jg	.L5
	addl	$1, -36(%rbp)
	jmp	.L6
.L5:
	movl	-44(%rbp), %eax
	cmpl	$19, %eax
	jg	.L7
	addl	$1, -32(%rbp)
	jmp	.L6
.L7:
	movl	-44(%rbp), %eax
	cmpl	$29, %eax
	jg	.L8
	addl	$1, -28(%rbp)
	jmp	.L6
.L8:
	movl	-44(%rbp), %eax
	cmpl	$39, %eax
	jg	.L9
	addl	$1, -24(%rbp)
	jmp	.L6
.L9:
	movl	-44(%rbp), %eax
	cmpl	$49, %eax
	jg	.L10
	addl	$1, -20(%rbp)
	jmp	.L6
.L10:
	movl	-44(%rbp), %eax
	cmpl	$59, %eax
	jg	.L11
	addl	$1, -16(%rbp)
	jmp	.L6
.L11:
	movl	-44(%rbp), %eax
	cmpl	$59, %eax
	jle	.L6
	addl	$1, -12(%rbp)
.L6:
	addl	$1, -40(%rbp)
.L4:
	movl	-48(%rbp), %eax
	cmpl	%eax, -40(%rbp)
	jl	.L12
	movl	-20(%rbp), %r8d
	movl	-24(%rbp), %edi
	movl	-28(%rbp), %ecx
	movl	-32(%rbp), %edx
	movl	-36(%rbp), %eax
	movl	-12(%rbp), %esi
	pushq	%rsi
	movl	-16(%rbp), %esi
	pushq	%rsi
	movl	%r8d, %r9d
	movl	%edi, %r8d
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	jmp	.L13
.L17:
	nop
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
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
