.file	"optimized_inputC.s"
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
	shrq	$3, %
