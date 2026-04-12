.file	"optimized_temp.s"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d %d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pxor	%xmm0, %xmm0
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	.LC0(%rip), %rbx
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	movl	%edi, 12(%rsp)
	movq	%rbx, %rdi
	leaq	8(%rsp), %rbp
	movl	%esi, 8(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movaps	%xmm0, 16(%rsp)
	movaps	%xmm0, 32(%rsp)
	call	scanf@PLT
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L7
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	scanf@PLT
	movslq	8(%rsp), %rax
	movq	%rax, %rdx
	shrq	$2, %rdx
	andl	$7, %edx
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx, %r12d
	cmovge	%rdx,
