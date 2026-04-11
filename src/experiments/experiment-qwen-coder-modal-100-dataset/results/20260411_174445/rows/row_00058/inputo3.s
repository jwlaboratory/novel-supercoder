	.file	"inputC.c"
	.text
	.p2align 4
	.globl	max
	.type	max, @function
max:
.LFB8:
	.cfi_startproc
	cmpl	%esi, %edi
	movl	%esi, %eax
	cmovge	%edi, %eax
	ret
	.cfi_endproc
.LFE8:
	.size	max, .-max
	.p2align 4
	.globl	min
	.type	min, @function
min:
.LFB9:
	.cfi_startproc
	cmpl	%esi, %edi
	movl	%esi, %eax
	cmovle	%edi, %eax
	ret
	.cfi_endproc
.LFE9:
	.size	min, .-min
	.p2align 4
	.globl	zt
	.type	zt, @function
zt:
.LFB10:
	.cfi_startproc
	cmpl	%esi, %edi
	movl	%esi, %eax
	cmovge	%edi, %eax
	cmovg	%esi, %edi
	subl	%edi, %eax
	ret
	.cfi_endproc
.LFE10:
	.size	zt, .-zt
	.p2align 4
	.globl	round
	.type	round, @function
round:
.LFB11:
	.cfi_startproc
	movl	%edi, %eax
	cltd
	idivl	%esi
	addl	%edx, %edx
	cmpl	%esi, %edx
	setge	%dl
	movzbl	%dl, %edx
	addl	%edx, %eax
	ret
	.cfi_endproc
.LFE11:
	.size	round, .-round
	.p2align 4
	.globl	ceil
	.type	ceil, @function
ceil:
.LFB12:
	.cfi_startproc
	movl	%edi, %eax
	cltd
	idivl	%esi
	cmpl	$1, %edx
	sbbl	$-1, %eax
	ret
	.cfi_endproc
.LFE12:
	.size	ceil, .-ceil
	.p2align 4
	.globl	gcd
	.type	gcd, @function
gcd:
.LFB13:
	.cfi_startproc
	movl	%edi, %eax
	movl	%esi, %edx
	testl	%esi, %esi
	je	.L14
	.p2align 4,,10
	.p2align 3
.L13:
	movl	%edx, %ecx
	cltd
	idivl	%ecx
	movl	%ecx, %eax
	testl	%edx, %edx
	jne	.L13
	movl	%ecx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	movl	%edi, %ecx
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE13:
	.size	gcd, .-gcd
	.p2align 4
	.globl	lcm
	.type	lcm, @function
lcm:
.LFB14:
	.cfi_startproc
	testl	%esi, %esi
	je	.L19
	movl	%esi, %edx
	movl	%edi, %ecx
	.p2align 4,,10
	.p2align 3
.L18:
	movl	%ecx, %eax
	movl	%edx, %ecx
	cltd
	idivl	%ecx
	testl	%edx, %edx
	jne	.L18
	movl	%edi, %eax
	cltd
	idivl	%ecx
	imull	%esi, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE14:
	.size	lcm, .-lcm
	.p2align 4
	.globl	nCr
	.type	nCr, @function
nCr:
.LFB15:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L24
	addl	$1, %esi
	movl	$1, %eax
	movl	$1, %ecx
	addl	$1, %edi
	.p2align 4,,10
	.p2align 3
.L23:
	movl	%edi, %edx
	subl	%ecx, %edx
	imull	%edx, %eax
	cltd
	idivl	%ecx
	addl	$1, %ecx
	cmpl	%esi, %ecx
	jne	.L23
	ret
	.p2align 4,,10
	.p2align 3
.L24:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE15:
	.size	nCr, .-nCr
	.p2align 4
	.globl	fact
	.type	fact, @function
fact:
.LFB16:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L29
	leal	1(%rdi), %esi
	andl	$1, %edi
	movl	$1, %edx
	movl	$1, %eax
	je	.L28
	movl	$2, %eax
	cmpl	%esi, %eax
	je	.L26
	.p2align 4,,10
	.p2align 3
.L28:
	imull	%eax, %edx
	leal	1(%rax), %ecx
	addl	$2, %eax
	imull	%ecx, %edx
	cmpl	%esi, %eax
	jne	.L28
.L26:
	movl	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L29:
	movl	$1, %edx
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE16:
	.size	fact, .-fact
	.p2align 4
	.globl	pow
	.type	pow, @function
pow:
.LFB17:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L39
	leal	1(%rsi), %ecx
	andl	$1, %esi
	movl	$1, %eax
	movl	$1, %edx
	je	.L38
	movl	$2, %edx
	movl	%edi, %eax
	cmpl	%ecx, %edx
	je	.L46
	.p2align 4,,10
	.p2align 3
.L38:
	imull	%edi, %eax
	addl	$2, %edx
	imull	%edi, %eax
	cmpl	%ecx, %edx
	jne	.L38
	ret
	.p2align 4,,10
	.p2align 3
.L39:
	movl	$1, %eax
	ret
.L46:
	ret
	.cfi_endproc
.LFE17:
	.size	pow, .-pow
	.p2align 4
	.globl	llmax
	.type	llmax, @function
llmax:
.LFB18:
	.cfi_startproc
	cmpq	%rsi, %rdi
	movq	%rsi, %rax
	cmovge	%rdi, %rax
	ret
	.cfi_endproc
.LFE18:
	.size	llmax, .-llmax
	.p2align 4
	.globl	llmin
	.type	llmin, @function
llmin:
.LFB19:
	.cfi_startproc
	cmpq	%rsi, %rdi
	movq	%rsi, %rax
	cmovle	%rdi, %rax
	ret
	.cfi_endproc
.LFE19:
	.size	llmin, .-llmin
	.p2align 4
	.globl	llzt
	.type	llzt, @function
llzt:
.LFB20:
	.cfi_startproc
	cmpq	%rsi, %rdi
	movq	%rsi, %rax
	cmovge	%rdi, %rax
	cmovg	%rsi, %rdi
	subq	%rdi, %rax
	ret
	.cfi_endproc
.LFE20:
	.size	llzt, .-llzt
	.p2align 4
	.globl	llround
	.type	llround, @function
llround:
.LFB21:
	.cfi_startproc
	movq	%rdi, %rax
	cqto
	idivq	%rsi
	addq	%rdx, %rdx
	cmpq	%rsi, %rdx
	setge	%dl
	movzbl	%dl, %edx
	addq	%rdx, %rax
	ret
	.cfi_endproc
.LFE21:
	.size	llround, .-llround
	.p2align 4
	.globl	llceil
	.type	llceil, @function
llceil:
.LFB22:
	.cfi_startproc
	movq	%rdi, %rax
	cqto
	idivq	%rsi
	cmpq	$1, %rdx
	sbbq	$-1, %rax
	ret
	.cfi_endproc
.LFE22:
	.size	llceil, .-llceil
	.p2align 4
	.globl	llgcd
	.type	llgcd, @function
llgcd:
.LFB23:
	.cfi_startproc
	movq	%rdi, %rax
	movq	%rsi, %rdx
	testq	%rsi, %rsi
	je	.L59
	.p2align 4,,10
	.p2align 3
.L58:
	movq	%rdx, %rcx
	cqto
	idivq	%rcx
	movq	%rcx, %rax
	testq	%rdx, %rdx
	jne	.L58
	movq	%rcx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L59:
	movq	%rdi, %rcx
	movq	%rcx, %rax
	ret
	.cfi_endproc
.LFE23:
	.size	llgcd, .-llgcd
	.p2align 4
	.globl	lllcm
	.type	lllcm, @function
lllcm:
.LFB24:
	.cfi_startproc
	testq	%rsi, %rsi
	je	.L64
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	.p2align 4,,10
	.p2align 3
.L63:
	movq	%rcx, %rax
	movq	%rdx, %rcx
	cqto
	idivq	%rcx
	testq	%rdx, %rdx
	jne	.L63
	movq	%rdi, %rax
	cqto
	idivq	%rcx
	imulq	%rsi, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L64:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE24:
	.size	lllcm, .-lllcm
	.p2align 4
	.globl	llnCr
	.type	llnCr, @function
llnCr:
.LFB25:
	.cfi_startproc
	testq	%rsi, %rsi
	jle	.L69
	addq	$1, %rsi
	movl	$1, %eax
	movl	$1, %ecx
	addq	$1, %rdi
	.p2align 4,,10
	.p2align 3
.L68:
	movq	%rdi, %rdx
	subq	%rcx, %rdx
	imulq	%rdx, %rax
	cqto
	idivq	%rcx
	addq	$1, %rcx
	cmpq	%rsi, %rcx
	jne	.L68
	ret
	.p2align 4,,10
	.p2align 3
.L69:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE25:
	.size	llnCr, .-llnCr
	.p2align 4
	.globl	llfact
	.type	llfact, @function
llfact:
.LFB26:
	.cfi_startproc
	testq	%rdi, %rdi
	jle	.L74
	leaq	1(%rdi), %rsi
	andl	$1, %edi
	movl	$1, %edx
	movl	$1, %eax
	je	.L73
	movl	$2, %eax
	cmpq	%rsi, %rax
	je	.L71
	.p2align 4,,10
	.p2align 3
.L73:
	imulq	%rax, %rdx
	leaq	1(%rax), %rcx
	addq	$2, %rax
	imulq	%rcx, %rdx
	cmpq	%rsi, %rax
	jne	.L73
.L71:
	movq	%rdx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L74:
	movl	$1, %edx
	movq	%rdx, %rax
	ret
	.cfi_endproc
.LFE26:
	.size	llfact, .-llfact
	.p2align 4
	.globl	llpow
	.type	llpow, @function
llpow:
.LFB27:
	.cfi_startproc
	testq	%rsi, %rsi
	jle	.L84
	leaq	1(%rsi), %rcx
	andl	$1, %esi
	movl	$1, %eax
	movl	$1, %edx
	je	.L83
	movl	$2, %edx
	movq	%rdi, %rax
	cmpq	%rcx, %rdx
	je	.L91
	.p2align 4,,10
	.p2align 3
.L83:
	imulq	%rdi, %rax
	addq	$2, %rdx
	imulq	%rdi, %rax
	cmpq	%rcx, %rdx
	jne	.L83
	ret
	.p2align 4,,10
	.p2align 3
.L84:
	movl	$1, %eax
	ret
.L91:
	ret
	.cfi_endproc
.LFE27:
	.size	llpow, .-llpow
	.p2align 4
	.globl	dbmax
	.type	dbmax, @function
dbmax:
.LFB28:
	.cfi_startproc
	maxsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE28:
	.size	dbmax, .-dbmax
	.p2align 4
	.globl	dbmin
	.type	dbmin, @function
dbmin:
.LFB29:
	.cfi_startproc
	minsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE29:
	.size	dbmin, .-dbmin
	.p2align 4
	.globl	dbzt
	.type	dbzt, @function
dbzt:
.LFB30:
	.cfi_startproc
	comisd	%xmm1, %xmm0
	ja	.L100
	minsd	%xmm1, %xmm0
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L100:
	movapd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	movapd	%xmm2, %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE30:
	.size	dbzt, .-dbzt
	.p2align 4
	.globl	sortfncsj
	.type	sortfncsj, @function
sortfncsj:
.LFB31:
	.cfi_startproc
	movl	(%rsi), %edx
	movl	$1, %eax
	cmpl	%edx, (%rdi)
	jg	.L101
	setne	%al
	movzbl	%al, %eax
	negl	%eax
.L101:
	ret
	.cfi_endproc
.LFE31:
	.size	sortfncsj, .-sortfncsj
	.p2align 4
	.globl	sortfnckj
	.type	sortfnckj, @function
sortfnckj:
.LFB32:
	.cfi_startproc
	movl	(%rsi), %edx
	movl	$1, %eax
	cmpl	%edx, (%rdi)
	jl	.L104
	setne	%al
	movzbl	%al, %eax
	negl	%eax
.L104:
	ret
	.cfi_endproc
.LFE32:
	.size	sortfnckj, .-sortfnckj
	.p2align 4
	.globl	llsortfncsj
	.type	llsortfncsj, @function
llsortfncsj:
.LFB33:
	.cfi_startproc
	movq	(%rsi), %rdx
	movl	$1, %eax
	cmpq	%rdx, (%rdi)
	jg	.L107
	setne	%al
	movzbl	%al, %eax
	negl	%eax
.L107:
	ret
	.cfi_endproc
.LFE33:
	.size	llsortfncsj, .-llsortfncsj
	.p2align 4
	.globl	llsortfnckj
	.type	llsortfnckj, @function
llsortfnckj:
.LFB34:
	.cfi_startproc
	movq	(%rsi), %rdx
	movl	$1, %eax
	cmpq	%rdx, (%rdi)
	jl	.L110
	setne	%al
	movzbl	%al, %eax
	negl	%eax
.L110:
	ret
	.cfi_endproc
.LFE34:
	.size	llsortfnckj, .-llsortfnckj
	.p2align 4
	.globl	dbsortfncsj
	.type	dbsortfncsj, @function
dbsortfncsj:
.LFB35:
	.cfi_startproc
	movsd	(%rdi), %xmm1
	movsd	(%rsi), %xmm0
	movl	$1, %eax
	comisd	%xmm0, %xmm1
	ja	.L113
	xorl	%edx, %edx
	ucomisd	%xmm0, %xmm1
	setp	%dl
	cmove	%edx, %eax
	negl	%eax
.L113:
	ret
	.cfi_endproc
.LFE35:
	.size	dbsortfncsj, .-dbsortfncsj
	.p2align 4
	.globl	dbsortfnckj
	.type	dbsortfnckj, @function
dbsortfnckj:
.LFB36:
	.cfi_startproc
	movsd	(%rdi), %xmm1
	movsd	(%rsi), %xmm0
	movl	$1, %eax
	comisd	%xmm1, %xmm0
	ja	.L116
	xorl	%edx, %edx
	ucomisd	%xmm0, %xmm1
	setp	%dl
	cmove	%edx, %eax
	negl	%eax
.L116:
	ret
	.cfi_endproc
.LFE36:
	.size	dbsortfnckj, .-dbsortfnckj
	.p2align 4
	.globl	strsortfncsj
	.type	strsortfncsj, @function
strsortfncsj:
.LFB37:
	.cfi_startproc
	jmp	strcmp
	.cfi_endproc
.LFE37:
	.size	strsortfncsj, .-strsortfncsj
	.p2align 4
	.globl	strsortfnckj
	.type	strsortfnckj, @function
strsortfnckj:
.LFB38:
	.cfi_startproc
	movq	%rdi, %rax
	movq	%rsi, %rdi
	movq	%rax, %rsi
	jmp	strcmp
	.cfi_endproc
.LFE38:
	.size	strsortfnckj, .-strsortfnckj
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"? %s\n"
.LC2:
	.string	"! "
.LC3:
	.string	"(%d,%d)"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$.LC0, %edi
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
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$524328, %rsp
	.cfi_def_cfa_offset 524384
	leaq	24(%rsp), %rsi
	movl	$0, 28(%rsp)
	call	__isoc99_scanf
	movl	24(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L122
	leaq	262176(%rsp), %rbx
	movl	%ecx, %edx
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	movl	$48, %esi
	movq	%rbx, %rdi
	movl	%ecx, 12(%rsp)
	movq	%rbx, %rbp
	call	memset
	movslq	12(%rsp), %rax
	movb	$0, 262176(%rsp,%rax)
	movq	%rax, %rcx
	.p2align 4,,10
	.p2align 3
.L128:
	movl	%r13d, %r14d
	addl	$1, %r13d
	cmpl	%ecx, %r13d
	jge	.L123
	movl	$1, %edx
	subq	%rbx, %rdx
	leaq	(%rdx,%rbp), %r15
	.p2align 4,,10
	.p2align 3
.L127:
	movb	$49, 0(%rbp)
	movq	%rbx, %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	movb	$49, (%rbx,%r15)
	call	printf
	movq	stdout(%rip), %rdi
	call	fflush
	movb	$48, 0(%rbp)
	xorl	%eax, %eax
	leaq	28(%rsp), %rsi
	movl	$.LC0, %edi
	movb	$48, (%rbx,%r15)
	call	__isoc99_scanf
	cmpl	$1, 28(%rsp)
	je	.L139
	movl	24(%rsp), %ecx
	addq	$1, %r15
	cmpl	%r15d, %ecx
	jg	.L127
	addq	$1, %rbp
	cmpl	%ecx, %r13d
	jl	.L128
	.p2align 4,,10
	.p2align 3
.L123:
	movl	$.LC2, %edi
	xorl	%eax, %eax
	movl	%r12d, %ebp
	movl	$1, %ebx
	call	printf
	testl	%r12d, %r12d
	jg	.L132
	jmp	.L137
	.p2align 4,,10
	.p2align 3
.L140:
	movl	$32, %edi
	addq	$1, %rbx
	call	putchar
	cmpl	%ebx, %r12d
	jl	.L137
.L132:
	movl	131104(%rsp,%rbx,4), %edx
	movl	32(%rsp,%rbx,4), %esi
	xorl	%eax, %eax
	movl	$.LC3, %edi
	call	printf
	cmpq	%rbx, %rbp
	jne	.L140
	movl	$10, %edi
	call	putchar
.L137:
	addq	$524328, %rsp
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
.L139:
	.cfi_restore_state
	addl	$1, %r12d
	movl	24(%rsp), %ecx
	movslq	%r12d, %rax
	movl	%r15d, 131104(%rsp,%rax,4)
	addq	$1, %r15
	movl	%r14d, 32(%rsp,%rax,4)
	cmpl	%r15d, %ecx
	jg	.L127
	addq	$1, %rbp
	cmpl	%ecx, %r13d
	jl	.L128
	jmp	.L123
.L122:
	movslq	%ecx, %rcx
	movl	$.LC2, %edi
	xorl	%eax, %eax
	movb	$0, 262176(%rsp,%rcx)
	call	printf
	jmp	.L137
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
