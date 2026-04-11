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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	h(%rip), %r13
	testq	%r13, %r13
	je	.L100
	movq	w(%rip), %r12
	movq	k(%rip), %r8
	testq	%r8, %r8
	je	.L100
	cmpq	$3, %r8
	jg	.L102
	xorl	%r14d, %r14d
	xorl	%ecx, %ecx
	movq	%r13, 24(%rsp)
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L104:
	xorl	%edx, %edx
	testq	%r12, %r12
	je	.L110
	imulq	$3010, %rcx, %r15
	addq	$t, %r15
	jmp	.L113
	.p2align 4,,10
	.p2align 3
.L105:
	addq	$1, %rdx
	movq	%rdx, %rbp
.L108:
	cmpq	%r12, %rbp
	jnb	.L110
.L113:
	movsbl	(%r15,%rdx), %eax
	testb	%al, %al
	je	.L105
	movq	%rdx, %rbx
	movq	%rdx, %rbp
	xorl	%edi, %edi
	xorl	%esi, %esi
	cmpq	%r12, %rdx
	jb	.L107
	jmp	.L108
	.p2align 4,,10
	.p2align 3
.L112:
	addq	$1, %rbx
	movq	%rbx, %rbp
	cmpq	%r12, %rbx
	jnb	.L126
.L107:
	movq	%rbx, %rbp
	cmpb	t(%r14,%rbx), %al
	je	.L112
	movq	%rbx, %rsi
	subq	%rdx, %rsi
	movq	%rsi, %rdi
.L108:
	cmpq	%r8, %rdi
	jnb	.L110
.L116:
	movq	%rbx, %rdx
	jmp	.L108
	.p2align 4,,10
	.p2align 3
.L126:
	movq	%rbx, %rsi
	subq	%rdx, %rsi
	cmpq	%r8, %rsi
	jnb	.L110
.L110:
	movq	24(%rsp), %rax
	addq	$1, %rcx
	addq	$3010, %r14
	cmpq	%rax, %rcx
	jne	.L104
.L100:
	testq	%r8, %r8
	je	.L103
	movl	$.LC0, %edi
	movq	%r8, %rsi
	movl	$0, %eax
	call	printf
	movq	%r8, %rax
	ret
.L102:
	xorl	%r14d, %r14d
	xorl	%ecx, %ecx
	movq	%r13, 24(%rsp)
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L128:
	xorl	%edx, %edx
	testq	%r12, %r12
	je	.L134
	imulq	$3010, %rcx, %r15
	addq	$t, %r15
	jmp	.L137
	.p2align 4,,10
	.p2align 3
.L129:
	addq	$1, %rdx
	movq	%rdx, %rbp
.L132:
	cmpq	%r12, %rbp
	jnb	.L134
.L137:
	movsbl	(%r15,%rdx), %eax
	testb	%al, %al
	je	.L129
	movq	%rdx, %rbx
	movq	%rdx, %rbp
	xorl	%edi, %edi
	xorl	%esi, %esi
	cmpq	%r12, %rdx
	jb	.L127
	jmp	.L132
	.p2align 4,,10
	.p2align 3
.L136:
	addq	$1, %rbx
	movq	%rbx, %rbp
	cmpq	%r12, %rbx
	jnb	.L150
.L127:
	movq	%rbx, %rbp
	cmpb	t(%r14,%rbx), %al
	je	.L136
	movq	%rbx, %rsi
	subq	%rdx, %rsi
	movq	%rsi, %rdi
.L132:
	cmpq	%r8, %rdi
	jnb	.L134
.L138:
	movq	%rbx, %rdx
	jmp	.L132
	.p2align 4,,10
	.p2align 3
.L150:
	movq	%rbx, %rsi
	subq	%rdx, %rsi
	cmpq	%r8, %rsi
	jnb	.L134
.L134:
	movq	24(%rsp), %rax
	addq	$1, %rcx
	addq	$3010, %r14
	cmpq	%rax, %rcx
	jne	.L128
.L103:
	movl	$.LC1, %edi
	movq	%r13, %rsi
	movl	$0, %eax
	call	printf
	movq	%r13, %rax
	ret
	.cfi_endproc
.LFE6:
	.size	solve, .-solve
	.text
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$40, %rsp
	.cfi_def_cfa_offset 80
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -28(%rbp)
	movl	$0, -32(%rbp)
	movl	$0, -36(%rbp)
	movl	$0, -40(%rbp)
	movl	$0, -44(%rbp)
	movl	$0, -48(%rbp)
	movl	$0, -52(%rbp)
	movl	$0, -56(%rbp)
	movl	$0, -60(%rbp)
	movl	$0, -64(%rbp)
	movl	$0, -68(%rbp)
	movl	$0, -72(%rbp)
	movl	$0, -76(%rbp)
	movl	$0, -80(%rbp)
	movl	$0, -84(%rbp
