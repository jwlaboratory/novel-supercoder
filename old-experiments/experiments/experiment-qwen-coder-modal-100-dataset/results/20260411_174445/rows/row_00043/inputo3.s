	.file	"inputC.c"
	.text
	.p2align 4
	.globl	upll
	.type	upll, @function
upll:
.LFB49:
	.cfi_startproc
	movq	(%rsi), %rax
	cmpq	%rax, (%rdi)
	movl	$-1, %edx
	setg	%al
	movzbl	%al, %eax
	cmovl	%edx, %eax
	ret
	.cfi_endproc
.LFE49:
	.size	upll, .-upll
	.p2align 4
	.globl	downll
	.type	downll, @function
downll:
.LFB50:
	.cfi_startproc
	movq	(%rsi), %rdx
	movl	$1, %eax
	cmpq	%rdx, (%rdi)
	jl	.L5
	setg	%al
	movzbl	%al, %eax
	negl	%eax
.L5:
	ret
	.cfi_endproc
.LFE50:
	.size	downll, .-downll
	.p2align 4
	.globl	cmp_char
	.type	cmp_char, @function
cmp_char:
.LFB52:
	.cfi_startproc
	movsbl	(%rdi), %eax
	movsbl	(%rsi), %edx
	subl	%edx, %eax
	ret
	.cfi_endproc
.LFE52:
	.size	cmp_char, .-cmp_char
	.p2align 4
	.globl	cmp1
	.type	cmp1, @function
cmp1:
.LFB59:
	.cfi_startproc
	movq	(%rdi), %rax
	subl	(%rsi), %eax
	ret
	.cfi_endproc
.LFE59:
	.size	cmp1, .-cmp1
	.p2align 4
	.globl	cmp2
	.type	cmp2, @function
cmp2:
.LFB60:
	.cfi_startproc
	movq	(%rsi), %rax
	subl	(%rdi), %eax
	ret
	.cfi_endproc
.LFE60:
	.size	cmp2, .-cmp2
	.p2align 4
	.globl	cmp_string
	.type	cmp_string, @function
cmp_string:
.LFB51:
	.cfi_startproc
	jmp	strcmp
	.cfi_endproc
.LFE51:
	.size	cmp_string, .-cmp_string
	.p2align 4
	.type	makeinv.part.0, @function
makeinv.part.0:
.LFB92:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdi, %r14
	movq	inv_arr(%rip), %rdi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rsi, %rbx
	movl	$16, %esi
	call	realloc
	movq	finv_arr(%rip), %rdi
	movl	$16, %esi
	movq	%rax, inv_arr(%rip)
	call	realloc
	movq	inv_arr(%rip), %rdi
	movdqa	.LC0(%rip), %xmm0
	movq	%rax, finv_arr(%rip)
	movq	$1, 8(%rdi)
	movups	%xmm0, (%rax)
	cmpq	$1, %r14
	jle	.L12
	leaq	1(%r14), %r12
	movl	$24, %ebp
	movl	$2, %r13d
	.p2align 4,,10
	.p2align 3
.L14:
	movq	%rbp, %rsi
	movq	%r13, %r14
	addq	$1, %r13
	call	realloc
	movq	finv_arr(%rip), %rdi
	movq	%rbp, %rsi
	movq	%rax, inv_arr(%rip)
	call	realloc
	movq	inv_arr(%rip), %rdi
	movq	%rax, finv_arr(%rip)
	movq	%rax, %rcx
	movq	%rbx, %rax
	cqto
	idivq	%r14
	imulq	(%rdi,%rdx,8), %rax
	cqto
	idivq	%rbx
	movq	%rbx, %rax
	subq	%rdx, %rax
	movq	%rax, -8(%rdi,%rbp)
	imulq	-16(%rcx,%rbp), %rax
	cqto
	idivq	%rbx
	movq	%rdx, -8(%rcx,%rbp)
	addq	$8, %rbp
	cmpq	%r13, %r12
	jne	.L14
.L12:
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
	.cfi_endproc
.LFE92:
	.size	makeinv.part.0, .-makeinv.part.0
	.p2align 4
	.type	graph_popHeap.constprop.0, @function
graph_popHeap.constprop.0:
.LFB97:
	.cfi_startproc
	movabsq	$4611686018427387904, %rax
	movq	%rax, heap+8(%rip)
	leaq	-1(%rdi), %rax
	movdqa	heap(%rip), %xmm2
	salq	$4, %rax
	movq	heap(%rax), %rcx
	movq	heap+8(%rax), %rdx
	movaps	%xmm2, heap(%rax)
	movq	%rcx, heap(%rip)
	movq	%rdx, heap+8(%rip)
	cmpq	$1, %rdi
	jle	.L29
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rsi
	movl	$1, %ecx
	xorl	%eax, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L32:
	movq	%rax, %r10
	salq	$5, %rdx
	movq	%rcx, %r9
	salq	$4, %r10
	movq	heap+8(%rdx), %r11
	salq	$4, %r9
	movq	heap+8(%r10), %rdi
	movq	heap+8(%r9), %r9
	cmpq	%rdi, %r11
	jge	.L22
	cmpq	%r9, %r11
	jge	.L22
	movq	heap(%rdx), %rcx
	movq	%r8, %rax
	movdqa	heap(%r10), %xmm1
	movaps	%xmm1, heap(%rdx)
	movq	%rcx, heap(%r10)
	leaq	1(%rax,%rax), %rcx
	movq	%r11, heap+8(%r10)
	cmpq	%rcx, %rsi
	jle	.L19
	.p2align 4,,10
	.p2align 3
.L20:
	leaq	1(%rax), %rdx
	leaq	(%rdx,%rdx), %r8
	cmpq	%r8, %rsi
	jg	.L32
	movq	%rax, %rdx
	salq	$4, %rdx
	movq	heap+8(%rdx), %rdi
	movq	%rcx, %rdx
	salq	$4, %rdx
	movq	heap+8(%rdx), %r9
.L22:
	cmpq	%r9, %rdi
	jle	.L19
	movq	%rcx, %rdx
	salq	$4, %rax
	salq	$4, %rdx
	movdqa	heap(%rax), %xmm0
	movq	heap(%rdx), %r8
	movq	heap+8(%rdx), %rdi
	movaps	%xmm0, heap(%rdx)
	movq	%r8, heap(%rax)
	movq	%rdi, heap+8(%rax)
	movq	%rcx, %rax
	leaq	1(%rax,%rax), %rcx
	cmpq	%rcx, %rsi
	jg	.L20
.L19:
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L29:
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE97:
	.size	graph_popHeap.constprop.0, .-graph_popHeap.constprop.0
	.p2align 4
	.globl	swap
	.type	swap, @function
swap:
.LFB10:
	.cfi_startproc
	movq	(%rsi), %rax
	movq	(%rdi), %rdx
	movq	%rdx, (%rsi)
	movq	%rax, (%rdi)
	ret
	.cfi_endproc
.LFE10:
	.size	swap, .-swap
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%lld"
	.text
	.p2align 4
	.globl	cin
	.type	cin, @function
cin:
.LFB11:
	.cfi_startproc
	movq	%rdi, %rsi
	xorl	%eax, %eax
	movl	$.LC1, %edi
	jmp	__isoc99_scanf
	.cfi_endproc
.LFE11:
	.size	cin, .-cin
	.p2align 4
	.globl	max2
	.type	max2, @function
max2:
.LFB12:
	.cfi_startproc
	cmpq	%rsi, %rdi
	movq	%rsi, %rax
	cmovge	%rdi, %rax
	ret
	.cfi_endproc
.LFE12:
	.size	max2, .-max2
	.p2align 4
	.globl	min2
	.type	min2, @function
min2:
.LFB13:
	.cfi_startproc
	cmpq	%rdi, %rsi
	movq	%rdi, %rax
	cmovle	%rsi, %rax
	ret
	.cfi_endproc
.LFE13:
	.size	min2, .-min2
	.p2align 4
	.globl	min3
	.type	min3, @function
min3:
.LFB14:
	.cfi_startproc
	cmpq	%rdx, %rsi
	movq	%rdi, %rax
	cmovg	%rdx, %rsi
	cmpq	%rdi, %rsi
	cmovle	%rsi, %rax
	ret
	.cfi_endproc
.LFE14:
	.size	min3, .-min3
	.p2align 4
	.globl	max3
	.type	max3, @function
max3:
.LFB15:
	.cfi_startproc
	cmpq	%rdx, %rsi
	movq	%rdi, %rax
	cmovl	%rdx, %rsi
	cmpq	%rdi, %rsi
	cmovge	%rsi, %rax
	ret
	.cfi_endproc
.LFE15:
	.size	max3, .-max3
	.p2align 4
	.globl	minn
	.type	minn, @function
minn:
.LFB16:
	.cfi_startproc
	movabsq	$4611686018427387904, %rax
	testq	%rdi, %rdi
	jle	.L39
	leaq	(%rsi,%rdi,8), %rcx
	andl	$1, %edi
	je	.L41
	movq	(%rsi), %rdx
	cmpq	%rdx, %rax
	cmovg	%rdx, %rax
	addq	$8, %rsi
	cmpq	%rsi, %rcx
	je	.L49
	.p2align 4,,10
	.p2align 3
.L41:
	movq	(%rsi), %rdx
	cmpq	%rdx, %rax
	cmovg	%rdx, %rax
	movq	8(%rsi), %rdx
	cmpq	%rdx, %rax
	cmovg	%rdx, %rax
	addq	$16, %rsi
	cmpq	%rsi, %rcx
	jne	.L41
.L39:
	ret
.L49:
	ret
	.cfi_endproc
.LFE16:
	.size	minn, .-minn
	.p2align 4
	.globl	maxn
	.type	maxn, @function
maxn:
.LFB17:
	.cfi_startproc
	movabsq	$-4611686018427387904, %rax
	testq	%rdi, %rdi
	jle	.L50
	leaq	(%rsi,%rdi,8), %rcx
	andl	$1, %edi
	je	.L52
	movq	(%rsi), %rdx
	cmpq	%rdx, %rax
	cmovl	%rdx, %rax
	addq	$8, %rsi
	cmpq	%rsi, %rcx
	je	.L60
	.p2align 4,,10
	.p2align 3
.L52:
	movq	(%rsi), %rdx
	cmpq	%rdx, %rax
	cmovl	%rdx, %rax
	movq	8(%rsi), %rdx
	cmpq	%rdx, %rax
	cmovl	%rdx, %rax
	addq	$16, %rsi
	cmpq	%rsi, %rcx
	jne	.L52
.L50:
	ret
.L60:
	ret
	.cfi_endproc
.LFE17:
	.size	maxn, .-maxn
	.p2align 4
	.globl	POW
	.type	POW, @function
POW:
.LFB18:
	.cfi_startproc
	testq	%rsi, %rsi
	jle	.L64
	xorl	%edx, %edx
	movl	$1, %eax
	testb	$1, %sil
	je	.L63
	movq	%rdi, %rax
	movl	$1, %edx
	cmpq	$1, %rsi
	je	.L71
	.p2align 4,,10
	.p2align 3
.L63:
	imulq	%rdi, %rax
	addq	$2, %rdx
	imulq	%rdi, %rax
	cmpq	%rdx, %rsi
	jne	.L63
	ret
	.p2align 4,,10
	.p2align 3
.L64:
	movl	$1, %eax
	ret
.L71:
	ret
	.cfi_endproc
.LFE18:
	.size	POW, .-POW
	.p2align 4
	.globl	POW_d
	.type	POW_d, @function
POW_d:
.LFB19:
	.cfi_startproc
	pxor	%xmm2, %xmm2
	xorl	%eax, %eax
	movapd	%xmm0, %xmm3
	movsd	.LC2(%rip), %xmm0
	comisd	%xmm2, %xmm1
	jbe	.L72
	.p2align 4,,10
	.p2align 3
.L75:
	mulsd	%xmm3, %xmm0
	addq	$1, %rax
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rax, %xmm2
	comisd	%xmm2, %xmm1
	ja	.L75
.L72:
	ret
	.cfi_endproc
.LFE19:
	.size	POW_d, .-POW_d
	.p2align 4
	.globl	gcd
	.type	gcd, @function
gcd:
.LFB20:
	.cfi_startproc
	movq	%rdi, %rax
	testq	%rsi, %rsi
	jne	.L82
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L84:
	movq	%rdx, %rsi
.L82:
	cqto
	idivq	%rsi
	movq	%rsi, %rax
	testq	%rdx, %rdx
	jne	.L84
	movq	%rsi, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	movq	%rdi, %rsi
	movq	%rsi, %rax
	ret
	.cfi_endproc
.LFE20:
	.size	gcd, .-gcd
	.p2align 4
	.globl	lcm
	.type	lcm, @function
lcm:
.LFB21:
	.cfi_startproc
	testq	%rsi, %rsi
	je	.L89
	movq	%rdi, %rax
	movq	%rsi, %rcx
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L90:
	movq	%rdx, %rcx
.L88:
	cqto
	idivq	%rcx
	movq	%rcx, %rax
	testq	%rdx, %rdx
	jne	.L90
	movq	%rdi, %rax
	cqto
	idivq	%rcx
	imulq	%rsi, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L89:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE21:
	.size	lcm, .-lcm
	.p2align 4
	.globl	mod_MOD1
	.type	mod_MOD1, @function
mod_MOD1:
.LFB22:
	.cfi_startproc
	movq	%rdi, %rcx
	testq	%rdi, %rdi
	jns	.L92
	movabsq	$-8543223828751151131, %rax
	imulq	%rdi
	movq	%rdi, %rax
	sarq	$63, %rax
	addq	%rdi, %rdx
	sarq	$29, %rdx
	subq	%rdx, %rax
	addq	$1, %rax
	imulq	$1000000007, %rax, %rax
	addq	%rax, %rcx
.L92:
	movabsq	$-8543223828751151131, %rax
	imulq	%rcx
	leaq	(%rdx,%rcx), %rax
	movq	%rcx, %rdx
	sarq	$63, %rdx
	sarq	$29, %rax
	subq	%rdx, %rax
	imulq	$1000000007, %rax, %rdx
	movq	%rcx, %rax
	subq	%rdx, %rax
	ret
	.cfi_endproc
.LFE22:
	.size	mod_MOD1, .-mod_MOD1
	.p2align 4
	.globl	mod_p
	.type	mod_p, @function
mod_p:
.LFB23:
	.cfi_startproc
	testq	%rdi, %rdi
	jns	.L94
	movq	%rdi, %rax
	negq	%rax
	cqto
	idivq	%rsi
	addq	$1, %rax
	imulq	%rsi, %rax
	addq	%rax, %rdi
.L94:
	movq	%rdi, %rax
	cqto
	idivq	%rsi
	movq	%rdx, %rax
	ret
	.cfi_endproc
.LFE23:
	.size	mod_p, .-mod_p
	.p2align 4
	.globl	change_into_num
	.type	change_into_num, @function
change_into_num:
.LFB24:
	.cfi_startproc
	movq	%rdx, %rcx
	testq	%rdx, %rdx
	je	.L101
	subq	%rdx, %rsi
	addq	%rdi, %rsi
	xorl	%edi, %edi
.L100:
	subq	$1, %rcx
	testq	%rcx, %rcx
	jle	.L97
	.p2align 4,,10
	.p2align 3
.L106:
	xorl	%edx, %edx
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L98:
	leaq	(%rax,%rax,4), %rax
	addq	$1, %rdx
	addq	%rax, %rax
	cmpq	%rdx, %rcx
	jne	.L98
	movsbl	(%rsi), %edx
	subq	$1, %rcx
	addq	$1, %rsi
	subl	$48, %edx
	movslq	%edx, %rdx
	imulq	%rdx, %rax
	addq	%rax, %rdi
	testq	%rcx, %rcx
	jg	.L106
.L97:
	movsbl	(%rsi), %eax
	subl	$48, %eax
	cltq
	addq	%rax, %rdi
	testq	%rcx, %rcx
	je	.L95
	addq	$1, %rsi
	jmp	.L100
.L101:
	xorl	%edi, %edi
.L95:
	movq	%rdi, %rax
	ret
	.cfi_endproc
.LFE24:
	.size	change_into_num, .-change_into_num
	.p2align 4
	.globl	digits
	.type	digits, @function
digits:
.LFB25:
	.cfi_startproc
	movq	%rdi, %rax
	cqto
	idivq	%rsi
	testq	%rax, %rax
	je	.L110
	movl	$1, %ecx
	.p2align 4,,10
	.p2align 3
.L109:
	cqto
	addq	$1, %rcx
	idivq	%rsi
	testq	%rax, %rax
	jne	.L109
	movq	%rcx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L110:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE25:
	.size	digits, .-digits
	.p2align 4
	.globl	base
	.type	base, @function
base:
.LFB26:
	.cfi_startproc
	movq	%rdi, %rax
	movq	%rdx, %rcx
	cmpq	$1, %rdx
	je	.L114
	.p2align 4,,10
	.p2align 3
.L113:
	cqto
	subq	$1, %rcx
	idivq	%rsi
	cmpq	$1, %rcx
	jne	.L113
.L114:
	cqto
	idivq	%rsi
	movq	%rdx, %rax
	ret
	.cfi_endproc
.LFE26:
	.size	base, .-base
	.p2align 4
	.globl	is_inArr1
	.type	is_inArr1, @function
is_inArr1:
.LFB27:
	.cfi_startproc
	movq	%rdi, %rax
	notq	%rax
	shrq	$63, %rax
	cmpq	%rsi, %rdi
	setl	%dl
	andq	%rdx, %rax
	ret
	.cfi_endproc
.LFE27:
	.size	is_inArr1, .-is_inArr1
	.p2align 4
	.globl	is_inArr2
	.type	is_inArr2, @function
is_inArr2:
.LFB28:
	.cfi_startproc
	testq	%rdi, %rdi
	js	.L123
	cmpq	%rdx, %rdi
	jge	.L123
	movq	%rsi, %rax
	notq	%rax
	shrq	$63, %rax
	cmpq	%rcx, %rsi
	setl	%dl
	andq	%rdx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L123:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE28:
	.size	is_inArr2, .-is_inArr2
	.p2align 4
	.globl	lr_lower
	.type	lr_lower, @function
lr_lower:
.LFB29:
	.cfi_startproc
	movq	%rdi, %r9
	movl	(%rsi), %edi
	addl	(%r9), %edi
	movl	%edi, %eax
	shrl	$31, %eax
	addl	%edi, %eax
	sarl	%eax
	cmpl	$2, %r8d
	jg	.L128
	cmpq	%rcx, %rdx
	jge	.L131
.L132:
	movl	%eax, (%r9)
	ret
	.p2align 4,,10
	.p2align 3
.L128:
	cmpq	%rcx, %rdx
	jle	.L132
.L131:
	movl	%eax, (%rsi)
	ret
	.cfi_endproc
.LFE29:
	.size	lr_lower, .-lr_lower
	.p2align 4
	.globl	lr_upper
	.type	lr_upper, @function
lr_upper:
.LFB30:
	.cfi_startproc
	movq	%rdi, %r9
	movl	(%rsi), %edi
	addl	(%r9), %edi
	movl	%edi, %eax
	shrl	$31, %eax
	addl	%edi, %eax
	sarl	%eax
	cmpl	$2, %r8d
	jg	.L134
	cmpq	%rcx, %rdx
	jg	.L137
.L138:
	movl	%eax, (%r9)
	ret
	.p2align 4,,10
	.p2align 3
.L134:
	cmpq	%rcx, %rdx
	jl	.L138
.L137:
	movl	%eax, (%rsi)
	ret
	.cfi_endproc
.LFE30:
	.size	lr_upper, .-lr_upper
	.p2align 4
	.globl	cmp_lower
	.type	cmp_lower, @function
cmp_lower:
.LFB31:
	.cfi_startproc
	cmpl	$1, %edx
	je	.L143
	xorl	%eax, %eax
	cmpq	%rsi, %rdi
	setg	%al
	cmpl	$2, %edx
	je	.L144
	ret
	.p2align 4,,10
	.p2align 3
.L144:
	xorl	%eax, %eax
	cmpq	%rsi, %rdi
	setge	%al
	ret
	.p2align 4,,10
	.p2align 3
.L143:
	xorl	%eax, %eax
	cmpq	%rsi, %rdi
	sete	%al
	ret
	.cfi_endproc
.LFE31:
	.size	cmp_lower, .-cmp_lower
	.p2align 4
	.globl	cmp_upper
	.type	cmp_upper, @function
cmp_upper:
.LFB32:
	.cfi_startproc
	cmpl	$1, %edx
	je	.L149
	xorl	%eax, %eax
	cmpq	%rsi, %rdi
	setl	%al
	cmpl	$2, %edx
	je	.L150
	ret
	.p2align 4,,10
	.p2align 3
.L150:
	xorl	%eax, %eax
	cmpq	%rsi, %rdi
	setle	%al
	ret
	.p2align 4,,10
	.p2align 3
.L149:
	xorl	%eax, %eax
	cmpq	%rsi, %rdi
	sete	%al
	ret
	.cfi_endproc
.LFE32:
	.size	cmp_upper, .-cmp_upper
	.p2align 4
	.globl	lower_bound
	.type	lower_bound, @function
lower_bound:
.LFB33:
	.cfi_startproc
	movslq	%esi, %rax
	movl	%edx, %esi
	movq	%rcx, %r9
	subl	%eax, %edx
	cmpl	$1, %edx
	jle	.L167
	cmpl	$2, %r8d
	jle	.L153
	.p2align 4,,10
	.p2align 3
.L158:
	leal	(%rsi,%rax), %ecx
	movl	%ecx, %edx
	shrl	$31, %edx
	addl	%ecx, %edx
	sarl	%edx
	movslq	%edx, %r8
	movq	%r8, %rcx
	cmpq	(%rdi,%r8,8), %r9
	jl	.L154
	movl	%esi, %eax
	subl	%r8d, %eax
	cmpl	$1, %eax
	jle	.L175
	movslq	%edx, %rax
	jmp	.L158
	.p2align 4,,10
	.p2align 3
.L159:
	movl	%edx, %esi
	subl	%eax, %esi
	cmpl	$1, %esi
	jle	.L152
	movl	%edx, %esi
.L153:
	leal	(%rsi,%rax), %ecx
	movl	%ecx, %edx
	shrl	$31, %edx
	addl	%ecx, %edx
	sarl	%edx
	movslq	%edx, %r10
	movq	%r10, %rcx
	cmpq	(%rdi,%r10,8), %r9
	jle	.L159
	movl	%esi, %eax
	subl	%r10d, %eax
	cmpl	$1, %eax
	jle	.L176
	movslq	%edx, %rax
	jmp	.L153
	.p2align 4,,10
	.p2align 3
.L154:
	movl	%edx, %esi
	subl	%eax, %esi
	cmpl	$1, %esi
	jle	.L157
	movl	%edx, %esi
	jmp	.L158
	.p2align 4,,10
	.p2align 3
.L176:
	movslq	%r10d, %rax
	movl	%esi, %ecx
.L152:
	movq	(%rdi,%rax,8), %rdx
	cmpl	$1, %r8d
	jne	.L162
.L177:
	cmpq	%r9, %rdx
	je	.L151
	movslq	%ecx, %rax
	cmpq	(%rdi,%rax,8), %r9
	jne	.L173
.L151:
	ret
	.p2align 4,,10
	.p2align 3
.L162:
	cmpl	$2, %r8d
	jne	.L166
	cmpq	%r9, %rdx
	jge	.L151
	movslq	%ecx, %rax
	cmpq	(%rdi,%rax,8), %r9
	jle	.L151
.L173:
	movq	$-1, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L157:
	movq	(%rdi,%rax,8), %rdx
.L166:
	cmpq	%r9, %rdx
	jg	.L151
	movslq	%ecx, %rax
	cmpq	%r9, (%rdi,%rax,8)
	jle	.L173
.L174:
	ret
	.p2align 4,,10
	.p2align 3
.L175:
	movl	%esi, %ecx
	movslq	%ecx, %rax
	cmpq	%r9, (%rdi,%rax,8)
	jg	.L174
	jmp	.L173
	.p2align 4,,10
	.p2align 3
.L167:
	movq	(%rdi,%rax,8), %rdx
	movl	%esi, %ecx
	cmpl	$1, %r8d
	je	.L177
	jmp	.L162
	.cfi_endproc
.LFE33:
	.size	lower_bound, .-lower_bound
	.p2align 4
	.globl	upper_bound
	.type	upper_bound, @function
upper_bound:
.LFB34:
	.cfi_startproc
	movl	%edx, %eax
	subl	%esi, %eax
	cmpl	$1, %eax
	jle	.L194
	cmpl	$2, %r8d
	jle	.L180
	.p2align 4,,10
	.p2align 3
.L185:
	leal	(%rdx,%rsi), %r8d
	movl	%r8d, %eax
	shrl	$31, %eax
	addl	%r8d, %eax
	sarl	%eax
	movslq	%eax, %r8
	cmpq	(%rdi,%r8,8), %rcx
	jle	.L181
	movl	%edx, %esi
	subl	%eax, %esi
	cmpl	$1, %esi
	jle	.L204
	movl	%eax, %esi
	jmp	.L185
	.p2align 4,,10
	.p2align 3
.L186:
	movl	%eax, %edx
	subl	%esi, %edx
	cmpl	$1, %edx
	jle	.L179
	movl	%eax, %edx
.L180:
	leal	(%rdx,%rsi), %r9d
	movl	%r9d, %eax
	shrl	$31, %eax
	addl	%r9d, %eax
	sarl	%eax
	movslq	%eax, %r10
	movq	%r10, %r9
	cmpq	(%rdi,%r10,8), %rcx
	jl	.L186
	movl	%edx, %esi
	subl	%r10d, %esi
	cmpl	$1, %esi
	jle	.L205
	movl	%eax, %esi
	jmp	.L180
	.p2align 4,,10
	.p2align 3
.L181:
	movl	%eax, %edx
	subl	%esi, %edx
	cmpl	$1, %edx
	jle	.L184
	movl	%eax, %edx
	jmp	.L185
	.p2align 4,,10
	.p2align 3
.L205:
	movl	%r10d, %esi
	movl	%edx, %r9d
.L179:
	movslq	%r9d, %rax
	movq	(%rdi,%rax,8), %r10
	cmpl	$1, %r8d
	jne	.L189
.L206:
	cmpq	%rcx, %r10
	je	.L178
	movslq	%esi, %rax
	cmpq	(%rdi,%rax,8), %rcx
	jne	.L202
.L178:
	ret
	.p2align 4,,10
	.p2align 3
.L189:
	cmpl	$2, %r8d
	jne	.L193
	cmpq	%rcx, %r10
	jle	.L178
	movslq	%esi, %rax
	cmpq	(%rdi,%rax,8), %rcx
	jge	.L178
.L202:
	movq	$-1, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L184:
	movslq	%esi, %rax
	cmpq	%rcx, (%rdi,%rax,8)
	jge	.L202
	ret
	.p2align 4,,10
	.p2align 3
.L204:
	movslq	%edx, %rsi
	movl	%edx, %r9d
	movq	(%rdi,%rsi,8), %r10
	movl	%eax, %esi
.L193:
	cmpq	%rcx, %r10
	jge	.L184
	movslq	%r9d, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L194:
	movl	%edx, %r9d
	movslq	%r9d, %rax
	movq	(%rdi,%rax,8), %r10
	cmpl	$1, %r8d
	je	.L206
	jmp	.L189
	.cfi_endproc
.LFE34:
	.size	upper_bound, .-upper_bound
	.p2align 4
	.globl	count
	.type	count, @function
count:
.LFB35:
	.cfi_startproc
	movl	%edx, %r9d
	movq	%rcx, %rdx
	movl	%r9d, %ecx
	jmp	.L209
	.p2align 4,,10
	.p2align 3
.L210:
	leal	(%rcx,%rsi), %r8d
	movl	%r8d, %eax
	shrl	$31, %eax
	addl	%r8d, %eax
	sarl	%eax
	movslq	%eax, %r8
	cmpq	(%rdi,%r8,8), %rdx
	cmovle	%eax, %ecx
	cmovg	%eax, %esi
.L209:
	movl	%ecx, %eax
	subl	%esi, %eax
	cmpl	$1, %eax
	jg	.L210
	movslq	%esi, %r8
	cmpq	(%rdi,%r8,8), %rdx
	je	.L213
	movslq	%ecx, %r8
	cmpq	(%rdi,%r8,8), %rdx
	jne	.L220
	movl	%ecx, %esi
.L213:
	cmpq	$-1, %r8
	jne	.L215
.L220:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L216:
	leal	(%r9,%rsi), %ecx
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
	movslq	%eax, %rcx
	cmpq	(%rdi,%rcx,8), %rdx
	cmovl	%eax, %r9d
	cmovge	%eax, %esi
.L215:
	movl	%r9d, %eax
	subl	%esi, %eax
	cmpl	$1, %eax
	jg	.L216
	movslq	%r9d, %rax
	cmpq	(%rdi,%rax,8), %rdx
	je	.L218
	movslq	%esi, %rsi
	movq	$-1, %rax
	cmpq	(%rdi,%rsi,8), %rdx
	cmove	%rsi, %rax
.L218:
	subq	%r8, %rax
	addq	$1, %rax
	ret
	.cfi_endproc
.LFE35:
	.size	count, .-count
	.p2align 4
	.globl	factor_pre
	.type	factor_pre, @function
factor_pre:
.LFB36:
	.cfi_startproc
	movq	is_factor_prepared(%rip), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, is_factor_prepared(%rip)
	testq	%rax, %rax
	je	.L244
	xorl	%eax, %eax
	ret
.L244:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$3, %edx
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$4000024, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	leaq	7(%rsp), %rbx
	movq	%rbx, %rax
	andq	$-8, %rbx
	shrq	$3, %rax
	movq	$2, 0(,%rax,8)
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L226:
	movq	%rdx, (%rbx,%rax,8)
	addq	$1, %rax
	addq	$2, %rdx
	cmpq	$500001, %rax
	jne	.L226
	movl	$3, %edi
	movl	$500001, %r9d
	jmp	.L230
	.p2align 4,,10
	.p2align 3
.L227:
	addq	$2, %rdi
	cmpq	$1000003, %rdi
	je	.L245
.L230:
	cmpq	$0, -4(%rbx,%rdi,4)
	je	.L227
	movq	%r9, %rax
	cqto
	idivq	%rdi
	cmpq	$2, %rax
	jle	.L227
	leaq	(%rdi,%rdi), %r8
	movl	$3, %ecx
	leaq	(%r8,%rdi), %rdx
	.p2align 4,,10
	.p2align 3
.L229:
	cmpq	$500000, %rdx
	jg	.L228
	leaq	-1(%rdx), %rsi
	sarq	%rsi
	movq	$0, (%rbx,%rsi,8)
.L228:
	addq	$2, %rcx
	addq	%r8, %rdx
	cmpq	%rax, %rcx
	jle	.L229
	addq	$2, %rdi
	cmpq	$1000003, %rdi
	jne	.L230
.L245:
	leaq	4000008(%rbx), %r13
	jmp	.L232
	.p2align 4,,10
	.p2align 3
.L231:
	addq	$8, %rbx
	cmpq	%rbx, %r13
	je	.L246
.L232:
	movq	(%rbx), %r12
	testq	%r12, %r12
	je	.L231
	movq	fac_cnt(%rip), %rax
	movq	factors(%rip), %rdi
	addq	$8, %rbx
	leaq	8(,%rax,8), %rsi
	call	realloc
	movq	fac_cnt(%rip), %rdx
	movq	factors+8(%rip), %rdi
	movq	%rax, factors(%rip)
	movq	%r12, (%rax,%rdx,8)
	movq	fac_cnt(%rip), %rax
	leaq	8(,%rax,8), %rsi
	call	realloc
	movq	fac_cnt(%rip), %rdx
	movq	%rax, factors+8(%rip)
	leaq	1(%rdx), %rcx
	movq	%rcx, fac_cnt(%rip)
	movq	$0, (%rax,%rdx,8)
	cmpq	%rbx, %r13
	jne	.L232
.L246:
	leaq	-24(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	factor_pre, .-factor_pre
	.p2align 4
	.globl	factor
	.type	factor, @function
factor:
.LFB37:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%eax, %eax
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	factor_pre
	cmpq	$0, fac_cnt(%rip)
	jle	.L247
	movq	factors(%rip), %r9
	movq	factors+8(%rip), %r10
	xorl	%r8d, %r8d
	jmp	.L249
	.p2align 4,,10
	.p2align 3
.L264:
	addq	$1, %r8
	cmpq	%r8, fac_cnt(%rip)
	jle	.L247
.L249:
	movq	(%r9,%r8,8), %rdi
	xorl	%ecx, %ecx
.L253:
	movq	%rbp, %rax
	cqto
	idivq	%rdi
	cmpq	$1, %rdx
	adcq	$0, %rcx
	testq	%rcx, %rcx
	je	.L252
	cqto
	movq	%rax, %rbp
	idivq	%rdi
	testq	%rdx, %rdx
	je	.L253
.L252:
	cmpq	$1, %rbx
	je	.L250
	movq	(%r10,%r8,8), %rax
	cmpq	%rax, %rcx
	movq	%rax, %rdx
	cmovge	%rcx, %rdx
	addq	%rax, %rcx
	cmpq	$2, %rbx
	cmove	%rdx, %rcx
.L250:
	movq	%rcx, (%r10,%r8,8)
	cmpq	%rbp, (%r9,%r8,8)
	jle	.L264
.L247:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE37:
	.size	factor, .-factor
	.p2align 4
	.globl	judge_prime
	.type	judge_prime, @function
judge_prime:
.LFB38:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	movq	%rdi, %rbx
	call	factor_pre
	movq	fac_cnt(%rip), %rdi
	testq	%rdi, %rdi
	jle	.L266
	movq	factors(%rip), %r8
	movq	(%r8), %rcx
	movq	%rcx, %rax
	imulq	%rcx, %rax
	cmpq	%rax, %rbx
	jl	.L266
	cmpq	%rcx, %rbx
	je	.L266
	xorl	%esi, %esi
	movl	$1, %r9d
	jmp	.L267
	.p2align 4,,10
	.p2align 3
.L269:
	movq	(%r8,%rsi,8), %rcx
	movq	%rcx, %rax
	imulq	%rcx, %rax
	cmpq	%rbx, %rax
	jg	.L266
	cmpq	%rbx, %rcx
	je	.L266
.L267:
	movq	%rbx, %rax
	cqto
	idivq	%rcx
	testq	%rdx, %rdx
	cmove	%r9, %rbx
	addq	$1, %rsi
	cmpq	%rdi, %rsi
	jne	.L269
.L266:
	xorl	%eax, %eax
	cmpq	$1, %rbx
	popq	%rbx
	.cfi_def_cfa_offset 8
	setne	%al
	ret
	.cfi_endproc
.LFE38:
	.size	judge_prime, .-judge_prime
	.p2align 4
	.globl	makeinv
	.type	makeinv, @function
makeinv:
.LFB39:
	.cfi_startproc
	movq	is_minv_made(%rip), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, is_minv_made(%rip)
	testq	%rax, %rax
	je	.L278
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L278:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	makeinv.part.0
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	makeinv, .-makeinv
	.p2align 4
	.globl	make_mf
	.type	make_mf, @function
make_mf:
.LFB40:
	.cfi_startproc
	movq	is_mf_made(%rip), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, is_mf_made(%rip)
	testq	%rax, %rax
	je	.L289
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L289:
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdi, %r12
	movq	mf_arr(%rip), %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %rbp
	movl	$16, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	call	realloc
	movdqa	.LC0(%rip), %xmm0
	movq	%rax, mf_arr(%rip)
	movq	%rax, %rdi
	movups	%xmm0, (%rax)
	cmpq	$1, %r12
	jle	.L283
	addq	$1, %r12
	movl	$2, %r13d
	movl	$1, %ebx
	.p2align 4,,10
	.p2align 3
.L282:
	movq	%rbx, %rax
	imulq	%r13, %rax
	addq	$1, %r13
	leaq	0(,%r13,8), %r14
	movq	%r14, %rsi
	cqto
	idivq	%rbp
	movq	%rdx, %rbx
	call	realloc
	movq	%rax, mf_arr(%rip)
	movq	%rax, %rdi
	movq	%rbx, -8(%rax,%r14)
	cmpq	%r13, %r12
	jne	.L282
.L283:
	popq	%rbx
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
	.size	make_mf, .-make_mf
	.p2align 4
	.globl	m_inv
	.type	m_inv, @function
m_inv:
.LFB41:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	is_minv_made(%rip), %rax
	movq	num_of_inv(%rip), %rdi
	leaq	1(%rax), %rdx
	movq	%rdx, is_minv_made(%rip)
	testq	%rax, %rax
	je	.L295
.L291:
	testq	%rbp, %rbp
	je	.L292
	movq	finv_arr(%rip), %rax
	movq	(%rax,%rbx,8), %rax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L292:
	.cfi_restore_state
	movq	inv_arr(%rip), %rax
	movq	(%rax,%rbx,8), %rax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L295:
	.cfi_restore_state
	call	makeinv.part.0
	jmp	.L291
	.cfi_endproc
.LFE41:
	.size	m_inv, .-m_inv
	.p2align 4
	.globl	m_f
	.type	m_f, @function
m_f:
.LFB42:
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
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	is_mf_made(%rip), %rax
	movq	num_of_inv(%rip), %r13
	movq	mf_arr(%rip), %rdi
	leaq	1(%rax), %rdx
	movq	%rdx, is_mf_made(%rip)
	testq	%rax, %rax
	je	.L301
.L297:
	movq	(%rdi,%r12,8), %rax
	addq	$8, %rsp
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
.L301:
	.cfi_restore_state
	movq	%rsi, %rbp
	movl	$16, %esi
	call	realloc
	movdqa	.LC0(%rip), %xmm0
	movq	%rax, mf_arr(%rip)
	movq	%rax, %rdi
	movups	%xmm0, (%rax)
	cmpq	$1, %r13
	jle	.L297
	addq	$1, %r13
	movl	$2, %r14d
	movl	$1, %ebx
	.p2align 4,,10
	.p2align 3
.L298:
	movq	%rbx, %rax
	imulq	%r14, %rax
	addq	$1, %r14
	leaq	0(,%r14,8), %r15
	movq	%r15, %rsi
	cqto
	idivq	%rbp
	movq	%rdx, %rbx
	call	realloc
	movq	%rax, mf_arr(%rip)
	movq	%rax, %rdi
	movq	%rbx, -8(%rax,%r15)
	cmpq	%r14, %r13
	jne	.L298
	jmp	.L297
	.cfi_endproc
.LFE42:
	.size	m_f, .-m_f
	.p2align 4
	.globl	mod_nck
	.type	mod_nck, @function
mod_nck:
.LFB43:
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
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	is_mf_made(%rip), %rax
	movq	num_of_inv(%rip), %rcx
	movq	%rsi, (%rsp)
	movq	mf_arr(%rip), %rdi
	leaq	1(%rax), %rdx
	movq	%rdx, is_mf_made(%rip)
	testq	%rax, %rax
	je	.L312
.L303:
	movq	is_minv_made(%rip), %rax
	movq	(%rdi,%rbp,8), %r13
	leaq	1(%rax), %rsi
	movq	%rsi, is_minv_made(%rip)
	testq	%rax, %rax
	je	.L313
.L306:
	movq	(%rsp), %r8
	movq	finv_arr(%rip), %rdi
	movq	(%rdi,%r8,8), %rax
	subq	%r8, %rbp
	imulq	%r13, %rax
	cqto
	idivq	%rbx
	leaq	1(%rsi), %rax
	movq	%rax, is_minv_made(%rip)
	movq	%rdx, %r13
	testq	%rsi, %rsi
	je	.L314
.L307:
	movq	(%rdi,%rbp,8), %rax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	imulq	%r13, %rax
	cqto
	idivq	%rbx
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
	movq	%rdx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L312:
	.cfi_restore_state
	movl	$16, %esi
	movq	%rcx, 8(%rsp)
	movl	$2, %r15d
	movl	$1, %r14d
	call	realloc
	movdqa	.LC0(%rip), %xmm0
	movq	8(%rsp), %rcx
	movq	%rax, mf_arr(%rip)
	movq	%rax, %rdi
	movups	%xmm0, (%rax)
	leaq	1(%rcx), %r13
	cmpq	$1, %rcx
	jle	.L311
	.p2align 4,,10
	.p2align 3
.L305:
	movq	%r14, %rax
	imulq	%r15, %rax
	addq	$1, %r15
	leaq	0(,%r15,8), %r12
	movq	%r12, %rsi
	cqto
	idivq	%rbx
	movq	%rdx, %r14
	call	realloc
	movq	%rax, mf_arr(%rip)
	movq	%rax, %rdi
	movq	%r14, -8(%rax,%r12)
	cmpq	%r13, %r15
	jne	.L305
.L311:
	movq	num_of_inv(%rip), %rcx
	jmp	.L303
	.p2align 4,,10
	.p2align 3
.L314:
	movq	%rcx, %rdi
	movq	%rbx, %rsi
	call	makeinv.part.0
	movq	finv_arr(%rip), %rdi
	jmp	.L307
	.p2align 4,,10
	.p2align 3
.L313:
	movq	%rbx, %rsi
	movq	%rcx, %rdi
	call	makeinv.part.0
	movq	num_of_inv(%rip), %rcx
	movq	is_minv_made(%rip), %rsi
	jmp	.L306
	.cfi_endproc
.LFE43:
	.size	mod_nck, .-mod_nck
	.p2align 4
	.globl	m_p
	.type	m_p, @function
m_p:
.LFB44:
	.cfi_startproc
	movq	%rdx, %r8
	testq	%rsi, %rsi
	jle	.L320
	movq	%rdi, %rcx
	movl	$1, %r9d
	.p2align 4,,10
	.p2align 3
.L318:
	testb	$1, %sil
	je	.L317
	movq	%r9, %rax
	imulq	%rcx, %rax
	cqto
	idivq	%r8
	movq	%rdx, %r9
.L317:
	imulq	%rcx, %rcx
	movq	%rcx, %rax
	cqto
	idivq	%r8
	sarq	%rsi
	movq	%rdx, %rcx
	jne	.L318
	xorl	%eax, %eax
	testq	%rdi, %rdi
	cmove	%rax, %r9
	movq	%r9, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L320:
	xorl	%eax, %eax
	movl	$1, %r9d
	testq	%rdi, %rdi
	cmove	%rax, %r9
	movq	%r9, %rax
	ret
	.cfi_endproc
.LFE44:
	.size	m_p, .-m_p
	.p2align 4
	.globl	m_mul2
	.type	m_mul2, @function
m_mul2:
.LFB45:
	.cfi_startproc
	movq	%rdi, %rax
	movq	%rdx, %rcx
	imulq	%rsi, %rax
	cqto
	idivq	%rcx
	movq	%rdx, %rax
	ret
	.cfi_endproc
.LFE45:
	.size	m_mul2, .-m_mul2
	.p2align 4
	.globl	m_mul3
	.type	m_mul3, @function
m_mul3:
.LFB46:
	.cfi_startproc
	movq	%rsi, %rax
	movq	%rdx, %rsi
	imulq	%rdi, %rax
	cqto
	idivq	%rcx
	movq	%rdx, %rax
	imulq	%rsi, %rax
	cqto
	idivq	%rcx
	movq	%rdx, %rax
	ret
	.cfi_endproc
.LFE46:
	.size	m_mul3, .-m_mul3
	.p2align 4
	.globl	m_mul4
	.type	m_mul4, @function
m_mul4:
.LFB47:
	.cfi_startproc
	movq	%rsi, %rax
	movq	%rdx, %rsi
	imulq	%rdi, %rax
	cqto
	idivq	%r8
	movq	%rdx, %rax
	imulq	%rsi, %rax
	cqto
	idivq	%r8
	movq	%rdx, %rax
	imulq	%rcx, %rax
	cqto
	idivq	%r8
	movq	%rdx, %rax
	ret
	.cfi_endproc
.LFE47:
	.size	m_mul4, .-m_mul4
	.p2align 4
	.globl	m_mul5
	.type	m_mul5, @function
m_mul5:
.LFB48:
	.cfi_startproc
	movq	%rsi, %rax
	movq	%rdx, %rsi
	imulq	%rdi, %rax
	cqto
	idivq	%r9
	movq	%rdx, %rax
	imulq	%rsi, %rax
	cqto
	idivq	%r9
	movq	%rdx, %rax
	imulq	%rcx, %rax
	cqto
	idivq	%r9
	movq	%rdx, %rax
	imulq	%r8, %rax
	cqto
	idivq	%r9
	movq	%rdx, %rax
	ret
	.cfi_endproc
.LFE48:
	.size	m_mul5, .-m_mul5
	.p2align 4
	.globl	sortup
	.type	sortup, @function
sortup:
.LFB53:
	.cfi_startproc
	movslq	%esi, %rsi
	movl	$upll, %ecx
	movl	$8, %edx
	jmp	qsort
	.cfi_endproc
.LFE53:
	.size	sortup, .-sortup
	.p2align 4
	.globl	sortdown
	.type	sortdown, @function
sortdown:
.LFB54:
	.cfi_startproc
	movslq	%esi, %rsi
	movl	$downll, %ecx
	movl	$8, %edx
	jmp	qsort
	.cfi_endproc
.LFE54:
	.size	sortdown, .-sortdown
	.p2align 4
	.globl	sort_string
	.type	sort_string, @function
sort_string:
.LFB55:
	.cfi_startproc
	movl	%edi, %eax
	movl	$cmp_string, %ecx
	movq	%rdx, %rdi
	movslq	%esi, %rdx
	movslq	%eax, %rsi
	jmp	qsort
	.cfi_endproc
.LFE55:
	.size	sort_string, .-sort_string
	.p2align 4
	.globl	sort_char
	.type	sort_char, @function
sort_char:
.LFB56:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	strlen
	movq	%rbx, %rdi
	movl	$cmp_char, %ecx
	popq	%rbx
	.cfi_def_cfa_offset 8
	movq	%rax, %rsi
	movl	$1, %edx
	jmp	qsort
	.cfi_endproc
.LFE56:
	.size	sort_char, .-sort_char
	.p2align 4
	.globl	unique_string
	.type	unique_string, @function
unique_string:
.LFB57:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	cmpq	$1, %rdi
	jle	.L339
	movq	%rdi, %r12
	movq	%rsi, %r13
	movq	%rdx, %rbx
	movl	$1, %ebp
	movl	$1, %r14d
	.p2align 4,,10
	.p2align 3
.L338:
	movq	%rbx, %rsi
	addq	%r13, %rbx
	movq	%rbx, %rdi
	call	strcmp
	cmpl	$1, %eax
	sbbq	$-1, %r14
	addq	$1, %rbp
	cmpq	%rbp, %r12
	jne	.L338
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r14, %rax
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
.L339:
	.cfi_restore_state
	movl	$1, %r14d
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	movq	%r14, %rax
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE57:
	.size	unique_string, .-unique_string
	.p2align 4
	.globl	unique_num
	.type	unique_num, @function
unique_num:
.LFB58:
	.cfi_startproc
	cmpq	$1, %rdi
	jle	.L352
	leaq	-1(%rdi), %rdx
	cmpq	$2, %rdi
	je	.L353
	movq	%rdx, %rcx
	pxor	%xmm1, %xmm1
	pxor	%xmm3, %xmm3
	movq	%rsi, %rax
	shrq	%rcx
	salq	$4, %rcx
	addq	%rsi, %rcx
	.p2align 4,,10
	.p2align 3
.L347:
	movdqu	8(%rax), %xmm0
	movdqu	(%rax), %xmm4
	addq	$16, %rax
	pcmpeqd	%xmm4, %xmm0
	pcmpeqd	%xmm3, %xmm0
	pshufd	$177, %xmm0, %xmm2
	por	%xmm2, %xmm0
	psubq	%xmm0, %xmm1
	cmpq	%rax, %rcx
	jne	.L347
	movdqa	%xmm1, %xmm0
	psrldq	$8, %xmm0
	paddq	%xmm0, %xmm1
	movq	%xmm1, %rax
	addq	$1, %rax
	testb	$1, %dl
	je	.L344
	orq	$1, %rdx
.L346:
	movq	-8(%rsi,%rdx,8), %rdi
	cmpq	%rdi, (%rsi,%rdx,8)
	je	.L344
	addq	$1, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L352:
	movl	$1, %eax
.L344:
	ret
.L353:
	movl	$1, %edx
	movl	$1, %eax
	jmp	.L346
	.cfi_endproc
.LFE58:
	.size	unique_num, .-unique_num
	.p2align 4
	.globl	strsortup
	.type	strsortup, @function
strsortup:
.LFB61:
	.cfi_startproc
	movslq	%esi, %rsi
	movl	$cmp1, %ecx
	movl	$16, %edx
	jmp	qsort
	.cfi_endproc
.LFE61:
	.size	strsortup, .-strsortup
	.p2align 4
	.globl	strsortdown
	.type	strsortdown, @function
strsortdown:
.LFB62:
	.cfi_startproc
	movslq	%esi, %rsi
	movl	$cmp2, %ecx
	movl	$16, %edx
	jmp	qsort
	.cfi_endproc
.LFE62:
	.size	strsortdown, .-strsortdown
	.p2align 4
	.globl	sort_partial
	.type	sort_partial, @function
sort_partial:
.LFB63:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%ecx, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movslq	%edx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%ebp, %r13d
	movslq	%esi, %rbx
	subl	%ebx, %r13d
	movslq	%r13d, %r13
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	leaq	0(,%r13,8), %rdi
	call	malloc
	movq	%rax, %r12
	cmpl	%ebx, %ebp
	jle	.L367
	movq	%rbp, %rdx
	leaq	(%r14,%rbx,8), %rsi
	movq	%rax, %rdi
	subq	%rbx, %rdx
	salq	$3, %rdx
	call	memcpy
	testl	%r15d, %r15d
	jne	.L368
	movl	$downll, %ecx
	movl	$8, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	qsort
.L364:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	subq	%rbx, %rbp
	leaq	(%r14,%rbx,8), %rdi
	movq	%r12, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 48
	leaq	0(,%rbp,8), %rdx
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
	jmp	memcpy
	.p2align 4,,10
	.p2align 3
.L368:
	.cfi_restore_state
	movl	$upll, %ecx
	movl	$8, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	qsort
	jmp	.L364
	.p2align 4,,10
	.p2align 3
.L367:
	movl	$upll, %ecx
	testl	%r15d, %r15d
	jne	.L366
	movl	$downll, %ecx
.L366:
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	movq	%r13, %rsi
	movq	%r12, %rdi
	movl	$8, %edx
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
	jmp	qsort
	.cfi_endproc
.LFE63:
	.size	sort_partial, .-sort_partial
	.p2align 4
	.globl	AVL_set_inside_rotate
	.type	AVL_set_inside_rotate, @function
AVL_set_inside_rotate:
.LFB64:
	.cfi_startproc
	xorl	%r9d, %r9d
	testl	%esi, %esi
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	(%rdi), %r11
	sete	%r9b
	cmpl	$1, %esi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%esi, %eax
	sbbl	%edx, %edx
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	andl	$6, %edx
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%esi, %ebx
	subl	$3, %edx
	movq	16(%r11,%r9,8), %rcx
	negl	%ebx
	sbbl	%r10d, %r10d
	orl	$1, %r10d
	cmpl	$1, %esi
	sbbl	%r8d, %r8d
	andl	$4, %r8d
	subl	$2, %r8d
	cmpl	$1, %esi
	sbbl	%esi, %esi
	orl	$1, %esi
	testq	%rcx, %rcx
	je	.L369
	movl	8(%r11), %r14d
	movl	8(%rcx), %r13d
	movl	%r14d, %r12d
	movl	%r13d, %ebx
	imull	%esi, %r12d
	imull	%esi, %ebx
	leal	-1(%r12), %ebp
	cmpl	$-1, %ebx
	je	.L372
	subl	%ebx, %ebp
	movl	%ebp, %r10d
	imull	%esi, %r10d
	cmpl	%r13d, %r14d
	je	.L373
	subl	$1, %ebx
	imull	%esi, %ebx
	movl	%ebx, %edx
.L374:
	cmpl	$1, %eax
	movl	%r10d, 8(%r11)
	sete	%al
	movl	%edx, 8(%rcx)
	movzbl	%al, %eax
	addq	$2, %rax
	movq	(%rcx,%rax,8), %rdx
	movq	%rdx, 16(%r11,%r9,8)
	movq	(%rdi), %rdx
	movq	%rdx, (%rcx,%rax,8)
	movq	%rcx, (%rdi)
.L369:
	popq	%rbx
	.cfi_remember_state
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
.L372:
	.cfi_restore_state
	testl	%r12d, %r12d
	je	.L374
	imull	%ebp, %esi
	movl	%r8d, %edx
	movl	%esi, %r10d
	jmp	.L374
	.p2align 4,,10
	.p2align 3
.L373:
	subl	$2, %r12d
	movl	%r12d, %edx
	imull	%esi, %edx
	jmp	.L374
	.cfi_endproc
.LFE64:
	.size	AVL_set_inside_rotate, .-AVL_set_inside_rotate
	.p2align 4
	.globl	AVL_set_inside_update
	.type	AVL_set_inside_update, @function
AVL_set_inside_update:
.LFB65:
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
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L514
	cmpq	%rsi, (%rbx)
	je	.L515
	setle	%r15b
	setg	%r12b
	movzbl	%r15b, %r8d
	movzbl	%r12b, %r12d
	leaq	2(%r8), %r14
	leal	-1(%r8,%r8), %eax
	movq	%r8, %r15
	movq	(%rbx,%r14,8), %r13
	movl	%eax, (%rsp)
	leal	-1(%r12,%r12), %r12d
	testq	%r13, %r13
	je	.L516
	cmpq	0(%r13), %rsi
	je	.L517
	setge	%r10b
	setl	%r14b
	movzbl	%r10b, %r10d
	movzbl	%r14b, %r14d
	leal	-1(%r10,%r10), %eax
	leal	-1(%r14,%r14), %r14d
	movl	%eax, 16(%rsp)
	movslq	%r10d, %rax
	leaq	2(%rax), %r9
	movq	%rax, 8(%rsp)
	movq	0(%r13,%r9,8), %rcx
	testq	%rcx, %rcx
	je	.L518
	cmpq	(%rcx), %rsi
	je	.L519
	setge	%al
	setl	%r9b
	movzbl	%al, %eax
	movzbl	%r9b, %r9d
	leal	-1(%rax,%rax), %edi
	leaq	2(%rax), %r11
	movl	%eax, 32(%rsp)
	movl	%edi, 40(%rsp)
	movq	(%rcx,%r11,8), %rdi
	leal	-1(%r9,%r9), %r9d
	movq	%rax, 24(%rsp)
	testq	%rdi, %rdi
	je	.L520
	cmpq	(%rdi), %rsi
	je	.L521
	setl	%r11b
	setge	%al
	movq	%r8, 80(%rsp)
	movzbl	%al, %eax
	movzbl	%r11b, %r11d
	movl	%r9d, 76(%rsp)
	leal	-1(%r11,%r11), %r11d
	leaq	16(%rdi,%rax,8), %rdi
	movq	%rcx, 64(%rsp)
	movl	%r10d, 56(%rsp)
	movl	%r11d, 48(%rsp)
	call	AVL_set_inside_update
	movq	80(%rsp), %r8
	movl	76(%rsp), %r9d
	movq	64(%rsp), %rcx
	movl	56(%rsp), %r10d
	movl	48(%rsp), %r11d
.L426:
	testl	%eax, %eax
	je	.L390
	movq	24(%rsp), %rdi
	imull	%eax, %r11d
	movq	16(%rcx,%rdi,8), %rdx
	movl	8(%rdx), %esi
	addl	%esi, %r11d
	movl	%r11d, 8(%rdx)
	cmpl	$1, %r11d
	jle	.L522
	movq	$16, 24(%rsp)
	movl	$1, %r11d
	movl	$1, %esi
	xorl	%edi, %edi
.L428:
	movslq	%edi, %r9
	movq	16(%rdx,%r9,8), %r9
	movl	8(%r9), %r9d
	imull	%r9d, %esi
	testl	%esi, %esi
	js	.L523
.L431:
	movl	32(%rsp), %edx
	movl	%r11d, %esi
	movl	%eax, 24(%rsp)
	movq	%r8, 64(%rsp)
	addl	$2, %edx
	movl	%r9d, 56(%rsp)
	movslq	%edx, %rdx
	movl	%r10d, 48(%rsp)
	leaq	(%rcx,%rdx,8), %rdi
	call	AVL_set_inside_rotate
	movl	24(%rsp), %eax
	testl	%eax, %eax
	jns	.L390
	movl	56(%rsp), %r9d
	movl	48(%rsp), %r10d
	movq	64(%rsp), %r8
	testl	%r9d, %r9d
	je	.L390
.L424:
	movl	40(%rsp), %r9d
	movl	$-1, %edx
	.p2align 4,,10
	.p2align 3
.L416:
	movq	8(%rsp), %rax
	movq	16(%r13,%rax,8), %rax
	movl	8(%rax), %ecx
	addl	%ecx, %r9d
	movl	%r9d, 8(%rax)
	cmpl	$1, %r9d
	jle	.L524
	movl	$16, %edi
	movl	$1, %r14d
	movl	$1, %ecx
	xorl	%esi, %esi
.L433:
	movslq	%esi, %r9
	movq	16(%rax,%r9,8), %r9
	movl	8(%r9), %r9d
	imull	%r9d, %ecx
	testl	%ecx, %ecx
	js	.L525
.L436:
	addl	$2, %r10d
	movl	%r14d, %esi
	movl	%edx, 8(%rsp)
	movslq	%r10d, %r10
	movq	%r8, 32(%rsp)
	leaq	0(%r13,%r10,8), %rdi
	movl	%r9d, 24(%rsp)
	call	AVL_set_inside_rotate
	movl	8(%rsp), %edx
	testl	%edx, %edx
	jns	.L390
	movl	24(%rsp), %r9d
	movq	32(%rsp), %r8
	testl	%r9d, %r9d
	je	.L390
.L414:
	movl	16(%rsp), %r14d
	movl	$-1, %r13d
	jmp	.L406
	.p2align 4,,10
	.p2align 3
.L515:
	cmpl	$2, %edx
	je	.L526
	testl	%edx, %edx
	jne	.L527
.L391:
	movq	24(%rbx), %r13
	movq	16(%rbx), %r12
	testq	%r13, %r13
	je	.L528
	testq	%r12, %r12
	je	.L529
	.p2align 4,,10
	.p2align 3
.L394:
	movq	%r12, %rax
	movq	24(%r12), %r12
	testq	%r12, %r12
	jne	.L394
	movq	(%rax), %rsi
	leaq	16(%rbx), %rdi
	movq	%rsi, (%rbx)
	call	AVL_set_inside_update
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.L390
	movl	%eax, %r12d
.L395:
	movq	0(%rbp), %rdi
	movl	8(%rdi), %edx
	addl	%edx, %r12d
	movl	%r12d, 8(%rdi)
	cmpl	$1, %r12d
	jle	.L530
	movl	$16, %edx
	movl	$1, %r12d
	movl	$1, %eax
	xorl	%esi, %esi
.L443:
	movslq	%esi, %rcx
	movq	16(%rdi,%rcx,8), %rcx
	movl	8(%rcx), %r13d
	imull	%r13d, %eax
	testl	%eax, %eax
	js	.L531
.L445:
	movl	%r12d, %esi
	movq	%rbp, %rdi
	call	AVL_set_inside_rotate
	movl	%ebx, %eax
	shrl	$31, %eax
	testl	%r13d, %r13d
	setne	%dl
	andl	%edx, %eax
	negl	%eax
.L383:
	addq	$104, %rsp
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
.L527:
	.cfi_restore_state
	movl	12(%rbx), %eax
	cmpl	$1, %eax
	jle	.L391
	subl	$1, %eax
	movl	%eax, 12(%rbx)
	.p2align 4,,10
	.p2align 3
.L390:
	xorl	%eax, %eax
.L533:
	addq	$104, %rsp
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
.L516:
	.cfi_restore_state
	cmpl	$2, %edx
	jne	.L390
	movl	$32, %edi
	movq	%rsi, (%rsp)
	call	malloc
	movq	(%rsp), %rsi
	movq	.LC4(%rip), %rdx
	pxor	%xmm0, %xmm0
	movq	%rax, (%rbx,%r14,8)
	movq	%rsi, (%rax)
	movq	%rdx, 8(%rax)
	movups	%xmm0, 16(%rax)
	jmp	.L399
	.p2align 4,,10
	.p2align 3
.L519:
	cmpl	$2, %edx
	je	.L532
	testl	%edx, %edx
	je	.L412
	movl	12(%rcx), %eax
	cmpl	$1, %eax
	jle	.L412
	subl	$1, %eax
	movl	%eax, 12(%rcx)
	xorl	%eax, %eax
	jmp	.L533
	.p2align 4,,10
	.p2align 3
.L412:
	movq	24(%rcx), %rsi
	movq	16(%rcx), %rax
	testq	%rsi, %rsi
	je	.L534
	testq	%rax, %rax
	je	.L535
	.p2align 4,,10
	.p2align 3
.L415:
	movq	%rax, %rsi
	movq	24(%rax), %rax
	testq	%rax, %rax
	jne	.L415
	movq	(%rsi), %rsi
	leaq	16(%rcx), %rdi
	movl	%r10d, 32(%rsp)
	movq	%r8, 24(%rsp)
	movq	%rsi, (%rcx)
	call	AVL_set_inside_update
	movq	24(%rsp), %r8
	movl	32(%rsp), %r10d
	testl	%eax, %eax
	movl	%eax, %edx
	je	.L390
	movl	%eax, %r9d
	jmp	.L416
	.p2align 4,,10
	.p2align 3
.L530:
	cmpl	$-1, %r12d
	jl	.L460
	testl	%ebx, %ebx
	jle	.L444
	testl	%edx, %edx
	jne	.L444
.L387:
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$1, %eax
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
.L444:
	.cfi_restore_state
	movl	%ebx, %eax
	shrl	$31, %eax
	testl	%edx, %edx
	setne	%dl
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	andl	%edx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	negl	%eax
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
.L514:
	.cfi_restore_state
	cmpl	$2, %edx
	jne	.L390
	movl	$32, %edi
	movq	%rsi, (%rsp)
	call	malloc
	movq	(%rsp), %rsi
	movq	.LC4(%rip), %rdx
	pxor	%xmm0, %xmm0
	movq	%rax, 0(%rbp)
	movq	%rsi, (%rax)
	movq	%rdx, 8(%rax)
	movups	%xmm0, 16(%rax)
	jmp	.L387
	.p2align 4,,10
	.p2align 3
.L517:
	cmpl	$2, %edx
	je	.L536
	testl	%edx, %edx
	je	.L402
	movl	12(%r13), %eax
	cmpl	$1, %eax
	jg	.L537
.L402:
	movq	24(%r13), %rax
	movq	16(%r13), %r14
	testq	%rax, %rax
	je	.L538
	testq	%r14, %r14
	je	.L539
	.p2align 4,,10
	.p2align 3
.L405:
	movq	%r14, %rax
	movq	24(%r14), %r14
	testq	%r14, %r14
	jne	.L405
	movq	(%rax), %rsi
	leaq	16(%r13), %rdi
	movq	%r8, 8(%rsp)
	movq	%rsi, 0(%r13)
	call	AVL_set_inside_update
	movq	8(%rsp), %r8
	testl	%eax, %eax
	movl	%eax, %r13d
	je	.L390
	movl	%eax, %r14d
.L406:
	movq	16(%rbx,%r8,8), %rdi
	movl	8(%rdi), %eax
	addl	%eax, %r14d
	movl	%r14d, 8(%rdi)
	cmpl	$1, %r14d
	jle	.L540
	movl	$16, %edx
	movl	$1, %r12d
	movl	$1, %eax
	xorl	%esi, %esi
.L438:
	movslq	%esi, %rcx
	movq	16(%rdi,%rcx,8), %rcx
	movl	8(%rcx), %r14d
	imull	%r14d, %eax
	testl	%eax, %eax
	js	.L541
.L441:
	addl	$2, %r15d
	movl	%r12d, %esi
	movslq	%r15d, %r15
	leaq	(%rbx,%r15,8), %rdi
	call	AVL_set_inside_rotate
	testl	%r13d, %r13d
	jns	.L390
	testl	%r14d, %r14d
	jne	.L404
	xorl	%eax, %eax
	jmp	.L533
	.p2align 4,,10
	.p2align 3
.L540:
	cmpl	$-1, %r14d
	jl	.L458
	testl	%r13d, %r13d
	jle	.L440
	testl	%eax, %eax
	jne	.L440
.L399:
	movl	$1, %ebx
	jmp	.L395
	.p2align 4,,10
	.p2align 3
.L440:
	testl	%r13d, %r13d
	jns	.L390
	testl	%eax, %eax
	je	.L390
.L404:
	movl	(%rsp), %r12d
	movl	$-1, %ebx
	jmp	.L395
	.p2align 4,,10
	.p2align 3
.L460:
	movl	$24, %edx
	xorl	%r12d, %r12d
	movl	$-1, %eax
	movl	$1, %esi
	jmp	.L443
	.p2align 4,,10
	.p2align 3
.L526:
	addl	$1, 12(%rbx)
	xorl	%eax, %eax
	jmp	.L533
	.p2align 4,,10
	.p2align 3
.L518:
	cmpl	$2, %edx
	jne	.L390
	movl	$32, %edi
	movq	%r8, 24(%rsp)
	movq	%r9, 16(%rsp)
	movq	%rsi, 8(%rsp)
	call	malloc
	movq	16(%rsp), %r9
	movq	8(%rsp), %rsi
	pxor	%xmm0, %xmm0
	movq	.LC4(%rip), %rdx
	movq	24(%rsp), %r8
	movq	%rax, 0(%r13,%r9,8)
	movq	%rsi, (%rax)
	movq	%rdx, 8(%rax)
	movups	%xmm0, 16(%rax)
.L409:
	movl	$1, %r13d
	jmp	.L406
	.p2align 4,,10
	.p2align 3
.L522:
	cmpl	$-1, %r11d
	jl	.L454
	testl	%eax, %eax
	jle	.L430
	testl	%esi, %esi
	jne	.L430
.L419:
	movl	$1, %edx
	jmp	.L416
	.p2align 4,,10
	.p2align 3
.L537:
	subl	$1, %eax
	movl	%eax, 12(%r13)
	xorl	%eax, %eax
	jmp	.L533
.L534:
	movq	%rcx, %rdi
	movq	%r8, 32(%rsp)
	movq	%rax, 24(%rsp)
	call	free
	movq	8(%rsp), %rcx
	movq	24(%rsp), %rax
	movq	32(%rsp), %r8
	movq	%rax, 16(%r13,%rcx,8)
	jmp	.L414
	.p2align 4,,10
	.p2align 3
.L524:
	cmpl	$-1, %r9d
	jl	.L456
	testl	%edx, %edx
	jle	.L435
	testl	%ecx, %ecx
	je	.L409
.L435:
	testl	%edx, %edx
	jns	.L390
	testl	%ecx, %ecx
	jne	.L414
	xorl	%eax, %eax
	jmp	.L533
	.p2align 4,,10
	.p2align 3
.L521:
	cmpl	$2, %edx
	je	.L542
	testl	%edx, %edx
	je	.L422
	movl	12(%rdi), %eax
	cmpl	$1, %eax
	jg	.L543
.L422:
	movq	24(%rdi), %rsi
	movq	16(%rdi), %rax
	testq	%rsi, %rsi
	je	.L544
	testq	%rax, %rax
	je	.L545
	.p2align 4,,10
	.p2align 3
.L425:
	movq	%rax, %rsi
	movq	24(%rax), %rax
	testq	%rax, %rax
	jne	.L425
	movq	(%rsi), %rsi
	addq	$16, %rdi
	movl	%r10d, 76(%rsp)
	movq	%rcx, 64(%rsp)
	movq	%rsi, -16(%rdi)
	movl	%r9d, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	AVL_set_inside_update
	movq	48(%rsp), %r8
	movl	56(%rsp), %r9d
	movl	$1, %r11d
	movq	64(%rsp), %rcx
	movl	76(%rsp), %r10d
	jmp	.L426
	.p2align 4,,10
	.p2align 3
.L458:
	movl	$24, %edx
	xorl	%r12d, %r12d
	movl	$-1, %eax
	movl	$1, %esi
	jmp	.L438
	.p2align 4,,10
	.p2align 3
.L531:
	addq	%rdx, %rdi
	call	AVL_set_inside_rotate
	jmp	.L445
	.p2align 4,,10
	.p2align 3
.L536:
	addl	$1, 12(%r13)
	xorl	%eax, %eax
	jmp	.L533
	.p2align 4,,10
	.p2align 3
.L430:
	testl	%eax, %eax
	jns	.L390
	testl	%esi, %esi
	jne	.L424
	xorl	%eax, %eax
	jmp	.L533
	.p2align 4,,10
	.p2align 3
.L520:
	cmpl	$2, %edx
	jne	.L390
	movl	$32, %edi
	movq	%r8, 64(%rsp)
	movq	%r11, 56(%rsp)
	movq	%rsi, 48(%rsp)
	movl	%r9d, 40(%rsp)
	movq	%rcx, 32(%rsp)
	movl	%r10d, 24(%rsp)
	call	malloc
	movq	32(%rsp), %rcx
	pxor	%xmm0, %xmm0
	movq	56(%rsp), %r11
	movq	48(%rsp), %rsi
	movq	.LC4(%rip), %rdx
	movl	24(%rsp), %r10d
	movl	40(%rsp), %r9d
	movq	%rax, (%rcx,%r11,8)
	movq	64(%rsp), %r8
	movq	%rsi, (%rax)
	movq	%rdx, 8(%rax)
	movups	%xmm0, 16(%rax)
	jmp	.L419
	.p2align 4,,10
	.p2align 3
.L456:
	movl	$24, %edi
	xorl	%r14d, %r14d
	movl	$-1, %ecx
	movl	$1, %esi
	jmp	.L433
	.p2align 4,,10
	.p2align 3
.L541:
	addq	%rdx, %rdi
	call	AVL_set_inside_rotate
	jmp	.L441
	.p2align 4,,10
	.p2align 3
.L528:
	movq	%rbx, %rdi
	call	free
.L393:
	movq	%r12, 0(%rbp)
	movl	$-1, %eax
	jmp	.L383
	.p2align 4,,10
	.p2align 3
.L532:
	addl	$1, 12(%rcx)
	xorl	%eax, %eax
	jmp	.L533
	.p2align 4,,10
	.p2align 3
.L529:
	movq	%rbx, %rdi
	movq	%r13, %r12
	call	free
	jmp	.L393
.L454:
	xorl	%r11d, %r11d
	movl	$-1, %esi
	movl	$1, %edi
	movq	$24, 24(%rsp)
	jmp	.L428
.L525:
	addq	%rax, %rdi
	movq	%r8, 40(%rsp)
	movl	%r9d, 32(%rsp)
	movl	%edx, 24(%rsp)
	movl	%r10d, 8(%rsp)
	call	AVL_set_inside_rotate
	movq	40(%rsp), %r8
	movl	32(%rsp), %r9d
	movl	24(%rsp), %edx
	movl	8(%rsp), %r10d
	jmp	.L436
.L538:
	movq	%r13, %rdi
	movq	%r8, 8(%rsp)
	call	free
	movq	8(%rsp), %r8
	movq	%r14, 16(%rbx,%r8,8)
	jmp	.L404
.L542:
	addl	$1, 12(%rdi)
	xorl	%eax, %eax
	jmp	.L533
.L539:
	movq	%r13, %rdi
	movq	%r8, 16(%rsp)
	movq	%rax, 8(%rsp)
	call	free
	movq	8(%rsp), %rax
	movq	16(%rsp), %r8
	movq	%rax, 16(%rbx,%r8,8)
	jmp	.L404
.L543:
	subl	$1, %eax
	movl	%eax, 12(%rdi)
	xorl	%eax, %eax
	jmp	.L533
.L523:
	movl	%eax, 64(%rsp)
	movq	24(%rsp), %rax
	movl	%edi, %esi
	movq	%r8, 88(%rsp)
	addq	%rax, %rdx
	movl	%r11d, 80(%rsp)
	movq	%rdx, %rdi
	movl	%r9d, 76(%rsp)
	movq	%rcx, 56(%rsp)
	movl	%r10d, 48(%rsp)
	call	AVL_set_inside_rotate
	movq	88(%rsp), %r8
	movl	80(%rsp), %r11d
	movl	76(%rsp), %r9d
	movl	64(%rsp), %eax
	movq	56(%rsp), %rcx
	movl	48(%rsp), %r10d
	jmp	.L431
.L535:
	movq	%rcx, %rdi
	movq	%r8, 32(%rsp)
	movq	%rsi, 24(%rsp)
	call	free
	movq	8(%rsp), %rax
	movq	24(%rsp), %rsi
	movq	32(%rsp), %r8
	movq	%rsi, 16(%r13,%rax,8)
	jmp	.L414
.L544:
	movq	%r8, 64(%rsp)
	movq	%rax, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movl	%r10d, 32(%rsp)
	call	free
	movq	24(%rsp), %rdi
	movq	48(%rsp), %rcx
	movq	56(%rsp), %rax
	movl	32(%rsp), %r10d
	movq	64(%rsp), %r8
	movq	%rax, 16(%rcx,%rdi,8)
	jmp	.L424
.L545:
	movq	%r8, 64(%rsp)
	movq	%rsi, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movl	%r10d, 32(%rsp)
	call	free
	movq	24(%rsp), %rax
	movq	48(%rsp), %rcx
	movq	56(%rsp), %rsi
	movl	32(%rsp), %r10d
	movq	64(%rsp), %r8
	movq	%rsi, 16(%rcx,%rax,8)
	jmp	.L424
	.cfi_endproc
.LFE65:
	.size	AVL_set_inside_update, .-AVL_set_inside_update
	.section	.rodata.str1.1
.LC6:
	.string	"%lld %d\n"
	.text
	.p2align 4
	.globl	AVL_set_inside_print
	.type	AVL_set_inside_print, @function
AVL_set_inside_print:
.LFB66:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L602
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%esi, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
.L547:
	movq	24(%rbx), %r12
	addl	$1, %r13d
	testq	%r12, %r12
	je	.L548
	movl	%r13d, %r15d
	movq	%rbx, %rbp
.L563:
	movq	24(%r12), %rbx
	addl	$1, %r15d
	testq	%rbx, %rbx
	je	.L549
	movl	%r15d, %r14d
	movl	%r15d, 36(%rsp)
	movq	%rbp, %r15
	movq	%r12, 40(%rsp)
	movl	%r14d, %ebp
	movl	%r13d, %r12d
.L562:
	movq	24(%rbx), %r13
	addl	$1, %ebp
	testq	%r13, %r13
	je	.L550
	movq	%rbx, 48(%rsp)
	movq	%r15, %r14
	movl	%ebp, 32(%rsp)
	movl	%ebp, 64(%rsp)
	movl	%r12d, %ebp
.L561:
	movq	24(%r13), %rbx
	addl	$1, 32(%rsp)
	movl	32(%rsp), %eax
	testq	%rbx, %rbx
	je	.L551
	movq	%r13, 56(%rsp)
	movl	%eax, %r15d
.L560:
	movq	24(%rbx), %r12
	addl	$1, %r15d
	testq	%r12, %r12
	je	.L552
	movl	%r15d, %r13d
.L559:
	movq	24(%r12), %rcx
	addl	$1, %r13d
	testq	%rcx, %rcx
	je	.L553
	movq	%rbx, 8(%rsp)
	movl	%r13d, 24(%rsp)
	movl	%ebp, 28(%rsp)
	movq	%r14, 16(%rsp)
	movq	%r12, %r14
	movq	%rcx, %r12
.L558:
	movq	24(%r12), %rbx
	addl	$1, %r13d
	testq	%rbx, %rbx
	je	.L554
	movq	%rbx, %rax
	movl	%r13d, %ebx
	movq	%rax, %rbp
.L557:
	movq	24(%rbp), %r8
	addl	$1, %ebx
	testq	%r8, %r8
	je	.L555
	movl	%ebx, %r10d
	movq	%rbp, %rcx
	movl	%ebx, %ebp
	movq	%r8, %rbx
.L556:
	addl	$1, %r10d
	movq	24(%rbx), %rdi
	movq	%rcx, 72(%rsp)
	movl	%r10d, %esi
	movl	%r10d, 68(%rsp)
	call	AVL_set_inside_print
	movl	12(%rbx), %edx
	movq	(%rbx), %rsi
	xorl	%eax, %eax
	movl	$.LC6, %edi
	call	printf
	movq	16(%rbx), %rbx
	movl	68(%rsp), %r10d
	movq	72(%rsp), %rcx
	testq	%rbx, %rbx
	jne	.L556
	movl	%ebp, %ebx
	movq	%rcx, %rbp
.L555:
	movl	12(%rbp), %edx
	movq	0(%rbp), %rsi
	movl	$.LC6, %edi
	xorl	%eax, %eax
	call	printf
	movq	16(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L557
.L554:
	movl	12(%r12), %edx
	movq	(%r12), %rsi
	movl	$.LC6, %edi
	xorl	%eax, %eax
	call	printf
	movq	16(%r12), %r12
	testq	%r12, %r12
	jne	.L558
	movq	%r14, %r12
	movq	8(%rsp), %rbx
	movl	24(%rsp), %r13d
	movq	16(%rsp), %r14
	movl	28(%rsp), %ebp
.L553:
	movl	12(%r12), %edx
	movq	(%r12), %rsi
	movl	$.LC6, %edi
	xorl	%eax, %eax
	call	printf
	movq	16(%r12), %r12
	testq	%r12, %r12
	jne	.L559
.L552:
	movl	12(%rbx), %edx
	movq	(%rbx), %rsi
	movl	$.LC6, %edi
	xorl	%eax, %eax
	call	printf
	movq	16(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L560
	movq	56(%rsp), %r13
.L551:
	movl	12(%r13), %edx
	movq	0(%r13), %rsi
	movl	$.LC6, %edi
	xorl	%eax, %eax
	call	printf
	movq	16(%r13), %r13
	testq	%r13, %r13
	jne	.L561
	movl	%ebp, %r12d
	movq	48(%rsp), %rbx
	movl	64(%rsp), %ebp
	movq	%r14, %r15
.L550:
	movl	12(%rbx), %edx
	movq	(%rbx), %rsi
	movl	$.LC6, %edi
	xorl	%eax, %eax
	call	printf
	movq	16(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L562
	movq	%r15, %rbp
	movl	%r12d, %r13d
	movl	36(%rsp), %r15d
	movq	40(%rsp), %r12
.L549:
	movl	12(%r12), %edx
	movq	(%r12), %rsi
	movl	$.LC6, %edi
	xorl	%eax, %eax
	call	printf
	movq	16(%r12), %r12
	testq	%r12, %r12
	jne	.L563
	movq	%rbp, %rbx
.L548:
	movl	12(%rbx), %edx
	movq	(%rbx), %rsi
	movl	$.LC6, %edi
	xorl	%eax, %eax
	call	printf
	movq	16(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L547
	addq	$88, %rsp
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
.L602:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE66:
	.size	AVL_set_inside_print, .-AVL_set_inside_print
	.p2align 4
	.globl	AVL_set_inside_free
	.type	AVL_set_inside_free, @function
AVL_set_inside_free:
.LFB67:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L605
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	16(%rdi), %rbp
	movq	%rdi, %rbx
	testq	%rbp, %rbp
	je	.L607
	movq	16(%rbp), %r12
	testq	%r12, %r12
	je	.L608
	movq	16(%r12), %r13
	testq	%r13, %r13
	je	.L609
	movq	16(%r13), %r14
	testq	%r14, %r14
	je	.L610
	movq	16(%r14), %rdi
	call	AVL_set_inside_free
	movq	24(%r14), %rdi
	call	AVL_set_inside_free
	movq	%r14, %rdi
	call	free
.L610:
	movq	24(%r13), %r14
	testq	%r14, %r14
	je	.L611
	movq	16(%r14), %rdi
	call	AVL_set_inside_free
	movq	24(%r14), %rdi
	call	AVL_set_inside_free
	movq	%r14, %rdi
	call	free
.L611:
	movq	%r13, %rdi
	call	free
.L609:
	movq	24(%r12), %r13
	testq	%r13, %r13
	je	.L612
	movq	16(%r13), %r14
	testq	%r14, %r14
	je	.L613
	movq	16(%r14), %rdi
	call	AVL_set_inside_free
	movq	24(%r14), %rdi
	call	AVL_set_inside_free
	movq	%r14, %rdi
	call	free
.L613:
	movq	24(%r13), %r14
	testq	%r14, %r14
	je	.L614
	movq	16(%r14), %rdi
	call	AVL_set_inside_free
	movq	24(%r14), %rdi
	call	AVL_set_inside_free
	movq	%r14, %rdi
	call	free
.L614:
	movq	%r13, %rdi
	call	free
.L612:
	movq	%r12, %rdi
	call	free
.L608:
	movq	24(%rbp), %r12
	testq	%r12, %r12
	je	.L615
	movq	16(%r12), %r13
	testq	%r13, %r13
	je	.L616
	movq	16(%r13), %r14
	testq	%r14, %r14
	je	.L617
	movq	16(%r14), %rdi
	call	AVL_set_inside_free
	movq	24(%r14), %rdi
	call	AVL_set_inside_free
	movq	%r14, %rdi
	call	free
.L617:
	movq	24(%r13), %r14
	testq	%r14, %r14
	je	.L618
	movq	16(%r14), %rdi
	call	AVL_set_inside_free
	movq	24(%r14), %rdi
	call	AVL_set_inside_free
	movq	%r14, %rdi
	call	free
.L618:
	movq	%r13, %rdi
	call	free
.L616:
	movq	24(%r12), %r13
	testq	%r13, %r13
	je	.L619
	movq	16(%r13), %r14
	testq	%r14, %r14
	je	.L620
	movq	16(%r14), %rdi
	call	AVL_set_inside_free
	movq	24(%r14), %rdi
	call	AVL_set_inside_free
	movq	%r14, %rdi
	call	free
.L620:
	movq	24(%r13), %r14
	testq	%r14, %r14
	je	.L621
	movq	16(%r14), %rdi
	call	AVL_set_inside_free
	movq	24(%r14), %rdi
	call	AVL_set_inside_free
	movq	%r14, %rdi
	call	free
.L621:
	movq	%r13, %rdi
	call	free
.L619:
	movq	%r12, %rdi
	call	free
.L615:
	movq	%rbp, %rdi
	call	free
.L607:
	movq	24(%rbx), %rbp
	testq	%rbp, %rbp
	je	.L622
	movq	16(%rbp), %r12
	testq	%r12, %r12
	je	.L623
	movq	16(%r12), %r13
	testq	%r13, %r13
	je	.L624
	movq	16(%r13), %r14
	testq	%r14, %r14
	je	.L625
	movq	16(%r14), %rdi
	call	AVL_set_inside_free
	movq	24(%r14), %rdi
	call	AVL_set_inside_free
	movq	%r14, %rdi
	call	free
.L625:
	movq	24(%r13), %r14
	testq	%r14, %r14
	je	.L626
	movq	16(%r14), %rdi
	call	AVL_set_inside_free
	movq	24(%r14), %rdi
	call	AVL_set_inside_free
	movq	%r14, %rdi
	call	free
.L626:
	movq	%r13, %rdi
	call	free
.L624:
	movq	24(%r12), %r13
	testq	%r13, %r13
	je	.L627
	movq	16(%r13), %r14
	testq	%r14, %r14
	je	.L628
	movq	16(%r14), %rdi
	call	AVL_set_inside_free
	movq	24(%r14), %rdi
	call	AVL_set_inside_free
	movq	%r14, %rdi
	call	free
.L628:
	movq	24(%r13), %r14
	testq	%r14, %r14
	je	.L629
	movq	16(%r14), %rdi
	call	AVL_set_inside_free
	movq	24(%r14), %rdi
	call	AVL_set_inside_free
	movq	%r14, %rdi
	call	free
.L629:
	movq	%r13, %rdi
	call	free
.L627:
	movq	%r12, %rdi
	call	free
.L623:
	movq	24(%rbp), %r12
	testq	%r12, %r12
	je	.L630
	movq	16(%r12), %r13
	testq	%r13, %r13
	je	.L631
	movq	16(%r13), %r14
	testq	%r14, %r14
	je	.L632
	movq	16(%r14), %rdi
	call	AVL_set_inside_free
	movq	24(%r14), %rdi
	call	AVL_set_inside_free
	movq	%r14, %rdi
	call	free
.L632:
	movq	24(%r13), %r14
	testq	%r14, %r14
	je	.L633
	movq	16(%r14), %rdi
	call	AVL_set_inside_free
	movq	24(%r14), %rdi
	call	AVL_set_inside_free
	movq	%r14, %rdi
	call	free
.L633:
	movq	%r13, %rdi
	call	free
.L631:
	movq	24(%r12), %r13
	testq	%r13, %r13
	je	.L634
	movq	16(%r13), %r14
	testq	%r14, %r14
	je	.L635
	movq	16(%r14), %rdi
	call	AVL_set_inside_free
	movq	24(%r14), %rdi
	call	AVL_set_inside_free
	movq	%r14, %rdi
	call	free
.L635:
	movq	24(%r13), %r14
	testq	%r14, %r14
	je	.L636
	movq	16(%r14), %rdi
	call	AVL_set_inside_free
	movq	24(%r14), %rdi
	call	AVL_set_inside_free
	movq	%r14, %rdi
	call	free
.L636:
	movq	%r13, %rdi
	call	free
.L634:
	movq	%r12, %rdi
	call	free
.L630:
	movq	%rbp, %rdi
	call	free
.L622:
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 8
	jmp	free
	.p2align 4,,10
	.p2align 3
.L605:
	ret
	.cfi_endproc
.LFE67:
	.size	AVL_set_inside_free, .-AVL_set_inside_free
	.p2align 4
	.globl	AVL_set_inside_count
	.type	AVL_set_inside_count, @function
AVL_set_inside_count:
.LFB68:
	.cfi_startproc
	.p2align 4,,10
	.p2align 3
.L738:
	testq	%rdi, %rdi
	je	.L736
	cmpq	%rsi, (%rdi)
	jg	.L739
	jge	.L734
	movq	24(%rdi), %rdi
	jmp	.L738
	.p2align 4,,10
	.p2align 3
.L739:
	movq	16(%rdi), %rdi
	jmp	.L738
	.p2align 4,,10
	.p2align 3
.L736:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L734:
	movslq	12(%rdi), %rax
	ret
	.cfi_endproc
.LFE68:
	.size	AVL_set_inside_count, .-AVL_set_inside_count
	.p2align 4
	.globl	AVL_set_inside_minmax
	.type	AVL_set_inside_minmax, @function
AVL_set_inside_minmax:
.LFB69:
	.cfi_startproc
	movslq	%esi, %rsi
	addq	$2, %rsi
	.p2align 4,,10
	.p2align 3
.L741:
	movq	%rdi, %rax
	movq	(%rdi,%rsi,8), %rdi
	testq	%rdi, %rdi
	jne	.L741
	movq	(%rax), %rax
	ret
	.cfi_endproc
.LFE69:
	.size	AVL_set_inside_minmax, .-AVL_set_inside_minmax
	.p2align 4
	.globl	AVL_set_inside_swap
	.type	AVL_set_inside_swap, @function
AVL_set_inside_swap:
.LFB70:
	.cfi_startproc
	movq	(%rdi), %rax
	movq	(%rsi), %rdx
	movq	%rdx, (%rdi)
	movq	%rax, (%rsi)
	ret
	.cfi_endproc
.LFE70:
	.size	AVL_set_inside_swap, .-AVL_set_inside_swap
	.p2align 4
	.globl	set_main
	.type	set_main, @function
set_main:
.LFB71:
	.cfi_startproc
	cmpb	$0, set_is_init.2(%rip)
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movslq	%esi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdx, %rbx
	jne	.L745
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_pointer.1, %edi
	movb	$1, set_is_init.2(%rip)
	call	memset
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_siz.0, %edi
	call	memset
.L745:
	cmpl	$-1, %r12d
	je	.L801
	cmpl	$1, %r12d
	je	.L802
	cmpl	$2, %r12d
	je	.L803
	cmpl	$3, %r12d
	jne	.L763
	movq	set_pointer.1(,%rbp,8), %rax
	.p2align 4,,10
	.p2align 3
.L799:
	testq	%rax, %rax
	je	.L764
.L804:
	cmpq	(%rax), %rbx
	jge	.L765
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L804
.L764:
	subq	$1, set_siz.0(,%rbp,8)
.L768:
	leaq	set_pointer.1(,%rbp,8), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	AVL_set_inside_update
	.p2align 4,,10
	.p2align 3
.L775:
	xorl	%eax, %eax
.L744:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L802:
	.cfi_restore_state
	movq	set_pointer.1(,%rbp,8), %rax
	.p2align 4,,10
	.p2align 3
.L797:
	testq	%rax, %rax
	je	.L749
.L805:
	cmpq	(%rax), %rbx
	jge	.L750
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L805
.L749:
	addq	$1, set_siz.0(,%rbp,8)
.L753:
	leaq	set_pointer.1(,%rbp,8), %rdi
	movl	$2, %edx
	movq	%rbx, %rsi
	call	AVL_set_inside_update
	jmp	.L775
	.p2align 4,,10
	.p2align 3
.L750:
	jle	.L752
	movq	24(%rax), %rax
	jmp	.L797
	.p2align 4,,10
	.p2align 3
.L765:
	jle	.L767
	movq	24(%rax), %rax
	jmp	.L799
.L803:
	movq	set_pointer.1(,%rbp,8), %rax
	.p2align 4,,10
	.p2align 3
.L798:
	testq	%rax, %rax
	je	.L775
	cmpq	(%rax), %rbx
	jge	.L758
.L806:
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L775
	cmpq	(%rax), %rbx
	jl	.L806
.L758:
	jle	.L760
	movq	24(%rax), %rax
	jmp	.L798
.L801:
	movq	set_pointer.1(,%rbp,8), %rdi
	xorl	%esi, %esi
	call	AVL_set_inside_print
	jmp	.L775
.L752:
	movl	12(%rax), %eax
	testl	%eax, %eax
	jne	.L753
	jmp	.L749
	.p2align 4,,10
	.p2align 3
.L767:
	cmpl	$1, 12(%rax)
	jg	.L768
	jmp	.L764
	.p2align 4,,10
	.p2align 3
.L763:
	cmpl	$4, %r12d
	jne	.L770
	leaq	set_pointer.1(,%rbp,8), %rdi
	xorl	%edx, %edx
	movq	%rbx, %rsi
	subq	$1, set_siz.0(,%rbp,8)
	call	AVL_set_inside_update
	jmp	.L775
.L770:
	cmpl	$5, %r12d
	jne	.L771
	movq	set_pointer.1(,%rbp,8), %rbx
	movq	$0, set_siz.0(,%rbp,8)
	testq	%rbx, %rbx
	je	.L775
	movq	16(%rbx), %rdi
	call	AVL_set_inside_free
	movq	24(%rbx), %rdi
	call	AVL_set_inside_free
	movq	%rbx, %rdi
	call	free
	movq	$0, set_pointer.1(,%rbp,8)
	jmp	.L775
.L771:
	cmpl	$6, %r12d
	jne	.L772
	movq	set_siz.0(,%rbp,8), %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L772:
	.cfi_restore_state
	cmpl	$7, %r12d
	jne	.L807
	movq	set_pointer.1(,%rbp,8), %rax
	.p2align 4,,10
	.p2align 3
.L773:
	movq	%rax, %rdx
	movq	24(%rax), %rax
	testq	%rax, %rax
	jne	.L773
	movq	(%rdx), %rax
.L808:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L807:
	.cfi_restore_state
	cmpl	$8, %r12d
	jne	.L747
	movq	set_pointer.1(,%rbp,8), %rax
	.p2align 4,,10
	.p2align 3
.L774:
	movq	%rax, %rdx
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L774
	movq	(%rdx), %rax
	jmp	.L808
.L747:
	cmpl	$9, %r12d
	jne	.L775
	movq	set_pointer.1(,%rbp,8), %rax
	movq	set_pointer.1(,%rbx,8), %rdx
	movq	%rdx, set_pointer.1(,%rbp,8)
	movq	%rax, set_pointer.1(,%rbx,8)
	jmp	.L775
.L760:
	movslq	12(%rax), %rax
	jmp	.L744
	.cfi_endproc
.LFE71:
	.size	set_main, .-set_main
	.p2align 4
	.globl	set_print
	.type	set_print, @function
set_print:
.LFB72:
	.cfi_startproc
	cmpb	$0, set_is_init.2(%rip)
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movslq	%edi, %rbx
	jne	.L810
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_pointer.1, %edi
	movb	$1, set_is_init.2(%rip)
	call	memset
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_siz.0, %edi
	call	memset
.L810:
	movq	set_pointer.1(,%rbx,8), %rdi
	xorl	%esi, %esi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	AVL_set_inside_print
	.cfi_endproc
.LFE72:
	.size	set_print, .-set_print
	.p2align 4
	.globl	set_insert
	.type	set_insert, @function
set_insert:
.LFB73:
	.cfi_startproc
	movq	%rsi, %rdx
	movl	%edi, %esi
	movl	$1, %edi
	jmp	set_main
	.cfi_endproc
.LFE73:
	.size	set_insert, .-set_insert
	.p2align 4
	.globl	set_count
	.type	set_count, @function
set_count:
.LFB74:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movslq	%edi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	cmpb	$0, set_is_init.2(%rip)
	jne	.L814
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_pointer.1, %edi
	movb	$1, set_is_init.2(%rip)
	call	memset
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_siz.0, %edi
	call	memset
.L814:
	movq	set_pointer.1(,%rbp,8), %rax
	testq	%rax, %rax
	jne	.L819
	jmp	.L820
	.p2align 4,,10
	.p2align 3
.L823:
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L813
.L819:
	cmpq	(%rax), %rbx
	jl	.L823
	jle	.L818
	movq	24(%rax), %rax
	testq	%rax, %rax
	jne	.L819
.L813:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L818:
	.cfi_restore_state
	movslq	12(%rax), %rax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L820:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L813
	.cfi_endproc
.LFE74:
	.size	set_count, .-set_count
	.p2align 4
	.globl	set_erase
	.type	set_erase, @function
set_erase:
.LFB75:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movslq	%edi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	testl	%edx, %edx
	je	.L825
	cmpb	$0, set_is_init.2(%rip)
	jne	.L826
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_pointer.1, %edi
	movb	$1, set_is_init.2(%rip)
	call	memset
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_siz.0, %edi
	call	memset
.L826:
	subq	$1, set_siz.0(,%rbx,8)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	leaq	set_pointer.1(,%rbx,8), %rdi
	xorl	%edx, %edx
	movq	%rbp, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	AVL_set_inside_update
	.p2align 4,,10
	.p2align 3
.L825:
	.cfi_restore_state
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%rsi, %rdx
	movl	$3, %edi
	movl	%ebx, %esi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	set_main
	.cfi_endproc
.LFE75:
	.size	set_erase, .-set_erase
	.p2align 4
	.globl	set_clear
	.type	set_clear, @function
set_clear:
.LFB76:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movslq	%edi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	cmpb	$0, set_is_init.2(%rip)
	jne	.L829
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_pointer.1, %edi
	movb	$1, set_is_init.2(%rip)
	call	memset
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_siz.0, %edi
	call	memset
.L829:
	movq	set_pointer.1(,%rbx,8), %rbp
	movq	$0, set_siz.0(,%rbx,8)
	testq	%rbp, %rbp
	je	.L830
	movq	16(%rbp), %rdi
	call	AVL_set_inside_free
	movq	24(%rbp), %rdi
	call	AVL_set_inside_free
	movq	%rbp, %rdi
	call	free
.L830:
	movq	$0, set_pointer.1(,%rbx,8)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE76:
	.size	set_clear, .-set_clear
	.p2align 4
	.globl	set_size
	.type	set_size, @function
set_size:
.LFB77:
	.cfi_startproc
	cmpb	$0, set_is_init.2(%rip)
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movslq	%edi, %rbx
	jne	.L836
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_pointer.1, %edi
	movb	$1, set_is_init.2(%rip)
	call	memset
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_siz.0, %edi
	call	memset
.L836:
	movq	set_siz.0(,%rbx,8), %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE77:
	.size	set_size, .-set_size
	.p2align 4
	.globl	set_max
	.type	set_max, @function
set_max:
.LFB78:
	.cfi_startproc
	cmpb	$0, set_is_init.2(%rip)
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movslq	%edi, %rbx
	jne	.L839
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_pointer.1, %edi
	movb	$1, set_is_init.2(%rip)
	call	memset
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_siz.0, %edi
	call	memset
.L839:
	movq	set_pointer.1(,%rbx,8), %rax
	.p2align 4,,10
	.p2align 3
.L840:
	movq	%rax, %rdx
	movq	24(%rax), %rax
	testq	%rax, %rax
	jne	.L840
	movq	(%rdx), %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE78:
	.size	set_max, .-set_max
	.p2align 4
	.globl	set_min
	.type	set_min, @function
set_min:
.LFB79:
	.cfi_startproc
	cmpb	$0, set_is_init.2(%rip)
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movslq	%edi, %rbx
	jne	.L844
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_pointer.1, %edi
	movb	$1, set_is_init.2(%rip)
	call	memset
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_siz.0, %edi
	call	memset
.L844:
	movq	set_pointer.1(,%rbx,8), %rax
	.p2align 4,,10
	.p2align 3
.L845:
	movq	%rax, %rdx
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L845
	movq	(%rdx), %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE79:
	.size	set_min, .-set_min
	.p2align 4
	.globl	set_swap
	.type	set_swap, @function
set_swap:
.LFB80:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	cmpb	$0, set_is_init.2(%rip)
	jne	.L849
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_pointer.1, %edi
	movb	$1, set_is_init.2(%rip)
	call	memset
	movl	$4116088, %edx
	xorl	%esi, %esi
	movl	$set_siz.0, %edi
	call	memset
.L849:
	movslq	%ebx, %rax
	movq	set_pointer.1(,%rbp,8), %rcx
	movq	set_pointer.1(,%rax,8), %rdx
	movq	%rcx, set_pointer.1(,%rax,8)
	movq	%rdx, set_pointer.1(,%rbp,8)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE80:
	.size	set_swap, .-set_swap
	.p2align 4
	.globl	pushGraph
	.type	pushGraph, @function
pushGraph:
.LFB81:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	edge_cnt(,%rdi,4), %eax
	movq	gr(,%rdi,8), %rdi
	leal	2(%rax,%rax), %esi
	movslq	%esi, %rsi
	salq	$3, %rsi
	call	realloc
	movl	edge_cnt(,%rbx,4), %edx
	movq	%rax, gr(,%rbx,8)
	leal	(%rdx,%rdx), %ecx
	addl	$1, %edx
	movslq	%ecx, %rcx
	movq	%r12, (%rax,%rcx,8)
	movq	%rbp, 8(%rax,%rcx,8)
	movl	%edx, edge_cnt(,%rbx,4)
	testq	%r13, %r13
	je	.L854
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L854:
	.cfi_restore_state
	movl	edge_cnt(,%r12,4), %eax
	movq	gr(,%r12,8), %rdi
	leal	2(%rax,%rax), %esi
	movslq	%esi, %rsi
	salq	$3, %rsi
	call	realloc
	movl	edge_cnt(,%r12,4), %edx
	movq	%rax, gr(,%r12,8)
	leal	(%rdx,%rdx), %ecx
	addl	$1, %edx
	movslq	%ecx, %rcx
	movq	%rbx, (%rax,%rcx,8)
	movq	%rbp, 8(%rax,%rcx,8)
	movl	%edx, edge_cnt(,%r12,4)
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE81:
	.size	pushGraph, .-pushGraph
	.p2align 4
	.globl	HeapValue
	.type	HeapValue, @function
HeapValue:
.LFB82:
	.cfi_startproc
	movabsq	$-4611686018427387904, %rdx
	testq	%rdi, %rdi
	movabsq	$4611686018427387904, %rax
	cmovne	%rdx, %rax
	ret
	.cfi_endproc
.LFE82:
	.size	HeapValue, .-HeapValue
	.p2align 4
	.globl	Heapcmp
	.type	Heapcmp, @function
Heapcmp:
.LFB83:
	.cfi_startproc
	testq	%rdx, %rdx
	je	.L859
	xorl	%eax, %eax
	cmpq	%rsi, %rdi
	setl	%al
	ret
	.p2align 4,,10
	.p2align 3
.L859:
	xorl	%eax, %eax
	cmpq	%rsi, %rdi
	setg	%al
	ret
	.cfi_endproc
.LFE83:
	.size	Heapcmp, .-Heapcmp
	.p2align 4
	.globl	str_swap
	.type	str_swap, @function
str_swap:
.LFB84:
	.cfi_startproc
	movq	(%rsi), %rdx
	movq	8(%rsi), %rax
	movdqu	(%rdi), %xmm0
	movups	%xmm0, (%rsi)
	movq	%rdx, (%rdi)
	movq	%rax, 8(%rdi)
	ret
	.cfi_endproc
.LFE84:
	.size	str_swap, .-str_swap
	.p2align 4
	.globl	graph_pushHeap
	.type	graph_pushHeap, @function
graph_pushHeap:
.LFB85:
	.cfi_startproc
	movq	%rsi, %rcx
	movq	%rsi, %rax
	salq	$4, %rcx
	movq	%rdi, heap+8(%rcx)
	testq	%rsi, %rsi
	je	.L862
	cmpq	$1, %rdx
	jne	.L864
	jmp	.L867
	.p2align 4,,10
	.p2align 3
.L878:
	movq	%rdx, %rax
	salq	$4, %rax
	movq	heap+8(%rax), %rdi
	movq	%rdx, %rax
.L867:
	leaq	-1(%rax), %rcx
	movq	%rcx, %rdx
	shrq	$63, %rdx
	addq	%rcx, %rdx
	sarq	%rdx
	movq	%rdx, %rcx
	salq	$4, %rcx
	cmpq	heap+8(%rcx), %rdi
	jle	.L865
	salq	$4, %rax
	movq	heap(%rcx), %rdi
	movq	heap+8(%rcx), %rsi
	movdqa	heap(%rax), %xmm0
	movaps	%xmm0, heap(%rcx)
	movq	%rdi, heap(%rax)
	movq	%rsi, heap+8(%rax)
.L865:
	testq	%rdx, %rdx
	jne	.L878
.L862:
	ret
	.p2align 4,,10
	.p2align 3
.L879:
	movq	%rdx, %rax
	salq	$4, %rax
	movq	heap+8(%rax), %rdi
	movq	%rdx, %rax
.L864:
	leaq	-1(%rax), %rcx
	movq	%rcx, %rdx
	shrq	$63, %rdx
	addq	%rcx, %rdx
	sarq	%rdx
	movq	%rdx, %rcx
	salq	$4, %rcx
	cmpq	%rdi, heap+8(%rcx)
	jle	.L868
	salq	$4, %rax
	movq	heap(%rcx), %rdi
	movq	heap+8(%rcx), %rsi
	movdqa	heap(%rax), %xmm1
	movaps	%xmm1, heap(%rcx)
	movq	%rdi, heap(%rax)
	movq	%rsi, heap+8(%rax)
.L868:
	testq	%rdx, %rdx
	jne	.L879
	ret
	.cfi_endproc
.LFE85:
	.size	graph_pushHeap, .-graph_pushHeap
	.p2align 4
	.globl	graph_popHeap
	.type	graph_popHeap, @function
graph_popHeap:
.LFB86:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	testq	%rsi, %rsi
	jne	.L904
	leaq	-1(%rdi), %rdx
	movq	%rsi, %rax
	movabsq	$4611686018427387904, %rbx
	salq	$4, %rdx
	movq	%rbx, heap+8(%rip)
	movdqa	heap(%rip), %xmm2
	movq	heap(%rdx), %rsi
	movq	heap+8(%rdx), %rcx
	movaps	%xmm2, heap(%rdx)
	movq	%rsi, heap(%rip)
	movq	%rcx, heap+8(%rip)
	cmpq	$1, %rdi
	jg	.L905
.L880:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L905:
	.cfi_restore_state
	movl	$1, %ecx
	jmp	.L891
	.p2align 4,,10
	.p2align 3
.L883:
	movq	%rax, %r10
	salq	$5, %rdx
	movq	%rcx, %r9
	salq	$4, %r10
	leaq	heap(%rdx), %rbx
	salq	$4, %r9
	leaq	heap(%r10), %rbp
	movq	8(%rbx), %r11
	movq	heap+8(%r9), %r9
	movq	8(%rbp), %r8
	cmpq	%r8, %r11
	jge	.L888
	cmpq	%r9, %r11
	jge	.L888
	movq	8(%rbx), %rax
	movq	heap(%rdx), %rcx
	movdqa	heap(%r10), %xmm3
	movaps	%xmm3, heap(%rdx)
	movq	%rcx, heap(%r10)
	movq	%rax, 8(%rbp)
	movq	%rsi, %rax
	.p2align 4,,10
	.p2align 3
.L885:
	leaq	1(%rax,%rax), %rcx
	cmpq	%rcx, %rdi
	jle	.L880
.L891:
	leaq	1(%rax), %rdx
	leaq	(%rdx,%rdx), %rsi
	cmpq	%rsi, %rdi
	jg	.L883
	movq	%rcx, %rdx
	salq	$4, %rdx
	movq	heap+8(%rdx), %r9
	movq	%rax, %rdx
	salq	$4, %rdx
	movq	heap+8(%rdx), %r8
.L888:
	cmpq	%r8, %r9
	jge	.L880
	movq	%rcx, %rdx
	salq	$4, %rax
	salq	$4, %rdx
	movdqa	heap(%rax), %xmm0
	movq	heap(%rdx), %r8
	movq	heap+8(%rdx), %rsi
	movaps	%xmm0, heap(%rdx)
	movq	%r8, heap(%rax)
	movq	%rsi, heap+8(%rax)
	movq	%rcx, %rax
	jmp	.L885
.L904:
	movabsq	$-4611686018427387904, %rax
	movq	%rax, heap+8(%rip)
	leaq	-1(%rdi), %rax
	movdqa	heap(%rip), %xmm5
	salq	$4, %rax
	movq	heap(%rax), %rcx
	movq	heap+8(%rax), %rdx
	movaps	%xmm5, heap(%rax)
	movq	%rcx, heap(%rip)
	movq	%rdx, heap+8(%rip)
	cmpq	$1, %rdi
	jle	.L880
	xorl	%ecx, %ecx
	movl	$1, %esi
	jmp	.L896
	.p2align 4,,10
	.p2align 3
.L906:
	movq	%rcx, %r10
	salq	$5, %rax
	movq	%rsi, %r9
	salq	$4, %r10
	movq	heap+8(%rax), %rbp
	salq	$4, %r9
	movq	heap+8(%r10), %r8
	movq	heap+8(%r9), %r9
	cmpq	%r8, %rbp
	jle	.L894
	cmpq	%r9, %rbp
	jle	.L894
	movq	heap(%rax), %rsi
	movq	%rdx, %rcx
	movdqa	heap(%r10), %xmm4
	movaps	%xmm4, heap(%rax)
	movq	%rsi, heap(%r10)
	movq	%rbp, heap+8(%r10)
	.p2align 4,,10
	.p2align 3
.L895:
	leaq	1(%rcx,%rcx), %rsi
	cmpq	%rdi, %rsi
	jge	.L880
.L896:
	leaq	1(%rcx), %rax
	leaq	(%rax,%rax), %rdx
	cmpq	%rdi, %rdx
	jl	.L906
	movq	%rsi, %rax
	salq	$4, %rax
	movq	heap+8(%rax), %r9
	movq	%rcx, %rax
	salq	$4, %rax
	movq	heap+8(%rax), %r8
.L894:
	cmpq	%r8, %r9
	jle	.L880
	movq	%rcx, %rax
	movq	%rsi, %rdx
	salq	$4, %rdx
	salq	$4, %rax
	movq	heap+8(%rdx), %rcx
	movq	heap(%rdx), %r8
	movdqa	heap(%rax), %xmm1
	movaps	%xmm1, heap(%rdx)
	movq	%rcx, heap+8(%rax)
	movq	%rsi, %rcx
	movq	%r8, heap(%rax)
	jmp	.L895
	.cfi_endproc
.LFE86:
	.size	graph_popHeap, .-graph_popHeap
	.p2align 4
	.globl	dijkstra
	.type	dijkstra, @function
dijkstra:
.LFB87:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$ans+16, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movdqa	.LC7(%rip), %xmm0
	movaps	%xmm0, ans(%rip)
	.p2align 4,,10
	.p2align 3
.L908:
	movaps	%xmm0, (%rax)
	addq	$32, %rax
	movaps	%xmm0, -16(%rax)
	cmpq	$ans+920912, %rax
	jne	.L908
	movl	$115115, %edx
	xorl	%esi, %esi
	movl	$is_conf, %edi
	movabsq	$4611686018427387904, %rax
	movq	%rax, ans+920912(%rip)
	call	memset
	movl	edge_cnt(,%rbx,4), %ebp
	movq	$0, ans(,%rbx,8)
	movb	$1, is_conf(%rbx)
	testl	%ebp, %ebp
	jle	.L907
	movq	gr(,%rbx,8), %r8
	movslq	%ebp, %r9
	movl	%ebx, %r10d
	xorl	%edi, %edi
	movl	%ebx, heap(%rip)
	xorl	%r11d, %r11d
	movq	(%r8), %rax
	movq	8(%r8), %rdx
	movl	%eax, heap+4(%rip)
	cltq
	movq	%rdx, ans(,%rax,8)
	movq	%rdx, heap+8(%rip)
	.p2align 4,,10
	.p2align 3
.L910:
	addq	$1, %r11
	addq	$16, %rdi
	cmpq	%r9, %r11
	je	.L913
	movq	(%r8,%rdi), %rax
	movq	8(%r8,%rdi), %rsi
	movl	%r10d, heap(%rdi)
	movq	%r11, %rdx
	movl	%eax, heap+4(%rdi)
	cltq
	movq	%rsi, ans(,%rax,8)
	movq	%rsi, heap+8(%rdi)
	.p2align 4,,10
	.p2align 3
.L912:
	leaq	-1(%rdx), %rcx
	movq	%rcx, %rax
	shrq	$63, %rax
	addq	%rcx, %rax
	sarq	%rax
	movq	%rax, %rcx
	salq	$4, %rcx
	cmpq	%rsi, heap+8(%rcx)
	jle	.L911
	salq	$4, %rdx
	movq	heap+8(%rcx), %rsi
	movq	heap(%rcx), %xmm0
	movdqa	heap(%rdx), %xmm2
	movaps	%xmm2, heap(%rcx)
	movq	%rsi, heap+8(%rdx)
	movq	%xmm0, heap(%rdx)
.L911:
	testq	%rax, %rax
	je	.L910
	movq	%rax, %rdx
	salq	$4, %rdx
	movq	heap+8(%rdx), %rsi
	movq	%rax, %rdx
	jmp	.L912
.L923:
	movl	%ebp, %edi
	.p2align 4,,10
	.p2align 3
.L916:
	leal	-1(%rdi), %ebp
	movslq	%edi, %rdi
	call	graph_popHeap.constprop.0
.L915:
	testl	%ebp, %ebp
	je	.L907
.L913:
	movslq	heap+4(%rip), %rdx
	cmpb	$0, is_conf(%rdx)
	movq	%rdx, %rcx
	jne	.L938
	movq	heap+8(%rip), %rax
	movslq	edge_cnt(,%rdx,4), %r9
	movb	$1, is_conf(%rdx)
	movq	%rax, ans(,%rdx,8)
	testl	%r9d, %r9d
	jle	.L923
	salq	$4, %r9
	movl	%ebp, %edi
	xorl	%r8d, %r8d
	jmp	.L921
	.p2align 4,,10
	.p2align 3
.L917:
	addq	$16, %r8
	cmpq	%r9, %r8
	je	.L916
	movslq	heap+4(%rip), %rdx
	movq	ans(,%rdx,8), %rax
	movq	%rdx, %rcx
.L921:
	movq	gr(,%rdx,8), %rdx
	movq	(%rdx,%r8), %rsi
	addq	8(%rdx,%r8), %rax
	cmpq	%rax, ans(,%rsi,8)
	jle	.L917
	movslq	%edi, %rdx
	addl	$1, %edi
	movq	%rdx, %r10
	salq	$4, %r10
	movl	%esi, heap+4(%r10)
	leaq	heap(%r10), %rax
	movl	%ecx, heap(%r10)
	movslq	heap+4(%rip), %rcx
	movq	gr(,%rcx,8), %r10
	movq	ans(,%rcx,8), %rsi
	addq	8(%r10,%r8), %rsi
	movq	%rsi, 8(%rax)
	testq	%rdx, %rdx
	jne	.L920
	jmp	.L917
	.p2align 4,,10
	.p2align 3
.L939:
	movq	%rax, %rdx
	salq	$4, %rdx
	movq	heap+8(%rdx), %rsi
	movq	%rax, %rdx
.L920:
	leaq	-1(%rdx), %rcx
	movq	%rcx, %rax
	shrq	$63, %rax
	addq	%rcx, %rax
	sarq	%rax
	movq	%rax, %rcx
	salq	$4, %rcx
	cmpq	%rsi, heap+8(%rcx)
	jle	.L919
	salq	$4, %rdx
	movq	heap(%rcx), %r11
	movq	heap+8(%rcx), %rsi
	movdqa	heap(%rdx), %xmm1
	movaps	%xmm1, heap(%rcx)
	movq	%r11, heap(%rdx)
	movq	%rsi, heap+8(%rdx)
.L919:
	testq	%rax, %rax
	jne	.L939
	jmp	.L917
	.p2align 4,,10
	.p2align 3
.L907:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L938:
	.cfi_restore_state
	movslq	%ebp, %rdi
	leal	-1(%rbp), %ebx
	call	graph_popHeap.constprop.0
	movl	%ebx, %ebp
	jmp	.L915
	.cfi_endproc
.LFE87:
	.size	dijkstra, .-dijkstra
	.section	.rodata.str1.1
.LC8:
	.string	"-1"
.LC9:
	.string	"%lld\n"
	.text
	.p2align 4
	.globl	solve
	.type	solve, @function
solve:
.LFB88:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$.LC1, %edi
	xorl	%eax, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$72, %rsp
	.cfi_def_cfa_offset 96
	leaq	24(%rsp), %rsi
	call	__isoc99_scanf
	xorl	%eax, %eax
	leaq	32(%rsp), %rsi
	movl	$.LC1, %edi
	call	__isoc99_scanf
	cmpq	$0, 32(%rsp)
	jle	.L941
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L942:
	leaq	40(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addq	$1, %rbp
	call	__isoc99_scanf
	leaq	48(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	leaq	56(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movq	40(%rsp), %rax
	leaq	-1(%rax), %rbx
	movq	48(%rsp), %rax
	movq	gr(,%rbx,8), %rdi
	movq	%rbx, 40(%rsp)
	subq	$1, %rax
	movq	%rax, 48(%rsp)
	movq	%rax, %xmm0
	movl	edge_cnt(,%rbx,4), %eax
	movhps	56(%rsp), %xmm0
	leal	2(%rax,%rax), %esi
	movaps	%xmm0, (%rsp)
	movslq	%esi, %rsi
	salq	$3, %rsi
	call	realloc
	movl	edge_cnt(,%rbx,4), %edx
	movdqa	(%rsp), %xmm0
	movq	%rax, gr(,%rbx,8)
	leal	(%rdx,%rdx), %ecx
	addl	$1, %edx
	movslq	%ecx, %rcx
	movups	%xmm0, (%rax,%rcx,8)
	movl	%edx, edge_cnt(,%rbx,4)
	cmpq	%rbp, 32(%rsp)
	jg	.L942
.L941:
	cmpq	$1, 24(%rsp)
	jle	.L943
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L944:
	movq	%rbx, %rbp
	addq	$1, %rbx
	movl	edge_cnt(,%rbx,4), %eax
	movq	gr(,%rbx,8), %rdi
	leal	2(%rax,%rax), %esi
	movslq	%esi, %rsi
	salq	$3, %rsi
	call	realloc
	movl	edge_cnt(,%rbx,4), %edx
	movq	%rax, gr(,%rbx,8)
	leal	(%rdx,%rdx), %ecx
	addl	$1, %edx
	movslq	%ecx, %rcx
	movq	%rbp, (%rax,%rcx,8)
	movq	$0, 8(%rax,%rcx,8)
	movq	24(%rsp), %rax
	movl	%edx, edge_cnt(,%rbx,4)
	subq	$1, %rax
	cmpq	%rax, %rbx
	jl	.L944
.L943:
	xorl	%edi, %edi
	call	dijkstra
	movq	24(%rsp), %rax
	movq	ans-8(,%rax,8), %rsi
	movabsq	$4611686018427387904, %rax
	cmpq	%rax, %rsi
	je	.L950
	movl	$.LC9, %edi
	xorl	%eax, %eax
	call	printf
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L950:
	.cfi_restore_state
	movl	$.LC8, %edi
	call	puts
	addq	$72, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE88:
	.size	solve, .-solve
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB89:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	call	solve
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE89:
	.size	main, .-main
	.local	set_siz.0
	.comm	set_siz.0,4116088,32
	.local	set_pointer.1
	.comm	set_pointer.1,4116088,32
	.local	set_is_init.2
	.comm	set_is_init.2,1,1
	.globl	heap
	.bss
	.align 32
	.type	heap, @object
	.size	heap, 4018464
heap:
	.zero	4018464
	.globl	is_conf
	.align 32
	.type	is_conf, @object
	.size	is_conf, 115115
is_conf:
	.zero	115115
	.globl	ans
	.align 32
	.type	ans, @object
	.size	ans, 920920
ans:
	.zero	920920
	.globl	gr
	.align 32
	.type	gr, @object
	.size	gr, 920920
gr:
	.zero	920920
	.globl	edge_cnt
	.align 32
	.type	edge_cnt, @object
	.size	edge_cnt, 460460
edge_cnt:
	.zero	460460
	.globl	num_of_inv
	.data
	.align 8
	.type	num_of_inv, @object
	.size	num_of_inv, 8
num_of_inv:
	.quad	2000010
	.globl	is_mf_made
	.bss
	.align 8
	.type	is_mf_made, @object
	.size	is_mf_made, 8
is_mf_made:
	.zero	8
	.globl	is_minv_made
	.align 8
	.type	is_minv_made, @object
	.size	is_minv_made, 8
is_minv_made:
	.zero	8
	.globl	finv_arr
	.align 8
	.type	finv_arr, @object
	.size	finv_arr, 8
finv_arr:
	.zero	8
	.globl	inv_arr
	.align 8
	.type	inv_arr, @object
	.size	inv_arr, 8
inv_arr:
	.zero	8
	.globl	mf_arr
	.align 8
	.type	mf_arr, @object
	.size	mf_arr, 8
mf_arr:
	.zero	8
	.globl	is_factor_prepared
	.align 8
	.type	is_factor_prepared, @object
	.size	is_factor_prepared, 8
is_factor_prepared:
	.zero	8
	.globl	fac_cnt
	.align 8
	.type	fac_cnt, @object
	.size	fac_cnt, 8
fac_cnt:
	.zero	8
	.globl	factors
	.align 16
	.type	factors, @object
	.size	factors, 16
factors:
	.zero	16
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.quad	1
	.quad	1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.align 8
.LC4:
	.long	0
	.long	1
	.section	.rodata.cst16
	.align 16
.LC7:
	.quad	4611686018427387904
	.quad	4611686018427387904
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
