	.file	"inputC.c"
	.text
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
	.globl	q
	.align 8
	.type	q, @object
	.size	q, 8
q:
	.zero	8
	.globl	va
	.align 8
	.type	va, @object
	.size	va, 8
va:
	.zero	8
	.globl	vb
	.align 8
	.type	vb, @object
	.size	vb, 8
vb:
	.zero	8
	.globl	vc
	.align 8
	.type	vc, @object
	.size	vc, 8
vc:
	.zero	8
	.globl	vd
	.align 8
	.type	vd, @object
	.size	vd, 8
vd:
	.zero	8
	.globl	ve
	.align 8
	.type	ve, @object
	.size	ve, 8
ve:
	.zero	8
	.globl	vf
	.align 8
	.type	vf, @object
	.size	vf, 8
vf:
	.zero	8
	.globl	ua
	.align 8
	.type	ua, @object
	.size	ua, 8
ua:
	.zero	8
	.globl	ub
	.align 8
	.type	ub, @object
	.size	ub, 8
ub:
	.zero	8
	.globl	uc
	.align 8
	.type	uc, @object
	.size	uc, 8
uc:
	.zero	8
	.globl	ud
	.align 8
	.type	ud, @object
	.size	ud, 8
ud:
	.zero	8
	.globl	ue
	.align 8
	.type	ue, @object
	.size	ue, 8
ue:
	.zero	8
	.globl	uf
	.align 8
	.type	uf, @object
	.size	uf, 8
uf:
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
	.globl	ch
	.type	ch, @object
	.size	ch, 1
ch:
	.zero	1
	.globl	dh
	.type	dh, @object
	.size	dh, 1
dh:
	.zero	1
	.text
	.globl	umin
	.type	umin, @function
umin:
.LFB6:
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
.LFE6:
	.size	umin, .-umin
	.globl	umax
	.type	umax, @function
umax:
.LFB7:
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
.LFE7:
	.size	umax, .-umax
	.globl	smin
	.type	smin, @function
smin:
.LFB8:
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
.LFE8:
	.size	smin, .-smin
	.globl	smax
	.type	smax, @function
smax:
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
	cmovge	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	smax, .-smax
	.globl	gcd
	.type	gcd, @function
gcd:
.LFB10:
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
	jnb	.L10
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	gcd
	jmp	.L11
.L10:
	cmpq	$0, -16(%rbp)
	jne	.L12
	movq	-8(%rbp), %rax
	jmp	.L11
.L12:
	movq	-8(%rbp), %rax
	movl	$0, %edx
	divq	-16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	gcd
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	gcd, .-gcd
	.globl	bitpow
	.type	bitpow, @function
bitpow:
.LFB11:
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
	jmp	.L14
.L16:
	movq	-32(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L15
	movq	-8(%rbp), %rax
	imulq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$0, %edx
	divq	-40(%rbp)
	movq	%rdx, -8(%rbp)
.L15:
	movq	-32(%rbp), %rax
	shrq	%rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	imulq	%rax, %rax
	movl	$0, %edx
	divq	-40(%rbp)
	movq	%rdx, -24(%rbp)
.L14:
	cmpq	$0, -32(%rbp)
	jne	.L16
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	bitpow, .-bitpow
	.globl	divide
	.type	divide, @function
divide:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rax
	leaq	-2(%rax), %rcx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	bitpow
	imulq	-8(%rbp), %rax
	movl	$0, %edx
	divq	-24(%rbp)
	movq	%rdx, %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	divide, .-divide
	.globl	udiff
	.type	udiff, @function
udiff:
.LFB13:
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
	jb	.L21
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	jmp	.L22
.L21:
	movq	-16(%rbp), %rax
	subq	-8(%rbp), %rax
.L22:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	udiff, .-udiff
	.globl	sdiff
	.type	sdiff, @function
sdiff:
.LFB14:
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
	jl	.L24
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	jmp	.L25
.L24:
	movq	-16(%rbp), %rax
	subq	-8(%rbp), %rax
.L25:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	sdiff, .-sdiff
	.globl	bitcount
	.type	bitcount, @function
bitcount:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L27
.L29:
	movq	-24(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L28
	addl	$1, -4(%rbp)
.L28:
	movq	-24(%rbp), %rax
	shrq	%rax
	movq	%rax, -24(%rbp)
.L27:
	cmpq	$0, -24(%rbp)
	jne	.L29
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	bitcount, .-bitcount
	.globl	pullcomp
	.type	pullcomp, @function
pullcomp:
.LFB16:
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
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jnb	.L32
	movl	$-1, %eax
	jmp	.L33
.L32:
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jbe	.L34
	movl	$1, %eax
	jmp	.L33
.L34:
	movl	$0, %eax
.L33:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	pullcomp, .-pullcomp
	.globl	psllcomp
	.type	psllcomp, @function
psllcomp:
.LFB17:
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
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jge	.L36
	movl	$-1, %eax
	jmp	.L37
.L36:
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jle	.L38
	movl	$1, %eax
	jmp	.L37
.L38:
	movl	$0, %eax
.L37:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	psllcomp, .-psllcomp
	.globl	pcharcomp
	.type	pcharcomp, @function
pcharcomp:
.LFB18:
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
	movzbl	(%rax), %eax
	movb	%al, -2(%rbp)
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -1(%rbp)
	movzbl	-2(%rbp), %eax
	cmpb	-1(%rbp), %al
	jge	.L40
	movl	$-1, %eax
	jmp	.L41
.L40:
	movzbl	-2(%rbp), %eax
	cmpb	-1(%rbp), %al
	jle	.L42
	movl	$1, %eax
	jmp	.L41
.L42:
	movl	$0, %eax
.L41:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	pcharcomp, .-pcharcomp
	.globl	pdoublecomp
	.type	pdoublecomp, @function
pdoublecomp:
.LFB19:
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
	movsd	(%rax), %xmm0
	movsd	%xmm0, -16(%rbp)
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	comisd	-16(%rbp), %xmm0
	jbe	.L51
	movl	$-1, %eax
	jmp	.L46
.L51:
	movsd	-16(%rbp), %xmm0
	comisd	-8(%rbp), %xmm0
	jbe	.L52
	movl	$1, %eax
	jmp	.L46
.L52:
	movl	$0, %eax
.L46:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	pdoublecomp, .-pdoublecomp
	.globl	pstrcomp
	.type	pstrcomp, @function
pstrcomp:
.LFB20:
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
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	pstrcomp, .-pstrcomp
	.globl	phwllABcomp
	.type	phwllABcomp, @function
phwllABcomp:
.LFB21:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-48(%rbp), %rax
	movq	8(%rax), %rdx
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	%rdx, -8(%rbp)
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rax
	cmpq	%rax, %rdx
	jge	.L56
	movl	$-1, %eax
	jmp	.L61
.L56:
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rax
	cmpq	%rax, %rdx
	jle	.L58
	movl	$1, %eax
	jmp	.L61
.L58:
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	cmpq	%rax, %rdx
	jge	.L59
	movl	$-1, %eax
	jmp	.L61
.L59:
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	cmpq	%rax, %rdx
	jle	.L60
	movl	$1, %eax
	jmp	.L61
.L60:
	movl	$0, %eax
.L61:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	phwllABcomp, .-phwllABcomp
	.globl	phwllREVcomp
	.type	phwllREVcomp, @function
phwllREVcomp:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-48(%rbp), %rax
	movq	8(%rax), %rdx
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	%rdx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	cmpq	%rax, %rdx
	jge	.L63
	movl	$-1, %eax
	jmp	.L68
.L63:
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	cmpq	%rax, %rdx
	jle	.L65
	movl	$1, %eax
	jmp	.L68
.L65:
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rax
	cmpq	%rax, %rdx
	jge	.L66
	movl	$-1, %eax
	jmp	.L68
.L66:
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rax
	cmpq	%rax, %rdx
	jle	.L67
	movl	$1, %eax
	jmp	.L68
.L67:
	movl	$0, %eax
.L68:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	phwllREVcomp, .-phwllREVcomp
	.globl	ptriplecomp
	.type	ptriplecomp, @function
ptriplecomp:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	-72(%rbp), %rcx
	movq	(%rcx), %rax
	movq	8(%rcx), %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movq	16(%rcx), %rax
	movq	%rax, -48(%rbp)
	movq	-80(%rbp), %rcx
	movq	(%rcx), %rax
	movq	8(%rcx), %rdx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movq	16(%rcx), %rax
	movq	%rax, -16(%rbp)
	movq	-64(%rbp), %rdx
	movq	-32(%rbp), %rax
	cmpq	%rax, %rdx
	jge	.L70
	movl	$-1, %eax
	jmp	.L77
.L70:
	movq	-64(%rbp), %rdx
	movq	-32(%rbp), %rax
	cmpq	%rax, %rdx
	jle	.L72
	movl	$1, %eax
	jmp	.L77
.L72:
	movq	-56(%rbp), %rdx
	movq	-24(%rbp), %rax
	cmpq	%rax, %rdx
	jge	.L73
	movl	$-1, %eax
	jmp	.L77
.L73:
	movq	-56(%rbp), %rdx
	movq	-24(%rbp), %rax
	cmpq	%rax, %rdx
	jle	.L74
	movl	$1, %eax
	jmp	.L77
.L74:
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rax
	cmpq	%rax, %rdx
	jge	.L75
	movl	$-1, %eax
	jmp	.L77
.L75:
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rax
	cmpq	%rax, %rdx
	jle	.L76
	movl	$1, %eax
	jmp	.L77
.L76:
	movl	$0, %eax
.L77:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	ptriplecomp, .-ptriplecomp
	.globl	isinrange
	.type	isinrange, @function
isinrange:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jg	.L79
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jg	.L79
	movl	$1, %eax
	jmp	.L80
.L79:
	movl	$0, %eax
.L80:
	andl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	isinrange, .-isinrange
	.globl	isinrange_soft
	.type	isinrange_soft, @function
isinrange_soft:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jg	.L83
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jle	.L84
.L83:
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jl	.L85
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jl	.L85
.L84:
	movl	$1, %eax
	jmp	.L86
.L85:
	movl	$0, %eax
.L86:
	andl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	isinrange_soft, .-isinrange_soft
	.globl	a
	.bss
	.align 32
	.type	a, @object
	.size	a, 8000000
a:
	.zero	8000000
	.globl	b
	.align 32
	.type	b, @object
	.size	b, 8000000
b:
	.zero	8000000
	.globl	c
	.align 32
	.type	c, @object
	.size	c, 8000000
c:
	.zero	8000000
	.globl	s
	.align 32
	.type	s, @object
	.size	s, 1000001
s:
	.zero	1000001
	.globl	t
	.align 32
	.type	t, @object
	.size	t, 1000001
t:
	.zero	1000001
	.globl	ok
	.align 32
	.type	ok, @object
	.size	ok, 1000000
ok:
	.zero	1000000
	.section	.rodata
.LC1:
	.string	"Yes"
.LC2:
	.string	"No"
	.text
	.globl	solve
	.type	solve, @function
solve:
.LFB26:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	$0, -32(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -8(%rbp)
	movq	$0, -40(%rbp)
	jmp	.L89
.L93:
	leaq	ok(%rip), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	cmpq	$0, -40(%rbp)
	jne	.L90
	leaq	ok(%rip), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movb	$1, (%rax)
.L90:
	cmpq	$3, -40(%rbp)
	jle	.L91
	movq	-40(%rbp), %rax
	leaq	-4(%rax), %rdx
	leaq	ok(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	testb	%al, %al
	je	.L91
	leaq	ok(%rip), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movb	$1, (%rax)
.L91:
	cmpq	$6, -40(%rbp)
	jle	.L92
	movq	-40(%rbp), %rax
	leaq	-7(%rax), %rdx
	leaq	ok(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	testb	%al, %al
	je	.L92
	leaq	ok(%rip), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movb	$1, (%rax)
.L92:
	addq	$1, -40(%rbp)
.L89:
	movq	va(%rip), %rax
	cmpq	%rax, -40(%rbp)
	jle	.L93
	movq	va(%rip), %rax
	leaq	ok(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	testb	%al, %al
	je	.L98
	nop
.L95:
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L97
.L98:
	nop
.L96:
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %eax
.L97:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	solve, .-solve
	.section	.rodata
.LC3:
	.string	"%lld"
	.text
	.globl	main
	.type	main, @function
main:
.LFB27:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	vd(%rip), %r8
	leaq	vc(%rip), %rax
	movq	%rax, %rcx
	leaq	vb(%rip), %rax
	movq	%rax, %rdx
	leaq	va(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, %eax
	call	solve
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
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
