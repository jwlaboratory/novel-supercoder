.file	"optimized_inputC.s"
	.text
	.p2align 4
	.globl	in
	.type	in, @function
in:
.LFB3:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	getchar_unlocked
	cmpl	$45, %eax
	je	.L11
	.p2align 4,,10
	.p2align 3
.L2:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L2
	movl	%ebx, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	.cfi_restore_state
	xorl	%eax, %eax
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L3:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L3
	negl	%ebx
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3:
	.size	in, .-in
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lld\n"
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
	xorl	%eax, %eax
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
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	getchar_unlocked
	cmpl	$45, %eax
	je	.L63
	.p2align 4,,10
	.p2align 3
.L31:
	andl	$15, %eax
	leal	0(%rbp,%rbp,4), %edx
	leal	(%rax,%rdx,2), %ebp
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L31
	testl	%ebp, %ebp
	je	.L34
.L68:
	movslq	%ebp, %rax
	movl	$0, %ebx
	movq	%rax, 8(%rsp)
	leaq	0(,%rax,4), %r12
	jle	.L36
	.p2align 4,,10
	.p2align 3
.L20:
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	call	getchar_unlocked
	cmpl	$45, %eax
	je	.L64
	.p2align 4,,10
	.p2align 3
.L14:
	andl	$15, %eax
	leal	0(%r13,%r13,4), %edx
	leal	(%rax,%rdx,2), %r13d
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L14
.L16:
	xorl	%eax, %eax
	movl	%r13d, x(%rbx)
	xorl	%r13d, %r13d
	call	getchar_unlocked
	cmpl	$45, %eax
	je	.L65
	.p2align 4,,10
	.p2align 3
.L17:
	andl	$15, %eax
	leal	0(%r13,%r13,4), %edx
	leal	(%rax,%rdx,2), %r13d
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L17
	movl	%r13d, y(%rbx)
	addq	$4, %rbx
	cmpq	%r12, %rbx
	jne	.L20
.L36:
	movl	x(%rip), %eax
	movq	8(%rsp), %rsi
	movl	$4, 4(%rsp)
	movl	$-20002, %r12d
	movl	$-20002, (%rsp)
	movl	$20002, %r13d
	movl	$20002, %r15d
	movl	%eax, x(,%rsi,4)
	movl	y(%rip), %eax
	movl	%eax, y(,%rsi,4)
.L27:
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	getchar_unlocked
	cmpl	$45, %eax
	je	.L66
	.p2align 4,,10
	.p2align 3
.L21:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L21
.L23:
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	call	getchar_unlocked
	cmpl	$45, %eax
	je	.L67
	.p2align 4,,10
	.p2align 3
.L24:
	andl	$15, %eax
	leal	(%r14,%r14,4), %edx
	leal	(%rax,%rdx,2), %r14d
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L24
.L26:
	movl	(%rsp), %eax
	cmpl	%ebx, %r15d
	cmovg	%ebx, %r15d
	cmpl	%ebx, %eax
	cmovge	%eax, %ebx
	cmpl	%r14d, %r13d
	cmovg	%r14d, %r13d
	cmpl	%r14d, %r12d
	cmovl	%r14d, %r12d
	subl	$1, 4(%rsp)
	movl	%ebx, (%rsp)
	jne	.L27
	testl	%ebp, %ebp
	jle	.L41
	movq	8(%rsp), %rax
	movl	x(%rip), %ecx
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	movl	$4, %edx
	leaq	4(,%rax,4), %rdi
	.p2align 4,,10
	.p2align 3
.L30:
	movl	%ecx, %eax
	movl	x
