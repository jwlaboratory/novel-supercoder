cqto
	idivq	%rcx
	addq	$1, %rcx
	cmpq	%rsi, %rcx
	jne	.L68
	ret
	.p2align 4,,10
	.p2align 3
.L69:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE25:
	.size	llnCr, .-llnCr
	.p2align 4
	.globl	llfact
	.type	llfact, @function
llfact:
.LFB26:
	.cfi_startproc
	testq	%rdi, %rdi
	jle	.L74
	leaq	1(%rdi), %rsi
	andq	$1, %rdi
	movq	$1, %rdx
	movq	$1, %rax
	je	.L73
	movq	$2, %rax
	cmpq	%rsi, %rax
	je	.L71
	.p2align 4,,10
	.p2align 3
.L73:
	imulq	%rax, %rdx
	leaq	1(%rax), %rcx
	addq	$2, %rax
	imulq	%rcx, %rdx
	cmpq	%rsi, %rax
	jne	.L73
.L71:
	movq	%rdx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L74:
	movq	$1, %rdx
	movq	%rdx, %rax
	ret
	.cfi_endproc
.LFE26:
	.size	llfact, .-llfact
	.p2align 4
	.globl	llpow
	.type	llpow, @function
llpow:
.LFB27:
	.cfi_startproc
	testq	%rsi, %rsi
	jle	.L84
	leaq	1(%rsi), %rdx
	andq	$1, %rsi
	movq	$1, %rax
	movq	$1, %rbx
	je	.L83
	movq	$2, %rbx
	movq	%rdi, %rax
	cmpq	%rdx, %rbx
	je	.L90
	.p2align 4,,10
	.p2align 3
.L83:
	imulq	%rdi, %rax
	addq	$2, %rbx
	imulq	%rdi, %rax
	cmpq	%rdx, %rbx
	jne	.L83
	ret
	.p2align 4,,10
	.p2align 3
.L84:
	movq	$1, %rax
	ret
.L90:
	ret
	.cfi_endproc
.LFE27:
	.size	llpow, .-llpow
	.section	.note.GNU-stack,"",@progbits



































































e
