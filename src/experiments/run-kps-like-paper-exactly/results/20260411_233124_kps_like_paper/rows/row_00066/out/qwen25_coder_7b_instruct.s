.file	"inputC.c"
	.text
	.globl	N
	.bss
	.align 4
	.type	N, @object
	.size	N, 4
N:
	.zero	4
	.globl	M
	.align 4
	.type	M, @object
	.size	M, 4
M:
	.zero	4
	.globl	K
	.align 4
	.type	K, @object
	.size	K, 4
K:
	.zero	4
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 80004
a:
	.zero	80004
	.globl	memo
	.align 32
	.type	memo, @object
	.size	memo, 160008
memo:
	.zero	160008
	.globl	buf
	.align 16
	.type	buf, @object
	.size	buf, 30
buf:
	.zero	30
	.globl	p
	.align 8
	.type	p, @object
	.size	p, 8
p:
	.zero	8
	.text
	.globl	in
	.type	in, @function
in:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, -4(%rbp)
.L2:
	movq	p(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jg	.L3
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	in, .-in
	.globl	rec
	.type	rec, @function
rec:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movl	N(%rip), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L6
	movl	$0, %eax
	jmp	.L7
.L6:
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	memo(%rip), %rax
	movq	(%rdx,%rax), %rax
	movabsq	$3472328296227680303, %rdx
	cmpq	%rdx, %rax
	jg	.L8
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	memo(%rip), %rax
	movq	(%rdx,%rax), %rax
	jmp	.L7
.L8:
	movabsq	$3472328296227680304, %rax
	movq	%rax, -16(%rbp)
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	movl	M(%rip), %edx
	movl	-52(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -36(%rbp)
	movl	N(%rip), %eax
	cmpl	%eax, -36(%rbp)
	jle	.L9
	movl	N(%rip), %eax
	movl	%eax, -36(%rbp)
.L9:
	movl	-52(%rbp), %eax
	movl	%eax, -40(%rbp)
	jmp	.L10
.L14:
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	cmpq	%rax, -24(%rbp)
	jge	.L11
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	movq	%rax, -24(%rbp)
	jmp	.L12
.L11:
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	cmpq	%rax, -32(%rbp)
	jle	.L12
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	movq	%rax, -32(%rbp)
.L12:
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	call	rec
	movq	%rax, %rdx
	movl	K(%rip), %eax
	cltq
	leaq	(%rdx,%rax), %rcx
	movl	-40(%rbp), %eax
	subl	-52(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	subq	-32(%rbp), %rax
	imulq	%rdx, %rax
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jge	.L13
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L13:
	addl	$1, -40(%rbp)
.L10:
	movl	-40(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L14
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	memo(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, (%rcx,%rdx)
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	memo(%rip), %rax
	movq	(%rdx,%rax), %rax
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	rec, .-rec
	.section	.rodata
.LC0:
	.string	"%lld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	stdin(%rip), %rdx
	leaq	buf(%rip), %rax
	movq	%rax, p(%rip)
	movq	p(%rip), %rax
	movl	$30, %esi
	movq	%rax,
