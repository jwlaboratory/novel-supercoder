	.file	"inputC.c"
	.text
	.p2align 4
	.globl	in
	.type	in, @function
in:
.LFB8:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L2:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L2
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE8:
	.size	in, .-in
	.p2align 4
	.globl	vset
	.type	vset, @function
vset:
.LFB9:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE9:
	.size	vset, .-vset
	.p2align 4
	.globl	vadd
	.type	vadd, @function
vadd:
.LFB10:
	.cfi_startproc
	movq	%xmm0, -40(%rsp)
	movq	%xmm1, -32(%rsp)
	movapd	-40(%rsp), %xmm4
	movq	%xmm2, -24(%rsp)
	movq	%xmm3, -16(%rsp)
	addpd	-24(%rsp), %xmm4
	movaps	%xmm4, -40(%rsp)
	movsd	-32(%rsp), %xmm1
	movsd	-40(%rsp), %xmm0
	ret
	.cfi_endproc
.LFE10:
	.size	vadd, .-vadd
	.p2align 4
	.globl	vsub
	.type	vsub, @function
vsub:
.LFB11:
	.cfi_startproc
	movq	%xmm0, -40(%rsp)
	movq	%xmm1, -32(%rsp)
	movapd	-40(%rsp), %xmm4
	movq	%xmm2, -24(%rsp)
	movq	%xmm3, -16(%rsp)
	subpd	-24(%rsp), %xmm4
	movaps	%xmm4, -40(%rsp)
	movsd	-32(%rsp), %xmm1
	movsd	-40(%rsp), %xmm0
	ret
	.cfi_endproc
.LFE11:
	.size	vsub, .-vsub
	.p2align 4
	.globl	vsmul
	.type	vsmul, @function
vsmul:
.LFB12:
	.cfi_startproc
	movq	%xmm0, -24(%rsp)
	unpcklpd	%xmm2, %xmm2
	movq	%xmm1, -16(%rsp)
	mulpd	-24(%rsp), %xmm2
	movaps	%xmm2, -24(%rsp)
	movsd	-16(%rsp), %xmm1
	movsd	-24(%rsp), %xmm0
	ret
	.cfi_endproc
.LFE12:
	.size	vsmul, .-vsmul
	.p2align 4
	.globl	vmul
	.type	vmul, @function
vmul:
.LFB13:
	.cfi_startproc
	movq	%xmm1, -32(%rsp)
	movq	%xmm0, -40(%rsp)
	movapd	-40(%rsp), %xmm0
	movq	%xmm2, -24(%rsp)
	movapd	-40(%rsp), %xmm2
	movq	%xmm3, -16(%rsp)
	movapd	-24(%rsp), %xmm1
	unpckhpd	%xmm0, %xmm0
	unpcklpd	%xmm2, %xmm2
	mulpd	-24(%rsp), %xmm2
	shufpd	$1, %xmm1, %xmm1
	mulpd	%xmm1, %xmm0
	movapd	%xmm2, %xmm1
	subpd	%xmm0, %xmm1
	addpd	%xmm0, %xmm2
	movsd	%xmm1, %xmm2
	movaps	%xmm2, -40(%rsp)
	movsd	-32(%rsp), %xmm1
	movsd	-40(%rsp), %xmm0
	ret
	.cfi_endproc
.LFE13:
	.size	vmul, .-vmul
	.p2align 4
	.globl	dist
	.type	dist, @function
dist:
.LFB14:
	.cfi_startproc
	subsd	%xmm2, %xmm0
	subsd	%xmm3, %xmm1
	jmp	hypot
	.cfi_endproc
.LFE14:
	.size	dist, .-dist
	.p2align 4
	.globl	disPP2Ln
	.type	disPP2Ln, @function
disPP2Ln:
.LFB15:
	.cfi_startproc
	movsd	8(%rsp), %xmm9
	movsd	16(%rsp), %xmm11
	movapd	%xmm0, %xmm8
	movapd	%xmm1, %xmm10
	movsd	24(%rsp), %xmm13
	movsd	32(%rsp), %xmm14
	subsd	%xmm9, %xmm8
	subsd	%xmm11, %xmm10
	movsd	.LC1(%rip), %xmm12
	movapd	%xmm13, %xmm3
	movapd	%xmm14, %xmm4
	subsd	%xmm9, %xmm3
	subsd	%xmm11, %xmm4
	movapd	%xmm8, %xmm2
	movapd	%xmm10, %xmm5
	mulsd	%xmm4, %xmm5
	movapd	%xmm3, %xmm6
	mulsd	%xmm3, %xmm2
	mulsd	%xmm3, %xmm6
	addsd	%xmm5, %xmm2
	movapd	%xmm4, %xmm5
	mulsd	%xmm4, %xmm5
	movapd	%xmm2, %xmm7
	addsd	%xmm5, %xmm6
	movq	.LC0(%rip), %xmm5
	subsd	%xmm6, %xmm7
	andpd	%xmm5, %xmm7
	andpd	%xmm2, %xmm5
	comisd	%xmm5, %xmm12
	jbe	.L28
	comisd	%xmm7, %xmm12
	ja	.L15
	xorl	%eax, %eax
	comisd	%xmm2, %xmm6
	movapd	%xmm10, %xmm1
	movapd	%xmm8, %xmm0
	setnb	%al
	movl	%eax, (%rdi)
	jmp	hypot
	.p2align 4,,10
	.p2align 3
.L28:
	pxor	%xmm5, %xmm5
	comisd	%xmm5, %xmm2
	jb	.L29
	comisd	%xmm7, %xmm12
	jbe	.L30
	subsd	%xmm14, %xmm1
	subsd	%xmm13, %xmm0
	movl	$1, (%rdi)
	movapd	%xmm1, %xmm10
	movapd	%xmm0, %xmm8
	movapd	%xmm10, %xmm1
	movapd	%xmm8, %xmm0
	jmp	hypot
	.p2align 4,,10
	.p2align 3
.L15:
	movl	$1, (%rdi)
	movapd	%xmm10, %xmm1
	movapd	%xmm8, %xmm0
	jmp	hypot
	.p2align 4,,10
	.p2align 3
.L29:
	comisd	%xmm7, %xmm12
	movl	$0, (%rdi)
	jbe	.L22
	subsd	%xmm14, %xmm1
	subsd	%xmm13, %xmm0
	movapd	%xmm1, %xmm10
	movapd	%xmm0, %xmm8
	movapd	%xmm10, %xmm1
	movapd	%xmm8, %xmm0
	jmp	hypot
	.p2align 4,,10
	.p2align 3
.L30:
	xorl	%eax, %eax
	comisd	%xmm2, %xmm6
	setnb	%al
	movl	%eax, (%rdi)
.L22:
	mulsd	%xmm2, %xmm4
	mulsd	%xmm2, %xmm3
	divsd	%xmm6, %xmm4
	divsd	%xmm6, %xmm3
	addsd	%xmm11, %xmm4
	subsd	%xmm4, %xmm1
	movapd	%xmm1, %xmm10
	movapd	%xmm10, %xmm1
	addsd	%xmm9, %xmm3
	subsd	%xmm3, %xmm0
	movapd	%xmm0, %xmm8
	movapd	%xmm8, %xmm0
	jmp	hypot
	.cfi_endproc
.LFE15:
	.size	disPP2Ln, .-disPP2Ln
	.p2align 4
	.globl	disSeg2Seg
	.type	disSeg2Seg, @function
disSeg2Seg:
.LFB16:
	.cfi_startproc
	subq	$120, %rsp
	.cfi_def_cfa_offset 128
	movdqu	160(%rsp), %xmm7
	leaq	108(%rsp), %rdi
	movdqu	176(%rsp), %xmm3
	movsd	128(%rsp), %xmm0
	movsd	136(%rsp), %xmm1
	movups	%xmm7, (%rsp)
	movups	%xmm3, 16(%rsp)
	call	disPP2Ln
	movl	108(%rsp), %esi
	addq	$32, %rsp
	.cfi_def_cfa_offset 96
	testl	%esi, %esi
	je	.L40
	minsd	.LC3(%rip), %xmm0
	movsd	%xmm0, 8(%rsp)
.L32:
	subq	$32, %rsp
	.cfi_def_cfa_offset 128
	movdqu	160(%rsp), %xmm6
	leaq	108(%rsp), %rdi
	movdqu	176(%rsp), %xmm7
	movsd	144(%rsp), %xmm0
	movsd	152(%rsp), %xmm1
	movups	%xmm6, (%rsp)
	movups	%xmm7, 16(%rsp)
	call	disPP2Ln
	movl	108(%rsp), %ecx
	addq	$32, %rsp
	.cfi_def_cfa_offset 96
	testl	%ecx, %ecx
	je	.L33
	minsd	8(%rsp), %xmm0
	movsd	%xmm0, 8(%rsp)
.L33:
	subq	$32, %rsp
	.cfi_def_cfa_offset 128
	movdqu	128(%rsp), %xmm3
	leaq	108(%rsp), %rdi
	movdqu	144(%rsp), %xmm6
	movsd	160(%rsp), %xmm0
	movsd	168(%rsp), %xmm1
	movups	%xmm3, (%rsp)
	movups	%xmm6, 16(%rsp)
	call	disPP2Ln
	movl	108(%rsp), %edx
	addq	$32, %rsp
	.cfi_def_cfa_offset 96
	testl	%edx, %edx
	je	.L34
	minsd	8(%rsp), %xmm0
	movsd	%xmm0, 8(%rsp)
.L34:
	subq	$32, %rsp
	.cfi_def_cfa_offset 128
	movdqu	128(%rsp), %xmm7
	leaq	108(%rsp), %rdi
	movdqu	144(%rsp), %xmm5
	movsd	176(%rsp), %xmm0
	movsd	184(%rsp), %xmm1
	movups	%xmm7, (%rsp)
	movups	%xmm5, 16(%rsp)
	call	disPP2Ln
	movl	108(%rsp), %eax
	addq	$32, %rsp
	.cfi_def_cfa_offset 96
	testl	%eax, %eax
	je	.L35
	minsd	8(%rsp), %xmm0
	movsd	%xmm0, 8(%rsp)
.L35:
	movsd	96(%rsp), %xmm2
	movsd	104(%rsp), %xmm4
	movsd	128(%rsp), %xmm7
	movsd	136(%rsp), %xmm6
	movapd	%xmm2, %xmm0
	movapd	%xmm4, %xmm1
	movsd	%xmm2, 24(%rsp)
	subsd	%xmm6, %xmm1
	subsd	%xmm7, %xmm0
	movsd	%xmm7, 56(%rsp)
	movsd	%xmm6, 48(%rsp)
	movsd	%xmm4, 16(%rsp)
	call	hypot
	movsd	24(%rsp), %xmm2
	movsd	152(%rsp), %xmm3
	movsd	144(%rsp), %xmm5
	movsd	16(%rsp), %xmm4
	minsd	8(%rsp), %xmm0
	movsd	%xmm3, 32(%rsp)
	subsd	%xmm3, %xmm4
	subsd	%xmm5, %xmm2
	movsd	%xmm5, 40(%rsp)
	movsd	%xmm0, 8(%rsp)
	movapd	%xmm4, %xmm1
	movapd	%xmm2, %xmm0
	call	hypot
	movsd	112(%rsp), %xmm2
	movsd	120(%rsp), %xmm4
	movsd	56(%rsp), %xmm7
	movsd	48(%rsp), %xmm6
	movapd	%xmm0, %xmm5
	movapd	%xmm4, %xmm1
	movapd	%xmm2, %xmm0
	minsd	8(%rsp), %xmm5
	movsd	%xmm2, 24(%rsp)
	subsd	%xmm6, %xmm1
	subsd	%xmm7, %xmm0
	movsd	%xmm4, 16(%rsp)
	movsd	%xmm5, 8(%rsp)
	call	hypot
	movsd	24(%rsp), %xmm2
	movsd	40(%rsp), %xmm5
	movsd	16(%rsp), %xmm4
	movsd	32(%rsp), %xmm3
	minsd	8(%rsp), %xmm0
	subsd	%xmm5, %xmm2
	subsd	%xmm3, %xmm4
	movsd	%xmm0, 8(%rsp)
	movapd	%xmm2, %xmm0
	movapd	%xmm4, %xmm1
	call	hypot
	minsd	8(%rsp), %xmm0
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L40:
	.cfi_restore_state
	movsd	.LC3(%rip), %xmm6
	movsd	%xmm6, 8(%rsp)
	jmp	.L32
	.cfi_endproc
.LFE16:
	.size	disSeg2Seg, .-disSeg2Seg
	.p2align 4
	.globl	disPoly2Poly
	.type	disPoly2Poly, @function
disPoly2Poly:
.LFB17:
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
	subq	$80, %rsp
	.cfi_def_cfa_offset 128
	movslq	128(%rsp), %rax
	movl	936(%rsp), %r14d
	testl	%eax, %eax
	jle	.L51
	salq	$4, %rax
	movsd	.LC3(%rip), %xmm6
	leaq	136(%rsp), %r12
	movslq	%r14d, %rbp
	leaq	(%r12,%rax), %r13
	salq	$4, %rbp
	leaq	944(%rsp), %rax
	addq	%rax, %rbp
	movsd	%xmm6, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L50:
	movdqu	(%r12), %xmm6
	movdqu	16(%r12), %xmm7
	movaps	%xmm6, 16(%rsp)
	movaps	%xmm7, 32(%rsp)
	testl	%r14d, %r14d
	jle	.L47
	leaq	944(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L49:
	movdqu	(%rbx), %xmm1
	subq	$64, %rsp
	.cfi_def_cfa_offset 192
	addq	$16, %rbx
	movdqa	80(%rsp), %xmm3
	movdqa	96(%rsp), %xmm4
	movups	%xmm1, 32(%rsp)
	movdqu	(%rbx), %xmm2
	movups	%xmm3, (%rsp)
	movups	%xmm2, 48(%rsp)
	movups	%xmm4, 16(%rsp)
	call	disSeg2Seg
	minsd	72(%rsp), %xmm0
	addq	$64, %rsp
	.cfi_def_cfa_offset 128
	movsd	%xmm0, 8(%rsp)
	cmpq	%rbp, %rbx
	jne	.L49
.L47:
	addq	$16, %r12
	cmpq	%r13, %r12
	jne	.L50
.L45:
	movsd	8(%rsp), %xmm0
	addq	$80, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
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
.L51:
	.cfi_restore_state
	movsd	.LC3(%rip), %xmm7
	movsd	%xmm7, 8(%rsp)
	jmp	.L45
	.cfi_endproc
.LFE17:
	.size	disPoly2Poly, .-disPoly2Poly
	.p2align 4
	.globl	min_heapify
	.type	min_heapify, @function
min_heapify:
.LFB18:
	.cfi_startproc
	movl	qsize(%rip), %esi
	jmp	.L63
	.p2align 4,,10
	.p2align 3
.L64:
	movslq	%edx, %rax
	salq	$4, %rax
	movsd	que+8(%rax), %xmm0
	movslq	%edi, %rax
	movq	%rax, %r8
	salq	$4, %r8
	movsd	que+8(%r8), %xmm1
	comisd	%xmm0, %xmm1
	jbe	.L57
	cmpl	%ecx, %esi
	jg	.L61
	movl	%edx, %ecx
.L62:
	cmpl	%edi, %ecx
	je	.L56
	movslq	%ecx, %rdx
	salq	$4, %rax
	salq	$4, %rdx
	movl	que(%rax), %edi
	movsd	que+8(%rax), %xmm0
	movdqa	que(%rdx), %xmm2
	movaps	%xmm2, que(%rax)
	movl	%edi, que(%rdx)
	movl	%ecx, %edi
	movsd	%xmm0, que+8(%rdx)
.L63:
	leal	(%rdi,%rdi), %edx
	leal	1(%rdx), %ecx
	cmpl	%edx, %esi
	jg	.L64
.L57:
	cmpl	%ecx, %esi
	jg	.L59
	ret
	.p2align 4,,10
	.p2align 3
.L59:
	movslq	%edi, %rax
	movslq	%ecx, %rdx
	movq	%rax, %r8
	salq	$4, %rdx
	salq	$4, %r8
	movsd	que+8(%r8), %xmm0
	comisd	que+8(%rdx), %xmm0
	ja	.L62
	ret
	.p2align 4,,10
	.p2align 3
.L61:
	movslq	%ecx, %r8
	salq	$4, %r8
	comisd	que+8(%r8), %xmm0
	cmovbe	%edx, %ecx
	jmp	.L62
.L56:
	ret
	.cfi_endproc
.LFE18:
	.size	min_heapify, .-min_heapify
	.p2align 4
	.globl	deq
	.type	deq, @function
deq:
.LFB19:
	.cfi_startproc
	movl	qsize(%rip), %eax
	xorl	%esi, %esi
	leal	-1(%rax), %edi
	movslq	%edi, %rax
	movl	%edi, qsize(%rip)
	salq	$4, %rax
	movdqa	que(%rax), %xmm3
	movaps	%xmm3, que(%rip)
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L73:
	movslq	%edx, %rax
	salq	$4, %rax
	movsd	que+8(%rax), %xmm0
	movslq	%esi, %rax
	movq	%rax, %r8
	salq	$4, %r8
	movsd	que+8(%r8), %xmm1
	comisd	%xmm0, %xmm1
	jbe	.L66
	cmpl	%ecx, %edi
	jle	.L72
	movslq	%ecx, %r8
	salq	$4, %r8
	comisd	que+8(%r8), %xmm0
	cmovbe	%edx, %ecx
.L70:
	cmpl	%ecx, %esi
	je	.L65
	movslq	%ecx, %rdx
	salq	$4, %rax
	salq	$4, %rdx
	movl	que(%rax), %esi
	movsd	que+8(%rax), %xmm0
	movdqa	que(%rdx), %xmm2
	movaps	%xmm2, que(%rax)
	movl	%esi, que(%rdx)
	movl	%ecx, %esi
	movsd	%xmm0, que+8(%rdx)
.L71:
	leal	(%rsi,%rsi), %edx
	leal	1(%rdx), %ecx
	cmpl	%edx, %edi
	jg	.L73
.L66:
	cmpl	%ecx, %edi
	jg	.L68
	ret
	.p2align 4,,10
	.p2align 3
.L68:
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	movq	%rax, %r8
	salq	$4, %rdx
	salq	$4, %r8
	movsd	que+8(%r8), %xmm0
	comisd	que+8(%rdx), %xmm0
	ja	.L70
.L65:
	ret
	.p2align 4,,10
	.p2align 3
.L72:
	movl	%edx, %ecx
	jmp	.L70
	.cfi_endproc
.LFE19:
	.size	deq, .-deq
	.p2align 4
	.globl	enq
	.type	enq, @function
enq:
.LFB20:
	.cfi_startproc
	movslq	qsize(%rip), %rax
	leal	1(%rax), %edx
	cmpl	qmax(%rip), %edx
	movl	%edx, qsize(%rip)
	jle	.L75
	movl	%edx, qmax(%rip)
.L75:
	movslq	%eax, %rdx
	salq	$4, %rdx
	movl	%edi, que(%rdx)
	movsd	%xmm0, que+8(%rdx)
	testl	%eax, %eax
	jg	.L76
	ret
	.p2align 4,,10
	.p2align 3
.L78:
	salq	$4, %rax
	movdqa	que(%rdx), %xmm2
	movl	que(%rax), %edi
	movsd	que+8(%rax), %xmm0
	movaps	%xmm2, que(%rax)
	movl	%edi, que(%rdx)
	movsd	%xmm0, 8(%rcx)
	testl	%esi, %esi
	je	.L74
	movslq	%esi, %rax
.L76:
	movl	%eax, %esi
	sarl	%esi
	movslq	%esi, %rdx
	salq	$4, %rdx
	leaq	que(%rdx), %rcx
	movsd	8(%rcx), %xmm1
	comisd	%xmm0, %xmm1
	ja	.L78
.L74:
	ret
	.cfi_endproc
.LFE20:
	.size	enq, .-enq
	.p2align 4
	.globl	dijkstra
	.type	dijkstra, @function
dijkstra:
.LFB21:
	.cfi_startproc
	movl	%esi, %r8d
	movl	$vis, %esi
	movl	%edi, %edx
	movl	$25, %ecx
	xorl	%eax, %eax
	movq	%rsi, %rdi
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	qmax(%rip), %r9d
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
	rep stosq
	movl	$1, qsize(%rip)
	movl	$0, (%rdi)
	movb	$0, vis+204(%rip)
	testl	%r9d, %r9d
	jg	.L84
	movl	$1, qmax(%rip)
	movl	$1, %r9d
.L84:
	movslq	N(%rip), %rdi
	movl	%edx, que(%rip)
	xorl	%r10d, %r10d
	xorl	%edx, %edx
	movq	$0x000000000, que+8(%rip)
	movl	$1, %eax
	movq	%rdi, %r11
.L85:
	movslq	%eax, %r12
	salq	$4, %r12
	addq	$que-16, %r12
.L95:
	testl	%eax, %eax
	je	.L126
	movdqa	(%r12), %xmm5
	movl	que(%rip), %esi
	subl	$1, %eax
	xorl	%ebp, %ebp
	movsd	que+8(%rip), %xmm2
	movaps	%xmm5, que(%rip)
	jmp	.L91
	.p2align 4,,10
	.p2align 3
.L127:
	movslq	%edx, %rcx
	salq	$4, %rcx
	movsd	que+8(%rcx), %xmm0
	movslq	%ebp, %rcx
	movq	%rcx, %r13
	salq	$4, %r13
	movsd	que+8(%r13), %xmm1
	comisd	%xmm0, %xmm1
	jbe	.L86
	cmpl	%ebx, %eax
	jle	.L106
	movslq	%ebx, %r13
	salq	$4, %r13
	comisd	que+8(%r13), %xmm0
	cmovbe	%edx, %ebx
.L90:
	cmpl	%ebx, %ebp
	je	.L89
	movslq	%ebx, %rdx
	salq	$4, %rcx
	salq	$4, %rdx
	movl	que(%rcx), %ebp
	movsd	que+8(%rcx), %xmm0
	movdqa	que(%rdx), %xmm4
	movaps	%xmm4, que(%rcx)
	movl	%ebp, que(%rdx)
	movl	%ebx, %ebp
	movsd	%xmm0, que+8(%rdx)
.L91:
	leal	(%rbp,%rbp), %edx
	leal	1(%rdx), %ebx
	cmpl	%edx, %eax
	jg	.L127
.L86:
	cmpl	%ebx, %eax
	jg	.L88
.L89:
	cmpl	%r8d, %esi
	je	.L128
.L92:
	movslq	%esi, %rcx
	subq	$16, %r12
	movl	$1, %edx
	cmpb	$0, vis(%rcx)
	jne	.L95
	movb	$1, vis(%rcx)
	testl	%r11d, %r11d
	jle	.L96
	imulq	$1640, %rcx, %rcx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L102:
	cmpl	%edx, %esi
	je	.L97
	cmpb	$0, vis(%rdx)
	jne	.L97
	movsd	dis(%rcx,%rdx,8), %xmm0
	leal	1(%rax), %ebx
	addsd	%xmm2, %xmm0
	cmpl	%r9d, %ebx
	jle	.L98
	movl	%ebx, %r9d
	movl	$1, %r10d
.L98:
	movslq	%eax, %rbp
	salq	$4, %rbp
	movl	%edx, que(%rbp)
	movsd	%xmm0, que+8(%rbp)
	testl	%eax, %eax
	jg	.L99
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L101:
	cltq
	movdqa	que(%rbp), %xmm3
	salq	$4, %rax
	movl	que(%rax), %r14d
	movsd	que+8(%rax), %xmm0
	movaps	%xmm3, que(%rax)
	movl	%r14d, que(%rbp)
	movsd	%xmm0, 8(%r13)
	testl	%r12d, %r12d
	je	.L100
	movl	%r12d, %eax
.L99:
	movl	%eax, %r12d
	sarl	%r12d
	movslq	%r12d, %rbp
	salq	$4, %rbp
	leaq	que(%rbp), %r13
	movsd	8(%r13), %xmm1
	comisd	%xmm0, %xmm1
	ja	.L101
.L100:
	movl	%ebx, %eax
.L97:
	addq	$1, %rdx
	cmpq	%rdi, %rdx
	jne	.L102
.L96:
	movl	$1, %edx
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L88:
	movslq	%ebp, %rcx
	movslq	%ebx, %rdx
	movq	%rcx, %r13
	salq	$4, %rdx
	salq	$4, %r13
	movsd	que+8(%r13), %xmm0
	comisd	que+8(%rdx), %xmm0
	ja	.L90
	cmpl	%r8d, %esi
	jne	.L92
.L128:
	testb	%r10b, %r10b
	je	.L93
	movl	%r9d, qmax(%rip)
.L93:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movapd	%xmm2, %xmm0
	popq	%rbp
	.cfi_def_cfa_offset 32
	movl	%eax, qsize(%rip)
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L106:
	.cfi_restore_state
	movl	%edx, %ebx
	jmp	.L90
.L126:
	testb	%r10b, %r10b
	je	.L104
	movl	%r9d, qmax(%rip)
.L104:
	testb	%dl, %dl
	je	.L105
	movl	$0, qsize(%rip)
.L105:
	movsd	.LC4(%rip), %xmm2
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	movapd	%xmm2, %xmm0
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE21:
	.size	dijkstra, .-dijkstra
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"%.20lf\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB22:
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
	subq	$1800, %rsp
	.cfi_def_cfa_offset 1856
.L130:
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	getchar_unlocked
.L159:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L159
	movl	%ebx, W(%rip)
	testl	%ebx, %ebx
	je	.L182
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	getchar_unlocked
.L131:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L131
	movl	%ebx, N(%rip)
	movl	%ebx, %r9d
	testl	%ebx, %ebx
	jle	.L132
	movl	$808, %r12d
	movl	$1, %r13d
.L135:
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L133:
	andl	$15, %eax
	leal	0(%rbp,%rbp,4), %edx
	leal	(%rax,%rdx,2), %ebp
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L133
	testl	%ebp, %ebp
	movl	%ebp, poly(%r12)
	movslq	%ebp, %rbp
	jle	.L140
	movq	%rbp, %r14
	movq	%r12, %rbx
	salq	$4, %r14
	addq	%r12, %r14
	.p2align 4,,10
	.p2align 3
.L139:
	xorl	%eax, %eax
	xorl	%r15d, %r15d
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L137:
	andl	$15, %eax
	leal	(%r15,%r15,4), %edx
	leal	(%rax,%rdx,2), %r15d
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L137
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	cvtsi2sdl	%r15d, %xmm0
	xorl	%r15d, %r15d
	movsd	%xmm0, poly+8(%rbx)
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L138:
	andl	$15, %eax
	leal	(%r15,%r15,4), %edx
	leal	(%rax,%rdx,2), %r15d
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L138
	pxor	%xmm0, %xmm0
	addq	$16, %rbx
	cvtsi2sdl	%r15d, %xmm0
	movsd	%xmm0, poly(%rbx)
	cmpq	%r14, %rbx
	jne	.L139
.L140:
	movslq	%r13d, %rax
	movl	N(%rip), %r9d
	salq	$4, %rbp
	movdqu	poly+8(%r12), %xmm2
	imulq	$808, %rax, %rax
	addl	$1, %r13d
	addq	$808, %r12
	movups	%xmm2, poly+8(%rbp,%rax)
	cmpl	%r13d, %r9d
	jge	.L135
	pxor	%xmm3, %xmm3
	leal	1(%r9), %eax
	cvtsi2sdl	W(%rip), %xmm3
	movl	%eax, %ebx
	testl	%r9d, %r9d
	jle	.L142
	movslq	%eax, %rsi
	movl	%eax, %r11d
	movl	$808, %edi
	movl	$1, %ecx
	imulq	$1640, %rsi, %r10
	movl	$dis+1640, %r8d
.L143:
	movslq	poly(%rdi), %rbp
	movsd	.LC3(%rip), %xmm1
	movapd	%xmm3, %xmm0
	testl	%ebp, %ebp
	jle	.L149
	leaq	poly+8(%rdi), %rdx
	salq	$4, %rbp
	movsd	.LC3(%rip), %xmm1
	pxor	%xmm2, %xmm2
	addq	%rdx, %rbp
	.p2align 4,,10
	.p2align 3
.L146:
	movsd	(%rdx), %xmm0
	addq	$16, %rdx
	movapd	%xmm0, %xmm7
	maxsd	%xmm2, %xmm0
	minsd	%xmm1, %xmm7
	movapd	%xmm0, %xmm2
	movapd	%xmm7, %xmm1
	cmpq	%rbp, %rdx
	jne	.L146
	movapd	%xmm3, %xmm0
	subsd	%xmm2, %xmm0
.L149:
	movsd	%xmm1, (%r8)
	addq	$808, %rdi
	movsd	%xmm1, dis(,%rcx,8)
	movsd	%xmm0, dis(%r10,%rcx,8)
	addq	$1, %rcx
	movsd	%xmm0, (%r8,%rsi,8)
	addq	$1640, %r8
	cmpq	%r11, %rcx
	jne	.L143
	imulq	$1640, %rsi, %rdx
	movsd	%xmm3, dis(%rdx)
	movsd	%xmm3, dis(,%rsi,8)
	cmpl	$1, %r9d
	je	.L141
	movl	%r9d, 44(%rsp)
	movl	$2, %esi
	movl	$poly+1616, %ecx
	movl	%eax, %r10d
	movl	$dis+3288, %edi
	movq	%rsi, %r8
.L158:
	imulq	$1640, %r8, %r14
	movl	%ebx, 60(%rsp)
	movq	%rcx, %rdx
	movq	%r8, %r12
	movslq	-808(%rcx), %rbp
	leaq	168(%rsp), %rax
	movq	%r8, 64(%rsp)
	movq	%rcx, 72(%rsp)
	movl	%ebp, 56(%rsp)
	salq	$4, %rbp
	movq	%rdi, 80(%rsp)
	addq	%rax, %rbp
	leaq	-1640(%r14), %rax
	leaq	-808(%rcx), %r14
	movq	%r10, 88(%rsp)
	movq	%rax, 48(%rsp)
	movq	%rdi, %rax
	.p2align 4,,10
	.p2align 3
.L157:
	movl	$101, %ecx
	leaq	160(%rsp), %rdi
	movq	%r14, %rsi
	movl	(%rdx), %r15d
	rep movsq
	movl	$101, %ecx
	leaq	976(%rsp), %rdi
	movq	%rdx, %rsi
	rep movsq
	movl	56(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L163
	movsd	.LC3(%rip), %xmm2
	movslq	%r15d, %rbx
	movq	%rdx, 24(%rsp)
	leaq	168(%rsp), %r13
	movq	%rax, 32(%rsp)
	salq	$4, %rbx
	leaq	984(%rsp), %rsi
	movq	%r12, 16(%rsp)
	addq	%rsi, %rbx
	movq	%r13, %r12
	movsd	%xmm2, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L156:
	movdqu	(%r12), %xmm7
	movdqu	16(%r12), %xmm3
	movaps	%xmm7, 96(%rsp)
	movaps	%xmm3, 112(%rsp)
	testl	%r15d, %r15d
	jle	.L153
	leaq	984(%rsp), %r13
	.p2align 4,,10
	.p2align 3
.L155:
	movdqu	0(%r13), %xmm1
	movdqu	16(%r13), %xmm0
	subq	$64, %rsp
	.cfi_def_cfa_offset 1920
	addq	$16, %r13
	movaps	%xmm1, 192(%rsp)
	movaps	%xmm0, 208(%rsp)
	movdqa	160(%rsp), %xmm4
	movdqa	176(%rsp), %xmm5
	movups	%xmm1, 32(%rsp)
	movups	%xmm0, 48(%rsp)
	movups	%xmm4, (%rsp)
	movups	%xmm5, 16(%rsp)
	call	disSeg2Seg
	minsd	72(%rsp), %xmm0
	addq	$64, %rsp
	.cfi_def_cfa_offset 1856
	movsd	%xmm0, 8(%rsp)
	cmpq	%r13, %rbx
	jne	.L155
.L153:
	addq	$16, %r12
	cmpq	%rbp, %r12
	jne	.L156
	movsd	8(%rsp), %xmm2
	movq	16(%rsp), %r12
	movq	24(%rsp), %rdx
	movq	32(%rsp), %rax
.L152:
	movq	48(%rsp), %rdi
	movsd	%xmm2, (%rax)
	addq	$808, %rdx
	addq	$1640, %rax
	movsd	%xmm2, dis(%rdi,%r12,8)
	addq	$1, %r12
	cmpl	%r12d, 44(%rsp)
	jge	.L157
	movq	64(%rsp), %r8
	movq	72(%rsp), %rcx
	movq	80(%rsp), %rdi
	movq	88(%rsp), %r10
	addq	$1, %r8
	movl	60(%rsp), %ebx
	addq	$808, %rcx
	addq	$1648, %rdi
	cmpq	%r10, %r8
	jne	.L158
	movl	44(%rsp), %r9d
.L141:
	addl	$2, %r9d
	xorl	%edi, %edi
	movl	%ebx, %esi
	movl	%r9d, N(%rip)
	call	dijkstra
	movl	$.LC6, %edi
	movl	$1, %eax
	call	printf
	jmp	.L130
.L163:
	movsd	.LC3(%rip), %xmm2
	jmp	.L152
.L132:
	leal	1(%rbx), %ebx
	pxor	%xmm0, %xmm0
	cvtsi2sdl	W(%rip), %xmm0
	movslq	%ebx, %rax
	imulq	$1640, %rax, %rdx
	movsd	%xmm0, dis(%rdx)
	movsd	%xmm0, dis(,%rax,8)
	jmp	.L141
.L182:
	addq	$1800, %rsp
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
.L142:
	.cfi_restore_state
	cltq
	imulq	$1640, %rax, %rdx
	movsd	%xmm3, dis(%rdx)
	movsd	%xmm3, dis(,%rax,8)
	jmp	.L141
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.globl	vis
	.bss
	.align 32
	.type	vis, @object
	.size	vis, 205
vis:
	.zero	205
	.globl	dis
	.align 32
	.type	dis, @object
	.size	dis, 336200
dis:
	.zero	336200
	.globl	poly
	.align 32
	.type	poly, @object
	.size	poly, 165640
poly:
	.zero	165640
	.globl	N
	.align 4
	.type	N, @object
	.size	N, 4
N:
	.zero	4
	.globl	W
	.align 4
	.type	W, @object
	.size	W, 4
W:
	.zero	4
	.globl	qmax
	.align 4
	.type	qmax, @object
	.size	qmax, 4
qmax:
	.zero	4
	.globl	qsize
	.align 4
	.type	qsize, @object
	.size	qsize, 4
qsize:
	.zero	4
	.globl	que
	.align 32
	.type	que, @object
	.size	que, 480000
que:
	.zero	480000
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	-500134854
	.long	1044740494
	.align 8
.LC3:
	.long	0
	.long	1100470148
	.align 8
.LC4:
	.long	0
	.long	-1074790400
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
