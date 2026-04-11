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
	.globl	nHr
	.type	nHr, @function
nHr:
.LFB16:
	.cfi_startproc
	addl	%esi, %edi
	testl	%esi, %esi
	jle	.L29
	addl	$1, %esi
	movl	$1, %eax
	movl	$1, %ecx
	.p2align 4,,10
	.p2align 3
.L28:
	movl	%edi, %edx
	subl	%ecx, %edx
	imull	%edx, %eax
	cltd
	idivl	%ecx
	addl	$1, %ecx
	cmpl	%esi, %ecx
	jne	.L28
	ret
	.p2align 4,,10
	.p2align 3
.L29:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE16:
	.size	nHr, .-nHr
	.p2align 4
	.globl	fact
	.type	fact, @function
fact:
.LFB17:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L34
	leal	1(%rdi), %esi
	andl	$1, %edi
	movl	$1, %edx
	movl	$1, %eax
	je	.L33
	movl	$2, %eax
	cmpl	%esi, %eax
	je	.L31
	.p2align 4,,10
	.p2align 3
.L33:
	imull	%eax, %edx
	leal	1(%rax), %ecx
	addl	$2, %eax
	imull	%ecx, %edx
	cmpl	%esi, %eax
	jne	.L33
.L31:
	movl	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L34:
	movl	$1, %edx
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE17:
	.size	fact, .-fact
	.p2align 4
	.globl	pow
	.type	pow, @function
pow:
.LFB18:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L44
	leal	1(%rsi), %ecx
	andl	$1, %esi
	movl	$1, %eax
	movl	$1, %edx
	je	.L43
	movl	$2, %edx
	movl	%edi, %eax
	cmpl	%ecx, %edx
	je	.L51
	.p2align 4,,10
	.p2align 3
.L43:
	imull	%edi, %eax
	addl	$2, %edx
	imull	%edi, %eax
	cmpl	%ecx, %edx
	jne	.L43
	ret
	.p2align 4,,10
	.p2align 3
.L44:
	movl	$1, %eax
	ret
.L51:
	ret
	.cfi_endproc
.LFE18:
	.size	pow, .-pow
	.p2align 4
	.globl	dsum
	.type	dsum, @function
dsum:
.LFB19:
	.cfi_startproc
	xorl	%ecx, %ecx
	testl	%edi, %edi
	je	.L52
	.p2align 4,,10
	.p2align 3
.L54:
	movslq	%edi, %rax
	movl	%edi, %edx
	imulq	$1717986919, %rax, %rax
	sarl	$31, %edx
	sarq	$34, %rax
	subl	%edx, %eax
	leal	(%rax,%rax,4), %edx
	addl	%edx, %edx
	subl	%edx, %edi
	addl	%edi, %ecx
	movl	%eax, %edi
	testl	%eax, %eax
	jne	.L54
.L52:
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE19:
	.size	dsum, .-dsum
	.p2align 4
	.globl	dsumb
	.type	dsumb, @function
dsumb:
.LFB20:
	.cfi_startproc
	movl	%edi, %eax
	xorl	%ecx, %ecx
	testl	%edi, %edi
	je	.L57
	.p2align 4,,10
	.p2align 3
.L59:
	cltd
	idivl	%esi
	addl	%edx, %ecx
	testl	%eax, %eax
	jne	.L59
.L57:
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE20:
	.size	dsumb, .-dsumb
	.p2align 4
	.globl	sankaku
	.type	sankaku, @function
sankaku:
.LFB21:
	.cfi_startproc
	leal	1(%rdi), %edx
	imull	%edi, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	addl	%edx, %eax
	sarl	%eax
	ret
	.cfi_endproc
.LFE21:
	.size	sankaku, .-sankaku
	.p2align 4
	.globl	llmax
	.type	llmax, @function
llmax:
.LFB22:
	.cfi_startproc
	cmpq	%rsi, %rdi
	movq	%rsi, %rax
	cmovge	%rdi, %rax
	ret
	.cfi_endproc
.LFE22:
	.size	llmax, .-llmax
	.p2align 4
	.globl	llmin
	.type	llmin, @function
llmin:
.LFB23:
	.cfi_startproc
	cmpq	%rsi, %rdi
	movq	%rsi, %rax
	cmovle	%rdi, %rax
	ret
	.cfi_endproc
.LFE23:
	.size	llmin, .-llmin
	.p2align 4
	.globl	llzt
	.type	llzt, @function
llzt:
.LFB24:
	.cfi_startproc
	cmpq	%rsi, %rdi
	movq	%rsi, %rax
	cmovge	%rdi, %rax
	cmovg	%rsi, %rdi
	subq	%rdi, %rax
	ret
	.cfi_endproc
.LFE24:
	.size	llzt, .-llzt
	.p2align 4
	.globl	llround
	.type	llround, @function
llround:
.LFB25:
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
.LFE25:
	.size	llround, .-llround
	.p2align 4
	.globl	llceil
	.type	llceil, @function
llceil:
.LFB26:
	.cfi_startproc
	movq	%rdi, %rax
	cqto
	idivq	%rsi
	cmpq	$1, %rdx
	sbbq	$-1, %rax
	ret
	.cfi_endproc
.LFE26:
	.size	llceil, .-llceil
	.p2align 4
	.globl	llgcd
	.type	llgcd, @function
llgcd:
.LFB27:
	.cfi_startproc
	movq	%rdi, %rax
	movq	%rsi, %rdx
	testq	%rsi, %rsi
	je	.L75
	.p2align 4,,10
	.p2align 3
.L74:
	movq	%rdx, %rcx
	cqto
	idivq	%rcx
	movq	%rcx, %rax
	testq	%rdx, %rdx
	jne	.L74
	movq	%rcx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L75:
	movq	%rdi, %rcx
	movq	%rcx, %rax
	ret
	.cfi_endproc
.LFE27:
	.size	llgcd, .-llgcd
	.p2align 4
	.globl	lllcm
	.type	lllcm, @function
lllcm:
.LFB28:
	.cfi_startproc
	testq	%rsi, %rsi
	je	.L80
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	.p2align 4,,10
	.p2align 3
.L79:
	movq	%rcx, %rax
	movq	%rdx, %rcx
	cqto
	idivq	%rcx
	testq	%rdx, %rdx
	jne	.L79
	movq	%rdi, %rax
	cqto
	idivq	%rcx
	imulq	%rsi, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L80:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE28:
	.size	lllcm, .-lllcm
	.p2align 4
	.globl	llnCr
	.type	llnCr, @function
llnCr:
.LFB29:
	.cfi_startproc
	testq	%rsi, %rsi
	jle	.L85
	addq	$1, %rsi
	movl	$1, %eax
	movl	$1, %ecx
	addq	$1, %rdi
	.p2align 4,,10
	.p2align 3
.L84:
	movq	%rdi, %rdx
	subq	%rcx, %rdx
	imulq	%rdx, %rax
	cqto
	idivq	%rcx
	addq	$1, %rcx
	cmpq	%rsi, %rcx
	jne	.L84
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE29:
	.size	llnCr, .-llnCr
	.p2align 4
	.globl	llnHr
	.type	llnHr, @function
llnHr:
.LFB30:
	.cfi_startproc
	addq	%rsi, %rdi
	testq	%rsi, %rsi
	jle	.L90
	addq	$1, %rsi
	movl	$1, %eax
	movl	$1, %ecx
	.p2align 4,,10
	.p2align 3
.L89:
	movq	%rdi, %rdx
	subq	%rcx, %rdx
	imulq	%rdx, %rax
	cqto
	idivq	%rcx
	addq	$1, %rcx
	cmpq	%rsi, %rcx
	jne	.L89
	ret
	.p2align 4,,10
	.p2align 3
.L90:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE30:
	.size	llnHr, .-llnHr
	.p2align 4
	.globl	llfact
	.type	llfact, @function
llfact:
.LFB31:
	.cfi_startproc
	testq	%rdi, %rdi
	jle	.L95
	leaq	1(%rdi), %rsi
	andl	$1, %edi
	movl	$1, %edx
	movl	$1, %eax
	je	.L94
	movl	$2, %eax
	cmpq	%rsi, %rax
	je	.L92
	.p2align 4,,10
	.p2align 3
.L94:
	imulq	%rax, %rdx
	leaq	1(%rax), %rcx
	addq	$2, %rax
	imulq	%rcx, %rdx
	cmpq	%rsi, %rax
	jne	.L94
.L92:
	movq	%rdx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L95:
	movl	$1, %edx
	movq	%rdx, %rax
	ret
	.cfi_endproc
.LFE31:
	.size	llfact, .-llfact
	.p2align 4
	.globl	llpow
	.type	llpow, @function
llpow:
.LFB32:
	.cfi_startproc
	testq	%rsi, %rsi
	jle	.L105
	leaq	1(%rsi), %rcx
	andl	$1, %esi
	movl	$1, %eax
	movl	$1, %edx
	je	.L104
	movl	$2, %edx
	movq	%rdi, %rax
	cmpq	%rcx, %rdx
	je	.L112
	.p2align 4,,10
	.p2align 3
.L104:
	imulq	%rdi, %rax
	addq	$2, %rdx
	imulq	%rdi, %rax
	cmpq	%rcx, %rdx
	jne	.L104
	ret
	.p2align 4,,10
	.p2align 3
.L105:
	movl	$1, %eax
	ret
.L112:
	ret
	.cfi_endproc
.LFE32:
	.size	llpow, .-llpow
	.p2align 4
	.globl	lldsum
	.type	lldsum, @function
lldsum:
.LFB33:
	.cfi_startproc
	xorl	%ecx, %ecx
	testq	%rdi, %rdi
	je	.L113
	movabsq	$7378697629483820647, %rsi
	.p2align 4,,10
	.p2align 3
.L115:
	movq	%rdi, %rax
	imulq	%rsi
	movq	%rdi, %rax
	sarq	$63, %rax
	sarq	$2, %rdx
	subq	%rax, %rdx
	leaq	(%rdx,%rdx,4), %rax
	addq	%rax, %rax
	subq	%rax, %rdi
	addq	%rdi, %rcx
	movq	%rdx, %rdi
	testq	%rdx, %rdx
	jne	.L115
.L113:
	movq	%rcx, %rax
	ret
	.cfi_endproc
.LFE33:
	.size	lldsum, .-lldsum
	.p2align 4
	.globl	lldsumb
	.type	lldsumb, @function
lldsumb:
.LFB34:
	.cfi_startproc
	movq	%rdi, %rax
	xorl	%ecx, %ecx
	testq	%rdi, %rdi
	je	.L118
	.p2align 4,,10
	.p2align 3
.L120:
	cqto
	idivq	%rsi
	addq	%rdx, %rcx
	testq	%rax, %rax
	jne	.L120
.L118:
	movq	%rcx, %rax
	ret
	.cfi_endproc
.LFE34:
	.size	lldsumb, .-lldsumb
	.p2align 4
	.globl	llsankaku
	.type	llsankaku, @function
llsankaku:
.LFB35:
	.cfi_startproc
	leaq	1(%rdi), %rdx
	imulq	%rdi, %rdx
	movq	%rdx, %rax
	shrq	$63, %rax
	addq	%rdx, %rax
	sarq	%rax
	ret
	.cfi_endproc
.LFE35:
	.size	llsankaku, .-llsankaku
	.p2align 4
	.globl	dbmax
	.type	dbmax, @function
dbmax:
.LFB36:
	.cfi_startproc
	maxsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE36:
	.size	dbmax, .-dbmax
	.p2align 4
	.globl	dbmin
	.type	dbmin, @function
dbmin:
.LFB37:
	.cfi_startproc
	minsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE37:
	.size	dbmin, .-dbmin
	.p2align 4
	.globl	dbzt
	.type	dbzt, @function
dbzt:
.LFB38:
	.cfi_startproc
	comisd	%xmm1, %xmm0
	ja	.L132
	minsd	%xmm1, %xmm0
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L132:
	movapd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	movapd	%xmm2, %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE38:
	.size	dbzt, .-dbzt
	.p2align 4
	.globl	sortfncsj
	.type	sortfncsj, @function
sortfncsj:
.LFB39:
	.cfi_startproc
	movl	(%rsi), %edx
	movl	$1, %eax
	cmpl	%edx, (%rdi)
	jg	.L133
	setne	%al
	movzbl	%al, %eax
	negl	%eax
.L133:
	ret
	.cfi_endproc
.LFE39:
	.size	sortfncsj, .-sortfncsj
	.p2align 4
	.globl	sortfnckj
	.type	sortfnckj, @function
sortfnckj:
.LFB40:
	.cfi_startproc
	movl	(%rsi), %edx
	movl	$1, %eax
	cmpl	%edx, (%rdi)
	jl	.L136
	setne	%al
	movzbl	%al, %eax
	negl	%eax
.L136:
	ret
	.cfi_endproc
.LFE40:
	.size	sortfnckj, .-sortfnckj
	.p2align 4
	.globl	llsortfncsj
	.type	llsortfncsj, @function
llsortfncsj:
.LFB41:
	.cfi_startproc
	movq	(%rsi), %rdx
	movl	$1, %eax
	cmpq	%rdx, (%rdi)
	jg	.L139
	setne	%al
	movzbl	%al, %eax
	negl	%eax
.L139:
	ret
	.cfi_endproc
.LFE41:
	.size	llsortfncsj, .-llsortfncsj
	.p2align 4
	.globl	llsortfnckj
	.type	llsortfnckj, @function
llsortfnckj:
.LFB42:
	.cfi_startproc
	movq	(%rsi), %rdx
	movl	$1, %eax
	cmpq	%rdx, (%rdi)
	jl	.L142
	setne	%al
	movzbl	%al, %eax
	negl	%eax
.L142:
	ret
	.cfi_endproc
.LFE42:
	.size	llsortfnckj, .-llsortfnckj
	.p2align 4
	.globl	dbsortfncsj
	.type	dbsortfncsj, @function
dbsortfncsj:
.LFB43:
	.cfi_startproc
	movsd	(%rdi), %xmm1
	movsd	(%rsi), %xmm0
	movl	$1, %eax
	comisd	%xmm0, %xmm1
	ja	.L145
	xorl	%edx, %edx
	ucomisd	%xmm0, %xmm1
	setp	%dl
	cmove	%edx, %eax
	negl	%eax
.L145:
	ret
	.cfi_endproc
.LFE43:
	.size	dbsortfncsj, .-dbsortfncsj
	.p2align 4
	.globl	dbsortfnckj
	.type	dbsortfnckj, @function
dbsortfnckj:
.LFB44:
	.cfi_startproc
	movsd	(%rdi), %xmm1
	movsd	(%rsi), %xmm0
	movl	$1, %eax
	comisd	%xmm1, %xmm0
	ja	.L148
	xorl	%edx, %edx
	ucomisd	%xmm0, %xmm1
	setp	%dl
	cmove	%edx, %eax
	negl	%eax
.L148:
	ret
	.cfi_endproc
.LFE44:
	.size	dbsortfnckj, .-dbsortfnckj
	.p2align 4
	.globl	strsortfncsj
	.type	strsortfncsj, @function
strsortfncsj:
.LFB45:
	.cfi_startproc
	jmp	strcmp
	.cfi_endproc
.LFE45:
	.size	strsortfncsj, .-strsortfncsj
	.p2align 4
	.globl	strsortfnckj
	.type	strsortfnckj, @function
strsortfnckj:
.LFB46:
	.cfi_startproc
	movq	%rdi, %rax
	movq	%rsi, %rdi
	movq	%rax, %rsi
	jmp	strcmp
	.cfi_endproc
.LFE46:
	.size	strsortfnckj, .-strsortfnckj
	.p2align 4
	.globl	chsortfncsj
	.type	chsortfncsj, @function
chsortfncsj:
.LFB47:
	.cfi_startproc
	movzbl	(%rsi), %edx
	movl	$1, %eax
	cmpb	%dl, (%rdi)
	jg	.L153
	setne	%al
	movzbl	%al, %eax
	negl	%eax
.L153:
	ret
	.cfi_endproc
.LFE47:
	.size	chsortfncsj, .-chsortfncsj
	.p2align 4
	.globl	chsortfnckj
	.type	chsortfnckj, @function
chsortfnckj:
.LFB48:
	.cfi_startproc
	movzbl	(%rsi), %edx
	movl	$1, %eax
	cmpb	%dl, (%rdi)
	jl	.L156
	setne	%al
	movzbl	%al, %eax
	negl	%eax
.L156:
	ret
	.cfi_endproc
.LFE48:
	.size	chsortfnckj, .-chsortfnckj
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"%d"
	.text
	.p2align 4
	.globl	shuffledget
	.type	shuffledget, @function
shuffledget:
.LFB49:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdi, %r13
	xorl	%edi, %edi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movslq	%esi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$2097160, %rsp
	.cfi_def_cfa_offset 2097200
	call	time
	movl	%eax, %edi
	call	srand
	testl	%r12d, %r12d
	jle	.L159
	leal	-1(%r12), %eax
	cmpl	$2, %eax
	jbe	.L167
	movl	%r12d, %edx
	movq	%rsp, %rbp
	movdqa	.LC0(%rip), %xmm0
	movdqa	.LC1(%rip), %xmm2
	shrl	$2, %edx
	movq	%rbp, %rax
	salq	$4, %rdx
	addq	%rbp, %rdx
	.p2align 4,,10
	.p2align 3
.L162:
	movdqa	%xmm0, %xmm1
	addq	$16, %rax
	paddd	%xmm2, %xmm0
	movaps	%xmm1, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L162
	movl	%r12d, %eax
	andl	$-4, %eax
	testb	$3, %r12b
	je	.L163
.L161:
	movslq	%eax, %rdx
	movl	%eax, (%rsp,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%edx, %r12d
	jle	.L163
	movslq	%edx, %rcx
	addl	$2, %eax
	movl	%edx, (%rsp,%rcx,4)
	cmpl	%eax, %r12d
	jle	.L163
	movslq	%eax, %rdx
	movl	%eax, (%rsp,%rdx,4)
.L163:
	movq	%r12, %rbx
	.p2align 4,,10
	.p2align 3
.L164:
	call	rand
	cltd
	idivl	%ebx
	movl	-4(%rbp,%rbx,4), %eax
	movslq	%edx, %rdx
	movl	(%rsp,%rdx,4), %ecx
	movl	%ecx, -4(%rbp,%rbx,4)
	subq	$1, %rbx
	movl	%eax, (%rsp,%rdx,4)
	testl	%ebx, %ebx
	jg	.L164
	movq	%rbp, %rbx
	leaq	0(%rbp,%r12,4), %rbp
	.p2align 4,,10
	.p2align 3
.L165:
	movslq	(%rbx), %rax
	movl	$.LC2, %edi
	addq	$4, %rbx
	leaq	0(%r13,%rax,4), %rsi
	xorl	%eax, %eax
	call	__isoc99_scanf
	cmpq	%rbp, %rbx
	jne	.L165
.L159:
	addq	$2097160, %rsp
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
.L167:
	.cfi_restore_state
	xorl	%eax, %eax
	movq	%rsp, %rbp
	jmp	.L161
	.cfi_endproc
.LFE49:
	.size	shuffledget, .-shuffledget
	.p2align 4
	.globl	search
	.type	search, @function
search:
.LFB50:
	.cfi_startproc
	xorl	%r8d, %r8d
	subl	$1, %edx
	js	.L172
	.p2align 4,,10
	.p2align 3
.L176:
	leal	(%rdx,%r8), %ecx
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
	movslq	%eax, %rcx
	cmpl	(%rsi,%rcx,4), %edi
	jle	.L174
	leal	1(%rax), %r8d
	cmpl	%edx, %r8d
	jle	.L176
.L172:
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L174:
	leal	-1(%rax), %edx
	cmpl	%r8d, %edx
	jge	.L176
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE50:
	.size	search, .-search
	.p2align 4
	.globl	prarr
	.type	prarr, @function
prarr:
.LFB51:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L188
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movslq	%esi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	xorl	%ebx, %ebx
.L182:
	testq	%rbx, %rbx
	jne	.L186
	movl	(%r12), %esi
	xorl	%eax, %eax
	movl	$.LC2, %edi
	call	printf
	cmpq	$1, %rbp
	je	.L179
	movl	$1, %ebx
.L186:
	movl	$32, %edi
	call	putchar
	movl	(%r12,%rbx,4), %esi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	printf
	cmpq	%rbp, %rbx
	jne	.L182
.L179:
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 24
	movl	$10, %edi
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 8
	jmp	putchar
	.p2align 4,,10
	.p2align 3
.L188:
	movl	$10, %edi
	jmp	putchar
	.cfi_endproc
.LFE51:
	.size	prarr, .-prarr
	.p2align 4
	.globl	sdsortfnc
	.type	sdsortfnc, @function
sdsortfnc:
.LFB52:
	.cfi_startproc
	movl	(%rsi), %eax
	cmpl	%eax, (%rdi)
	movl	$-1, %edx
	setg	%al
	movzbl	%al, %eax
	cmovl	%edx, %eax
	ret
	.cfi_endproc
.LFE52:
	.size	sdsortfnc, .-sdsortfnc
	.p2align 4
	.globl	cfact
	.type	cfact, @function
cfact:
.LFB53:
	.cfi_startproc
	movdqa	.LC3(%rip), %xmm0
	movl	$1, %edx
	movl	$2, %ecx
	movabsq	$-8543223828751151131, %rdi
	movaps	%xmm0, factorial(%rip)
	.p2align 4,,10
	.p2align 3
.L195:
	movq	%rdx, %rsi
	imulq	%rcx, %rsi
	movq	%rsi, %rax
	imulq	%rdi
	movq	%rsi, %rax
	sarq	$63, %rax
	addq	%rsi, %rdx
	sarq	$29, %rdx
	subq	%rax, %rdx
	imulq	$1000000007, %rdx, %rax
	subq	%rax, %rsi
	movq	%rsi, factorial(,%rcx,8)
	addq	$1, %rcx
	movq	%rsi, %rdx
	cmpq	$262144, %rcx
	jne	.L195
	ret
	.cfi_endproc
.LFE53:
	.size	cfact, .-cfact
	.p2align 4
	.globl	power
	.type	power, @function
power:
.LFB54:
	.cfi_startproc
	movq	%rdi, %rcx
	movq	%rsi, %r8
	testq	%rsi, %rsi
	jle	.L201
	movabsq	$-8543223828751151131, %r9
	movl	$1, %edi
	.p2align 4,,10
	.p2align 3
.L200:
	testb	$1, %r8b
	je	.L199
	imulq	%rcx, %rdi
	movq	%rdi, %rax
	movq	%rdi, %rsi
	imulq	%r9
	movq	%rdi, %rax
	sarq	$63, %rax
	addq	%rdi, %rdx
	sarq	$29, %rdx
	movq	%rdx, %rdi
	subq	%rax, %rdi
	imulq	$1000000007, %rdi, %rax
	movq	%rsi, %rdi
	subq	%rax, %rdi
.L199:
	imulq	%rcx, %rcx
	movq	%rcx, %rax
	movq	%rcx, %rsi
	mulq	%r9
	shrq	$29, %rdx
	imulq	$1000000007, %rdx, %rax
	subq	%rax, %rsi
	sarq	%r8
	movq	%rsi, %rcx
	jne	.L200
	movq	%rdi, %rax
	imulq	%r9
	leaq	(%rdx,%rdi), %rax
	movq	%rdi, %rdx
	sarq	$63, %rdx
	sarq	$29, %rax
	subq	%rdx, %rax
	imulq	$1000000007, %rax, %rdx
	movq	%rdi, %rax
	subq	%rdx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L201:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE54:
	.size	power, .-power
	.p2align 4
	.globl	modular_inverse
	.type	modular_inverse, @function
modular_inverse:
.LFB55:
	.cfi_startproc
	movq	%rdi, %rcx
	movl	$30, %r9d
	movl	$1, %edi
	movl	$1000000005, %r8d
	movabsq	$-8543223828751151131, %r10
	.p2align 4,,10
	.p2align 3
.L208:
	testb	$1, %r8b
	je	.L207
	imulq	%rcx, %rdi
	movq	%rdi, %rax
	movq	%rdi, %rsi
	imulq	%r10
	movq	%rdi, %rax
	sarq	$63, %rax
	addq	%rdi, %rdx
	sarq	$29, %rdx
	movq	%rdx, %rdi
	subq	%rax, %rdi
	imulq	$1000000007, %rdi, %rax
	movq	%rsi, %rdi
	subq	%rax, %rdi
.L207:
	movq	%rcx, %rsi
	sarq	%r8
	imulq	%rcx, %rsi
	movq	%rsi, %rax
	mulq	%r10
	movq	%rdx, %rcx
	shrq	$29, %rcx
	imulq	$1000000007, %rcx, %rax
	subq	%rax, %rsi
	movq	%rsi, %rcx
	subl	$1, %r9d
	jne	.L208
	movq	%rdi, %rax
	imulq	%r10
	leaq	(%rdx,%rdi), %rax
	movq	%rdi, %rdx
	sarq	$63, %rdx
	sarq	$29, %rax
	subq	%rdx, %rax
	imulq	$1000000007, %rax, %rdx
	movq	%rdi, %rax
	subq	%rdx, %rax
	ret
	.cfi_endproc
.LFE55:
	.size	modular_inverse, .-modular_inverse
	.p2align 4
	.globl	calcnCr
	.type	calcnCr, @function
calcnCr:
.LFB56:
	.cfi_startproc
	movq	%rdi, %r8
	movq	%rsi, %r9
	movq	factorial(,%rdi,8), %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	factorial(,%rsi,8), %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	$1, %r11d
	movl	$30, %ebx
	movabsq	$-8543223828751151131, %rbp
	movl	$1000000005, %r10d
	.p2align 4,,10
	.p2align 3
.L215:
	testb	$1, %r10b
	je	.L214
	movq	%r11, %rcx
	imulq	%rsi, %rcx
	movq	%rcx, %rax
	imulq	%rbp
	leaq	(%rdx,%rcx), %rax
	movq	%rcx, %rdx
	sarq	$29, %rax
	sarq	$63, %rdx
	subq	%rdx, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	movq	%rcx, %r11
.L214:
	imulq	%rsi, %rsi
	sarq	%r10
	movq	%rsi, %rax
	movq	%rsi, %rcx
	mulq	%rbp
	shrq	$29, %rdx
	imulq	$1000000007, %rdx, %rax
	subq	%rax, %rcx
	movq	%rcx, %rsi
	subl	$1, %ebx
	jne	.L215
	movq	%r11, %rax
	subq	%r9, %r8
	movq	%r11, %r10
	movl	$1, %ebx
	imulq	%rbp
	movq	%r11, %rax
	movq	factorial(,%r8,8), %rcx
	movl	$1000000005, %r9d
	movabsq	$-8543223828751151131, %r8
	sarq	$63, %rax
	addq	%r11, %rdx
	movl	$30, %r11d
	sarq	$29, %rdx
	subq	%rax, %rdx
	imulq	$1000000007, %rdx, %rax
	subq	%rax, %r10
	.p2align 4,,10
	.p2align 3
.L217:
	testb	$1, %r9b
	je	.L216
	imulq	%rcx, %rbx
	movq	%rbx, %rax
	movq	%rbx, %rsi
	imulq	%r8
	movq	%rbx, %rax
	sarq	$63, %rax
	addq	%rbx, %rdx
	sarq	$29, %rdx
	movq	%rdx, %rbx
	subq	%rax, %rbx
	imulq	$1000000007, %rbx, %rax
	movq	%rsi, %rbx
	subq	%rax, %rbx
.L216:
	movq	%rcx, %rsi
	sarq	%r9
	imulq	%rcx, %rsi
	movq	%rsi, %rax
	movq	%rsi, %rcx
	mulq	%r8
	shrq	$29, %rdx
	imulq	$1000000007, %rdx, %rax
	subq	%rax, %rcx
	subl	$1, %r11d
	jne	.L217
	movq	%rbx, %rax
	imulq	%r8
	leaq	(%rdx,%rbx), %rax
	movq	%rbx, %rdx
	sarq	$63, %rdx
	sarq	$29, %rax
	subq	%rdx, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rbx
	movq	%rbx, %rcx
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	imulq	%r10, %rcx
	movq	%rcx, %rax
	imulq	%r8
	leaq	(%rdx,%rcx), %rax
	movq	%rcx, %rdx
	sarq	$63, %rdx
	sarq	$29, %rax
	subq	%rdx, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	imulq	%rdi, %rcx
	movq	%rcx, %rax
	imulq	%r8
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
.LFE56:
	.size	calcnCr, .-calcnCr
	.section	.rodata.str1.1
.LC4:
	.string	"%lld%lld%s"
.LC5:
	.string	"%lld%lld"
.LC7:
	.string	"%lld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB57:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$1, %eax
	movl	$2, %ecx
	movabsq	$-8543223828751151131, %rdi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rax, %rdx
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
	subq	$557144, %rsp
	.cfi_def_cfa_offset 557200
	movdqa	.LC3(%rip), %xmm0
	movaps	%xmm0, factorial(%rip)
	.p2align 4,,10
	.p2align 3
.L228:
	imulq	%rcx, %rdx
	movq	%rdx, %rax
	movq	%rdx, %rsi
	imulq	%rdi
	movq	%rsi, %rax
	sarq	$63, %rax
	addq	%rsi, %rdx
	sarq	$29, %rdx
	subq	%rax, %rdx
	imulq	$1000000007, %rdx, %rax
	movq	%rsi, %rdx
	subq	%rax, %rdx
	movq	%rdx, factorial(,%rcx,8)
	addq	$1, %rcx
	cmpq	$262144, %rcx
	jne	.L228
	xorl	%esi, %esi
	movl	$32768, %edx
	leaq	80(%rsp), %rdi
	call	memset
	xorl	%eax, %eax
	leaq	56(%rsp), %rdx
	leaq	32849(%rsp), %rcx
	leaq	48(%rsp), %rsi
	movl	$.LC4, %edi
	call	__isoc99_scanf
	cmpq	$0, 56(%rsp)
	movq	$1, 80(%rsp)
	jle	.L229
	xorl	%r15d, %r15d
	xorl	%r11d, %r11d
	xorl	%r8d, %r8d
	xorl	%ebp, %ebp
	movabsq	$-8543223828751151131, %r12
	movq	%r8, %r13
	movq	%r11, %rbx
	movq	%r15, %r14
	.p2align 4,,10
	.p2align 3
.L260:
	leaq	72(%rsp), %rdx
	leaq	64(%rsp), %rsi
	movl	$.LC5, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movq	64(%rsp), %rcx
	cmpq	%rbp, %rcx
	jg	.L302
.L230:
	movq	72(%rsp), %rcx
	leaq	1(%rbx), %rdx
	cmpq	%rcx, %rdx
	jg	.L240
	movq	%rcx, %rdi
	subq	%rbx, %rdi
	leaq	-1(%rdi), %rax
	cmpq	$14, %rax
	jbe	.L241
	pxor	%xmm0, %xmm0
	pxor	%xmm4, %xmm4
	pxor	%xmm3, %xmm3
	movq	%rdi, %r8
	leaq	32848(%rsp,%rdx), %rax
	andq	$-16, %r8
	movdqa	.LC6(%rip), %xmm5
	pxor	%xmm2, %xmm2
	leaq	(%r8,%rax), %rsi
	.p2align 4,,10
	.p2align 3
.L242:
	movdqu	(%rax), %xmm1
	movdqa	%xmm4, %xmm6
	movdqa	%xmm3, %xmm9
	addq	$16, %rax
	pcmpeqb	%xmm5, %xmm1
	pcmpgtb	%xmm1, %xmm6
	movdqa	%xmm1, %xmm7
	punpcklbw	%xmm6, %xmm7
	punpckhbw	%xmm6, %xmm1
	movdqa	%xmm3, %xmm6
	pcmpgtw	%xmm7, %xmm6
	pcmpgtw	%xmm1, %xmm9
	movdqa	%xmm7, %xmm8
	punpcklwd	%xmm6, %xmm8
	punpckhwd	%xmm6, %xmm7
	movdqa	%xmm1, %xmm6
	punpcklwd	%xmm9, %xmm6
	punpckhwd	%xmm9, %xmm1
	movdqa	%xmm2, %xmm9
	pcmpgtd	%xmm8, %xmm9
	movdqa	%xmm8, %xmm10
	punpckldq	%xmm9, %xmm10
	punpckhdq	%xmm9, %xmm8
	movdqa	%xmm7, %xmm9
	psubq	%xmm10, %xmm0
	psubq	%xmm8, %xmm0
	movdqa	%xmm2, %xmm8
	pcmpgtd	%xmm7, %xmm8
	punpckldq	%xmm8, %xmm9
	punpckhdq	%xmm8, %xmm7
	movdqa	%xmm6, %xmm8
	psubq	%xmm9, %xmm0
	psubq	%xmm7, %xmm0
	movdqa	%xmm2, %xmm7
	pcmpgtd	%xmm6, %xmm7
	punpckldq	%xmm7, %xmm8
	punpckhdq	%xmm7, %xmm6
	movdqa	%xmm1, %xmm7
	psubq	%xmm8, %xmm0
	psubq	%xmm6, %xmm0
	movdqa	%xmm2, %xmm6
	pcmpgtd	%xmm1, %xmm6
	punpckldq	%xmm6, %xmm7
	punpckhdq	%xmm6, %xmm1
	psubq	%xmm7, %xmm0
	psubq	%xmm1, %xmm0
	cmpq	%rsi, %rax
	jne	.L242
	movdqa	%xmm0, %xmm1
	addq	%r8, %rdx
	psrldq	$8, %xmm1
	paddq	%xmm1, %xmm0
	movq	%xmm0, %rax
	addq	%rax, %r14
	cmpq	%rdi, %r8
	je	.L240
.L241:
	cmpb	$49, 32848(%rsp,%rdx)
	jne	.L244
	addq	$1, %r14
.L244:
	leaq	1(%rdx), %rax
	cmpq	%rcx, %rax
	jg	.L240
	cmpb	$49, 32849(%rsp,%rdx)
	jne	.L245
	addq	$1, %r14
.L245:
	leaq	2(%rdx), %rax
	cmpq	%rax, %rcx
	jl	.L240
	cmpb	$49, 32850(%rsp,%rdx)
	jne	.L246
	addq	$1, %r14
.L246:
	leaq	3(%rdx), %rax
	cmpq	%rcx, %rax
	jg	.L240
	cmpb	$49, 32851(%rsp,%rdx)
	jne	.L247
	addq	$1, %r14
.L247:
	leaq	4(%rdx), %rax
	cmpq	%rcx, %rax
	jg	.L240
	cmpb	$49, 32852(%rsp,%rdx)
	jne	.L248
	addq	$1, %r14
.L248:
	leaq	5(%rdx), %rax
	cmpq	%rax, %rcx
	jl	.L240
	cmpb	$49, 32853(%rsp,%rdx)
	jne	.L249
	addq	$1, %r14
.L249:
	leaq	6(%rdx), %rax
	cmpq	%rax, %rcx
	jl	.L240
	cmpb	$49, 32854(%rsp,%rdx)
	jne	.L250
	addq	$1, %r14
.L250:
	leaq	7(%rdx), %rax
	cmpq	%rcx, %rax
	jg	.L240
	cmpb	$49, 32855(%rsp,%rdx)
	jne	.L251
	addq	$1, %r14
.L251:
	leaq	8(%rdx), %rax
	cmpq	%rcx, %rax
	jg	.L240
	cmpb	$49, 32856(%rsp,%rdx)
	jne	.L252
	addq	$1, %r14
.L252:
	leaq	9(%rdx), %rax
	cmpq	%rax, %rcx
	jl	.L240
	cmpb	$49, 32857(%rsp,%rdx)
	jne	.L253
	addq	$1, %r14
.L253:
	leaq	10(%rdx), %rax
	cmpq	%rcx, %rax
	jg	.L240
	cmpb	$49, 32858(%rsp,%rdx)
	jne	.L254
	addq	$1, %r14
.L254:
	leaq	11(%rdx), %rax
	cmpq	%rcx, %rax
	jg	.L240
	cmpb	$49, 32859(%rsp,%rdx)
	jne	.L255
	addq	$1, %r14
.L255:
	leaq	12(%rdx), %rax
	cmpq	%rcx, %rax
	jg	.L240
	cmpb	$49, 32860(%rsp,%rdx)
	jne	.L256
	addq	$1, %r14
.L256:
	leaq	13(%rdx), %rax
	cmpq	%rax, %rcx
	jl	.L240
	cmpb	$49, 32861(%rsp,%rdx)
	jne	.L257
	addq	$1, %r14
.L257:
	addq	$14, %rdx
	cmpq	%rdx, %rcx
	jl	.L240
	cmpb	$49, 32848(%rsp,%rdx)
	jne	.L240
	addq	$1, %r14
	.p2align 4,,10
	.p2align 3
.L240:
	cmpq	%rcx, %rbx
	cmovl	%rcx, %rbx
	addq	$1, %r13
	cmpq	%r13, 56(%rsp)
	jg	.L260
	movq	$0, 72(%rsp)
	movq	%rbx, %r11
	movq	%r14, %r15
	testq	%r14, %r14
	js	.L263
.L262:
	movabsq	$-8543223828751151131, %r8
	subq	%rbp, %r11
	xorl	%ebx, %ebx
	movq	%r15, %rbp
	movq	%r11, %r13
	leaq	1(%r11), %r12
	xorl	%r11d, %r11d
	subq	%r15, %r13
	leaq	0(,%r13,8), %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L269:
	cmpq	%rbp, %r12
	jl	.L264
	movq	80(%rsp,%rbx,8), %r10
	movl	$1, %esi
	movl	$1000000005, %edi
	movq	factorial(,%r12,8), %r14
	movq	factorial(,%rbp,8), %rcx
	movl	$30, %r9d
	.p2align 4,,10
	.p2align 3
.L266:
	testb	$1, %dil
	je	.L265
	imulq	%rcx, %rsi
	movq	%rsi, %rax
	movq	%rsi, %r13
	imulq	%r8
	movq	%r13, %rax
	sarq	$63, %rax
	leaq	(%rdx,%rsi), %rsi
	sarq	$29, %rsi
	subq	%rax, %rsi
	imulq	$1000000007, %rsi, %rax
	movq	%r13, %rsi
	subq	%rax, %rsi
.L265:
	imulq	%rcx, %rcx
	sarq	%rdi
	movq	%rcx, %rax
	mulq	%r8
	shrq	$29, %rdx
	imulq	$1000000007, %rdx, %rax
	subq	%rax, %rcx
	subl	$1, %r9d
	jne	.L266
	movq	%rsi, %rax
	movq	%r10, (%rsp)
	movl	$30, %r9d
	movl	$1, %ecx
	imulq	%r8
	movq	%rsi, %rax
	movl	$1000000005, %edi
	sarq	$63, %rax
	leaq	(%rdx,%rsi), %r13
	sarq	$29, %r13
	subq	%rax, %r13
	imulq	$1000000007, %r13, %rax
	subq	%rax, %rsi
	movq	8(%rsp), %rax
	movq	%rsi, %r13
	movq	factorial+8(%rax,%rbx,8), %rsi
	.p2align 4,,10
	.p2align 3
.L268:
	testb	$1, %dil
	je	.L267
	imulq	%rsi, %rcx
	movq	%rcx, %rax
	movq	%rcx, %r10
	imulq	%r8
	movq	%r10, %rax
	sarq	$63, %rax
	leaq	(%rdx,%rcx), %rcx
	sarq	$29, %rcx
	subq	%rax, %rcx
	imulq	$1000000007, %rcx, %rax
	movq	%r10, %rcx
	subq	%rax, %rcx
.L267:
	imulq	%rsi, %rsi
	sarq	%rdi
	movq	%rsi, %rax
	mulq	%r8
	shrq	$29, %rdx
	imulq	$1000000007, %rdx, %rax
	subq	%rax, %rsi
	subl	$1, %r9d
	jne	.L268
	movq	%rcx, %rax
	movq	(%rsp), %r10
	imulq	%r8
	leaq	(%rdx,%rcx), %rax
	movq	%rcx, %rdx
	sarq	$63, %rdx
	sarq	$29, %rax
	subq	%rdx, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	imulq	%r13, %rcx
	movq	%rcx, %rax
	imulq	%r8
	leaq	(%rdx,%rcx), %rax
	movq	%rcx, %rdx
	sarq	$63, %rdx
	sarq	$29, %rax
	subq	%rdx, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	imulq	%r14, %rcx
	movq	%rcx, %rax
	imulq	%r8
	leaq	(%rdx,%rcx), %rax
	movq	%rcx, %rdx
	sarq	$63, %rdx
	sarq	$29, %rax
	subq	%rdx, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	imulq	%r10, %rcx
	addq	%r11, %rcx
	movq	%rcx, %rax
	imulq	%r8
	movq	%rcx, %rax
	sarq	$63, %rax
	leaq	(%rdx,%rcx), %r11
	sarq	$29, %r11
	subq	%rax, %r11
	imulq	$1000000007, %r11, %rax
	subq	%rax, %rcx
	movl	$1, %eax
	movq	%rcx, %r11
.L264:
	addq	$1, %rbx
	subq	$1, %rbp
	cmpq	%rbx, %r15
	jge	.L269
	testb	%al, %al
	je	.L263
	movq	%r11, 72(%rsp)
.L263:
	movq	72(%rsp), %rsi
	movl	$.LC7, %edi
	xorl	%eax, %eax
	call	printf
	addq	$557144, %rsp
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
.L302:
	.cfi_restore_state
	leaq	-1(%rcx), %r8
	movq	%rbx, %rax
	cmpq	%rbx, %r8
	cmovle	%r8, %rax
	subq	%rbp, %rax
	addq	$1, %rax
	movq	%rax, 16(%rsp)
	testq	%r14, %r14
	js	.L231
	testq	%rax, %rax
	jle	.L232
	movq	%r8, 24(%rsp)
	leaq	80(%rsp,%r14,8), %rbp
	movq	%r14, %r15
	movq	%rcx, %r9
	movq	%r13, 32(%rsp)
	movq	%rbx, 40(%rsp)
	movq	%r14, (%rsp)
	.p2align 4,,10
	.p2align 3
.L233:
	movq	16(%rsp), %r10
	movl	$factorial, %ebx
	.p2align 4,,10
	.p2align 3
.L239:
	leaq	(%r15,%r10), %rax
	cmpq	%rax, (%rsp)
	jl	.L234
	movq	16(%rsp), %rax
	movq	0(%rbp), %r13
	movl	$1, %esi
	movl	$30, %r8d
	movq	factorial(,%r10,8), %rcx
	movl	$1000000005, %edi
	movq	factorial(,%rax,8), %r14
	.p2align 4,,10
	.p2align 3
.L236:
	testb	$1, %dil
	je	.L235
	imulq	%rcx, %rsi
	movq	%rsi, %rax
	movq	%rsi, %r11
	imulq	%r12
	movq	%r11, %rax
	sarq	$63, %rax
	leaq	(%rdx,%rsi), %rsi
	sarq	$29, %rsi
	subq	%rax, %rsi
	imulq	$1000000007, %rsi, %rax
	movq	%r11, %rsi
	subq	%rax, %rsi
.L235:
	imulq	%rcx, %rcx
	sarq	%rdi
	movq	%rcx, %rax
	mulq	%r12
	shrq	$29, %rdx
	imulq	$1000000007, %rdx, %rax
	subq	%rax, %rcx
	subl	$1, %r8d
	jne	.L236
	movq	%rsi, %rax
	movq	%r9, 8(%rsp)
	movl	$30, %r8d
	movl	$1, %ecx
	imulq	%r12
	movq	%rsi, %rax
	movl	$1000000005, %edi
	sarq	$63, %rax
	leaq	(%rdx,%rsi), %r11
	sarq	$29, %r11
	subq	%rax, %r11
	imulq	$1000000007, %r11, %rax
	subq	%rax, %rsi
	movq	%rsi, %r11
	movq	(%rbx), %rsi
	.p2align 4,,10
	.p2align 3
.L238:
	testb	$1, %dil
	je	.L237
	imulq	%rsi, %rcx
	movq	%rcx, %rax
	movq	%rcx, %r9
	imulq	%r12
	movq	%r9, %rax
	sarq	$63, %rax
	leaq	(%rdx,%rcx), %rcx
	sarq	$29, %rcx
	subq	%rax, %rcx
	imulq	$1000000007, %rcx, %rax
	movq	%r9, %rcx
	subq	%rax, %rcx
.L237:
	imulq	%rsi, %rsi
	sarq	%rdi
	movq	%rsi, %rax
	mulq	%r12
	shrq	$29, %rdx
	imulq	$1000000007, %rdx, %rax
	subq	%rax, %rsi
	subl	$1, %r8d
	jne	.L238
	movq	%rcx, %rax
	movq	%rcx, %rsi
	movq	8(%rsp), %r9
	imulq	%r12
	sarq	$63, %rsi
	leaq	(%rdx,%rcx), %rax
	sarq	$29, %rax
	subq	%rsi, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	imulq	%r11, %rcx
	movq	%rcx, %rax
	movq	%rcx, %rsi
	imulq	%r12
	sarq	$63, %rsi
	leaq	(%rdx,%rcx), %rax
	sarq	$29, %rax
	subq	%rsi, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	imulq	%r14, %rcx
	movq	%rcx, %rax
	movq	%rcx, %rsi
	imulq	%r12
	sarq	$63, %rsi
	leaq	(%rdx,%rcx), %rax
	sarq	$29, %rax
	subq	%rsi, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	imulq	%r13, %rcx
	addq	0(%rbp,%r10,8), %rcx
	movq	%rcx, %rax
	imulq	%r12
	leaq	(%rdx,%rcx), %rax
	movq	%rcx, %rdx
	sarq	$29, %rax
	sarq	$63, %rdx
	subq	%rdx, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	movq	%rcx, 0(%rbp,%r10,8)
.L234:
	addq	$8, %rbx
	subq	$1, %r10
	jne	.L239
	subq	$1, %r15
	subq	$8, %rbp
	cmpq	$-1, %r15
	jne	.L233
	movq	24(%rsp), %r8
	movq	32(%rsp), %r13
	movq	%r9, %rcx
	movq	40(%rsp), %rbx
	movq	(%rsp), %r14
.L232:
	movq	%rbx, %rax
	movl	$0, %edx
	subq	%rcx, %rax
	addq	$1, %rax
	cmovs	%rdx, %rax
	movq	%r14, %rdx
	subq	%rax, %rdx
	testq	%rdx, %rdx
	jle	.L231
	salq	$3, %rdx
	xorl	%esi, %esi
	leaq	80(%rsp), %rdi
	movq	%r8, 8(%rsp)
	movq	%rcx, (%rsp)
	call	memset
	movq	(%rsp), %rcx
	movq	8(%rsp), %r8
.L231:
	cmpq	%r8, %rbx
	movq	%rcx, %rbp
	cmovl	%r8, %rbx
	jmp	.L230
.L229:
	xorl	%eax, %eax
	xorl	%r15d, %r15d
	xorl	%r11d, %r11d
	xorl	%ebp, %ebp
	movq	%rax, 72(%rsp)
	jmp	.L262
	.cfi_endproc
.LFE57:
	.size	main, .-main
	.globl	factorial
	.bss
	.align 32
	.type	factorial, @object
	.size	factorial, 2097152
factorial:
	.zero	2097152
	.globl	dy8
	.data
	.align 32
	.type	dy8, @object
	.size	dy8, 32
dy8:
	.long	-1
	.long	0
	.long	1
	.long	-1
	.long	1
	.long	-1
	.long	0
	.long	1
	.globl	dx8
	.align 32
	.type	dx8, @object
	.size	dx8, 32
dx8:
	.long	-1
	.long	-1
	.long	-1
	.long	0
	.long	0
	.long	1
	.long	1
	.long	1
	.globl	dy4
	.align 16
	.type	dy4, @object
	.size	dy4, 16
dy4:
	.long	0
	.long	0
	.long	1
	.long	-1
	.globl	dx4
	.align 16
	.type	dx4, @object
	.size	dx4, 16
dx4:
	.long	1
	.long	-1
	.long	0
	.long	0
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC1:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC3:
	.quad	1
	.quad	1
	.align 16
.LC6:
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
