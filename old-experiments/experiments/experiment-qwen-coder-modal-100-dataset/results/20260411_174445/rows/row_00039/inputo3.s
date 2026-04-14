	.file	"inputC.c"
	.text
	.p2align 4
	.globl	pintcomp
	.type	pintcomp, @function
pintcomp:
.LFB21:
	.cfi_startproc
	movl	(%rsi), %eax
	cmpl	%eax, (%rdi)
	movl	$-1, %edx
	setg	%al
	movzbl	%al, %eax
	cmovl	%edx, %eax
	ret
	.cfi_endproc
.LFE21:
	.size	pintcomp, .-pintcomp
	.p2align 4
	.globl	swap_adj
	.type	swap_adj, @function
swap_adj:
.LFB8:
	.cfi_startproc
	movq	(%rdi), %rdx
	movq	(%rsi), %rax
	cmpq	%rax, %rdx
	je	.L5
	movq	%rdx, (%rsi)
	movq	%rax, (%rdi)
.L5:
	ret
	.cfi_endproc
.LFE8:
	.size	swap_adj, .-swap_adj
	.p2align 4
	.globl	divide
	.type	divide, @function
divide:
.LFB9:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$30, %r8d
	movq	%rdi, %rbx
	movl	$1, %ecx
	movabsq	$-8543223828751151131, %r11
	movl	$1000000005, %edi
	.p2align 4,,10
	.p2align 3
.L9:
	testb	$1, %dil
	je	.L8
	imulq	%rsi, %rcx
	movq	%rcx, %rax
	mulq	%r11
	shrq	$29, %rdx
	imulq	$1000000007, %rdx, %rax
	subq	%rax, %rcx
.L8:
	imulq	%rsi, %rsi
	shrq	%rdi
	movq	%rsi, %rax
	movq	%rsi, %r9
	mulq	%r11
	movq	%rdx, %rsi
	shrq	$29, %rsi
	imulq	$1000000007, %rsi, %r10
	movq	%r9, %rsi
	subq	%r10, %rsi
	subl	$1, %r8d
	jne	.L9
	imulq	%rcx, %rbx
	movq	%rbx, %rax
	mulq	%r11
	movq	%rdx, %rax
	shrq	$29, %rax
	imulq	$1000000007, %rax, %rdx
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	subq	%rdx, %rax
	ret
	.cfi_endproc
.LFE9:
	.size	divide, .-divide
	.p2align 4
	.globl	digits
	.type	digits, @function
digits:
.LFB10:
	.cfi_startproc
	movq	%rdi, %rdx
	movl	$1, %esi
	cmpq	$9, %rdi
	jbe	.L15
	movabsq	$-3689348814741910323, %rdi
	.p2align 4,,10
	.p2align 3
.L17:
	movq	%rdx, %rax
	movq	%rdx, %rcx
	addl	$1, %esi
	mulq	%rdi
	shrq	$3, %rdx
	cmpq	$99, %rcx
	ja	.L17
.L15:
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE10:
	.size	digits, .-digits
	.p2align 4
	.globl	umin
	.type	umin, @function
umin:
.LFB11:
	.cfi_startproc
	cmpq	%rdi, %rsi
	movq	%rdi, %rax
	cmovbe	%rsi, %rax
	ret
	.cfi_endproc
.LFE11:
	.size	umin, .-umin
	.p2align 4
	.globl	umax
	.type	umax, @function
umax:
.LFB12:
	.cfi_startproc
	cmpq	%rdi, %rsi
	movq	%rdi, %rax
	cmovnb	%rsi, %rax
	ret
	.cfi_endproc
.LFE12:
	.size	umax, .-umax
	.p2align 4
	.globl	smin
	.type	smin, @function
smin:
.LFB13:
	.cfi_startproc
	cmpq	%rdi, %rsi
	movq	%rdi, %rax
	cmovle	%rsi, %rax
	ret
	.cfi_endproc
.LFE13:
	.size	smin, .-smin
	.p2align 4
	.globl	smax
	.type	smax, @function
smax:
.LFB14:
	.cfi_startproc
	cmpq	%rdi, %rsi
	movq	%rdi, %rax
	cmovge	%rsi, %rax
	ret
	.cfi_endproc
.LFE14:
	.size	smax, .-smax
	.p2align 4
	.globl	gcd
	.type	gcd, @function
gcd:
.LFB15:
	.cfi_startproc
	movq	%rdi, %rdx
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L29:
	xorl	%edx, %edx
	divq	%rsi
.L26:
	movq	%rdx, %rax
	movq	%rsi, %rdx
	movq	%rax, %rsi
.L25:
	cmpq	%rsi, %rdx
	jb	.L26
	movq	%rdx, %rax
	testq	%rsi, %rsi
	jne	.L29
	ret
	.cfi_endproc
.LFE15:
	.size	gcd, .-gcd
	.p2align 4
	.globl	bitpow
	.type	bitpow, @function
bitpow:
.LFB16:
	.cfi_startproc
	movq	%rdx, %rcx
	movl	$1, %r8d
	testq	%rsi, %rsi
	je	.L30
	.p2align 4,,10
	.p2align 3
.L33:
	testb	$1, %sil
	je	.L32
	movq	%r8, %rax
	xorl	%edx, %edx
	imulq	%rdi, %rax
	divq	%rcx
	movq	%rdx, %r8
.L32:
	imulq	%rdi, %rdi
	xorl	%edx, %edx
	movq	%rdi, %rax
	divq	%rcx
	shrq	%rsi
	movq	%rdx, %rdi
	jne	.L33
.L30:
	movq	%r8, %rax
	ret
	.cfi_endproc
.LFE16:
	.size	bitpow, .-bitpow
	.p2align 4
	.globl	targetdig
	.type	targetdig, @function
targetdig:
.LFB17:
	.cfi_startproc
	cmpq	$9, %rdi
	jbe	.L45
	movq	%rdi, %rdx
	movl	$1, %ecx
	movabsq	$-3689348814741910323, %r9
	.p2align 4,,10
	.p2align 3
.L41:
	movq	%rdx, %rax
	movq	%rdx, %r8
	addl	$1, %ecx
	mulq	%r9
	shrq	$3, %rdx
	cmpq	$99, %r8
	ja	.L41
.L40:
	cmpl	%ecx, %esi
	jg	.L46
	jge	.L43
	movabsq	$-3689348814741910323, %r8
	.p2align 4,,10
	.p2align 3
.L44:
	movq	%rdi, %rax
	subl	$1, %ecx
	mulq	%r8
	movq	%rdx, %rdi
	shrq	$3, %rdi
	cmpl	%ecx, %esi
	jne	.L44
.L43:
	movabsq	$-3689348814741910323, %rax
	mulq	%rdi
	movl	%edi, %eax
	shrq	$3, %rdx
	leaq	(%rdx,%rdx,4), %rdx
	addq	%rdx, %rdx
	subl	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L45:
	movl	$1, %ecx
	jmp	.L40
.L46:
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE17:
	.size	targetdig, .-targetdig
	.p2align 4
	.globl	charcomp
	.type	charcomp, @function
charcomp:
.LFB18:
	.cfi_startproc
	xorl	%eax, %eax
	cmpb	%sil, %dil
	movl	$-1, %edx
	setg	%al
	cmovl	%edx, %eax
	ret
	.cfi_endproc
.LFE18:
	.size	charcomp, .-charcomp
	.p2align 4
	.globl	pcharcomp
	.type	pcharcomp, @function
pcharcomp:
.LFB19:
	.cfi_startproc
	movzbl	(%rsi), %eax
	cmpb	%al, (%rdi)
	movl	$-1, %edx
	setg	%al
	movzbl	%al, %eax
	cmovl	%edx, %eax
	ret
	.cfi_endproc
.LFE19:
	.size	pcharcomp, .-pcharcomp
	.p2align 4
	.globl	intcomp
	.type	intcomp, @function
intcomp:
.LFB20:
	.cfi_startproc
	xorl	%eax, %eax
	cmpl	%esi, %edi
	movl	$-1, %edx
	setg	%al
	cmovl	%edx, %eax
	ret
	.cfi_endproc
.LFE20:
	.size	intcomp, .-intcomp
	.p2align 4
	.globl	ullcomp
	.type	ullcomp, @function
ullcomp:
.LFB22:
	.cfi_startproc
	movl	$-1, %eax
	cmpq	%rsi, %rdi
	jb	.L58
	xorl	%eax, %eax
	cmpq	%rdi, %rsi
	setb	%al
.L58:
	ret
	.cfi_endproc
.LFE22:
	.size	ullcomp, .-ullcomp
	.p2align 4
	.globl	pullcomp
	.type	pullcomp, @function
pullcomp:
.LFB23:
	.cfi_startproc
	movq	(%rdi), %rdx
	movq	(%rsi), %rcx
	movl	$-1, %eax
	cmpq	%rcx, %rdx
	jb	.L61
	xorl	%eax, %eax
	cmpq	%rdx, %rcx
	setb	%al
.L61:
	ret
	.cfi_endproc
.LFE23:
	.size	pullcomp, .-pullcomp
	.p2align 4
	.globl	sllcomp
	.type	sllcomp, @function
sllcomp:
.LFB24:
	.cfi_startproc
	xorl	%eax, %eax
	cmpq	%rsi, %rdi
	movl	$-1, %edx
	setg	%al
	cmovl	%edx, %eax
	ret
	.cfi_endproc
.LFE24:
	.size	sllcomp, .-sllcomp
	.p2align 4
	.globl	psllcomp
	.type	psllcomp, @function
psllcomp:
.LFB25:
	.cfi_startproc
	movq	(%rsi), %rcx
	movq	(%rdi), %rdx
	movl	$-1, %eax
	cmpq	%rcx, %rdx
	jb	.L67
	xorl	%eax, %eax
	cmpq	%rdx, %rcx
	setb	%al
.L67:
	ret
	.cfi_endproc
.LFE25:
	.size	psllcomp, .-psllcomp
	.p2align 4
	.globl	hwllfraccomp
	.type	hwllfraccomp, @function
hwllfraccomp:
.LFB26:
	.cfi_startproc
	imulq	%rdx, %rsi
	movl	$-1, %eax
	imulq	%rcx, %rdi
	cmpq	%rsi, %rdi
	jb	.L70
	xorl	%eax, %eax
	cmpq	%rdi, %rsi
	setb	%al
.L70:
	ret
	.cfi_endproc
.LFE26:
	.size	hwllfraccomp, .-hwllfraccomp
	.p2align 4
	.globl	phwAcomp
	.type	phwAcomp, @function
phwAcomp:
.LFB27:
	.cfi_startproc
	movl	(%rdi), %eax
	cmpl	%eax, (%rsi)
	movl	$-1, %edx
	setl	%al
	movzbl	%al, %eax
	cmovg	%edx, %eax
	ret
	.cfi_endproc
.LFE27:
	.size	phwAcomp, .-phwAcomp
	.p2align 4
	.globl	phwBcomp
	.type	phwBcomp, @function
phwBcomp:
.LFB28:
	.cfi_startproc
	movl	4(%rdi), %eax
	cmpl	%eax, 4(%rsi)
	movl	$-1, %edx
	setl	%al
	movzbl	%al, %eax
	cmovg	%edx, %eax
	ret
	.cfi_endproc
.LFE28:
	.size	phwBcomp, .-phwBcomp
	.p2align 4
	.globl	phwABcomp
	.type	phwABcomp, @function
phwABcomp:
.LFB29:
	.cfi_startproc
	movl	(%rsi), %ecx
	movl	$-1, %eax
	cmpl	%ecx, (%rdi)
	jl	.L79
	movl	$1, %eax
	jle	.L84
.L79:
	ret
	.p2align 4,,10
	.p2align 3
.L84:
	movl	4(%rdi), %eax
	cmpl	%eax, 4(%rsi)
	movl	$-1, %edx
	setl	%al
	movzbl	%al, %eax
	cmovg	%edx, %eax
	ret
	.cfi_endproc
.LFE29:
	.size	phwABcomp, .-phwABcomp
	.p2align 4
	.globl	phwllAcomp
	.type	phwllAcomp, @function
phwllAcomp:
.LFB30:
	.cfi_startproc
	movq	(%rdi), %rax
	cmpq	%rax, (%rsi)
	movl	$-1, %edx
	setl	%al
	movzbl	%al, %eax
	cmovg	%edx, %eax
	ret
	.cfi_endproc
.LFE30:
	.size	phwllAcomp, .-phwllAcomp
	.p2align 4
	.globl	phwllBcomp
	.type	phwllBcomp, @function
phwllBcomp:
.LFB31:
	.cfi_startproc
	movq	8(%rdi), %rax
	cmpq	%rax, 8(%rsi)
	movl	$-1, %edx
	setl	%al
	movzbl	%al, %eax
	cmovg	%edx, %eax
	ret
	.cfi_endproc
.LFE31:
	.size	phwllBcomp, .-phwllBcomp
	.p2align 4
	.globl	phwllABcomp
	.type	phwllABcomp, @function
phwllABcomp:
.LFB32:
	.cfi_startproc
	movq	(%rsi), %rcx
	movl	$-1, %eax
	cmpq	%rcx, (%rdi)
	jl	.L91
	movl	$1, %eax
	jle	.L96
.L91:
	ret
	.p2align 4,,10
	.p2align 3
.L96:
	movq	8(%rdi), %rax
	cmpq	%rax, 8(%rsi)
	movl	$-1, %edx
	setl	%al
	movzbl	%al, %eax
	cmovg	%edx, %eax
	ret
	.cfi_endproc
.LFE32:
	.size	phwllABcomp, .-phwllABcomp
	.p2align 4
	.globl	phwllrAcBcomp
	.type	phwllrAcBcomp, @function
phwllrAcBcomp:
.LFB33:
	.cfi_startproc
	movq	(%rsi), %rcx
	movl	$1, %eax
	cmpq	%rcx, (%rdi)
	jl	.L97
	movl	$-1, %eax
	jle	.L102
.L97:
	ret
	.p2align 4,,10
	.p2align 3
.L102:
	movq	8(%rdi), %rdx
	cmpq	%rdx, 8(%rsi)
	setl	%dl
	movzbl	%dl, %edx
	cmovle	%edx, %eax
	ret
	.cfi_endproc
.LFE33:
	.size	phwllrAcBcomp, .-phwllrAcBcomp
	.p2align 4
	.globl	phwllBAcomp
	.type	phwllBAcomp, @function
phwllBAcomp:
.LFB34:
	.cfi_startproc
	movq	8(%rsi), %rcx
	movl	$-1, %eax
	cmpq	%rcx, 8(%rdi)
	jl	.L103
	movl	$1, %eax
	jle	.L108
.L103:
	ret
	.p2align 4,,10
	.p2align 3
.L108:
	movq	(%rdi), %rax
	cmpq	%rax, (%rsi)
	movl	$-1, %edx
	setl	%al
	movzbl	%al, %eax
	cmovg	%edx, %eax
	ret
	.cfi_endproc
.LFE34:
	.size	phwllBAcomp, .-phwllBAcomp
	.p2align 4
	.globl	pstrAcomp
	.type	pstrAcomp, @function
pstrAcomp:
.LFB35:
	.cfi_startproc
	movq	8(%rsi), %rcx
	movq	8(%rdi), %rdx
	movl	$-1, %eax
	cmpq	%rcx, %rdx
	jb	.L109
	movl	$1, %eax
	cmpq	%rdx, %rcx
	jb	.L109
	movq	(%rsi), %rcx
	movq	(%rdi), %rdx
	movl	$-1, %eax
	cmpq	%rcx, %rdx
	jb	.L109
	movl	$1, %eax
	cmpq	%rdx, %rcx
	jnb	.L116
.L109:
	ret
	.p2align 4,,10
	.p2align 3
.L116:
	movl	16(%rdi), %eax
	cmpl	%eax, 16(%rsi)
	movl	$-1, %edx
	setl	%al
	movzbl	%al, %eax
	cmovg	%edx, %eax
	ret
	.cfi_endproc
.LFE35:
	.size	pstrAcomp, .-pstrAcomp
	.p2align 4
	.globl	bitlet
	.type	bitlet, @function
bitlet:
.LFB36:
	.cfi_startproc
	leal	-97(%rdi), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	ret
	.cfi_endproc
.LFE36:
	.size	bitlet, .-bitlet
	.p2align 4
	.globl	ullabs
	.type	ullabs, @function
ullabs:
.LFB37:
	.cfi_startproc
	movq	%rdi, %rdx
	movq	%rsi, %rax
	subq	%rsi, %rdx
	subq	%rdi, %rax
	cmpq	%rsi, %rdi
	cmovnb	%rdx, %rax
	ret
	.cfi_endproc
.LFE37:
	.size	ullabs, .-ullabs
	.p2align 4
	.globl	sllabs
	.type	sllabs, @function
sllabs:
.LFB38:
	.cfi_startproc
	movq	%rdi, %rdx
	movq	%rsi, %rax
	subq	%rsi, %rdx
	subq	%rdi, %rax
	cmpq	%rsi, %rdi
	cmovge	%rdx, %rax
	ret
	.cfi_endproc
.LFE38:
	.size	sllabs, .-sllabs
	.p2align 4
	.globl	nibutanlobo
	.type	nibutanlobo, @function
nibutanlobo:
.LFB39:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L129:
	leaq	0(%rbp,%r12), %rax
	movq	%rax, %rbx
	shrq	$63, %rbx
	addq	%rax, %rbx
	sarq	%rbx
	movq	%rbx, %rdi
	call	*%r13
	testb	%al, %al
	cmovne	%rbx, %rbp
	cmove	%rbx, %r12
.L125:
	movq	%rbp, %rdx
	movq	%r12, %rax
	subq	%r12, %rdx
	subq	%rbp, %rax
	cmpq	%r12, %rbp
	cmovge	%rdx, %rax
	cmpq	$1, %rax
	jg	.L129
	movq	%rbp, %rdi
	call	*%r13
	movl	%eax, %edx
	leaq	(%rbp,%rbp), %rax
	subq	%r12, %rax
	testb	%dl, %dl
	cmove	%rax, %rbp
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	movq	%rbp, %rax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	nibutanlobo, .-nibutanlobo
	.p2align 4
	.globl	nextroute
	.type	nextroute, @function
nextroute:
.LFB40:
	.cfi_startproc
	leal	-1(%rsi), %eax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %r8
	testl	%eax, %eax
	jle	.L134
	movslq	%esi, %rcx
	salq	$2, %rcx
	movl	-4(%rdi,%rcx), %edx
	leaq	-8(%rdi,%rcx), %rcx
	jmp	.L135
	.p2align 4,,10
	.p2align 3
.L137:
	subq	$4, %rcx
	subl	$1, %eax
	je	.L144
.L135:
	movl	%edx, %edi
	movl	(%rcx), %edx
	cmpl	%edi, %edx
	jg	.L137
	movslq	%eax, %rdx
	movl	%esi, %ecx
	leaq	0(,%rdx,4), %r11
	leaq	-4(%r8,%r11), %rbx
	movl	(%rbx), %r9d
	cmpl	%eax, %esi
	jle	.L142
.L141:
	movl	%esi, %ecx
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L150:
	movslq	%ecx, %r10
	cmpl	(%r8,%r10,4), %edi
	cmovl	%edx, %ecx
.L139:
	addq	$1, %rdx
	cmpl	%edx, %esi
	jle	.L142
.L140:
	movl	(%r8,%rdx,4), %edi
	cmpl	%r9d, %edi
	jl	.L139
	cmpl	%ecx, %esi
	jne	.L150
	movl	%edx, %ecx
	addq	$1, %rdx
	cmpl	%edx, %esi
	jg	.L140
.L142:
	movslq	%ecx, %rcx
	subl	%eax, %esi
	leaq	(%r8,%r11), %rdi
	leaq	(%r8,%rcx,4), %rdx
	movslq	%esi, %rsi
	movl	$pintcomp, %ecx
	xorl	(%rdx), %r9d
	movl	%r9d, (%rbx)
	xorl	(%rdx), %r9d
	movl	%r9d, (%rdx)
	movl	$4, %edx
	xorl	%r9d, (%rbx)
	call	qsort
	movl	$1, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L144:
	.cfi_restore_state
	xorl	%eax, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L134:
	.cfi_restore_state
	je	.L144
	movslq	%eax, %rdx
	leaq	0(,%rdx,4), %r11
	leaq	-4(%rdi,%r11), %rbx
	movl	(%rbx), %r9d
	jmp	.L141
	.cfi_endproc
.LFE40:
	.size	nextroute, .-nextroute
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%llu."
.LC1:
	.string	"%1d"
.LC2:
	.string	""
	.text
	.p2align 4
	.globl	printUquotient
	.type	printUquotient, @function
printUquotient:
.LFB41:
	.cfi_startproc
	movq	%rdi, %rax
	xorl	%edx, %edx
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$.LC0, %edi
	divq	%rsi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rsi, %rbp
	movq	%rdx, %rbx
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf
	movq	%rbx, %rdx
	movl	$20, %ebx
	.p2align 4,,10
	.p2align 3
.L152:
	leaq	(%rdx,%rdx,4), %rax
	xorl	%edx, %edx
	movl	$.LC1, %edi
	addq	%rax, %rax
	divq	%rbp
	movq	%rdx, %r12
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf
	movq	%r12, %rdx
	subl	$1, %ebx
	jne	.L152
	popq	%rbx
	.cfi_def_cfa_offset 24
	movl	$.LC2, %edi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	puts
	.cfi_endproc
.LFE41:
	.size	printUquotient, .-printUquotient
	.p2align 4
	.globl	printSquotient
	.type	printSquotient, @function
printSquotient:
.LFB42:
	.cfi_startproc
	movq	%rdi, %rax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rsi, %r12
	imulq	%rsi, %rax
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	testq	%rax, %rax
	js	.L160
.L156:
	movq	%r12, %rbp
	movq	%rbx, %rax
	movl	$.LC0, %edi
	negq	%rbp
	cmovs	%r12, %rbp
	negq	%rax
	cmovs	%rbx, %rax
	xorl	%edx, %edx
	divq	%rbp
	movq	%rdx, %rbx
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf
	movq	%rbx, %rdx
	movl	$20, %ebx
	.p2align 4,,10
	.p2align 3
.L157:
	leaq	(%rdx,%rdx,4), %rax
	xorl	%edx, %edx
	movl	$.LC1, %edi
	addq	%rax, %rax
	divq	%rbp
	movq	%rdx, %r12
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf
	movq	%r12, %rdx
	subl	$1, %ebx
	jne	.L157
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$.LC2, %edi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	puts
	.p2align 4,,10
	.p2align 3
.L160:
	.cfi_restore_state
	movq	stdout(%rip), %rsi
	movl	$45, %edi
	call	putc
	jmp	.L156
	.cfi_endproc
.LFE42:
	.size	printSquotient, .-printSquotient
	.p2align 4
	.globl	bitcount
	.type	bitcount, @function
bitcount:
.LFB43:
	.cfi_startproc
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.L165
	.p2align 4,,10
	.p2align 3
.L164:
	movq	%rdi, %rdx
	andl	$1, %edx
	addl	%edx, %eax
	shrq	%rdi
	jne	.L164
	ret
	.p2align 4,,10
	.p2align 3
.L165:
	ret
	.cfi_endproc
.LFE43:
	.size	bitcount, .-bitcount
	.p2align 4
	.globl	distance
	.type	distance, @function
distance:
.LFB44:
	.cfi_startproc
	subq	%rdx, %rdi
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	subq	%rcx, %rsi
	imulq	%rdi, %rdi
	imulq	%rsi, %rsi
	cvtsi2sdq	%rdi, %xmm0
	cvtsi2sdq	%rsi, %xmm1
	addsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	ucomisd	%xmm0, %xmm1
	ja	.L177
	sqrtsd	%xmm0, %xmm0
	ret
.L177:
	jmp	sqrt
	.cfi_endproc
.LFE44:
	.size	distance, .-distance
	.p2align 4
	.globl	solve
	.type	solve, @function
solve:
.LFB45:
	.cfi_startproc
	movabsq	$5494767893316060486, %rax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movq	k(%rip), %r10
	movq	%rax, 7(%rsp)
	movb	$0, 15(%rsp)
	testq	%r10, %r10
	je	.L189
	movd	.LC4(%rip), %xmm0
	movq	%r10, %r9
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	movzwl	.LC5(%rip), %r11d
	movl	$1, %ebx
	movabsq	$-2049638230412172401, %rbp
	movabsq	$72340172838076673, %r12
	jmp	.L179
	.p2align 4,,10
	.p2align 3
.L216:
	leaq	6(%rsi), %rax
	movw	%r11w, s+4(%rsi)
	addq	$7, %rsi
	movd	%xmm0, s-7(%rsi)
	movb	$65, s(%rax)
.L181:
	andl	$1, %r9d
	je	.L188
	movb	$76, s(%rsi)
	addq	$1, %rsi
.L188:
	addq	$1, %r8
	movq	%r10, %r9
	movl	%r8d, %ecx
	shrq	%cl, %r9
	testq	%r9, %r9
	je	.L189
.L179:
	testq	%r8, %r8
	je	.L216
	leaq	-1(%r8), %rdi
	movq	%rdi, %rax
	movq	%rdi, %rcx
	mulq	%rbp
	movq	%rdx, %rax
	andq	$-8, %rdx
	shrq	$3, %rax
	addq	%rax, %rdx
	subq	%rdx, %rcx
	movl	%ebx, %edx
	sall	%cl, %edx
	cmpq	$53, %rdi
	ja	.L182
	movb	$65, s(%rsi)
	cmpq	$5, %rax
	je	.L183
	movb	$86, s+1(%rsi)
	cmpq	$4, %rax
	je	.L183
	movb	$73, s+2(%rsi)
	cmpq	$3, %rax
	je	.L183
	movb	$84, s+3(%rsi)
	cmpq	$2, %rax
	je	.L183
	movb	$83, s+4(%rsi)
	testq	%rax, %rax
	jne	.L183
	movb	$69, s+5(%rsi)
.L183:
	addq	$6, %rsi
	subq	%rax, %rsi
.L182:
	movzbl	7(%rsp,%rax), %eax
	leaq	s(%rsi), %rcx
	imulq	%r12, %rax
	cmpl	$8, %edx
	jnb	.L184
	testb	$4, %dl
	jne	.L217
	testl	%edx, %edx
	je	.L185
	movb	%al, (%rcx)
	testb	$2, %dl
	jne	.L218
.L185:
	subl	$1, %edx
	movslq	%edx, %rdx
	leaq	1(%rsi,%rdx), %rsi
	jmp	.L181
	.p2align 4,,10
	.p2align 3
.L184:
	movl	%edx, %edi
	movq	%rax, s(%rsi)
	movq	%rax, -8(%rcx,%rdi)
	leaq	8(%rcx), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rcx
	addl	%edx, %ecx
	shrl	$3, %ecx
	rep stosq
	jmp	.L185
	.p2align 4,,10
	.p2align 3
.L189:
	movl	$s, %edi
	call	puts
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L217:
	.cfi_restore_state
	movl	%edx, %edi
	movl	%eax, (%rcx)
	movl	%eax, -4(%rcx,%rdi)
	jmp	.L185
.L218:
	movl	%edx, %edi
	movw	%ax, -2(%rcx,%rdi)
	jmp	.L185
	.cfi_endproc
.LFE45:
	.size	solve, .-solve
	.section	.rodata.str1.1
.LC6:
	.string	"%llu"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB46:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$n, %edx
	movl	$k, %esi
	xorl	%eax, %eax
	movl	$.LC6, %edi
	call	__isoc99_scanf
	xorl	%eax, %eax
	call	solve
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE46:
	.size	main, .-main
	.globl	dp
	.bss
	.align 32
	.type	dp, @object
	.size	dp, 40000
dp:
	.zero	40000
	.globl	s
	.align 32
	.type	s, @object
	.size	s, 5001
s:
	.zero	5001
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 40000
a:
	.zero	40000
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
	.globl	tlen
	.align 8
	.type	tlen, @object
	.size	tlen, 8
tlen:
	.zero	8
	.globl	slen
	.align 8
	.type	slen, @object
	.size	slen, 8
slen:
	.zero	8
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
	.globl	vsf
	.align 8
	.type	vsf, @object
	.size	vsf, 8
vsf:
	.zero	8
	.globl	vse
	.align 8
	.type	vse, @object
	.size	vse, 8
vse:
	.zero	8
	.globl	vsd
	.align 8
	.type	vsd, @object
	.size	vsd, 8
vsd:
	.zero	8
	.globl	vsc
	.align 8
	.type	vsc, @object
	.size	vsc, 8
vsc:
	.zero	8
	.globl	vsb
	.align 8
	.type	vsb, @object
	.size	vsb, 8
vsb:
	.zero	8
	.globl	vsa
	.align 8
	.type	vsa, @object
	.size	vsa, 8
vsa:
	.zero	8
	.globl	vuf
	.align 8
	.type	vuf, @object
	.size	vuf, 8
vuf:
	.zero	8
	.globl	vue
	.align 8
	.type	vue, @object
	.size	vue, 8
vue:
	.zero	8
	.globl	vud
	.align 8
	.type	vud, @object
	.size	vud, 8
vud:
	.zero	8
	.globl	vuc
	.align 8
	.type	vuc, @object
	.size	vuc, 8
vuc:
	.zero	8
	.globl	vub
	.align 8
	.type	vub, @object
	.size	vub, 8
vub:
	.zero	8
	.globl	vua
	.align 8
	.type	vua, @object
	.size	vua, 8
vua:
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
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC4:
	.byte	70
	.byte	69
	.byte	83
	.byte	84
	.section	.rodata.cst2,"aM",@progbits,2
	.align 2
.LC5:
	.byte	73
	.byte	86
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
