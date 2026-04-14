	.file	"inputC.c"
	.text
	.p2align 4
	.globl	phwllABcomp
	.type	phwllABcomp, @function
phwllABcomp:
.LFB24:
	.cfi_startproc
	movq	(%rsi), %rcx
	movl	$-1, %eax
	cmpq	%rcx, (%rdi)
	jl	.L1
	movl	$1, %eax
	jg	.L1
	movq	8(%rsi), %rax
	cmpq	%rax, 8(%rdi)
	movl	$-1, %edx
	setg	%al
	movzbl	%al, %eax
	cmovl	%edx, %eax
.L1:
	ret
	.cfi_endproc
.LFE24:
	.size	phwllABcomp, .-phwllABcomp
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
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L16:
	xorl	%edx, %edx
	divq	%rsi
.L13:
	movq	%rdx, %rax
	movq	%rsi, %rdx
	movq	%rax, %rsi
.L12:
	cmpq	%rsi, %rdx
	jb	.L13
	movq	%rdx, %rax
	testq	%rsi, %rsi
	jne	.L16
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
	je	.L17
	.p2align 4,,10
	.p2align 3
.L20:
	testb	$1, %sil
	je	.L19
	movq	%r8, %rax
	xorl	%edx, %edx
	imulq	%rdi, %rax
	divq	%rcx
	movq	%rdx, %r8
.L19:
	imulq	%rdi, %rdi
	xorl	%edx, %edx
	movq	%rdi, %rax
	divq	%rcx
	shrq	%rsi
	movq	%rdx, %rdi
	jne	.L20
.L17:
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
	je	.L27
	movl	$1, %r9d
	.p2align 4,,10
	.p2align 3
.L29:
	testb	$1, %cl
	je	.L28
	movq	%r9, %rax
	xorl	%edx, %edx
	imulq	%rsi, %rax
	divq	%r8
	movq	%rdx, %r9
.L28:
	imulq	%rsi, %rsi
	xorl	%edx, %edx
	movq	%rsi, %rax
	divq	%r8
	shrq	%rcx
	movq	%rdx, %rsi
	jne	.L29
	imulq	%r9, %rdi
.L27:
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
	je	.L47
	.p2align 4,,10
	.p2align 3
.L46:
	movq	%rdi, %rdx
	andl	$1, %edx
	addl	%edx, %eax
	shrq	%rdi
	jne	.L46
	ret
	.p2align 4,,10
	.p2align 3
.L47:
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
	jb	.L51
	xorl	%eax, %eax
	cmpq	%rdx, %rcx
	setb	%al
.L51:
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
	jb	.L54
	xorl	%eax, %eax
	cmpq	%rdx, %rcx
	setb	%al
.L54:
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
	ja	.L63
	xorl	%eax, %eax
	comisd	%xmm0, %xmm1
	seta	%al
.L63:
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
	.globl	dfs
	.type	dfs, @function
dfs:
.LFB31:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$25, %ecx
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
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	leaq	1(%r12), %r15
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$216, %rsp
	.cfi_def_cfa_offset 272
	movq	gin(,%r12,8), %r13
	movq	gin(,%r15,8), %rdx
	movq	%rsp, %rbx
	movq	%rbx, %rdi
	rep stosq
	cmpq	%rdx, %r13
	jnb	.L99
	movq	%rsi, %r14
	movl	$1, %ebp
.L103:
	movq	%r13, %rax
	salq	$4, %rax
	movq	xy+8(%rax), %rdi
	cmpq	%r14, %rdi
	jne	.L122
.L100:
	addq	$1, %r13
	cmpq	%rdx, %r13
	jb	.L103
.L99:
	xorl	%eax, %eax
	movq	$-1, %rdx
	.p2align 4,,10
	.p2align 3
.L105:
	cmpq	$2, (%rbx,%rax,8)
	cmovnb	%rax, %rdx
	addq	$1, %rax
	cmpq	$25, %rax
	jne	.L105
	addq	$1, %rdx
	cmpq	$24, %rdx
	jle	.L109
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L107:
	addq	$1, %rdx
	cmpq	$25, %rdx
	je	.L106
.L109:
	cmpq	$0, (%rbx,%rdx,8)
	movq	%rdx, %rcx
	jne	.L107
	movq	%rdx, dp(,%r12,8)
	jmp	.L108
	.p2align 4,,10
	.p2align 3
.L122:
	movq	%r12, %rsi
	call	dfs
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L102:
	movq	%rbp, %rdx
	salq	%cl, %rdx
	testq	%rax, %rdx
	je	.L101
	addq	$1, (%rbx,%rcx,8)
.L101:
	addq	$1, %rcx
	cmpq	$25, %rcx
	jne	.L102
	movq	gin(,%r15,8), %rdx
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L106:
	movq	dp(,%r12,8), %rcx
.L108:
	movl	$1, %eax
	salq	%cl, %rax
	addq	$1, %rcx
	cmpq	$24, %rcx
	jg	.L98
	.p2align 4,,10
	.p2align 3
.L112:
	cmpq	$0, (%rbx,%rcx,8)
	je	.L111
	btcq	%rcx, %rax
.L111:
	addq	$1, %rcx
	cmpq	$25, %rcx
	jne	.L112
.L98:
	addq	$216, %rsp
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
	.cfi_endproc
.LFE31:
	.size	dfs, .-dfs
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lld\n"
	.text
	.p2align 4
	.globl	solve
	.type	solve, @function
solve:
.LFB32:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	n(%rip), %rax
	movq	%rax, %rdi
	subq	$1, %rdi
	je	.L124
	leaq	-8(,%rax,8), %rsi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L125:
	movq	a(%rax), %rcx
	movq	b(%rax), %rdx
	movq	%rcx, %xmm0
	movq	%rdx, %xmm1
	movq	%rcx, %xmm2
	addq	$1, c(,%rcx,8)
	addq	$1, c(,%rdx,8)
	punpcklqdq	%xmm1, %xmm0
	movaps	%xmm0, xy(,%rax,4)
	movq	%rdx, %xmm0
	punpcklqdq	%xmm2, %xmm0
	movaps	%xmm0, xy+16(,%rax,4)
	addq	$8, %rax
	cmpq	%rsi, %rax
	jne	.L125
	addq	%rdi, %rdi
.L124:
	movq	%rdi, %rsi
	movl	$phwllABcomp, %ecx
	movl	$16, %edx
	movl	$xy, %edi
	call	qsort
	movq	n(%rip), %r8
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	leaq	-2(%r8,%r8), %rsi
	.p2align 4,,10
	.p2align 3
.L141:
	movq	%rax, gin(,%rcx,8)
	cmpq	%rsi, %rax
	jb	.L126
	jmp	.L187
	.p2align 4,,10
	.p2align 3
.L129:
	addq	$1, %rax
	cmpq	%rsi, %rax
	jnb	.L128
.L126:
	movq	%rax, %rdx
	salq	$4, %rdx
	cmpq	%rcx, xy(%rdx)
	je	.L129
.L128:
	addq	$1, %rcx
	cmpq	%rcx, %r8
	jnb	.L141
.L142:
	testq	%r8, %r8
	je	.L144
.L135:
	xorl	%edi, %edi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L138:
	cmpq	c(,%rax,8), %rdi
	cmovb	%rax, %rdi
	addq	$1, %rax
	cmpq	%r8, %rax
	jne	.L138
.L136:
	movq	%r8, %rsi
	call	dfs
	movq	n(%rip), %rcx
	xorl	%esi, %esi
	testq	%rcx, %rcx
	je	.L139
	xorl	%eax, %eax
	testb	$1, %cl
	je	.L140
	movq	dp(%rip), %rax
	cmpq	%rax, %rsi
	cmovl	%rax, %rsi
	movl	$1, %eax
	cmpq	%rcx, %rax
	je	.L139
	.p2align 4,,10
	.p2align 3
.L140:
	movq	dp(,%rax,8), %rdx
	cmpq	%rdx, %rsi
	cmovl	%rdx, %rsi
	movq	dp+8(,%rax,8), %rdx
	cmpq	%rdx, %rsi
	cmovl	%rdx, %rsi
	addq	$2, %rax
	cmpq	%rcx, %rax
	jne	.L140
.L139:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	printf
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L187:
	.cfi_restore_state
	leaq	1(%rcx), %rdx
	cmpq	%rdx, %r8
	jb	.L142
	movq	%r8, %rsi
	subq	%rdx, %rsi
	cmpq	$4, %rsi
	jbe	.L172
	addq	$2, %rcx
	leaq	1(%r8), %rdi
	cmpq	%rcx, %rdi
	jb	.L172
	cmpq	$-1, %r8
	je	.L172
	addq	$1, %rsi
	leaq	gin(,%rdx,8), %rcx
	movq	%rax, %xmm0
	movq	%rsi, %rdi
	punpcklqdq	%xmm0, %xmm0
	shrq	%rdi
	salq	$4, %rdi
	leaq	(%rdi,%rcx), %r9
	andl	$16, %edi
	je	.L131
	movups	%xmm0, (%rcx)
	addq	$16, %rcx
	cmpq	%r9, %rcx
	je	.L185
.L131:
	movups	%xmm0, (%rcx)
	addq	$32, %rcx
	movups	%xmm0, -16(%rcx)
	cmpq	%r9, %rcx
	jne	.L131
.L185:
	movq	%rsi, %rcx
	andq	$-2, %rcx
	addq	%rcx, %rdx
	andl	$1, %esi
	je	.L135
	movq	%rax, gin(,%rdx,8)
	jmp	.L135
.L172:
	movq	%r8, %rcx
	movq	%rax, gin(,%rdx,8)
	subq	%rdx, %rcx
	addq	$1, %rdx
	andl	$1, %ecx
	cmpq	%rdx, %r8
	jb	.L135
	testq	%rcx, %rcx
	je	.L133
	movq	%rax, gin(,%rdx,8)
	addq	$1, %rdx
	cmpq	%rdx, %r8
	jb	.L135
.L133:
	movq	%rax, gin(,%rdx,8)
	movq	%rax, gin+8(,%rdx,8)
	addq	$2, %rdx
	cmpq	%rdx, %r8
	jnb	.L133
	jmp	.L135
	.p2align 4,,10
	.p2align 3
.L144:
	xorl	%edi, %edi
	jmp	.L136
	.cfi_endproc
.LFE32:
	.size	solve, .-solve
	.section	.rodata.str1.1
.LC1:
	.string	"%llu"
.LC2:
	.string	"%lld"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB33:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%eax, %eax
	movl	$m, %edx
	movl	$n, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	$.LC1, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	$3, n(%rip)
	movq	$0, m(%rip)
	call	__isoc99_scanf
	cmpq	$1, n(%rip)
	je	.L191
	movl	$a, %ebp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L190:
	movq	%rbp, %rsi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	leaq	b(,%rbx,8), %rsi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movq	n(%rip), %rax
	subq	$1, 0(%rbp)
	addq	$8, %rbp
	subq	$1, b(,%rbx,8)
	addq	$1, %rbx
	subq	$1, %rax
	cmpq	%rax, %rbx
	jb	.L190
.L191:
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
.LFE33:
	.size	main, .-main
	.globl	dp
	.bss
	.align 32
	.type	dp, @object
	.size	dp, 8388608
dp:
	.zero	8388608
	.globl	gin
	.align 32
	.type	gin, @object
	.size	gin, 8388608
gin:
	.zero	8388608
	.globl	tup
	.align 32
	.type	tup, @object
	.size	tup, 25165944
tup:
	.zero	25165944
	.globl	xy
	.align 32
	.type	xy, @object
	.size	xy, 16777296
xy:
	.zero	16777296
	.globl	u
	.align 32
	.type	u, @object
	.size	u, 1048577
u:
	.zero	1048577
	.globl	t
	.align 32
	.type	t, @object
	.size	t, 1048577
t:
	.zero	1048577
	.globl	s
	.align 32
	.type	s, @object
	.size	s, 1048577
s:
	.zero	1048577
	.globl	e
	.align 32
	.type	e, @object
	.size	e, 8388608
e:
	.zero	8388608
	.globl	d
	.align 32
	.type	d, @object
	.size	d, 8388648
d:
	.zero	8388648
	.globl	c
	.align 32
	.type	c, @object
	.size	c, 8388648
c:
	.zero	8388648
	.globl	b
	.align 32
	.type	b, @object
	.size	b, 8388648
b:
	.zero	8388648
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 8388648
a:
	.zero	8388648
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
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
