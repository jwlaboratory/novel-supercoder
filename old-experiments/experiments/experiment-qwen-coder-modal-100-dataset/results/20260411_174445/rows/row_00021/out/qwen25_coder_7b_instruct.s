.file	"optimized_inputC.s"
	.text
	.p2align 4
	.globl	isreach
	.type	isreach, @function
isreach:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%edi, %eax
	imull	%ecx, %ecx
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edx, %ebx
	movl	%edi, %edx
	imull	%edi, %edx
	movl	%esi, %edi
	imull	%esi, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	addl	%edi, %edx
	xorl	%edi, %edi
	cmpl	%ecx, %edx
	jle	.L15
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%edi, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L15:
	.cfi_restore_state
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movl	%r8d, %ebp
	cvtsi2sdl	%eax, %xmm1
	cvtsi2sdl	%esi, %xmm0
	call	atan2
	pxor	%xmm1, %xmm1
	pxor	%xmm2, %xmm2
	movsd	.LC0(%rip), %xmm3
	cvtsi2sdl	%ebx, %xmm1
	movsd	.LC1(%rip), %xmm4
	cvtsi2sdl	%ebp, %xmm2
	mulsd	%xmm3, %xmm1
	mulsd	%xmm3, %xmm2
	divsd	%xmm4, %xmm1
	divsd	%xmm4, %xmm2
	subsd	%xmm1, %xmm0
	movsd	.LC3(%rip), %xmm1
	andpd	.LC2(%rip), %xmm0
	comisd	%xmm1, %xmm0
	jb	.L3
	.p2align 4,,10
	.p2align 3
.L5:
	subsd	%xmm1, %xmm0
	comisd	%xmm1, %xmm0
	jnb	.L5
.L3:
	comisd	%xmm3, %xmm0
	jbe	.L6
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
.L6:
	mulsd	.LC4(%rip), %xmm2
	xorl	%edi, %edi
	comisd	%xmm0, %xmm2
	setnb	%dil
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movl	%edi, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3:
	.size	isreach, .-isreach
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"%d%d"
.LC6:
	.string	"%d%d%d%d%d%d"
.LC7:
	.string	"NA"
.LC8:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$1608, %rsp
	.cfi_def_cfa_offset 1664
.L17:
	xorl	%eax, %eax
	leaq	76(%rsp), %rdx
	leaq	72(%rsp), %rsi
	movl	$.LC5, %edi
	call	__isoc99_scanf
	cmpl	$2, %eax
	jne	.L81
	movl	72(%rsp), %eax
	movl	%eax, %edi
	orl	76(%rsp), %edi
	je	.L81
	testl	%eax, %eax
	jle	.L82
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
	leaq	800(%rsp), %r13
	leaq	400(%rsp), %r12
	leaq	1200(%rsp), %r14
	.p2align 4,,10
	.p2align 3
.L18:
	leaq	0(%r13,%rbx), %rdx
	leaq	(%r12,%rbx), %rsi
	movl	$.LC5, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	addl	$1, %ebp
	movl	$0, (%r14,%rbx)
	addq	$4, %rbx
	cmpl	%ebp, 72(%rsp)
	jg	.L18
.L82:
	subq	$8, %rsp
	.cfi_def_cfa_offset 1672
	movl	$.LC6, %edi
	xorl	%ebx, %ebx
	leaq	108(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 1680
	xorl	%eax, %eax
	leaq	108(%rsp), %r8
	leaq	112(%rsp), %r9
	leaq	104(%rsp), %rcx
	leaq	100(%rsp), %rdx
	leaq	96(%rsp), %rsi
	call	__isoc99_scanf
	popq	%rsi
	.cfi_def_cfa_offset 1672
	popq	%rdi
	.cfi_def_cfa_offset 1664
	movl	80(%rsp), %r8d
	leaq	112(%rsp), %rbp
	leaq	160(%rsp), %r12
	testl	%r8d, %r8d
	jle	.L23
	.p2align 4,,10
	.p2align 3
.L22:
	leaq	(%r12,%rbx,4), %rdx
	movq	%rbp, %rsi
	movl	$.LC5, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	addq	$1, %rbx
	addq	$4, %rbp
	cmpl	%ebx, 80(%rsp)
	jg	.L22
.L23:
	movl	84(%rsp), %ecx
	leaq	208(%rsp), %rbp
	xorl	%ebx, %ebx
	leaq	256(%rsp), %r12
	testl	%ecx, %ecx
	jle	.L21
	.p2align 4,,10
	.p2align 3
.L26:
	leaq	(%r12,%rbx,4), %rdx
	movq	%rbp, %rsi
	movl	$.LC5, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	addq	$1, %rbx
	addq	$4, %rbp
