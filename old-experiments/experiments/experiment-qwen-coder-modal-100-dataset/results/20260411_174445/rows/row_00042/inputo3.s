	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lld %lld"
.LC1:
	.string	" %lld"
.LC2:
	.string	"%lld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%eax, %eax
	movl	$.LC0, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	leaq	16(%rsp), %rdx
	leaq	8(%rsp), %rsi
	call	__isoc99_scanf
	cmpq	$0, 8(%rsp)
	jle	.L6
	movl	$1, %ebx
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L5:
	leaq	24(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movq	24(%rsp), %rcx
	movq	16(%rsp), %rdx
	leaq	(%rcx,%rbp), %rax
	cmpq	%rdx, %rax
	jle	.L3
	subq	%rdx, %rax
	subq	%rbp, %rdx
	addq	$1, %rbx
	movq	%rdx, 24(%rsp)
	addq	%rax, %r12
	movq	%rdx, %rbp
	cmpq	8(%rsp), %rbx
	jle	.L5
.L2:
	movq	%r12, %rsi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	printf
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	.cfi_restore_state
	addq	$1, %rbx
	cmpq	%rbx, 8(%rsp)
	jl	.L2
	movq	%rcx, %rbp
	jmp	.L5
.L6:
	xorl	%r12d, %r12d
	jmp	.L2
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
