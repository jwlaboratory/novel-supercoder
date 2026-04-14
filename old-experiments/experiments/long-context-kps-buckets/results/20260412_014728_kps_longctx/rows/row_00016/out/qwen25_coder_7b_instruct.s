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
	.globl	vda
	.align 8
	.type	vda, @object
	.size	vda, 8
vda:
	.zero	8
	.globl	vdb
	.align 8
	.type	vdb, @object
	.size	vdb, 8
vdb:
	.zero	8
	.globl	vdc
	.align 8
	.type	vdc, @object
	.size	vdc, 8
vdc:
	.zero	8
	.globl	slen
	.align 8
	.type	slen, @object
	.size	slen, 8
slen:
	.zero	8
	.globl	tlen
	.align 8
	.type	tlen, @object
	.size	tlen, 8
tlen:
	.zero	8
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 2400000
a:
	.zero	2400000
	.globl	alphabets
	.align 32
	.type	alphabets, @object
	.size	alphabets, 208
alphabets:
	.zero	208
	.globl	dp
	.align 32
	.type	dp, @object
	.size	dp, 2400000
dp:
	.zero	2400000
	.globl	imos
	.align 32
	.type	imos, @object
	.size	imos, 2400040
imos:
	.zero	2400040
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
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	je	.L4
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
.L4:
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
	jmp	.L6
.L8:
	movq	-16(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L7
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
.L7:
	movq	-32(%rbp), %rax
	imulq	%rax, %rax
	movq	%rax, %rcx
	movabsq	$-8543223828751151131, %rdx
	movq	%rcx, %rax
	mulq	%rdx
	movq	%rdx, %rax
	shrq	$29, %
