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
.L6:
	cmpq	$0, -16(%rbp)
	jne	.L8
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
	ret
	.cfi_endproc
.LFE7:
	.size	divide, .-divide
	.globl	digits
	.type	digits, @function
digits:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$1, -4(%rbp)
	jmp	.L11
.L12:
	movq	-24(%rbp), %rax
	movabsq	$-3689348814741910323, %rdx
	mulq	%rdx
	movq	%rdx, %rax
	shrq	$3, %rax
	movq	%rax, -24(%rbp)
	addl	$1, -4(%rbp)
.L11:
	cmpq	$9, -24(%rbp)
	ja	.L12
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	digits, .-digits
	.globl	umin
	.type	umin, @function
umin:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	cmpq	%rax, %rdx
	cmovbe	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	umin, .-umin
	.globl	umax
	.type	umax, @function
umax:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	cmpq	%rax, %rdx
	cmovnb	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	umax, .-umax
	.globl	smin
	.type	smin, @function
smin:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	cmpq	%rax, %rdx
	cmovle	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	smin, .-smin
	.globl	smax
	.type	smax, @function
smax:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	cmpq	%rax, %rdx
	cmovge	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	smax, .-smax
	.globl	gcd
	.type	gcd, @function
gcd:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jnb	.L23
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	gcd
	jmp	.L24
.L23:
	cmpq	$0, -16(%rbp)
	jne	.L25
	movq	-8(%rbp), %rax
	jmp	.L24
.L25:
	movq	-8(%rbp), %rax
	movl	$0, %edx
	divq	-16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	gcd
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	gcd, .-gcd
	.globl	bitpow
	.type	bitpow, @function
bitpow:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	$1, -8(%rbp)
	jmp	.L27
.L29:
	movq	-32(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L28
	movq	-8(%rbp), %rax
	imulq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$0, %edx
	divq	-40(%rbp)
	movq	%rdx, -8(%rbp)
.L28:
	movq	-32(%rbp), %rax
	shrq	%rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	imulq	%rax, %rax
	movl	$0, %edx
	divq	-40(%rbp)
	movq	%rdx, -24(%rbp)
.L27:
	cmpq	$0, -32(%rbp)
	jne	.L29
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	bitpow, .-bitpow
	.globl	targetdig
	.type	targetdig, @function
targetdig:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	digits
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.L34
	movl	$-1, %eax
	jmp	.L33
.L35:
	subl	$1, -4(%rbp)
	movq	-24(%rbp), %rax
	movabsq	$-3689348814741910323, %rdx
	mulq	%rdx
	movq	%rdx, %rax
	shrq	$3, %rax
	movq	%rax, -24(%rbp)
.L34:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jg	.L35
	movq	-24(%rbp), %rcx
	movabsq	$-3689348814741910323, %rdx
	movq	%rcx, %rax
	mulq	%rdx
	shrq	$3, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	subq	%rax, %rcx
	movq	%rcx, %rdx
	movl	%edx, %eax
.L33:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	targetdig, .-targetdig
	.globl	charcomp
	.type	charcomp, @function
charcomp:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %edx
	movl	%esi, %eax
	movb	%dl, -4(%rbp)
	movb	%al, -8(%rbp)
	movzbl	-4(%rbp), %eax
	cmpb	-8(%rbp), %al
	jge	.L37
	movl	$-1, %eax
	jmp	.L38
.L37:
	movzbl	-4(%rbp), %eax
	cmpb	-8(%rbp), %al
	jle	.L39
	movl	$1, %eax
	jmp	.L38
.L39:
	movl	$0, %eax
.L38:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	charcomp, .-charcomp
	.globl	pcharcomp
	.type	pcharcomp, @function
pcharcomp:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	charcomp
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	pcharcomp, .-pcharcomp
	.globl	pcharrevcomp
	.type	pcharrevcomp, @function
pcharrevcomp:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	charcomp
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	pcharrevcomp, .-pcharrevcomp
	.globl	intcomp
	.type	intcomp, @function
intcomp:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.L45
	movl	$-1, %eax
	jmp	.L46
.L45:
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.L47
	movl	$1, %eax
	jmp	.L46
.L47:
	movl	$0, %eax
.L46:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	intcomp, .-intcomp
	.globl	pintcomp
	.type	pintcomp, @function
pintcomp:
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	intcomp
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	pintcomp, .-pintcomp
	.globl	ullcomp
	.type	ullcomp, @function
ullcomp:
.LFB21:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jnb	.L51
	movl	$-1, %eax
	jmp	.L52
.L51:
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jbe	.L53
	movl	$1, %eax
	jmp	.L52
.L53:
	movl	$0, %eax
.L52:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	ullcomp, .-ullcomp
	.globl	pullcomp
	.type	pullcomp, @function
pullcomp:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	ullcomp
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	pullcomp, .-pullcomp
	.globl	sllcomp
	.type	sllcomp, @function
sllcomp:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jge	.L57
	movl	$-1, %eax
	jmp	.L58
.L57:
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jle	.L59
	movl	$1, %eax
	jmp	.L58
.L59:
	movl	$0, %eax
.L58:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	sllcomp, .-sllcomp
	.globl	hwllfraccomp
	.type	hwllfraccomp, @function
hwllfraccomp:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rsi, %rax
	movq	%rdi, %r8
	movq	%r8, %rsi
	movq	%r9, %rdi
	movq	%rax, %rdi
	movq	%rsi, -16(%rbp)
	movq	%rdi, -8(%rbp)
	movq	%rdx, -32(%rbp)
	movq	%rcx, -24(%rbp)
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rax
	imulq	%rdx, %rax
	movq	%rax, %rcx
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	imulq	%rdx, %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	ullcomp
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	hwllfraccomp, .-hwllfraccomp
	.globl	psllcomp
	.type	psllcomp, @function
psllcomp:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	sllcomp
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	psllcomp, .-psllcomp
	.globl	phwAcomp
	.type	phwAcomp, @function
phwAcomp:
.LFB26:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	intcomp
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	phwAcomp, .-phwAcomp
	.globl	phwBcomp
	.type	phwBcomp, @function
phwBcomp:
.LFB27:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	4(%rax), %edx
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	intcomp
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	phwBcomp, .-phwBcomp
	.globl	phwABcomp
	.type	phwABcomp, @function
phwABcomp:
.LFB28:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	phwAcomp
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L69
	movl	-4(%rbp), %eax
	jmp	.L70
.L69:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	phwBcomp
.L70:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	phwABcomp, .-phwABcomp
	.globl	phwllAcomp
	.type	phwllAcomp, @function
phwllAcomp:
.LFB29:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	sllcomp
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	phwllAcomp, .-phwllAcomp
	.globl	phwllBcomp
	.type	phwllBcomp, @function
phwllBcomp:
.LFB30:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	sllcomp
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	phwllBcomp, .-phwllBcomp
	.globl	phwllABcomp
	.type	phwllABcomp, @function
phwllABcomp:
.LFB31:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	phwllAcomp
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L76
	movl	-4(%rbp), %eax
	jmp	.L77
.L76:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	phwllBcomp
.L77:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	phwllABcomp, .-phwllABcomp
	.globl	pstrAcomp
	.type	pstrAcomp, @function
pstrAcomp:
.LFB32:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	ullcomp
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L79
	movl	-4(%rbp), %eax
	jmp	.L80
.L79:
	movq	-32(%rbp), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	ullcomp
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L81
	movl	-4(%rbp), %eax
	jmp	.L80
.L81:
	movq	-32(%rbp), %rax
	movl	16(%rax), %edx
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	intcomp
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L82
	movl	-4(%rbp), %eax
	jmp	.L80
.L82:
	movl	$0, %eax
.L80:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	pstrAcomp, .-pstrAcomp
	.globl	bitlet
	.type	bitlet, @function
bitlet:
.LFB33:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movsbl	-4(%rbp), %eax
	subl	$97, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	bitlet, .-bitlet
	.globl	ullabs
	.type	ullabs, @function
ullabs:
.LFB34:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jb	.L86
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	jmp	.L87
.L86:
	movq	-16(%rbp), %rax
	subq	-8(%rbp), %rax
.L87:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	ullabs, .-ullabs
	.globl	sllabs
	.type	sllabs, @function
sllabs:
.LFB35:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jl	.L89
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	jmp	.L90
.L89:
	movq	-16(%rbp), %rax
	subq	-8(%rbp), %rax
.L90:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	sllabs, .-sllabs
	.globl	nibutanlobo
	.type	nibutanlobo, @function
nibutanlobo:
.LFB36:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	jmp	.L92
.L94:
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$63, %rdx
	addq	%rdx, %rax
	sarq	%rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, %rdi
	call	*%rdx
	testb	%al, %al
	je	.L93
	movq	-8(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L92
.L93:
	movq	-8(%rbp), %rax
	movq	%rax, -40(%rbp)
.L92:
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	sllabs
	cmpq	$1, %rax
	jg	.L94
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, %rdi
	call	*%rdx
	xorl	$1, %eax
	testb	%al, %al
	je	.L95
	movq	-32(%rbp), %rax
	addq	%rax, %rax
	subq	-40(%rbp), %rax
	jmp	.L96
.L95:
	movq	-32(%rbp), %rax
.L96:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	nibutanlobo, .-nibutanlobo
	.globl	nextroute
	.type	nextroute, @function
nextroute:
.LFB37:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	-28(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.L98
.L100:
	subl	$1, -12(%rbp)
.L98:
	cmpl	$0, -12(%rbp)
	jle	.L99
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jg	.L100
.L99:
	cmpl	$0, -12(%rbp)
	jne	.L101
	movl	$0, %eax
	jmp	.L102
.L101:
	movl	-28(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
	jmp	.L103
.L107:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jl	.L108
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	je	.L106
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jle	.L105
.L106:
	movl	-8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.L105
.L108:
	nop
.L105:
	addl	$1, -8(%rbp)
.L103:
	movl	-8(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L107
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %ecx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rsi
	movq	-24(%rbp), %rax
	addq	%rsi, %rax
	xorl	%ecx, %edx
	movl	%edx, (%rax)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %ecx
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rsi
	movq	-24(%rbp), %rax
	addq	%rsi, %rax
	xorl	%ecx, %edx
	movl	%edx, (%rax)
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %ecx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rsi
	movq	-24(%rbp), %rax
	addq	%rsi, %rax
	xorl	%ecx, %edx
	movl	%edx, (%rax)
	movl	-28(%rbp), %eax
	subl	-12(%rbp), %eax
	cltq
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-24(%rbp), %rdx
	leaq	(%rcx,%rdx), %rdi
	leaq	pintcomp(%rip), %rdx
	movq	%rdx, %rcx
	movl	$4, %edx
	movq	%rax, %rsi
	call	qsort@PLT
	movl	$1, %eax
.L102:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE37:
	.size	nextroute, .-nextroute
	.section	.rodata
.LC0:
	.string	"%llu."
.LC1:
	.string	"%1d"
.LC2:
	.string	""
	.text
	.globl	printUquotient
	.type	printUquotient, @function
printUquotient:
.LFB38:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$20, -4(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, %edx
	divq	-32(%rbp)
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movl	$0, %edx
	divq	-32(%rbp)
	movq	%rdx, -24(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L110
.L111:
	movq	-24(%rbp), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, %edx
	divq	-32(%rbp)
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movl	$0, %edx
	divq	-32(%rbp)
	movq	%rdx, -24(%rbp)
	addl	$1, -8(%rbp)
.L110:
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L111
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE38:
	.size	printUquotient, .-printUquotient
	.globl	printSquotient
	.type	printSquotient, @function
printSquotient:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	imulq	-32(%rbp), %rax
	testq	%rax, %rax
	jns	.L114
	movl	$45, %edi
	call	putchar@PLT
.L114:
	movq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	sllabs
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	sllabs
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	printUquotient
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE39:
	.size	printSquotient, .-printSquotient
	.globl	bitcount
	.type	bitcount, @function
bitcount:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L117
.L119:
	movq	-24(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L118
	addl	$1, -4(%rbp)
.L118:
	movq	-24(%rbp), %rax
	shrq	%rax
	movq	%rax, -24(%rbp)
.L117:
	cmpq	$0, -24(%rbp)
	jne	.L119
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE40:
	.size	bitcount, .-bitcount
	.globl	isprime
	.type	isprime, @function
isprime:
.LFB41:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	cmpq	$1, -24(%rbp)
	ja	.L122
	movl	$0, %eax
	jmp	.L123
.L122:
	movq	$2, -8(%rbp)
	jmp	.L124
.L126:
	movq	-24(%rbp), %rax
	movl	$0, %edx
	divq	-8(%rbp)
	movq	%rdx, %rax
	testq	%rax, %rax
	jne	.L125
	movl	$0, %eax
	jmp	.L123
.L125:
	addq	$1, -8(%rbp)
.L124:
	movq	-8(%rbp), %rax
	imulq	%rax, %rax
	cmpq	%rax, -24(%rbp)
	jnb	.L126
	movl	$1, %eax
.L123:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE41:
	.size	isprime, .-isprime
	.section	.rodata
.LC3:
	.string	"%llu\n"
	.text
	.globl	solve
	.type	solve, @function
solve:
.LFB42:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	$0, -16(%rbp)
	movq	$0, -8(%rbp)
	movq	$0, -24(%rbp)
	jmp	.L128
.L130:
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	a(%rip), %rax
	movq	(%rdx,%rax), %rax
	shrq	%rax
	addq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	a(%rip), %rax
	movq	(%rdx,%rax), %rax
	andl	$1, %eax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	a(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	movq	n(%rip), %rax
	leaq	-1(%rax), %rdx
	movq	-24(%rbp), %rax
	cmpq	%rax, %rdx
	jbe	.L129
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	a(%rip), %rax
	movq	(%rdx,%rax), %rax
	testq	%rax, %rax
	je	.L129
	movq	-24(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	leaq	a(%rip), %rax
	movq	(%rdx,%rax), %rax
	testq	%rax, %rax
	je	.L129
	addq	$1, -16(%rbp)
	movq	-24(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	leaq	a(%rip), %rcx
	movq	(%rdx,%rcx), %rdx
	leaq	-1(%rdx), %rcx
	leaq	0(,%rax,8), %rdx
	leaq	a(%rip), %rax
	movq	%rcx, (%rdx,%rax)
.L129:
	addq	$1, -24(%rbp)
.L128:
	movq	-24(%rbp), %rdx
	movq	n(%rip), %rax
	cmpq	%rax, %rdx
	jb	.L130
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE42:
	.size	solve, .-solve
	.section	.rodata
.LC4:
	.string	"%llu"
	.text
	.globl	main
	.type	main, @function
main:
.LFB43:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	m(%rip), %rax
	movq	%rax, %rdx
	leaq	n(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -4(%rbp)
	jmp	.L133
.L134:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	a(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -4(%rbp)
.L133:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	n(%rip), %rax
	cmpq	%rax, %rdx
	jb	.L134
	movl	$0, %eax
	call	solve
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE43:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
