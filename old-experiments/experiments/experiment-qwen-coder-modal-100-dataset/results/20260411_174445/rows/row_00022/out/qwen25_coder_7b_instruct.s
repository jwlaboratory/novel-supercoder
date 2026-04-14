.file	"optimized_inputC.s"
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
	xor
