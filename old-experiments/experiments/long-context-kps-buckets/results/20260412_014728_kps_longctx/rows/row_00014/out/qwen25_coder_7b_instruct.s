.file	"inputC.c"
	.text
	.globl	vector8
	.section	.rodata
	.align 32
	.type	vector8, @object
	.size	vector8, 64
vector8:
	.long	-1
	.long	-1
	.long	-1
	.long	0
	.long	-1
	.long	1
	.long	0
	.long	-1
	.long	0
	.long	1
	.long	1
	.long	-1
	.long	1
	.long	0
	.long	1
	.long	1
	.globl	n
	.bss
	.align 8
	.type	n, @object
	.size	n, 8
n:
	.zero	8
	.globl	m
	.align 8
	.type	m, @object
	.size	m, 8
m:
	.zero	8
	.globl	h
	.align 8
	.type	h, @object
	.size	h, 8
h:
	.zero	8
	.globl	w
	.align 8
	.type	w, @object
	.size	w, 8
w:
	.zero	8
	.globl	k
	.align 8
	.type	k, @object
	.size	k, 8
k:
	.zero	8
	.globl	vua
	.align 8
	.type	vua, @object
	.size	vua, 8
vua:
	.zero	8
	.globl	vub
	.align 8
	.type	vub, @object
	.size	vub, 8
vub:
	.zero	8
	.globl	vuc
	.align 8
	.type	vuc, @object
	.size	vuc, 8
vuc:
	.zero	8
	.globl	vud
	.align 8
	.type	vud, @object
	.size	vud, 8
vud:
	.zero	8
	.globl	vue
	.align 8
	.type	vue, @object
	.size	vue, 8
vue:
	.zero	8
	.globl	vuf
	.align 8
	.type	vuf, @object
	.size	vuf, 8
vuf:
	.zero	8
	.globl	vsa
	.align 8
	.type	vsa, @object
	.size	vsa, 8
vsa:
	.zero	8
	.globl	vsb
	.align 8
	.type	vsb, @object
	.size	vsb, 8
vsb:
	.zero	8
	.globl	vsc
	.align 8
	.type	vsc, @object
	.size	vsc, 8
vsc:
	.zero	8
	.globl	vsd
	.align 8
	.type	vsd, @object
	.size	vsd, 8
vsd:
	.zero	8
	.globl	vse
	.align 8
	.type	vse, @object
	.size	vse, 8
vse:
	.zero	8
	.globl	vsf
	.align 8
	.type	vsf, @object
	.size	vsf, 8
vsf:
	.zero	8
	.globl	vra
	.align 16
	.type	vra, @object
	.size	vra, 16
vra:
	.zero	16
	.globl	vrb
	.align 16
	.type	vrb, @object
	.size	vrb, 16
vrb:
	.zero	16
	.globl	vrc
	.align 16
	.type	vrc, @object
	.size	vrc, 16
vrc:
	.zero	16
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 1600000
a:
	.zero	1600000
	.globl	s
	.align 32
	.type	s, @object
	.size	s, 200001
s:
	.zero	200001
	.globl	slen
	.align 8
	.type	slen, @object
	.size	slen, 8
slen:
	.zero	8
	.text
	.globl	swap_adj
	.type	swap_adj, @function
swap_adj:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	swap_adj, .-swap_adj
	.globl	divide
	.type	divide, @function
divide:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$1000000005, -16(%rbp)
	movq	$1, -8(%rbp)
	jmp	.L4
.L6:
	movq	-16(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L5
	movq	-8(%rbp), %rax
	imulq	-32(%rbp), %rax
	movq	%rax, %rcx
	movabsq	$-8543223828751151131, %rdx
	movq	%rcx, %rax
	mulq	%rdx
	movq	%rdx, %rax
	shrq	$29, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	imulq	$1000000007, %rax, %rdx
	movq	%rcx, %rax
	subq	%rdx, %rax
	movq	%rax, -8(%rbp)
.L5:
	movq	-32(%rbp), %rax
	imulq	%rax, %rax
	movq	%rax, %rcx
	movabsq	$-8543223828751151131, %rdx
	movq	%rcx, %rax
	mulq	%rdx
	movq	%rdx, %rax
	shrq	$29, %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	imulq	$1000000007, %rax, %rdx
	movq	%rcx, %rax
	subq	%rdx, %rax
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rax
	shrq	%rax
	movq	%rax, -16(%rbp)
.L4:
	cmpq	$0, -16(%rbp)
	jne	.L6
	movq	-24(%rbp), %rax
	imulq	-8(%rbp), %rax
	movq	%rax, %rcx
	movabsq	$-8543223828751151131, %rdx
	movq	%rcx, %rax
	mulq	%rdx
	movq	%rdx, %rax
	shrq	$29, %rax
	imulq	$1000000007, %rax, %rdx
	movq	%rcx, %rax
	subq	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
