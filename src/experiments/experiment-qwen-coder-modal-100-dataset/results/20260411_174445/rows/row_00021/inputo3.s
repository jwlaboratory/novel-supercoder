	.file	"inputC.c"
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
	cmpl	%ebx, 84(%rsp)
	jg	.L26
.L21:
	movl	88(%rsp), %edx
	leaq	304(%rsp), %rbp
	xorl	%ebx, %ebx
	leaq	352(%rsp), %r12
	testl	%edx, %edx
	jle	.L25
	.p2align 4,,10
	.p2align 3
.L29:
	leaq	(%r12,%rbx,4), %rdx
	movq	%rbp, %rsi
	movl	$.LC5, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	addq	$1, %rbx
	addq	$4, %rbp
	cmpl	%ebx, 88(%rsp)
	jg	.L29
.L25:
	movl	76(%rsp), %eax
	xorl	%ebp, %ebp
	movl	%ebp, %r15d
	testl	%eax, %eax
	jle	.L128
	.p2align 4,,10
	.p2align 3
.L27:
	leaq	108(%rsp), %rdx
	leaq	104(%rsp), %rsi
	movl	$.LC5, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	72(%rsp), %ebx
	testl	%ebx, %ebx
	jle	.L72
	movl	92(%rsp), %eax
	movslq	%ebx, %rbp
	movl	108(%rsp), %ecx
	movl	%r15d, 56(%rsp)
	movl	%ebx, 60(%rsp)
	movl	%eax, 40(%rsp)
	movl	104(%rsp), %eax
	imull	%ecx, %ecx
	movl	%eax, 44(%rsp)
	leaq	0(,%rbp,4), %rax
	xorl	%ebp, %ebp
	movq	%rax, (%rsp)
	leaq	800(%rsp), %rax
	movq	%rbp, %r13
	movl	%ecx, %r14d
	movq	%rax, 16(%rsp)
	leaq	400(%rsp), %rax
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L71:
	movq	16(%rsp), %rax
	movl	(%rax,%r13), %ebx
	movq	8(%rsp), %rax
	movl	(%rax,%r13), %r15d
	movl	%ebx, %edi
	imull	%ebx, %edi
	movl	%r15d, %esi
	imull	%r15d, %esi
	addl	%edi, %esi
	cmpl	%r14d, %esi
	jg	.L33
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%r15d, %xmm1
	cvtsi2sdl	%ebx, %xmm0
	call	atan2
	pxor	%xmm3, %xmm3
	pxor	%xmm1, %xmm1
	movsd	.LC3(%rip), %xmm2
	cvtsi2sdl	44(%rsp), %xmm3
	mulsd	.LC0(%rip), %xmm3
	divsd	.LC1(%rip), %xmm3
	subsd	%xmm3, %xmm0
	andpd	.LC2(%rip), %xmm0
	cvtsi2sdl	40(%rsp), %xmm1
	mulsd	.LC0(%rip), %xmm1
	comisd	%xmm2, %xmm0
	divsd	.LC1(%rip), %xmm1
	jb	.L34
	.p2align 4,,10
	.p2align 3
.L36:
	subsd	%xmm2, %xmm0
	comisd	%xmm2, %xmm0
	jnb	.L36
.L34:
	comisd	.LC0(%rip), %xmm0
	jbe	.L37
	movapd	%xmm2, %xmm7
	subsd	%xmm0, %xmm7
	movapd	%xmm7, %xmm0
.L37:
	mulsd	.LC4(%rip), %xmm1
	comisd	%xmm0, %xmm1
	jnb	.L129
.L33:
	addq	$4, %r13
	cmpq	%r13, (%rsp)
	jne	.L71
	movl	56(%rsp), %r15d
	movl	60(%rsp), %ebx
.L72:
	addl	$1, %r15d
	cmpl	%r15d, 76(%rsp)
	jg	.L27
.L31:
	testl	%ebx, %ebx
	jle	.L73
	leal	-1(%rbx), %eax
	cmpl	$2, %eax
	jbe	.L84
	movl	%ebx, %edx
	leaq	1200(%rsp), %rax
	pxor	%xmm0, %xmm0
	shrl	$2, %edx
	salq	$4, %rdx
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L75:
	movdqa	%xmm0, %xmm1
	addq	$16, %rax
	pcmpgtd	-16(%rax), %xmm1
	pand	%xmm1, %xmm0
	pandn	-16(%rax), %xmm1
	por	%xmm1, %xmm0
	cmpq	%rax, %rdx
	jne	.L75
	movdqa	%xmm0, %xmm2
	movl	%ebx, %eax
	psrldq	$8, %xmm2
	andl	$-4, %eax
	movdqa	%xmm2, %xmm1
	pcmpgtd	%xmm0, %xmm1
	pand	%xmm1, %xmm2
	pandn	%xmm0, %xmm1
	por	%xmm2, %xmm1
	movdqa	%xmm1, %xmm2
	psrldq	$4, %xmm2
	movdqa	%xmm2, %xmm0
	pcmpgtd	%xmm1, %xmm0
	pand	%xmm0, %xmm2
	pandn	%xmm1, %xmm0
	por	%xmm2, %xmm0
	movd	%xmm0, %r12d
	testb	$3, %bl
	je	.L76
.L74:
	movslq	%eax, %rdx
	movl	1200(%rsp,%rdx,4), %edx
	cmpl	%edx, %r12d
	cmovl	%edx, %r12d
	leal	1(%rax), %edx
	cmpl	%ebx, %edx
	jge	.L76
	movslq	%edx, %rdx
	movl	1200(%rsp,%rdx,4), %edx
	cmpl	%edx, %r12d
	cmovl	%edx, %r12d
	addl	$2, %eax
	cmpl	%ebx, %eax
	jge	.L76
	cltq
	movl	1200(%rsp,%rax,4), %eax
	cmpl	%eax, %r12d
	cmovl	%eax, %r12d
.L76:
	testl	%r12d, %r12d
	je	.L73
	xorl	%ebp, %ebp
	xorl	%eax, %eax
	leaq	1200(%rsp), %r14
	jmp	.L77
.L79:
	addq	$1, %rbp
	cmpl	%ebp, %ebx
	jle	.L130
.L77:
	cmpl	%r12d, (%r14,%rbp,4)
	jne	.L79
	testl	%eax, %eax
	jne	.L131
.L80:
	leal	1(%rbp), %esi
	movl	$.LC8, %edi
	xorl	%eax, %eax
	addq	$1, %rbp
	call	printf
	movl	72(%rsp), %ebx
	movl	$1, %eax
	cmpl	%ebp, %ebx
	jg	.L77
.L130:
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	putc
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L129:
	movslq	80(%rsp), %rbp
	testl	%ebp, %ebp
	jle	.L46
	leaq	0(,%rbp,4), %rax
	movl	%r14d, %edi
	movq	%r13, 48(%rsp)
	movl	%r15d, %r14d
	leaq	160(%rsp), %rbp
	movl	%ebx, %r15d
	xorl	%r12d, %r12d
	movl	%edi, %ebx
	movq	%rbp, %r13
	movsd	%xmm3, 24(%rsp)
	movq	%rax, %rbp
	movsd	%xmm1, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L45:
	movl	%r15d, %ecx
	movl	%r14d, %edx
	subl	0(%r13,%r12), %ecx
	subl	112(%rsp,%r12), %edx
	movl	%edx, %eax
	movl	%ecx, %esi
	imull	%edx, %eax
	imull	%ecx, %esi
	addl	%esi, %eax
	cmpl	%ebx, %eax
	jg	.L52
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%ecx, %xmm0
	cvtsi2sdl	%edx, %xmm1
	call	atan2
	movsd	.LC3(%rip), %xmm2
	subsd	24(%rsp), %xmm0
	andpd	.LC2(%rip), %xmm0
	comisd	%xmm2, %xmm0
	jb	.L47
	.p2align 4,,10
	.p2align 3
.L49:
	subsd	%xmm2, %xmm0
	comisd	%xmm2, %xmm0
	jnb	.L49
.L47:
	comisd	.LC0(%rip), %xmm0
	jbe	.L50
	movapd	%xmm2, %xmm6
	subsd	%xmm0, %xmm6
	movapd	%xmm6, %xmm0
.L50:
	movsd	32(%rsp), %xmm5
	comisd	%xmm0, %xmm5
	jnb	.L132
.L52:
	addq	$4, %r12
	cmpq	%r12, %rbp
	jne	.L45
	movl	%ebx, %eax
	movsd	24(%rsp), %xmm3
	movq	48(%rsp), %r13
	movl	%r15d, %ebx
	movl	%r14d, %r15d
	movl	%eax, %r14d
.L46:
	movslq	84(%rsp), %rsi
	testl	%esi, %esi
	jle	.L43
	movl	96(%rsp), %eax
	leaq	256(%rsp), %r12
	movq	%r13, 48(%rsp)
	xorl	%ebp, %ebp
	movl	%r14d, %r13d
	movsd	%xmm3, 24(%rsp)
	movl	%r15d, %r14d
	movl	%ebx, %r15d
	movl	%eax, 32(%rsp)
	leaq	0(,%rsi,4), %rax
	movq	%r12, %rbx
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L56:
	movl	%r15d, %edi
	movl	%r14d, %edx
	subl	(%rbx,%rbp), %edi
	subl	208(%rsp,%rbp), %edx
	movl	%edx, %eax
	movl	%edi, %r8d
	imull	%edx, %eax
	imull	%edi, %r8d
	addl	%r8d, %eax
	cmpl	%r13d, %eax
	jg	.L62
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%edx, %xmm1
	cvtsi2sdl	%edi, %xmm0
	call	atan2
	subsd	24(%rsp), %xmm0
	pxor	%xmm1, %xmm1
	andpd	.LC2(%rip), %xmm0
	movsd	.LC3(%rip), %xmm2
	cvtsi2sdl	32(%rsp), %xmm1
	mulsd	.LC0(%rip), %xmm1
	divsd	.LC1(%rip), %xmm1
	comisd	%xmm2, %xmm0
	jb	.L57
	.p2align 4,,10
	.p2align 3
.L59:
	subsd	%xmm2, %xmm0
	comisd	%xmm2, %xmm0
	jnb	.L59
.L57:
	comisd	.LC0(%rip), %xmm0
	jbe	.L60
	movapd	%xmm2, %xmm7
	subsd	%xmm0, %xmm7
	movapd	%xmm7, %xmm0
.L60:
	mulsd	.LC4(%rip), %xmm1
	comisd	%xmm0, %xmm1
	jnb	.L127
.L62:
	addq	$4, %rbp
	cmpq	%rbp, %r12
	jne	.L56
	movl	%r15d, %ebx
	movsd	24(%rsp), %xmm3
	movl	%r14d, %r15d
	movl	%r13d, %r14d
	movq	48(%rsp), %r13
.L43:
	movslq	88(%rsp), %rsi
	testl	%esi, %esi
	jle	.L54
	movl	100(%rsp), %eax
	movq	%r13, 48(%rsp)
	xorl	%ebp, %ebp
	movl	%r14d, %r13d
	leaq	352(%rsp), %r12
	movl	%ebx, %r14d
	movsd	%xmm3, 32(%rsp)
	movl	%eax, 24(%rsp)
	leaq	0(,%rsi,4), %rax
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L64:
	movl	%r14d, %edi
	movl	%r15d, %edx
	subl	(%r12,%rbp), %edi
	subl	304(%rsp,%rbp), %edx
	movl	%edx, %eax
	movl	%edi, %r8d
	imull	%edx, %eax
	imull	%edi, %r8d
	addl	%r8d, %eax
	cmpl	%r13d, %eax
	jg	.L70
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%edx, %xmm1
	cvtsi2sdl	%edi, %xmm0
	call	atan2
	subsd	32(%rsp), %xmm0
	pxor	%xmm1, %xmm1
	andpd	.LC2(%rip), %xmm0
	movsd	.LC3(%rip), %xmm2
	cvtsi2sdl	24(%rsp), %xmm1
	mulsd	.LC0(%rip), %xmm1
	divsd	.LC1(%rip), %xmm1
	comisd	%xmm2, %xmm0
	jb	.L65
	.p2align 4,,10
	.p2align 3
.L67:
	subsd	%xmm2, %xmm0
	comisd	%xmm2, %xmm0
	jnb	.L67
.L65:
	comisd	.LC0(%rip), %xmm0
	jbe	.L68
	movapd	%xmm2, %xmm6
	subsd	%xmm0, %xmm6
	movapd	%xmm6, %xmm0
.L68:
	mulsd	.LC4(%rip), %xmm1
	comisd	%xmm0, %xmm1
	jnb	.L127
.L70:
	addq	$4, %rbp
	cmpq	%rbp, %rbx
	jne	.L64
	movl	%r13d, %r14d
	movq	48(%rsp), %r13
.L54:
	addl	$1, 1200(%rsp,%r13)
	jmp	.L33
.L132:
	movq	48(%rsp), %r13
	movl	%ebx, %r14d
	jmp	.L33
.L127:
	movl	%r13d, %r14d
	movq	48(%rsp), %r13
	jmp	.L33
.L73:
	movl	$.LC7, %edi
	call	puts
	jmp	.L17
.L131:
	movq	stdout(%rip), %rsi
	movl	$32, %edi
	call	putc
	jmp	.L80
.L81:
	addq	$1608, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L84:
	.cfi_restore_state
	xorl	%r12d, %r12d
	xorl	%eax, %eax
	jmp	.L74
.L128:
	movl	72(%rsp), %ebx
	jmp	.L31
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	1413754136
	.long	1074340347
	.align 8
.LC1:
	.long	0
	.long	1080459264
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC3:
	.long	1413754136
	.long	1075388923
	.align 8
.LC4:
	.long	0
	.long	1071644672
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
