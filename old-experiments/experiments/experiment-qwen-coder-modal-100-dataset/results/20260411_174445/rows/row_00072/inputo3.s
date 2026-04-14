	.file	"inputC.c"
	.text
	.p2align 4
	.globl	umin
	.type	umin, @function
umin:
.LFB8:
	.cfi_startproc
	cmpq	%rdi, %rsi
	movq	%rdi, %rax
	cmovbe	%rsi, %rax
	ret
	.cfi_endproc
.LFE8:
	.size	umin, .-umin
	.p2align 4
	.globl	umax
	.type	umax, @function
umax:
.LFB9:
	.cfi_startproc
	cmpq	%rdi, %rsi
	movq	%rdi, %rax
	cmovnb	%rsi, %rax
	ret
	.cfi_endproc
.LFE9:
	.size	umax, .-umax
	.p2align 4
	.globl	smin
	.type	smin, @function
smin:
.LFB10:
	.cfi_startproc
	cmpq	%rdi, %rsi
	movq	%rdi, %rax
	cmovle	%rsi, %rax
	ret
	.cfi_endproc
.LFE10:
	.size	smin, .-smin
	.p2align 4
	.globl	smax
	.type	smax, @function
smax:
.LFB11:
	.cfi_startproc
	cmpq	%rdi, %rsi
	movq	%rdi, %rax
	cmovge	%rsi, %rax
	ret
	.cfi_endproc
.LFE11:
	.size	smax, .-smax
	.p2align 4
	.globl	gcd
	.type	gcd, @function
gcd:
.LFB12:
	.cfi_startproc
	movq	%rdi, %rdx
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L11:
	xorl	%edx, %edx
	divq	%rsi
.L8:
	movq	%rdx, %rax
	movq	%rsi, %rdx
	movq	%rax, %rsi
.L7:
	cmpq	%rsi, %rdx
	jb	.L8
	movq	%rdx, %rax
	testq	%rsi, %rsi
	jne	.L11
	ret
	.cfi_endproc
.LFE12:
	.size	gcd, .-gcd
	.p2align 4
	.globl	bitpow
	.type	bitpow, @function
bitpow:
.LFB13:
	.cfi_startproc
	movq	%rdx, %rcx
	movl	$1, %r8d
	testq	%rsi, %rsi
	je	.L12
	.p2align 4,,10
	.p2align 3
.L15:
	testb	$1, %sil
	je	.L14
	movq	%r8, %rax
	xorl	%edx, %edx
	imulq	%rdi, %rax
	divq	%rcx
	movq	%rdx, %r8
.L14:
	imulq	%rdi, %rdi
	xorl	%edx, %edx
	movq	%rdi, %rax
	divq	%rcx
	shrq	%rsi
	movq	%rdx, %rdi
	jne	.L15
.L12:
	movq	%r8, %rax
	ret
	.cfi_endproc
.LFE13:
	.size	bitpow, .-bitpow
	.p2align 4
	.globl	divide
	.type	divide, @function
divide:
.LFB14:
	.cfi_startproc
	movq	%rdx, %rcx
	movq	%rdx, %r8
	subq	$2, %rcx
	je	.L22
	movl	$1, %r9d
	.p2align 4,,10
	.p2align 3
.L24:
	testb	$1, %cl
	je	.L23
	movq	%r9, %rax
	xorl	%edx, %edx
	imulq	%rsi, %rax
	divq	%r8
	movq	%rdx, %r9
.L23:
	imulq	%rsi, %rsi
	xorl	%edx, %edx
	movq	%rsi, %rax
	divq	%r8
	shrq	%rcx
	movq	%rdx, %rsi
	jne	.L24
	imulq	%r9, %rdi
.L22:
	movq	%rdi, %rax
	xorl	%edx, %edx
	divq	%r8
	movq	%rdx, %rax
	ret
	.cfi_endproc
.LFE14:
	.size	divide, .-divide
	.p2align 4
	.globl	udiff
	.type	udiff, @function
udiff:
.LFB15:
	.cfi_startproc
	movq	%rdi, %rdx
	movq	%rsi, %rax
	subq	%rsi, %rdx
	subq	%rdi, %rax
	cmpq	%rsi, %rdi
	cmovnb	%rdx, %rax
	ret
	.cfi_endproc
.LFE15:
	.size	udiff, .-udiff
	.p2align 4
	.globl	sdiff
	.type	sdiff, @function
sdiff:
.LFB16:
	.cfi_startproc
	movq	%rdi, %rdx
	movq	%rsi, %rax
	subq	%rsi, %rdx
	subq	%rdi, %rax
	cmpq	%rsi, %rdi
	cmovge	%rdx, %rax
	ret
	.cfi_endproc
.LFE16:
	.size	sdiff, .-sdiff
	.p2align 4
	.globl	bitcount
	.type	bitcount, @function
bitcount:
.LFB17:
	.cfi_startproc
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.L42
	.p2align 4,,10
	.p2align 3
.L41:
	movq	%rdi, %rdx
	andl	$1, %edx
	addl	%edx, %eax
	shrq	%rdi
	jne	.L41
	ret
	.p2align 4,,10
	.p2align 3
.L42:
	ret
	.cfi_endproc
.LFE17:
	.size	bitcount, .-bitcount
	.p2align 4
	.globl	pullcomp
	.type	pullcomp, @function
pullcomp:
.LFB18:
	.cfi_startproc
	movq	(%rdi), %rdx
	movq	(%rsi), %rcx
	movl	$-1, %eax
	cmpq	%rcx, %rdx
	jb	.L46
	xorl	%eax, %eax
	cmpq	%rdx, %rcx
	setb	%al
.L46:
	ret
	.cfi_endproc
.LFE18:
	.size	pullcomp, .-pullcomp
	.p2align 4
	.globl	prevcomp
	.type	prevcomp, @function
prevcomp:
.LFB19:
	.cfi_startproc
	movq	(%rdi), %rcx
	movq	(%rsi), %rdx
	movl	$-1, %eax
	cmpq	%rcx, %rdx
	jb	.L49
	xorl	%eax, %eax
	cmpq	%rdx, %rcx
	setb	%al
.L49:
	ret
	.cfi_endproc
.LFE19:
	.size	prevcomp, .-prevcomp
	.p2align 4
	.globl	psllcomp
	.type	psllcomp, @function
psllcomp:
.LFB20:
	.cfi_startproc
	movq	(%rsi), %rax
	cmpq	%rax, (%rdi)
	movl	$-1, %edx
	setg	%al
	movzbl	%al, %eax
	cmovl	%edx, %eax
	ret
	.cfi_endproc
.LFE20:
	.size	psllcomp, .-psllcomp
	.p2align 4
	.globl	pcharcomp
	.type	pcharcomp, @function
pcharcomp:
.LFB21:
	.cfi_startproc
	movzbl	(%rsi), %eax
	cmpb	%al, (%rdi)
	movl	$-1, %edx
	setg	%al
	movzbl	%al, %eax
	cmovl	%edx, %eax
	ret
	.cfi_endproc
.LFE21:
	.size	pcharcomp, .-pcharcomp
	.p2align 4
	.globl	pdoublecomp
	.type	pdoublecomp, @function
pdoublecomp:
.LFB22:
	.cfi_startproc
	movsd	(%rdi), %xmm1
	movsd	(%rsi), %xmm0
	movl	$-1, %eax
	comisd	%xmm1, %xmm0
	ja	.L58
	xorl	%eax, %eax
	comisd	%xmm0, %xmm1
	seta	%al
.L58:
	ret
	.cfi_endproc
.LFE22:
	.size	pdoublecomp, .-pdoublecomp
	.p2align 4
	.globl	pstrcomp
	.type	pstrcomp, @function
pstrcomp:
.LFB23:
	.cfi_startproc
	movq	(%rsi), %rsi
	movq	(%rdi), %rdi
	jmp	strcmp
	.cfi_endproc
.LFE23:
	.size	pstrcomp, .-pstrcomp
	.p2align 4
	.globl	phwllABcomp
	.type	phwllABcomp, @function
phwllABcomp:
.LFB24:
	.cfi_startproc
	movq	(%rsi), %rcx
	movl	$-1, %eax
	cmpq	%rcx, (%rdi)
	jl	.L62
	movl	$1, %eax
	jg	.L62
	movq	8(%rsi), %rax
	cmpq	%rax, 8(%rdi)
	movl	$-1, %edx
	setg	%al
	movzbl	%al, %eax
	cmovl	%edx, %eax
.L62:
	ret
	.cfi_endproc
.LFE24:
	.size	phwllABcomp, .-phwllABcomp
	.p2align 4
	.globl	phwllREVcomp
	.type	phwllREVcomp, @function
phwllREVcomp:
.LFB25:
	.cfi_startproc
	movq	8(%rsi), %rcx
	movl	$-1, %eax
	cmpq	%rcx, 8(%rdi)
	jl	.L67
	movl	$1, %eax
	jg	.L67
	movq	(%rsi), %rax
	cmpq	%rax, (%rdi)
	movl	$-1, %edx
	setg	%al
	movzbl	%al, %eax
	cmovl	%edx, %eax
.L67:
	ret
	.cfi_endproc
.LFE25:
	.size	phwllREVcomp, .-phwllREVcomp
	.p2align 4
	.globl	ptriplecomp
	.type	ptriplecomp, @function
ptriplecomp:
.LFB26:
	.cfi_startproc
	movq	(%rsi), %rcx
	movl	$-1, %eax
	cmpq	%rcx, (%rdi)
	jl	.L72
	movl	$1, %eax
	jg	.L72
	movq	8(%rsi), %rdx
	movl	$-1, %eax
	cmpq	%rdx, 8(%rdi)
	jl	.L72
	movl	$1, %eax
	jg	.L72
	movq	16(%rsi), %rax
	cmpq	%rax, 16(%rdi)
	movl	$-1, %edx
	setg	%al
	movzbl	%al, %eax
	cmovl	%edx, %eax
.L72:
	ret
	.cfi_endproc
.LFE26:
	.size	ptriplecomp, .-ptriplecomp
	.p2align 4
	.globl	ptripleREVcomp
	.type	ptripleREVcomp, @function
ptripleREVcomp:
.LFB27:
	.cfi_startproc
	movq	8(%rsi), %rcx
	movl	$-1, %eax
	cmpq	%rcx, 8(%rdi)
	jl	.L79
	movl	$1, %eax
	jg	.L79
	movq	(%rsi), %rdx
	movl	$-1, %eax
	cmpq	%rdx, (%rdi)
	jl	.L79
	movl	$1, %eax
	jg	.L79
	movq	16(%rsi), %rax
	cmpq	%rax, 16(%rdi)
	movl	$-1, %edx
	setg	%al
	movzbl	%al, %eax
	cmovl	%edx, %eax
.L79:
	ret
	.cfi_endproc
.LFE27:
	.size	ptripleREVcomp, .-ptripleREVcomp
	.p2align 4
	.globl	pquadcomp
	.type	pquadcomp, @function
pquadcomp:
.LFB28:
	.cfi_startproc
	movq	(%rsi), %rcx
	movl	$-1, %eax
	cmpq	%rcx, (%rdi)
	jl	.L86
	movl	$1, %eax
	jg	.L86
	movq	8(%rsi), %rdx
	movl	$-1, %eax
	cmpq	%rdx, 8(%rdi)
	jl	.L86
	movl	$1, %eax
	jg	.L86
	movq	16(%rsi), %rdx
	movl	$-1, %eax
	cmpq	%rdx, 16(%rdi)
	jl	.L86
	movl	$1, %eax
	jg	.L86
	movq	24(%rsi), %rax
	cmpq	%rax, 24(%rdi)
	movl	$-1, %edx
	setg	%al
	movzbl	%al, %eax
	cmovl	%edx, %eax
.L86:
	ret
	.cfi_endproc
.LFE28:
	.size	pquadcomp, .-pquadcomp
	.p2align 4
	.globl	isinrange
	.type	isinrange, @function
isinrange:
.LFB29:
	.cfi_startproc
	cmpq	%rsi, %rdi
	setle	%al
	cmpq	%rdx, %rsi
	setle	%dl
	andl	%edx, %eax
	ret
	.cfi_endproc
.LFE29:
	.size	isinrange, .-isinrange
	.p2align 4
	.globl	isinrange_soft
	.type	isinrange_soft, @function
isinrange_soft:
.LFB30:
	.cfi_startproc
	cmpq	%rsi, %rdi
	setle	%al
	cmpq	%rdx, %rsi
	setle	%cl
	andb	%cl, %al
	jne	.L96
	cmpq	%rsi, %rdi
	setge	%al
	cmpq	%rdx, %rsi
	setge	%dl
	andl	%edx, %eax
.L96:
	ret
	.cfi_endproc
.LFE30:
	.size	isinrange_soft, .-isinrange_soft
	.p2align 4
	.globl	segf_
	.type	segf_, @function
segf_:
.LFB31:
	.cfi_startproc
	cmpq	%rdi, %rcx
	jle	.L113
	cmpq	%rdx, %rsi
	jle	.L113
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	movq	%rcx, %rbx
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	cmpq	%rdx, %rdi
	setle	%al
	cmpq	%rsi, %rcx
	setle	%r12b
	testb	%al, %al
	je	.L100
	testb	%r12b, %r12b
	je	.L100
	movq	seg(,%r8,8), %rax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L100:
	.cfi_restore_state
	leaq	(%rbx,%rdx), %rcx
	leaq	(%r8,%r8), %r9
	movq	%rcx, %rbp
	leaq	1(%r9), %r15
	shrq	$63, %rbp
	addq	%rcx, %rbp
	sarq	%rbp
	cmpq	%rbp, %rdi
	jge	.L114
	cmpq	%rbp, %rsi
	movl	%eax, %ecx
	setge	%r14b
	andb	%r14b, %cl
	je	.L102
	movq	seg(,%r9,8), %r13
	xorl	%eax, %eax
	cmpq	%rbp, %rsi
	je	.L103
.L104:
	leaq	(%rbx,%rbp), %rax
	movq	%rax, %r14
	shrq	$63, %r14
	addq	%rax, %r14
	leaq	(%r15,%r15), %rax
	sarq	%r14
	leaq	1(%rax), %r9
	cmpq	%r14, %rdi
	jge	.L120
	cmpq	%r14, %rsi
	jl	.L110
	testb	%cl, %cl
	je	.L110
	movq	seg(,%rax,8), %rbp
	xorl	%eax, %eax
	cmpq	%r14, %rsi
	je	.L111
.L112:
	leaq	(%rbx,%r14), %rax
	leaq	(%r9,%r9), %r8
	movq	%r14, %rdx
	movq	%rsi, 8(%rsp)
	movq	%rax, %r15
	movq	%r8, 16(%rsp)
	shrq	$63, %r15
	movq	%rdi, (%rsp)
	addq	%rax, %r15
	sarq	%r15
	movq	%r15, %rcx
	call	segf_
	movq	16(%rsp), %r8
	movq	%rbx, %rcx
	movq	%r15, %rdx
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%rax, %r12
	addq	$1, %r8
	call	segf_
	cmpq	%rax, %r12
	cmovge	%r12, %rax
.L111:
	cmpq	%rbp, %rax
	cmovl	%rbp, %rax
.L103:
	cmpq	%r13, %rax
	cmovl	%r13, %rax
.L163:
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L113:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L102:
	.cfi_def_cfa_offset 112
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	leaq	(%rdx,%rbp), %rcx
	movq	%rcx, %r13
	shrq	$63, %r13
	addq	%rcx, %r13
	leaq	0(,%r8,4), %rcx
	sarq	%r13
	leaq	1(%rcx), %r9
	cmpq	%r13, %rdi
	jge	.L116
	cmpq	%r13, %rsi
	jl	.L106
	testb	%al, %al
	je	.L106
	movq	seg(,%rcx,8), %r11
	xorl	%eax, %eax
	cmpq	%r13, %rsi
	je	.L107
.L108:
	leaq	0(%rbp,%r13), %rax
	leaq	(%r9,%r9), %r8
	movq	%r13, %rdx
	movq	%rdi, (%rsp)
	movq	%rax, %r14
	movq	%r11, 24(%rsp)
	shrq	$63, %r14
	movq	%r8, 16(%rsp)
	addq	%rax, %r14
	movq	%rsi, 8(%rsp)
	sarq	%r14
	movq	%r14, %rcx
	call	segf_
	movq	16(%rsp), %r8
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	movq	%rax, %r13
	addq	$1, %r8
	call	segf_
	movq	24(%rsp), %r11
	movq	8(%rsp), %rsi
	cmpq	%rax, %r13
	movq	(%rsp), %rdi
	cmovge	%r13, %rax
.L107:
	cmpq	%rax, %r11
	cmovge	%r11, %rax
	movq	%rax, %r13
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L114:
	xorl	%r13d, %r13d
.L101:
	xorl	%eax, %eax
	cmpq	%rbp, %rsi
	jle	.L103
	cmpq	%rbp, %rdi
	setle	%al
	movl	%eax, %ecx
	testb	%r12b, %r12b
	je	.L104
	testb	%al, %al
	je	.L104
	movq	seg(,%r15,8), %rax
	cmpq	%r13, %rax
	cmovl	%r13, %rax
	jmp	.L163
	.p2align 4,,10
	.p2align 3
.L106:
	leaq	(%rdx,%r13), %rax
	salq	$3, %r8
	movq	%r9, 40(%rsp)
	movq	%rax, %r10
	movq	%r8, 32(%rsp)
	shrq	$63, %r10
	movq	%rsi, 8(%rsp)
	addq	%rax, %r10
	movq	%rdi, (%rsp)
	sarq	%r10
	movq	%r10, %rcx
	movq	%r10, 24(%rsp)
	call	segf_
	movq	32(%rsp), %r8
	movq	8(%rsp), %rsi
	movq	%r13, %rcx
	movq	(%rsp), %rdi
	movq	24(%rsp), %rdx
	movq	%rax, 16(%rsp)
	addq	$1, %r8
	call	segf_
	movq	16(%rsp), %r11
	movq	(%rsp), %rdi
	movq	8(%rsp), %rsi
	movq	40(%rsp), %r9
	cmpq	%rax, %r11
	cmovl	%rax, %r11
.L105:
	xorl	%eax, %eax
	cmpq	%r13, %rsi
	jle	.L107
	cmpq	%r13, %rdi
	jg	.L108
	testb	%r14b, %r14b
	je	.L108
	movq	seg(,%r9,8), %rax
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L110:
	leaq	0(%rbp,%r14), %rax
	salq	$2, %r15
	movq	%rbp, %rdx
	movq	%rdi, (%rsp)
	movq	%rax, %r10
	movq	%r15, %r8
	movq	%r9, 24(%rsp)
	shrq	$63, %r10
	movq	%rsi, 8(%rsp)
	addq	%rax, %r10
	sarq	%r10
	movq	%r10, %rcx
	movq	%r10, 16(%rsp)
	call	segf_
	movq	(%rsp), %rdi
	leaq	1(%r15), %r8
	movq	%r14, %rcx
	movq	8(%rsp), %rsi
	movq	16(%rsp), %rdx
	movq	%rax, %rbp
	call	segf_
	movq	(%rsp), %rdi
	movq	8(%rsp), %rsi
	cmpq	%rax, %rbp
	movq	24(%rsp), %r9
	cmovl	%rax, %rbp
.L109:
	xorl	%eax, %eax
	cmpq	%r14, %rsi
	jle	.L111
	cmpq	%r14, %rdi
	jg	.L112
	testb	%r12b, %r12b
	je	.L112
	movq	seg(,%r9,8), %rax
	jmp	.L111
	.p2align 4,,10
	.p2align 3
.L116:
	xorl	%r11d, %r11d
	jmp	.L105
	.p2align 4,,10
	.p2align 3
.L120:
	xorl	%ebp, %ebp
	jmp	.L109
	.cfi_endproc
.LFE31:
	.size	segf_, .-segf_
	.p2align 4
	.globl	segf
	.type	segf, @function
segf:
.LFB32:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	movq	base(%rip), %r13
	cmpq	%rdi, %r13
	jle	.L179
	movq	%rsi, %rbp
	testq	%rsi, %rsi
	jle	.L179
	testq	%rdi, %rdi
	movq	%rdi, %rbx
	setle	%al
	cmpq	%rsi, %r13
	setle	%r15b
	testb	%al, %al
	je	.L166
	testb	%r15b, %r15b
	je	.L166
	movq	seg+8(%rip), %rax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L166:
	.cfi_restore_state
	movq	%r13, %r12
	shrq	$63, %r12
	addq	%r13, %r12
	sarq	%r12
	cmpq	%r12, %rbx
	jge	.L180
	cmpq	%r12, %rbp
	movl	%eax, %edx
	setge	%r9b
	andb	%r9b, %dl
	je	.L168
	movq	seg+16(%rip), %r14
	xorl	%eax, %eax
	cmpq	%r12, %rbp
	je	.L169
.L170:
	leaq	0(%r13,%r12), %rax
	movq	%rax, %r9
	shrq	$63, %r9
	addq	%rax, %r9
	sarq	%r9
	cmpq	%r9, %rbx
	jge	.L186
	cmpq	%r9, %rbp
	jl	.L176
	testb	%dl, %dl
	je	.L176
	movq	seg+48(%rip), %r12
	xorl	%eax, %eax
	cmpq	%r9, %rbp
	je	.L177
.L178:
	leaq	0(%r13,%r9), %rax
	movq	%r9, %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movq	%rax, %r10
	movl	$14, %r8d
	shrq	$63, %r10
	addq	%rax, %r10
	sarq	%r10
	movq	%r10, %rcx
	movq	%r10, 8(%rsp)
	call	segf_
	movq	8(%rsp), %rdx
	movq	%r13, %rcx
	movq	%rbp, %rsi
	movl	$15, %r8d
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	segf_
	cmpq	%rax, %r15
	cmovge	%r15, %rax
.L177:
	cmpq	%rax, %r12
	cmovge	%r12, %rax
.L169:
	cmpq	%r14, %rax
	cmovl	%r14, %rax
.L226:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L179:
	.cfi_restore_state
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L168:
	.cfi_restore_state
	testq	%r13, %r13
	leaq	3(%r13), %r14
	cmovns	%r13, %r14
	sarq	$2, %r14
	cmpq	%r14, %rbx
	jge	.L182
	cmpq	%r14, %rbp
	jl	.L172
	testb	%al, %al
	je	.L172
	movq	seg+32(%rip), %r10
	xorl	%eax, %eax
	cmpq	%r14, %rbp
	je	.L173
.L174:
	leaq	(%r12,%r14), %rax
	movq	%r14, %rdx
	movl	$10, %r8d
	movq	%rbp, %rsi
	movq	%rax, %r9
	movq	%rbx, %rdi
	movq	%r10, 16(%rsp)
	shrq	$63, %r9
	addq	%rax, %r9
	sarq	%r9
	movq	%r9, %rcx
	movq	%r9, 8(%rsp)
	call	segf_
	movq	8(%rsp), %rdx
	movq	%r12, %rcx
	movq	%rbp, %rsi
	movl	$11, %r8d
	movq	%rbx, %rdi
	movq	%rax, %r14
	call	segf_
	movq	16(%rsp), %r10
	cmpq	%rax, %r14
	cmovge	%r14, %rax
.L173:
	cmpq	%r10, %rax
	cmovge	%rax, %r10
	movq	%r10, %r14
	jmp	.L167
	.p2align 4,,10
	.p2align 3
.L180:
	xorl	%r14d, %r14d
.L167:
	xorl	%eax, %eax
	cmpq	%r12, %rbp
	jle	.L169
	cmpq	%r12, %rbx
	setle	%al
	movl	%eax, %edx
	testb	%r15b, %r15b
	je	.L170
	testb	%al, %al
	je	.L170
	movq	seg+24(%rip), %rax
	cmpq	%r14, %rax
	cmovl	%r14, %rax
	jmp	.L226
	.p2align 4,,10
	.p2align 3
.L172:
	testq	%r13, %r13
	leaq	7(%r13), %r11
	movl	$8, %r8d
	movq	%rbp, %rsi
	cmovns	%r13, %r11
	movq	%rbx, %rdi
	xorl	%edx, %edx
	movb	%r9b, 31(%rsp)
	sarq	$3, %r11
	movq	%r11, %rcx
	movq	%r11, 16(%rsp)
	call	segf_
	movq	16(%rsp), %rdx
	movq	%r14, %rcx
	movq	%rbp, %rsi
	movl	$9, %r8d
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	segf_
	movq	8(%rsp), %r10
	movzbl	31(%rsp), %r9d
	cmpq	%rax, %r10
	cmovl	%rax, %r10
.L171:
	xorl	%eax, %eax
	cmpq	%r14, %rbp
	jle	.L173
	cmpq	%r14, %rbx
	jg	.L174
	testb	%r9b, %r9b
	je	.L174
	movq	seg+40(%rip), %rax
	jmp	.L173
	.p2align 4,,10
	.p2align 3
.L176:
	leaq	(%r12,%r9), %rax
	movq	%r12, %rdx
	movl	$12, %r8d
	movq	%rbp, %rsi
	movq	%rax, %r10
	movq	%rbx, %rdi
	movq	%r9, 8(%rsp)
	shrq	$63, %r10
	addq	%rax, %r10
	sarq	%r10
	movq	%r10, %rcx
	movq	%r10, 16(%rsp)
	call	segf_
	movq	8(%rsp), %rcx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movq	16(%rsp), %rdx
	movl	$13, %r8d
	movq	%rax, %r12
	call	segf_
	movq	8(%rsp), %r9
	cmpq	%rax, %r12
	cmovl	%rax, %r12
.L175:
	xorl	%eax, %eax
	cmpq	%r9, %rbp
	jle	.L177
	cmpq	%r9, %rbx
	jg	.L178
	testb	%r15b, %r15b
	je	.L178
	movq	seg+56(%rip), %rax
	jmp	.L177
	.p2align 4,,10
	.p2align 3
.L182:
	xorl	%r10d, %r10d
	jmp	.L171
	.p2align 4,,10
	.p2align 3
.L186:
	xorl	%r12d, %r12d
	jmp	.L175
	.cfi_endproc
.LFE32:
	.size	segf, .-segf
	.p2align 4
	.globl	segup
	.type	segup, @function
segup:
.LFB33:
	.cfi_startproc
	addq	base(%rip), %rdi
	movq	%rdi, %rax
	movq	%rsi, seg(,%rdi,8)
	shrq	$63, %rax
	addq	%rdi, %rax
	sarq	%rax
	je	.L227
	.p2align 4,,10
	.p2align 3
.L229:
	leaq	(%rax,%rax), %rcx
	movq	seg+8(,%rcx,8), %rdx
	movq	seg(,%rcx,8), %rcx
	cmpq	%rcx, %rdx
	cmovl	%rcx, %rdx
	movq	%rdx, seg(,%rax,8)
	movq	%rax, %rdx
	shrq	$63, %rdx
	addq	%rdx, %rax
	sarq	%rax
	jne	.L229
.L227:
	ret
	.cfi_endproc
.LFE33:
	.size	segup, .-segup
	.p2align 4
	.globl	bcnt
	.type	bcnt, @function
bcnt:
.LFB34:
	.cfi_startproc
	xorl	%edx, %edx
	testq	%rdi, %rdi
	je	.L234
	.p2align 4,,10
	.p2align 3
.L235:
	movq	%rdi, %rax
	andl	$1, %eax
	addq	%rax, %rdx
	shrq	%rdi
	jne	.L235
.L234:
	movq	%rdx, %rax
	ret
	.cfi_endproc
.LFE34:
	.size	bcnt, .-bcnt
	.p2align 4
	.globl	dfs1
	.type	dfs1, @function
dfs1:
.LFB35:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %rax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	salq	$4, %rax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	1(%rdi), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movdqa	.LC0(%rip), %xmm0
	movq	gin(,%rdi,8), %rbp
	movq	gin(,%r12,8), %rcx
	movaps	%xmm0, dp1(%rax)
	cmpq	%rcx, %rbp
	jnb	.L242
	movq	%rdi, %r15
	movq	%rsi, %r13
.L243:
	movq	%rbp, %rax
	salq	$4, %rax
	movq	xy+8(%rax), %rdx
	cmpq	%r13, %rdx
	je	.L245
	leaq	1(%rdx), %rsi
	movq	%rdx, %rax
	movq	gin(,%rdx,8), %rbx
	movq	gin(,%rsi,8), %rdi
	salq	$4, %rax
	movaps	%xmm0, dp1(%rax)
	cmpq	%rdi, %rbx
	jnb	.L245
	movq	%rbp, 72(%rsp)
	movq	%rsi, %r14
	movq	%r13, 80(%rsp)
	movq	%r15, %r13
.L278:
	movq	%rbx, %rax
	salq	$4, %rax
	movq	xy+8(%rax), %r15
	cmpq	%r15, %r13
	je	.L248
	movq	%r15, %rax
	movq	gin(,%r15,8), %rbp
	salq	$4, %rax
	movaps	%xmm0, dp1(%rax)
	leaq	1(%r15), %rax
	movq	gin(,%rax,8), %r8
	cmpq	%r8, %rbp
	jnb	.L248
	movq	%rbx, 88(%rsp)
	movq	%r14, 104(%rsp)
	movq	%r13, 112(%rsp)
	movq	%r12, 96(%rsp)
	movq	%rdx, %r12
	movq	%rax, %rdx
.L277:
	movq	%rbp, %rax
	salq	$4, %rax
	movq	xy+8(%rax), %rax
	cmpq	%rax, %r12
	je	.L251
	movq	%rax, %rsi
	leaq	1(%rax), %r14
	movq	gin(,%rax,8), %rbx
	salq	$4, %rsi
	movaps	%xmm0, dp1(%rsi)
	movq	gin(,%r14,8), %rsi
	cmpq	%rsi, %rbx
	jnb	.L251
	movq	%r12, 56(%rsp)
	movq	%r15, %r13
	movq	%rdx, %r10
	movq	%rbp, 64(%rsp)
.L276:
	movq	%rbx, %rdx
	salq	$4, %rdx
	movq	xy+8(%rdx), %r15
	cmpq	%r15, %r13
	je	.L254
	leaq	1(%r15), %r12
	movq	%r15, %rdx
	movq	gin(,%r15,8), %rbp
	movq	gin(,%r12,8), %rdi
	salq	$4, %rdx
	movaps	%xmm0, dp1(%rdx)
	cmpq	%rdi, %rbp
	jnb	.L254
	movq	%rbx, 48(%rsp)
	movq	%r14, %rdx
	movq	%r10, %r11
	movq	%r15, %r14
	movq	%r13, 40(%rsp)
	movq	%r12, %r13
.L275:
	movq	%rbp, %rcx
	salq	$4, %rcx
	movq	xy+8(%rcx), %rcx
	cmpq	%rcx, %rax
	je	.L257
	movq	%rcx, %rsi
	leaq	1(%rcx), %r12
	movq	gin(,%rcx,8), %rbx
	salq	$4, %rsi
	movaps	%xmm0, dp1(%rsi)
	movq	gin(,%r12,8), %rsi
	cmpq	%rsi, %rbx
	jnb	.L257
	movq	%rax, 24(%rsp)
	movq	%rbp, %r15
	movq	%r11, %r8
	movq	%rcx, 32(%rsp)
.L274:
	movq	%rbx, %rax
	salq	$4, %rax
	movq	xy+8(%rax), %rcx
	cmpq	%rcx, %r14
	je	.L260
	leaq	1(%rcx), %rbp
	movq	%rcx, %rax
	movq	gin(,%rcx,8), %r9
	movq	gin(,%rbp,8), %r11
	salq	$4, %rax
	movaps	%xmm0, dp1(%rax)
	cmpq	%r11, %r9
	jnb	.L260
	movq	%r9, 16(%rsp)
	movq	%rcx, %r10
	movq	%r8, %r9
	movq	%rdx, %rax
	movq	%r11, %rsi
.L273:
	movq	16(%rsp), %rdx
	salq	$4, %rdx
	movq	xy+8(%rdx), %rcx
	cmpq	%rcx, 32(%rsp)
	je	.L263
	movq	%rcx, %rdx
	leaq	1(%rcx), %r8
	salq	$4, %rdx
	movq	gin(,%r8,8), %r11
	movaps	%xmm0, dp1(%rdx)
	movq	gin(,%rcx,8), %rdx
	cmpq	%r11, %rdx
	jnb	.L263
	movq	%rcx, (%rsp)
	movq	%r8, 8(%rsp)
.L272:
	movq	%rdx, %rcx
	salq	$4, %rcx
	movq	xy+8(%rcx), %rsi
	cmpq	%rsi, %r10
	je	.L266
	movq	%rsi, %rcx
	leaq	1(%rsi), %r8
	salq	$4, %rcx
	movq	gin(,%r8,8), %rdi
	movaps	%xmm0, dp1(%rcx)
	movq	gin(,%rsi,8), %rcx
	cmpq	%rdi, %rcx
	jnb	.L266
.L271:
	movq	%rcx, %r11
	salq	$4, %r11
	movq	xy+8(%r11), %r11
	cmpq	%r11, (%rsp)
	je	.L268
	movq	%r11, %rdi
	movq	%r8, 168(%rsp)
	movq	%rax, 160(%rsp)
	movq	%r9, 152(%rsp)
	movq	%rcx, 144(%rsp)
	movq	%rdx, 136(%rsp)
	movq	%r10, 128(%rsp)
	movq	%rsi, 120(%rsp)
	call	dfs1
	movq	168(%rsp), %r8
	movq	144(%rsp), %rcx
	movq	120(%rsp), %rsi
	movdqa	.LC0(%rip), %xmm0
	movq	gin(,%r8,8), %rdi
	addq	$1, %rcx
	movq	128(%rsp), %r10
	movq	136(%rsp), %rdx
	movq	152(%rsp), %r9
	cmpq	%rdi, %rcx
	movq	160(%rsp), %rax
	jb	.L271
	.p2align 4,,10
	.p2align 3
.L270:
	movq	8(%rsp), %rdi
	movq	gin(,%rdi,8), %r11
.L266:
	addq	$1, %rdx
	cmpq	%r11, %rdx
	jb	.L272
	movq	gin(,%rbp,8), %rsi
.L263:
	addq	$1, 16(%rsp)
	movq	16(%rsp), %rdi
	cmpq	%rsi, %rdi
	jb	.L273
	movq	gin(,%r12,8), %rsi
	movq	%r9, %r8
	movq	%rax, %rdx
.L260:
	addq	$1, %rbx
	cmpq	%rsi, %rbx
	jb	.L274
	movq	24(%rsp), %rax
	movq	gin(,%r13,8), %rdi
	movq	%r15, %rbp
	movq	%r8, %r11
.L257:
	addq	$1, %rbp
	cmpq	%rdi, %rbp
	jb	.L275
	movq	40(%rsp), %r13
	movq	48(%rsp), %rbx
	movq	%r11, %r10
	movq	%rdx, %r14
	movq	gin(,%rdx,8), %rsi
.L254:
	addq	$1, %rbx
	cmpq	%rsi, %rbx
	jb	.L276
	movq	56(%rsp), %r12
	movq	64(%rsp), %rbp
	movq	%r13, %r15
	movq	%r10, %rdx
	movq	gin(,%r10,8), %r8
.L251:
	addq	$1, %rbp
	cmpq	%r8, %rbp
	jb	.L277
	movq	104(%rsp), %r14
	movq	%r12, %rdx
	movq	88(%rsp), %rbx
	movq	96(%rsp), %r12
	movq	112(%rsp), %r13
	movq	gin(,%r14,8), %rdi
.L248:
	addq	$1, %rbx
	cmpq	%rdi, %rbx
	jb	.L278
	movq	%r13, %r15
	movq	72(%rsp), %rbp
	movq	80(%rsp), %r13
	movq	gin(,%r12,8), %rcx
.L245:
	addq	$1, %rbp
	cmpq	%rcx, %rbp
	jb	.L243
.L242:
	addq	$184, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L268:
	.cfi_restore_state
	addq	$1, %rcx
	cmpq	%rdi, %rcx
	jb	.L271
	jmp	.L270
	.cfi_endproc
.LFE35:
	.size	dfs1, .-dfs1
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%lld\n"
	.text
	.p2align 4
	.globl	solve
	.type	solve, @function
solve:
.LFB36:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	k(%rip), %r8
	movl	$dp, %eax
	movl	$dp+800000, %ecx
	leaq	1(%r8), %rdx
	movq	%rdx, %xmm0
	punpcklqdq	%xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L291:
	movaps	%xmm0, (%rax)
	addq	$32, %rax
	movaps	%xmm0, -16(%rax)
	cmpq	%rax, %rcx
	jne	.L291
	movq	n(%rip), %rcx
	movq	%rdx, dp+800000(%rip)
	movq	$0, dp(%rip)
	testq	%rcx, %rcx
	je	.L292
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L293:
	movq	b(,%r11,8), %rdi
	cmpq	$100000, %rdi
	jg	.L296
	leaq	-1(%rdi), %r9
	movq	a(,%r11,8), %r10
	negq	%rdi
	movl	$100000, %eax
	salq	$3, %rdi
	.p2align 4,,10
	.p2align 3
.L294:
	movq	dp(%rdi,%rax,8), %rdx
	movq	dp(,%rax,8), %rsi
	addq	%r10, %rdx
	cmpq	%rsi, %rdx
	cmovg	%rsi, %rdx
	movq	%rdx, dp(,%rax,8)
	subq	$1, %rax
	cmpq	%r9, %rax
	jne	.L294
.L296:
	addq	$1, %r11
	cmpq	%rcx, %r11
	jne	.L293
	.p2align 4,,10
	.p2align 3
.L292:
	xorl	%esi, %esi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L298:
	cmpq	dp(,%rax,8), %r8
	cmovnb	%rax, %rsi
	addq	$1, %rax
	cmpq	$100001, %rax
	jne	.L298
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	printf
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE36:
	.size	solve, .-solve
	.section	.rodata.str1.1
.LC2:
	.string	"%llu"
.LC3:
	.string	"%lld"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB37:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$m, %edx
	movl	$n, %esi
	movl	$.LC2, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	xorl	%eax, %eax
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	__isoc99_scanf
	xorl	%eax, %eax
	movl	$m, %ecx
	movl	$n, %edx
	movl	$k, %esi
	movl	$.LC2, %edi
	call	__isoc99_scanf
	cmpq	$0, n(%rip)
	je	.L311
	movl	$a, %ebp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L310:
	movq	%rbp, %rsi
	movl	$.LC3, %edi
	xorl	%eax, %eax
	addq	$8, %rbp
	call	__isoc99_scanf
	leaq	b(,%rbx,8), %rsi
	xorl	%eax, %eax
	addq	$1, %rbx
	movl	$.LC3, %edi
	call	__isoc99_scanf
	cmpq	n(%rip), %rbx
	jb	.L310
.L311:
	xorl	%eax, %eax
	call	solve
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE37:
	.size	main, .-main
	.globl	dp
	.bss
	.align 32
	.type	dp, @object
	.size	dp, 800040
dp:
	.zero	800040
	.globl	dp1
	.align 32
	.type	dp1, @object
	.size	dp1, 16000000
dp1:
	.zero	16000000
	.globl	gin
	.align 32
	.type	gin, @object
	.size	gin, 8000000
gin:
	.zero	8000000
	.globl	base
	.data
	.align 8
	.type	base, @object
	.size	base, 8
base:
	.quad	262144
	.globl	seg
	.bss
	.align 32
	.type	seg, @object
	.size	seg, 4194304
seg:
	.zero	4194304
	.globl	p
	.align 32
	.type	p, @object
	.size	p, 8000000
p:
	.zero	8000000
	.globl	table
	.align 32
	.type	table, @object
	.size	table, 72240200
table:
	.zero	72240200
	.globl	tup
	.align 32
	.type	tup, @object
	.size	tup, 24000120
tup:
	.zero	24000120
	.globl	xy
	.align 32
	.type	xy, @object
	.size	xy, 16000080
xy:
	.zero	16000080
	.globl	u
	.align 32
	.type	u, @object
	.size	u, 1000001
u:
	.zero	1000001
	.globl	t
	.align 32
	.type	t, @object
	.size	t, 1000001
t:
	.zero	1000001
	.globl	s
	.align 32
	.type	s, @object
	.size	s, 1000001
s:
	.zero	1000001
	.globl	e
	.align 32
	.type	e, @object
	.size	e, 8000000
e:
	.zero	8000000
	.globl	d
	.align 32
	.type	d, @object
	.size	d, 8000040
d:
	.zero	8000040
	.globl	c
	.align 32
	.type	c, @object
	.size	c, 8000040
c:
	.zero	8000040
	.globl	b
	.align 32
	.type	b, @object
	.size	b, 8000040
b:
	.zero	8000040
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 8000040
a:
	.zero	8000040
	.globl	dh
	.type	dh, @object
	.size	dh, 1
dh:
	.zero	1
	.globl	ch
	.type	ch, @object
	.size	ch, 1
ch:
	.zero	1
	.globl	vdc
	.align 8
	.type	vdc, @object
	.size	vdc, 8
vdc:
	.zero	8
	.globl	vdb
	.align 8
	.type	vdb, @object
	.size	vdb, 8
vdb:
	.zero	8
	.globl	vda
	.align 8
	.type	vda, @object
	.size	vda, 8
vda:
	.zero	8
	.globl	vrc
	.align 16
	.type	vrc, @object
	.size	vrc, 16
vrc:
	.zero	16
	.globl	vrb
	.align 16
	.type	vrb, @object
	.size	vrb, 16
vrb:
	.zero	16
	.globl	vra
	.align 16
	.type	vra, @object
	.size	vra, 16
vra:
	.zero	16
	.globl	uf
	.align 8
	.type	uf, @object
	.size	uf, 8
uf:
	.zero	8
	.globl	ue
	.align 8
	.type	ue, @object
	.size	ue, 8
ue:
	.zero	8
	.globl	ud
	.align 8
	.type	ud, @object
	.size	ud, 8
ud:
	.zero	8
	.globl	uc
	.align 8
	.type	uc, @object
	.size	uc, 8
uc:
	.zero	8
	.globl	ub
	.align 8
	.type	ub, @object
	.size	ub, 8
ub:
	.zero	8
	.globl	ua
	.align 8
	.type	ua, @object
	.size	ua, 8
ua:
	.zero	8
	.globl	vf
	.align 8
	.type	vf, @object
	.size	vf, 8
vf:
	.zero	8
	.globl	ve
	.align 8
	.type	ve, @object
	.size	ve, 8
ve:
	.zero	8
	.globl	vd
	.align 8
	.type	vd, @object
	.size	vd, 8
vd:
	.zero	8
	.globl	vc
	.align 8
	.type	vc, @object
	.size	vc, 8
vc:
	.zero	8
	.globl	vb
	.align 8
	.type	vb, @object
	.size	vb, 8
vb:
	.zero	8
	.globl	va
	.align 8
	.type	va, @object
	.size	va, 8
va:
	.zero	8
	.globl	q
	.align 8
	.type	q, @object
	.size	q, 8
q:
	.zero	8
	.globl	k
	.align 8
	.type	k, @object
	.size	k, 8
k:
	.zero	8
	.globl	w
	.align 8
	.type	w, @object
	.size	w, 8
w:
	.zero	8
	.globl	h
	.align 8
	.type	h, @object
	.size	h, 8
h:
	.zero	8
	.globl	m
	.align 8
	.type	m, @object
	.size	m, 8
m:
	.zero	8
	.globl	n
	.align 8
	.type	n, @object
	.size	n, 8
n:
	.zero	8
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.quad	1
	.quad	1
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
