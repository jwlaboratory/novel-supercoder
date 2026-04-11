.LC5(%rip), %xmm0
.L48:
	movapd	%xmm0, %xmm2
	xorl	%eax, %eax
	subsd	32(%rsp), %xmm2
	andpd	.LC0(%rip), %xmm2
	comisd	.LC1(%rip), %xmm2
	jbe	.L45
	xorl	%eax, %eax
	comisd	%xmm0, %xmm2
	setnb	%al
.L45:
	addq	$32, %rbx
	cmpq	%rbp, %rbx
	je	.L83
.L79:
	pxor	%xmm0, %xmm0
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L83:
	movl	m(%rip), %eax
	testl	%eax, %eax
	jle	.L37
	movl	n(%rip), %r14d
	movl	m(%rip), %ecx
	testl	%r14d, %r14d
	jle	.L37
	movl	m(%rip), %esi
	movl	$ufo+24, %edx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	movl	%esi, %r15d
.L84:
	cmpb	$0, (%rdx)
	je	.L38
	movsd	-16(%rdx), %xmm1
	movsd	24(%rsp), %xmm6
	movsd	.LC1(%rip), %xmm7
	movapd	%xmm1, %xmm0
	subsd	%xmm6, %xmm0
	andpd	.LC0(%rip), %xmm0
	comisd	%xmm0, %xmm7
	jnb	.L39
	comisd	%xmm1, %xmm6
	jnb	.L39
	testb	%cl, %cl
	cltq
	cmove	%esi, %r15d
	salq	$5, %rax
	movsd	ufo(%rax), %xmm5
	movb	$0, ufo+24(%rax)
	subl	$1, %r15d
	movl	%r15d, m(%rip)
	movsd	%xmm5, 32(%rsp)
.L85:
	movslq	%r14d, %rdx
	movl	$ufo, %ebx
	movb	$0, 43(%rsp)
	movl	%r15d, %r12d
	salq	$5, %rdx
	movq	%rdx, %r13
	leaq	(%rdx,%rbx), %rbp
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L89:
	addq	$32, %rbx
	cmpq	%rbp, %rbx
	je	.L91
.L90:
	cmpb	$0, 24(%rbx)
	je	.L89
	pxor	%xmm3, %xmm3
	movsd	(%rbx), %xmm0
	subsd	32(%rsp), %xmm0
	cvtsi2sdl	16(%rbx), %xmm3
	movsd	8(%rbx), %xmm1
	movsd	%xmm1, 16(%rsp)
	movsd	%xmm3, 8(%rsp)
	call	cos
	movsd	16(%rsp), %xmm1
	movsd	.LC4(%rip), %xmm2
	movsd	8(%rsp), %xmm3
	mulsd	%xmm1, %xmm2
	mulsd	%xmm3, %xmm3
	mulsd	%xmm1, %xmm1
	mulsd	%xmm0, %xmm2
	subsd	%xmm3, %xmm1
	mulsd	.LC3(%rip), %xmm1
	movapd	%xmm2, %xmm0
	mulsd	%xmm2, %xmm0
	subsd	%xmm1, %xmm0
	comisd	.LC1(%rip), %xmm0
	ja	.L87
	pxor	%xmm7, %xmm7
	comisd	%xmm7, %xmm0
	jb	.L101
.L87:
	sqrtsd	%xmm0, %xmm0
	subsd	%xmm2, %xmm0
	mulsd	.LC5(%rip), %xmm0
.L88:
	movapd	%xmm0, %xmm2
	xorl	%eax, %eax
	subsd	32(%rsp), %xmm2
	andpd	.LC0(%rip), %xmm2
	comisd	.LC1(%rip), %xmm2
	jbe	.L85
	xorl	%eax, %eax
	comisd	%xmm0, %xmm2
	setnb	%al
.L85:
	addq	$32, %rbx
	cmpq	%rbp, %rbx
	je	.L91
.L101:
	pxor	%xmm0, %xmm0
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L91:
	movl	m(%rip), %eax
	testl	%eax, %eax
	jle	.L37
	movl	n(%rip), %r14d
	movl	m(%rip), %ecx
	testl	%r14d, %r14d
	jle	.L37
	movl	m(%rip), %esi
	movl	$ufo+24, %edx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	movl	%esi, %r15d
.L92:
	cmpb	$0, (%rdx)
	je	.L38
	movsd	-16(%rdx), %xmm1
	movsd	24(%rsp), %xmm6
	movsd	.LC1(%rip), %xmm7
	movapd	%xmm1, %xmm0
	subsd	%xmm6, %xmm0
	andpd	.LC0(%rip), %xmm0
	comisd	%xmm0, %xmm7
	jnb	.L39
	comisd	%xmm1, %xmm6
	jnb	.L39
	testb	%cl, %cl
	cltq
	cmove	%esi, %r15d
	salq	$5, %rax
	movsd	ufo(%rax), %xmm5
	movb	$0, ufo+24(%rax)
	subl	$1, %r15d
	movl	%r15d, m(%rip)
	movsd	%xmm5, 32(%rsp)
.L93:
	movslq	%r14d, %rdx
	movl	$ufo, %ebx
	movb	$0, 43(%rsp)
	movl	%r15d, %r12d
	salq	$5, %rdx
	movq	%rdx, %r13
	leaq	(%rdx,%rbx), %rbp
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L97:
	addq	$32, %rbx
	cmpq	%rbp, %rbx
	je	.L99
.L98:
	cmpb	$0, 24(%rbx)
	je	.L97
	pxor	%xmm3, %xmm3
	movsd	(%rbx), %xmm0
	subsd	32(%rsp), %xmm0
	cvtsi2sdl	16(%rbx), %xmm3
	movsd	8(%rbx), %xmm1
	movsd	%xmm1, 16(%rsp)
	movsd	%xmm3, 8(%rsp)
	call	cos
	movsd	16(%rsp), %xmm1
	movsd	.LC4(%rip), %xmm2
	movsd	8(%rsp), %xmm3
	mulsd	%xmm1, %xmm2
	mulsd	%xmm3, %xmm3
	mulsd	%xmm1, %xmm1
	mulsd	%xmm0, %xmm2
	subsd	%xmm3, %xmm1
	mulsd	.LC3(%rip), %xmm1
	movapd	%xmm2, %xmm0
	mulsd	%xmm2, %xmm0
	subsd	%xmm1, %xmm0
	comisd	.LC1(%rip), %xmm0
	ja	.L95
	pxor	%xmm7, %xmm7
	comisd	%xmm7, %xmm0
	jb	.L105
.L95:
	sqrtsd
