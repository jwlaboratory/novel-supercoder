.file	"optimized_inputC.s"
	.text
	.p2align 4
	.type	cp_cmp, @function
cp_cmp:
.LFB10:
	.cfi_startproc
	movq	8(%rdi), %rdx
	subq	8(%rsi), %rdx
	xorl	%eax, %eax
	testq	%rdx, %rdx
	movl	$-1, %edx
	setg	%al
	cmovs	%edx, %eax
	ret
	.cfi_endproc
.LFE10:
	.size	cp_cmp, .-cp_cmp
	.p2align 4
	.globl	in
	.type	in, @function
in:
.LFB8:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L6:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L6
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE8:
	.size	in, .-in
	.p2align 4
	.globl	out
	.type	out, @function
out:
.LFB9:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L19
	movabsq	$7378697629483820647, %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%ecx, %ecx
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	.p2align 4,,10
	.p2align 3
.L10:
	movq	%rdi, %rax
	imulq	%rsi
	movq	%rdi, %rax
	sarq	$63, %rax
	sarq	$2, %rdx
	subq	%rax, %rdx
	leaq	(%rdx,%rdx,4), %rax
	addq	%rax, %rax
	subq	%rax, %rdi
	movq	%rcx, %rax
	addl	$48, %edi
	movb	%dil, (%rsp,%rcx)
	movq	%rdx, %rdi
	addq	$1, %rcx
	testq	%rdx, %rdx
	jne	.L10
	movslq	%eax, %rdx
	leaq	-1(%rsp,%rdx), %rbp
	leaq	(%rsp,%rdx), %rbx
	subq	%rax, %rbp
	.p2align 4,,10
	.p2align 3
.L11:
	movsbl	(%rbx), %edi
	xorl	%eax, %eax
	subq	$1, %rbx
	call	putchar_unlocked
	cmpq	%rbp, %rbx
	jne	.L11
	addq	$56, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	.cfi_restore 3
	.cfi_restore 6
	movl	$48, %edi
	xorl	%eax, %eax
	jmp	putchar_unlocked
	.cfi_endproc
.LFE9:
	.size	out, .-out
	.p2align 4
	.globl	compact
	.type	compact, @function
compact:
.LFB11:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movslq	%esi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	movq	%r14, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	salq	$4, %rdi
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	call	malloc
	testq	%rax, %rax
	je	.L30
	movq	%r14, %r12
	movq	%rax, %rbx
	testl	%r14d, %r14d
	jle	.L22
	movq	%rax, %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L23:
	movq	0(%r13,%rax,8), %rsi
	movl	%eax, (%rcx)
	addq	$1, %rax
	addq	$16, %rcx
	movq	%rsi, -8(%rcx)
	cmpq	%rax, %r14
	jne	.L23
	movl	$cp_cmp, %ecx
	movl	$16, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	qsort
	movslq	(%rbx), %rax
	movl	$0, 0(%rbp,%rax,4)
	cmpl	$1, %r12d
	jne	.L34
.L25:
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L27:
	movq	%rbx, %rdi
	movl	%eax, 12(%rsp)
	call	free
	movl	12(%rsp), %eax
.L20:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
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
.L34:
	.cfi_restore_state
	leaq	16(%rbx), %rcx
	movl	%r12d, %r8d
	movl	$1, %edx
	xorl	%esi, %esi
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L26:
	movslq	(%rcx), %r9
	movslq	%esi, %rdi
	movq	8(%rcx), %r10
	salq	$4, %rdi
	leaq	0(%rbp,%r9,4), %r9
	cmpq	8(%rbx,%rdi), %r10
	je	.L28
	cmpl	%edx, %eax
	je	.L29
	movq	%r10, 24(%rbx,%rdi)
.L29:
	movl	%eax, %esi
	addl	$1, %eax
.L28:
	addq	$1, %rdx
	movl	%esi, (%r9)
	addq	$1
