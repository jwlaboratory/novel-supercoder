.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%lld %lld"
.LC1:
	.string	"%lld"
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
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	leaq	-12(%rbp), %rdx
	leaq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movq	$0, -4(%rbp)
.L2:
	movq	-8(%rbp), %rax
	cmpq	%rax, -4(%rbp)
	jl	.L3
	leaq	-12(%rbp), %rdx
	movq	-4(%rbp), %rax
	salq	$3, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addq	$1, -4(%rbp)
	jmp	.L2
.L3:
	movq	$0, -4(%rbp)
.L4:
	movq	-8(%rbp), %rax
	cmpq	%rax, -4(%rbp)
	jl	.L5
	leaq	-12(%rbp), %rdx
	movq	-4(%rbp), %rax
	salq	$3, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-800040(%rbp), %rax
	cmpq	%rax, %rdx
	jl	.L6
	addq	$1, -16(%rbp)
.L6:
	addq	$1, -4(%rbp)
	jmp	.L4
.L5:
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
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
