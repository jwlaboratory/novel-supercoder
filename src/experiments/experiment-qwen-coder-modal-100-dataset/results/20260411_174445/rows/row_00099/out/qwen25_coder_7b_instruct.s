.file	"optimized_inputC.s"
	.text
	.p2align 4
	.globl	gcd
	.type	gcd, @function
gcd:
.LFB8:
	.cfi_startproc
	movq	%rdi, %rax
	movq	%rsi, %rdx
	testq	%rsi, %rsi
	je	.L4
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rdx, %rcx
	cqto
	idivq	%rcx
	movq	%rcx, %rax
	testq	%rdx, %rdx
	jne	.L3
	movq	%rcx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%rdi, %rcx
	movq	%rcx, %rax
	ret
	.cfi_endproc
.LFE8:
	.size	gcd, .-gcd
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	$.LC2, %edi
	xorl	%eax, %eax
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
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	leaq	8(%rsp), %rdx
	leaq	4(%rsp), %rsi
	call	__isoc99_scanf
	movl	4(%rsp), %eax
	testl	%eax, %eax
	jle	.L13
	movl	$a, %ebp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L9:
	movq	%rbp, %rsi
	movl	$.LC3, %edi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf
	movl	4(%rsp), %eax
	addq	$8, %rbp
	cmpl	%ebx, %eax
	jg	.L9
	testl	%eax, %eax
	jle	.L13
	movl	$p, %ebp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L10:
	movq	%rbp, %rsi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf
	movl	4(%rsp), %ecx
	addq	$4, %rbp
	cmpl	%ebx, %ecx
	jg	.L10
	movl	$1, %r13d
	sall	%cl, %r13d
	cmpl	$1, %r13d
	jle	.L13
	movq	8(%rsp), %r14
	movsd	.LC0(%rip), %xmm4
	pxor	%xmm3, %xmm3
	movslq	%ecx, %rbx
	movsd	.LC5(%rip), %xmm2
	movl	$1, %r11d
	movabsq	$4611686018427387904, %r12
.L14:
	movapd	%xmm4, %xmm1
	movl	$1, %r9d
	testl	%ecx, %ecx
	jle	.L22
.L23:
	xorl	%edi, %edi
	movapd	%xmm4, %xmm1
	movl	$1, %r9d
	xorl	%ebp, %ebp
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L15:
	addq	$1, %rdi
	cmpq	%rdi, %rbx
	je	.L40
.L19:
	btl	%edi, %r11d
	jnc	.L15
	pxor	%xmm0, %xmm0
	movq	a(,%rdi,8), %r10
	addl	$1, %ebp
	cvtsi2sdl	p(,%rdi,4), %xmm0
	divsd	%xmm2, %xmm0
	mulsd	%xmm0, %xmm1
	testq	%r10, %r10
	je	.L24
	movq	%r10, %rdx
	movq	%r9, %rsi
	.p2align 4,,10
	.p2align 3
.L17:
	movq	%rsi, %rax
	movq	%rdx, %rsi
	cqto
	idivq	%rsi
	testq	%rdx, %rdx
	jne	.L17
	movq	%r9, %rax
	cqto
	idivq	%rsi
	movq	%rax, %r9
	movq	%r12, %rax
	cqto
	idivq	%r10
	cmpq	%r9, %rax
	jl	.L18
.L41:
	addq	$1, %rdi
	imulq	%r10, %r9
	cmpq	%rdi, %rbx
	jne	.L19
.L40:
	testq	%r9, %r9
	jle	.L18
	andl	$1, %ebp
	je	.L22
	movq	%r14, %rax
	pxor	%xmm0, %xmm0
	addl	$1, %r11d
	cqto
	idivq	%r9
	cvtsi2sdq	%rax, %xmm0
	mulsd	%xmm1, %xmm0
	addsd	%xmm0, %xmm3
	cmpl	%r11d, %r13d
	jne	.L23
.L12:
	movapd	%xmm3, %xmm0
	movl	$.LC6, %edi
	movl	$1, %eax
	call	printf
	addq	$16, %rsp
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L24:
	.cfi_restore_state
	movq	%r12, %rax
	movl	$1, %r9d
	cqto
	idivq	%r10
	cmpq	%r9, %rax
	jge	.L41
	.p2align 4,,10
	.p2align 3
.L18:
	addl	$1, %r11d
	cmpl	%r11d, %r13d
	jne	.L23
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L22:
	movq	%r14, %rax
	pxor	%xmm0, %xmm0
	addl	$1, %r11d
	cqto
	idivq	%r9
	cvtsi2sdq	%rax, %xmm0
	mulsd	%xmm1, %xmm0
	subsd	%xmm0, %xmm3
	cmpl	%r11d, %r13d
	jne	.L1
