	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	" %d"
.LC1:
	.string	"%ld"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$80, %rsp
	.cfi_def_cfa_offset 128
	leaq	32(%rsp), %r12
	.p2align 4,,10
	.p2align 3
.L9:
	leaq	12(%rsp), %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	12(%rsp), %eax
	testl	%eax, %eax
	je	.L2
	jle	.L9
	xorl	%r13d, %r13d
	leaq	48(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L3:
	leaq	16(%rsp), %rbx
.L5:
	movq	%rbx, %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	__isoc99_scanf
	cmpq	%r12, %rbx
	jne	.L5
	movq	%r12, %rbx
.L6:
	movq	%rbx, %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	__isoc99_scanf
	cmpq	%rbp, %rbx
	jne	.L6
	movdqa	32(%rsp), %xmm1
	movdqa	16(%rsp), %xmm0
	movq	%rbp, %rbx
	leaq	80(%rsp), %r14
	pshufd	$0, %xmm0, %xmm3
	movdqa	%xmm1, %xmm4
	pshufd	$177, %xmm1, %xmm5
	movdqa	%xmm3, %xmm2
	psrlq	$32, %xmm4
	psrlq	$32, %xmm3
	pmuludq	%xmm1, %xmm2
	pmuludq	%xmm4, %xmm3
	pshufd	$8, %xmm2, %xmm2
	pshufd	$8, %xmm3, %xmm3
	punpckldq	%xmm3, %xmm2
	pshufd	$85, %xmm0, %xmm3
	movdqa	%xmm3, %xmm4
	psrlq	$32, %xmm3
	pmuludq	%xmm5, %xmm4
	psrlq	$32, %xmm5
	pmuludq	%xmm5, %xmm3
	pshufd	$78, %xmm1, %xmm5
	pshufd	$27, %xmm1, %xmm1
	pshufd	$8, %xmm4, %xmm4
	pshufd	$8, %xmm3, %xmm3
	punpckldq	%xmm3, %xmm4
	movdqa	%xmm2, %xmm3
	psubd	%xmm4, %xmm3
	paddd	%xmm4, %xmm2
	shufps	$216, %xmm2, %xmm3
	pshufd	$170, %xmm0, %xmm2
	pshufd	$216, %xmm3, %xmm3
	pshufd	$255, %xmm0, %xmm0
	movdqa	%xmm2, %xmm4
	psrlq	$32, %xmm2
	pmuludq	%xmm5, %xmm4
	psrlq	$32, %xmm5
	pmuludq	%xmm5, %xmm2
	pshufd	$8, %xmm4, %xmm4
	pshufd	$8, %xmm2, %xmm2
	punpckldq	%xmm2, %xmm4
	movdqa	%xmm3, %xmm2
	psubd	%xmm4, %xmm2
	paddd	%xmm4, %xmm3
	shufps	$156, %xmm3, %xmm2
	movdqa	%xmm0, %xmm3
	psrlq	$32, %xmm0
	pshufd	$120, %xmm2, %xmm2
	pmuludq	%xmm1, %xmm3
	psrlq	$32, %xmm1
	pmuludq	%xmm1, %xmm0
	pshufd	$8, %xmm3, %xmm1
	pshufd	$8, %xmm0, %xmm0
	punpckldq	%xmm0, %xmm1
	movdqa	%xmm2, %xmm0
	psubd	%xmm1, %xmm0
	paddd	%xmm1, %xmm2
	pxor	%xmm1, %xmm1
	shufps	$228, %xmm2, %xmm0
	pcmpgtd	%xmm0, %xmm1
	movdqa	%xmm0, %xmm2
	punpckldq	%xmm1, %xmm2
	punpckhdq	%xmm1, %xmm0
	movaps	%xmm2, 48(%rsp)
	movaps	%xmm0, 64(%rsp)
.L8:
	movq	(%rbx), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	printf
	cmpq	%r14, %rbx
	je	.L16
	movl	$32, %edi
	call	putchar
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L16:
	movl	$10, %edi
	addl	$1, %r13d
	call	putchar
	cmpl	%r13d, 12(%rsp)
	jg	.L3
	jmp	.L9
.L2:
	addq	$80, %rsp
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
