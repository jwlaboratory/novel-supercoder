.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d %d"
.LC1:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$.LC0, %edi
	xorl	%eax, %eax
	leaq	12(%rsp), %rcx
	leaq	8(%rsp), %rdx
	leaq	4(%rsp), %rsi
	call	__isoc99_scanf
	movl	12(%rsp), %eax
	movl	4(%rsp), %edx
	movl	8(%rsp), %ecx
	cmpq	%rdx, %rax
	jg	.L2
	cmpq	%rcx, %rax
	jge	.L10
.L3:
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movq	%rdx, %rsi
	movl	$.LC1, %edi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq
