	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d%d%d%d"
.LC1:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$.LC0, %edi
	xorl	%eax, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	leaq	4(%rsp), %rdx
	leaq	16(%rsp), %r9
	movq	%rsp, %rsi
	leaq	12(%rsp), %r8
	leaq	8(%rsp), %rcx
	call	__isoc99_scanf
	movq	(%rsp), %xmm0
	pshufd	$0xe5, %xmm0, %xmm1
	movd	%xmm0, %eax
	movd	%xmm1, %edx
	cmpl	%eax, %edx
	jle	.L2
	pshufd	$225, %xmm0, %xmm0
	movq	%xmm0, (%rsp)
.L2:
	movl	(%rsp), %eax
	movl	8(%rsp), %edx
	cmpl	%edx, %eax
	jge	.L10
	movl	%edx, (%rsp)
	movl	%eax, 8(%rsp)
	movl	%edx, %eax
.L10:
	movl	12(%rsp), %ecx
	cmpl	%ecx, %eax
	jge	.L9
	movl	%eax, %edx
	movl	%ecx, (%rsp)
	movl	%eax, 12(%rsp)
	movl	%ecx, %eax
	movl	%edx, %ecx
.L9:
	movl	16(%rsp), %edx
	cmpl	%edx, %eax
	jl	.L5
.L8:
	movq	4(%rsp), %xmm0
	pshufd	$0xe5, %xmm0, %xmm2
	movd	%xmm0, %eax
	movd	%xmm2, %esi
	cmpl	%eax, %esi
	jle	.L7
	pshufd	$225, %xmm0, %xmm0
	movq	%xmm0, 4(%rsp)
.L7:
	movl	4(%rsp), %eax
	cmpl	%ecx, %eax
	jge	.L16
	movl	%ecx, 4(%rsp)
	movl	%eax, 12(%rsp)
	movl	%ecx, %eax
.L16:
	cmpl	%edx, %eax
	jl	.L12
.L15:
	movq	8(%rsp), %xmm0
	pshufd	$0xe5, %xmm0, %xmm3
	movd	%xmm0, %eax
	movd	%xmm3, %ecx
	cmpl	%eax, %ecx
	jle	.L14
	pshufd	$225, %xmm0, %xmm0
	movq	%xmm0, 8(%rsp)
.L14:
	movl	8(%rsp), %eax
	cmpl	%edx, %eax
	jge	.L20
	movl	%edx, 8(%rsp)
	movl	%eax, 16(%rsp)
.L20:
	movq	12(%rsp), %xmm0
	pshufd	$0xe5, %xmm0, %xmm4
	movd	%xmm0, %edx
	movd	%xmm4, %eax
	cmpl	%eax, %edx
	jl	.L18
.L19:
	movq	%rsp, %rbx
	leaq	20(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L21:
	movl	(%rbx), %esi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	printf
	cmpq	%rbp, %rbx
	je	.L25
	movq	stdout(%rip), %rsi
	movl	$32, %edi
	call	putc
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L25:
	movl	$10, %edi
	call	putchar
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L18:
	.cfi_restore_state
	pshufd	$225, %xmm0, %xmm0
	movq	%xmm0, 12(%rsp)
	jmp	.L19
.L12:
	movl	%edx, 4(%rsp)
	movl	%eax, %edx
	movl	%eax, 16(%rsp)
	jmp	.L15
.L5:
	movl	%edx, (%rsp)
	movl	%eax, %edx
	movl	%eax, 16(%rsp)
	jmp	.L8
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
