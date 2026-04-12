	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d %d %d"
.LC1:
	.string	"F"
.LC2:
	.string	"A"
.LC3:
	.string	"B"
.LC4:
	.string	"C"
.LC5:
	.string	"D"
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
	movl	$0, -16(%rbp)
	jmp	.L2
.L13:
	leaq	-20(%rbp), %rcx
	leaq	-24(%rbp), %rdx
	leaq	-28(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-28(%rbp), %eax
	cmpl	$-1, %eax
	jne	.L3
	movl	-24(%rbp), %eax
	cmpl	$-1, %eax
	jne	.L3
	movl	-20(%rbp), %eax
	cmpl	$-1, %eax
	je	.L16
.L3:
	movl	-28(%rbp), %edx
	movl	-24(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -12(%rbp)
	movl	-28(%rbp), %eax
	cmpl	$-1, %eax
	je	.L5
	movl	-24(%rbp), %eax
	cmpl	$-1, %eax
	jne	.L6
.L5:
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L7
.L6:
	cmpl	$79, -12(%rbp)
	jle	.L8
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L7
.L8:
	cmpl	$64, -12(%rbp)
	jle	.L9
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L7
.L9:
	cmpl	$49, -12(%rbp)
	jle	.L10
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L7
.L10:
	cmpl	$29, -12(%rbp)
	jle	.L11
	movl	-20(%rbp), %eax
	cmpl	$49, %eax
	jle	.L12
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L7
.L12:
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L7
.L11:
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L7:
	addl	$1, -16(%rbp)
.L2:
	cmpl	$59, -16(%rbp)
	jle	.L13
	jmp	.L4
.L16:
	nop
.L4:
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
