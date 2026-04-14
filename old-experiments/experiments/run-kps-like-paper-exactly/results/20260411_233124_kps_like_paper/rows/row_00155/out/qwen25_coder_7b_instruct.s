.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d %d %f\n"
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
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	movl	-12(%rbp), %esi
	movq	%rax, %rdx
	movq	%rsi, %rcx
	movq	%rdx, %r8
	movq	%rcx, %r9
	movq	%rdx, %r10
	movq	%rcx, %r11
	movq	%rdx, %r12
	movq	%rcx, %r13
	movq	%rdx, %r14
	movq	%rcx, %r15
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rcx, %rsp
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rsp
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%
