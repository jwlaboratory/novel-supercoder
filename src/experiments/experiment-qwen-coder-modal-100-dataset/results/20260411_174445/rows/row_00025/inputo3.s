	.file	"inputC.c"
	.text
	.p2align 4
	.globl	cmp2
	.type	cmp2, @function
cmp2:
.LFB29:
	.cfi_startproc
	movslq	(%rdi), %rax
	movq	.LC0(%rip), %xmm4
	movsd	.LC1(%rip), %xmm3
	salq	$4, %rax
	movsd	tbl(%rax), %xmm1
	leaq	tbl(%rax), %rcx
	movslq	(%rsi), %rax
	salq	$4, %rax
	movapd	%xmm1, %xmm0
	movsd	tbl(%rax), %xmm2
	subsd	%xmm2, %xmm0
	andpd	%xmm4, %xmm0
	comisd	%xmm0, %xmm3
	jbe	.L9
	movsd	8(%rcx), %xmm1
	movsd	tbl+8(%rax), %xmm2
	xorl	%eax, %eax
	movapd	%xmm1, %xmm0
	subsd	%xmm2, %xmm0
	andpd	%xmm4, %xmm0
	comisd	%xmm0, %xmm3
	ja	.L1
.L9:
	comisd	%xmm1, %xmm2
	sbbl	%eax, %eax
	andl	$2, %eax
	subl	$1, %eax
.L1:
	ret
	.cfi_endproc
.LFE29:
	.size	cmp2, .-cmp2
	.p2align 4
	.type	uniq.part.0, @function
uniq.part.0:
.LFB36:
	.cfi_startproc
	movq	%rdi, %r9
	movl	%esi, %edi
	cmpl	$1, %esi
	jle	.L26
	movq	.LC0(%rip), %xmm2
	movsd	.LC1(%rip), %xmm1
	movl	$1, %edx
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L24:
	movslq	%r10d, %r8
	movslq	%edx, %rax
	salq	$4, %r8
	salq	$4, %rax
	leaq	(%r9,%r8), %rsi
	addq	%r9, %rax
	movsd	(%rsi), %xmm3
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L27:
	movsd	8(%rsi), %xmm0
	subsd	8(%rax), %xmm0
	andpd	%xmm2, %xmm0
	comisd	%xmm0, %xmm1
	jbe	.L15
	addq	$16, %rax
	cmpl	%edx, %edi
	je	.L14
.L20:
	movapd	%xmm3, %xmm0
	subsd	(%rax), %xmm0
	movl	%edx, %ecx
	addl	$1, %edx
	andpd	%xmm2, %xmm0
	comisd	%xmm0, %xmm1
	ja	.L27
.L15:
	cmpl	%ecx, %edi
	jle	.L18
	addl	$1, %r10d
	cmpl	%r10d, %ecx
	je	.L18
	movslq	%ecx, %rax
	salq	$4, %rax
	movdqu	(%r9,%rax), %xmm4
	movups	%xmm4, 16(%r9,%r8)
.L18:
	leal	1(%rcx), %edx
	cmpl	%edx, %edi
	jg	.L24
.L14:
	leal	1(%r10), %eax
	ret
.L26:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE36:
	.size	uniq.part.0, .-uniq.part.0
	.p2align 4
	.globl	cmp
	.type	cmp, @function
cmp:
.LFB28:
	.cfi_startproc
	movsd	(%rdi), %xmm1
	movsd	(%rsi), %xmm2
	movq	.LC0(%rip), %xmm4
	movsd	.LC1(%rip), %xmm3
	movapd	%xmm1, %xmm0
	subsd	%xmm2, %xmm0
	andpd	%xmm4, %xmm0
	comisd	%xmm0, %xmm3
	jbe	.L36
	movsd	8(%rdi), %xmm1
	movsd	8(%rsi), %xmm2
	xorl	%eax, %eax
	movapd	%xmm1, %xmm0
	subsd	%xmm2, %xmm0
	andpd	%xmm4, %xmm0
	comisd	%xmm0, %xmm3
	ja	.L28
.L36:
	comisd	%xmm1, %xmm2
	sbbl	%eax, %eax
	andl	$2, %eax
	subl	$1, %eax
.L28:
	ret
	.cfi_endproc
.LFE28:
	.size	cmp, .-cmp
	.p2align 4
	.globl	lookup
	.type	lookup, @function
lookup:
.LFB8:
	.cfi_startproc
	cvttsd2sil	%xmm0, %edx
	movq	.LC0(%rip), %xmm4
	movsd	.LC1(%rip), %xmm3
	cvttsd2sil	%xmm1, %ecx
	movl	%edx, %eax
	negl	%eax
	cmovs	%edx, %eax
	movl	%ecx, %edx
	sall	$10, %eax
	negl	%edx
	cmovs	%ecx, %edx
	leal	1(%rax,%rdx), %edx
	movslq	%edx, %rax
	movl	%edx, %ecx
	imulq	$175916583, %rax, %rax
	sarl	$31, %ecx
	sarq	$44, %rax
	subl	%ecx, %eax
	movq	hashend(%rip), %rcx
	imull	$100003, %eax, %eax
	subl	%eax, %edx
	movslq	%edx, %rdx
	leaq	(%rdx,%rdx,2), %rax
	leaq	hash(,%rax,8), %rdx
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L44:
	movapd	%xmm0, %xmm2
	subsd	8(%rdx), %xmm2
	andpd	%xmm4, %xmm2
	comisd	%xmm2, %xmm3
	jbe	.L39
	movapd	%xmm1, %xmm2
	subsd	16(%rdx), %xmm2
	andpd	%xmm4, %xmm2
	comisd	%xmm2, %xmm3
	ja	.L48
.L39:
	addq	$24, %rdx
	movl	$hash, %eax
	cmpq	%rdx, %rcx
	cmove	%rax, %rdx
.L43:
	movl	(%rdx), %eax
	testl	%eax, %eax
	jne	.L44
	movl	$-1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L48:
	subl	$1, %eax
	ret
	.cfi_endproc
.LFE8:
	.size	lookup, .-lookup
	.p2align 4
	.globl	insert
	.type	insert, @function
insert:
.LFB9:
	.cfi_startproc
	cvttsd2sil	%xmm0, %edx
	movq	.LC0(%rip), %xmm4
	movl	%edi, %esi
	movsd	.LC1(%rip), %xmm3
	cvttsd2sil	%xmm1, %ecx
	movl	%edx, %eax
	negl	%eax
	cmovs	%edx, %eax
	movl	%ecx, %edx
	sall	$10, %eax
	negl	%edx
	cmovs	%ecx, %edx
	leal	1(%rax,%rdx), %edx
	movslq	%edx, %rax
	movl	%edx, %ecx
	imulq	$175916583, %rax, %rax
	sarl	$31, %ecx
	sarq	$44, %rax
	subl	%ecx, %eax
	imull	$100003, %eax, %eax
	subl	%eax, %edx
	movslq	%edx, %rdx
	leaq	(%rdx,%rdx,2), %rax
	movq	hashend(%rip), %rdx
	leaq	hash(,%rax,8), %rax
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L55:
	movapd	%xmm0, %xmm2
	subsd	8(%rax), %xmm2
	andpd	%xmm4, %xmm2
	comisd	%xmm2, %xmm3
	jbe	.L51
	movapd	%xmm1, %xmm2
	subsd	16(%rax), %xmm2
	andpd	%xmm4, %xmm2
	comisd	%xmm2, %xmm3
	ja	.L56
.L51:
	addq	$24, %rax
	movl	$hash, %ecx
	cmpq	%rax, %rdx
	cmove	%rcx, %rax
.L54:
	movl	(%rax), %ecx
	testl	%ecx, %ecx
	jne	.L55
	unpcklpd	%xmm1, %xmm0
	addl	$1, %esi
	movl	%esi, (%rax)
	movups	%xmm0, 8(%rax)
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L56:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE9:
	.size	insert, .-insert
	.p2align 4
	.globl	min_heapify
	.type	min_heapify, @function
min_heapify:
.LFB10:
	.cfi_startproc
	movl	qsize(%rip), %esi
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L67:
	movslq	%edx, %rax
	salq	$4, %rax
	movsd	que(%rax), %xmm0
	movslq	%edi, %rax
	movq	%rax, %r8
	salq	$4, %r8
	movsd	que(%r8), %xmm1
	comisd	%xmm0, %xmm1
	jbe	.L60
	cmpl	%ecx, %esi
	jg	.L64
	movl	%edx, %ecx
.L65:
	cmpl	%edi, %ecx
	je	.L59
	movslq	%ecx, %rdx
	salq	$4, %rax
	salq	$4, %rdx
	movl	que+8(%rax), %edi
	movsd	que(%rax), %xmm0
	movdqa	que(%rdx), %xmm2
	movaps	%xmm2, que(%rax)
	movl	%edi, que+8(%rdx)
	movl	%ecx, %edi
	movsd	%xmm0, que(%rdx)
.L66:
	leal	(%rdi,%rdi), %edx
	leal	1(%rdx), %ecx
	cmpl	%edx, %esi
	jg	.L67
.L60:
	cmpl	%ecx, %esi
	jg	.L62
	ret
	.p2align 4,,10
	.p2align 3
.L62:
	movslq	%edi, %rax
	movslq	%ecx, %rdx
	movq	%rax, %r8
	salq	$4, %rdx
	salq	$4, %r8
	movsd	que(%r8), %xmm0
	comisd	que(%rdx), %xmm0
	ja	.L65
	ret
	.p2align 4,,10
	.p2align 3
.L64:
	movslq	%ecx, %r8
	salq	$4, %r8
	comisd	que(%r8), %xmm0
	cmovbe	%edx, %ecx
	jmp	.L65
.L59:
	ret
	.cfi_endproc
.LFE10:
	.size	min_heapify, .-min_heapify
	.p2align 4
	.globl	deq
	.type	deq, @function
deq:
.LFB11:
	.cfi_startproc
	movl	qsize(%rip), %eax
	xorl	%esi, %esi
	leal	-1(%rax), %edi
	movslq	%edi, %rax
	movl	%edi, qsize(%rip)
	salq	$4, %rax
	movdqa	que(%rax), %xmm3
	movaps	%xmm3, que(%rip)
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L76:
	movslq	%edx, %rax
	salq	$4, %rax
	movsd	que(%rax), %xmm0
	movslq	%esi, %rax
	movq	%rax, %r8
	salq	$4, %r8
	movsd	que(%r8), %xmm1
	comisd	%xmm0, %xmm1
	jbe	.L69
	cmpl	%ecx, %edi
	jle	.L75
	movslq	%ecx, %r8
	salq	$4, %r8
	comisd	que(%r8), %xmm0
	cmovbe	%edx, %ecx
.L73:
	cmpl	%ecx, %esi
	je	.L68
	movslq	%ecx, %rdx
	salq	$4, %rax
	salq	$4, %rdx
	movl	que+8(%rax), %esi
	movsd	que(%rax), %xmm0
	movdqa	que(%rdx), %xmm2
	movaps	%xmm2, que(%rax)
	movl	%esi, que+8(%rdx)
	movl	%ecx, %esi
	movsd	%xmm0, que(%rdx)
.L74:
	leal	(%rsi,%rsi), %edx
	leal	1(%rdx), %ecx
	cmpl	%edx, %edi
	jg	.L76
.L69:
	cmpl	%ecx, %edi
	jg	.L71
	ret
	.p2align 4,,10
	.p2align 3
.L71:
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	movq	%rax, %r8
	salq	$4, %rdx
	salq	$4, %r8
	movsd	que(%r8), %xmm0
	comisd	que(%rdx), %xmm0
	ja	.L73
.L68:
	ret
	.p2align 4,,10
	.p2align 3
.L75:
	movl	%edx, %ecx
	jmp	.L73
	.cfi_endproc
.LFE11:
	.size	deq, .-deq
	.p2align 4
	.globl	enq
	.type	enq, @function
enq:
.LFB12:
	.cfi_startproc
	movslq	qsize(%rip), %rdx
	leal	1(%rdx), %ecx
	movq	%rdx, %rax
	salq	$4, %rdx
	cmpl	qmax(%rip), %ecx
	movl	%ecx, qsize(%rip)
	movl	%edi, que+8(%rdx)
	movsd	%xmm0, que(%rdx)
	jle	.L78
	movl	%ecx, qmax(%rip)
.L78:
	testl	%eax, %eax
	jg	.L79
	ret
	.p2align 4,,10
	.p2align 3
.L81:
	salq	$4, %rax
	movdqa	que(%rdx), %xmm2
	movl	que+8(%rax), %edi
	movaps	%xmm2, que(%rax)
	movsd	%xmm0, que(%rdx)
	movl	%edi, 8(%rsi)
	testl	%ecx, %ecx
	je	.L77
	movslq	%ecx, %rax
.L79:
	movl	%eax, %ecx
	sarl	%ecx
	movslq	%ecx, %rdx
	salq	$4, %rdx
	movsd	que(%rdx), %xmm1
	leaq	que(%rdx), %rsi
	comisd	%xmm0, %xmm1
	ja	.L81
.L77:
	ret
	.cfi_endproc
.LFE12:
	.size	enq, .-enq
	.p2align 4
	.globl	in
	.type	in, @function
in:
.LFB13:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L87:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L87
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE13:
	.size	in, .-in
	.p2align 4
	.globl	dbl
	.type	dbl, @function
dbl:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	call	getchar_unlocked
	cmpl	$45, %eax
	je	.L105
.L91:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L92:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L92
	cmpl	$46, %eax
	je	.L106
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%ebx, %xmm0
.L95:
	testl	%ebp, %ebp
	je	.L90
	xorpd	.LC5(%rip), %xmm0
.L90:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L105:
	.cfi_restore_state
	xorl	%eax, %eax
	movl	$1, %ebp
	call	getchar_unlocked
	jmp	.L91
	.p2align 4,,10
	.p2align 3
.L106:
	xorl	%eax, %eax
	call	getchar_unlocked
	movsd	.LC2(%rip), %xmm1
	pxor	%xmm2, %xmm2
	.p2align 4,,10
	.p2align 3
.L94:
	mulsd	.LC4(%rip), %xmm1
	andl	$15, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	xorl	%eax, %eax
	mulsd	%xmm1, %xmm0
	movsd	%xmm1, 8(%rsp)
	addsd	%xmm0, %xmm2
	movsd	%xmm2, (%rsp)
	call	getchar_unlocked
	movsd	(%rsp), %xmm2
	movsd	8(%rsp), %xmm1
	cmpl	$47, %eax
	jg	.L94
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%ebx, %xmm0
	addsd	%xmm2, %xmm0
	jmp	.L95
	.cfi_endproc
.LFE14:
	.size	dbl, .-dbl
	.p2align 4
	.globl	vadd
	.type	vadd, @function
vadd:
.LFB15:
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
.LFE15:
	.size	vadd, .-vadd
	.p2align 4
	.globl	vsub
	.type	vsub, @function
vsub:
.LFB16:
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
.LFE16:
	.size	vsub, .-vsub
	.p2align 4
	.globl	vsmul
	.type	vsmul, @function
vsmul:
.LFB17:
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
.LFE17:
	.size	vsmul, .-vsmul
	.p2align 4
	.globl	cross
	.type	cross, @function
cross:
.LFB18:
	.cfi_startproc
	mulsd	%xmm3, %xmm0
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE18:
	.size	cross, .-cross
	.p2align 4
	.globl	dot
	.type	dot, @function
dot:
.LFB19:
	.cfi_startproc
	mulsd	%xmm2, %xmm0
	mulsd	%xmm3, %xmm1
	addsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE19:
	.size	dot, .-dot
	.p2align 4
	.globl	norm
	.type	norm, @function
norm:
.LFB20:
	.cfi_startproc
	mulsd	%xmm1, %xmm1
	mulsd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE20:
	.size	norm, .-norm
	.p2align 4
	.globl	dist
	.type	dist, @function
dist:
.LFB21:
	.cfi_startproc
	subsd	%xmm2, %xmm0
	subsd	%xmm3, %xmm1
	jmp	hypot
	.cfi_endproc
.LFE21:
	.size	dist, .-dist
	.p2align 4
	.globl	ccw
	.type	ccw, @function
ccw:
.LFB22:
	.cfi_startproc
	subsd	%xmm0, %xmm4
	subsd	%xmm1, %xmm5
	movl	$1, %eax
	subsd	%xmm0, %xmm2
	subsd	%xmm1, %xmm3
	movapd	%xmm5, %xmm0
	movapd	%xmm4, %xmm1
	mulsd	%xmm2, %xmm0
	mulsd	%xmm3, %xmm1
	subsd	%xmm1, %xmm0
	comisd	.LC1(%rip), %xmm0
	ja	.L114
	movsd	.LC6(%rip), %xmm1
	comisd	%xmm0, %xmm1
	ja	.L117
	movapd	%xmm5, %xmm6
	movapd	%xmm4, %xmm0
	movl	$2, %eax
	mulsd	%xmm3, %xmm6
	mulsd	%xmm2, %xmm0
	addsd	%xmm6, %xmm0
	comisd	%xmm0, %xmm1
	ja	.L114
	mulsd	%xmm5, %xmm5
	movl	$0, %edx
	movl	$-2, %eax
	mulsd	%xmm3, %xmm3
	mulsd	%xmm4, %xmm4
	mulsd	%xmm2, %xmm2
	addsd	%xmm5, %xmm4
	addsd	%xmm3, %xmm2
	comisd	%xmm2, %xmm4
	cmovbe	%edx, %eax
	ret
.L117:
	movl	$-1, %eax
.L114:
	ret
	.cfi_endproc
.LFE22:
	.size	ccw, .-ccw
	.p2align 4
	.globl	dir
	.type	dir, @function
dir:
.LFB23:
	.cfi_startproc
	movq	24(%rsp), %xmm2
	movhpd	32(%rsp), %xmm2
	movq	8(%rsp), %xmm3
	movhpd	16(%rsp), %xmm3
	subpd	%xmm3, %xmm2
	movaps	%xmm2, -24(%rsp)
	movsd	-16(%rsp), %xmm1
	movsd	-24(%rsp), %xmm0
	ret
	.cfi_endproc
.LFE23:
	.size	dir, .-dir
	.p2align 4
	.globl	zero_ccw
	.type	zero_ccw, @function
zero_ccw:
.LFB24:
	.cfi_startproc
	subsd	%xmm0, %xmm2
	subsd	%xmm1, %xmm5
	xorl	%eax, %eax
	subsd	%xmm0, %xmm4
	subsd	%xmm1, %xmm3
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm2, %xmm5
	mulsd	%xmm3, %xmm4
	subsd	%xmm4, %xmm5
	andpd	.LC0(%rip), %xmm5
	comisd	%xmm5, %xmm0
	seta	%al
	ret
	.cfi_endproc
.LFE24:
	.size	zero_ccw, .-zero_ccw
	.p2align 4
	.globl	intersect
	.type	intersect, @function
intersect:
.LFB25:
	.cfi_startproc
	movsd	24(%rsp), %xmm7
	movsd	32(%rsp), %xmm14
	movsd	8(%rsp), %xmm2
	movsd	16(%rsp), %xmm3
	movsd	40(%rsp), %xmm9
	movsd	48(%rsp), %xmm10
	movapd	%xmm7, %xmm0
	movapd	%xmm14, %xmm1
	subsd	%xmm2, %xmm0
	subsd	%xmm3, %xmm1
	movapd	%xmm9, %xmm4
	movapd	%xmm10, %xmm5
	subsd	%xmm2, %xmm4
	subsd	%xmm3, %xmm5
	movapd	%xmm0, %xmm6
	movapd	%xmm1, %xmm8
	mulsd	%xmm4, %xmm8
	mulsd	%xmm5, %xmm6
	subsd	%xmm8, %xmm6
	movsd	.LC1(%rip), %xmm8
	comisd	%xmm8, %xmm6
	ja	.L133
	movsd	.LC6(%rip), %xmm13
	comisd	%xmm6, %xmm13
	ja	.L134
	movapd	%xmm1, %xmm11
	movapd	%xmm0, %xmm6
	mulsd	%xmm5, %xmm11
	mulsd	%xmm4, %xmm6
	addsd	%xmm11, %xmm6
	comisd	%xmm6, %xmm13
	ja	.L135
	movapd	%xmm1, %xmm11
	movapd	%xmm0, %xmm6
	movl	$-4, %ecx
	movl	$0, %edx
	mulsd	%xmm1, %xmm11
	mulsd	%xmm0, %xmm6
	mulsd	%xmm4, %xmm4
	mulsd	%xmm5, %xmm5
	addsd	%xmm11, %xmm6
	addsd	%xmm5, %xmm4
	comisd	%xmm6, %xmm4
	seta	%sil
	seta	%al
	movzbl	%sil, %esi
	movzbl	%al, %eax
	addl	%esi, %esi
	comisd	%xmm6, %xmm4
	cmovbe	%edx, %ecx
	sall	$2, %eax
.L124:
	movsd	56(%rsp), %xmm4
	movsd	64(%rsp), %xmm6
	movapd	%xmm4, %xmm5
	movapd	%xmm6, %xmm11
	subsd	%xmm2, %xmm5
	subsd	%xmm3, %xmm11
	movapd	%xmm5, %xmm15
	movapd	%xmm11, %xmm12
	mulsd	%xmm0, %xmm12
	mulsd	%xmm1, %xmm15
	subsd	%xmm15, %xmm12
	comisd	%xmm8, %xmm12
	ja	.L126
.L132:
	comisd	%xmm12, %xmm13
	ja	.L137
	movapd	%xmm11, %xmm15
	movapd	%xmm5, %xmm12
	mulsd	%xmm1, %xmm15
	mulsd	%xmm0, %xmm12
	addsd	%xmm15, %xmm12
	comisd	%xmm12, %xmm13
	ja	.L125
	mulsd	%xmm0, %xmm0
	mulsd	%xmm1, %xmm1
	mulsd	%xmm5, %xmm5
	mulsd	%xmm11, %xmm11
	addsd	%xmm1, %xmm0
	addsd	%xmm11, %xmm5
	comisd	%xmm0, %xmm5
	ja	.L147
.L126:
	movapd	%xmm4, %xmm0
	movapd	%xmm6, %xmm1
	subsd	%xmm9, %xmm2
	subsd	%xmm9, %xmm0
	subsd	%xmm10, %xmm1
	subsd	%xmm10, %xmm3
	movapd	%xmm0, %xmm4
	movapd	%xmm1, %xmm5
	mulsd	%xmm3, %xmm4
	mulsd	%xmm2, %xmm5
	subsd	%xmm5, %xmm4
	comisd	%xmm8, %xmm4
	ja	.L141
	comisd	%xmm4, %xmm13
	ja	.L140
	movapd	%xmm1, %xmm5
	movapd	%xmm0, %xmm4
	mulsd	%xmm3, %xmm5
	mulsd	%xmm2, %xmm4
	addsd	%xmm5, %xmm4
	comisd	%xmm4, %xmm13
	ja	.L141
	movapd	%xmm1, %xmm5
	movapd	%xmm0, %xmm4
	xorl	%eax, %eax
	movl	$1, %edx
	mulsd	%xmm1, %xmm5
	mulsd	%xmm0, %xmm4
	mulsd	%xmm2, %xmm2
	mulsd	%xmm3, %xmm3
	addsd	%xmm5, %xmm4
	addsd	%xmm3, %xmm2
	comisd	%xmm4, %xmm2
	setbe	%al
.L129:
	subsd	%xmm9, %xmm7
	subsd	%xmm10, %xmm14
	movapd	%xmm7, %xmm3
	movapd	%xmm14, %xmm2
	mulsd	%xmm0, %xmm2
	mulsd	%xmm1, %xmm3
	subsd	%xmm3, %xmm2
	comisd	%xmm8, %xmm2
	ja	.L122
	comisd	%xmm2, %xmm13
	ja	.L142
	movapd	%xmm14, %xmm3
	movapd	%xmm7, %xmm2
	mulsd	%xmm1, %xmm3
	mulsd	%xmm0, %xmm2
	addsd	%xmm3, %xmm2
	comisd	%xmm2, %xmm13
	ja	.L122
	mulsd	%xmm0, %xmm0
	movl	$1, %edx
	mulsd	%xmm1, %xmm1
	mulsd	%xmm7, %xmm7
	mulsd	%xmm14, %xmm14
	addsd	%xmm1, %xmm0
	addsd	%xmm14, %xmm7
	comisd	%xmm0, %xmm7
	cmova	%eax, %edx
.L122:
	movl	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L133:
	movl	$-1, %esi
	movl	$2, %ecx
	movl	$-2, %eax
.L123:
	movsd	56(%rsp), %xmm4
	movsd	64(%rsp), %xmm6
	movapd	%xmm0, %xmm12
	xorl	%edx, %edx
	movapd	%xmm1, %xmm13
	movapd	%xmm4, %xmm5
	movapd	%xmm6, %xmm11
	subsd	%xmm2, %xmm5
	subsd	%xmm3, %xmm11
	mulsd	%xmm5, %xmm13
	mulsd	%xmm11, %xmm12
	subsd	%xmm13, %xmm12
	movsd	.LC6(%rip), %xmm13
	comisd	%xmm8, %xmm12
	jbe	.L132
	movl	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L141:
	xorl	%edx, %edx
	movl	$1, %eax
	jmp	.L129
.L137:
	movl	%esi, %ecx
	.p2align 4,,10
	.p2align 3
.L125:
	testl	%ecx, %ecx
	jle	.L126
	xorl	%edx, %edx
	movl	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L135:
	movl	$-2, %esi
	movl	$4, %ecx
	movl	$-4, %eax
	jmp	.L123
.L134:
	movl	$1, %esi
	movl	$-2, %ecx
	movl	$2, %eax
	jmp	.L124
.L147:
	movl	%eax, %ecx
	jmp	.L125
.L140:
	movl	$1, %edx
	xorl	%eax, %eax
	jmp	.L129
.L142:
	movl	%eax, %edx
	jmp	.L122
	.cfi_endproc
.LFE25:
	.size	intersect, .-intersect
	.p2align 4
	.globl	crossPoint
	.type	crossPoint, @function
crossPoint:
.LFB26:
	.cfi_startproc
	movq	8(%rsp), %xmm1
	movhpd	16(%rsp), %xmm1
	movq	24(%rsp), %xmm6
	movhpd	32(%rsp), %xmm6
	movsd	40(%rsp), %xmm0
	movsd	48(%rsp), %xmm3
	subpd	%xmm1, %xmm6
	movsd	56(%rsp), %xmm7
	movsd	64(%rsp), %xmm4
	movsd	.LC1(%rip), %xmm8
	subsd	%xmm0, %xmm7
	subsd	%xmm3, %xmm4
	movapd	%xmm6, %xmm5
	movapd	%xmm6, %xmm2
	unpckhpd	%xmm5, %xmm5
	mulsd	%xmm7, %xmm5
	mulsd	%xmm4, %xmm2
	subsd	%xmm5, %xmm2
	movapd	%xmm2, %xmm5
	andpd	.LC0(%rip), %xmm5
	comisd	%xmm5, %xmm8
	ja	.L150
	subsd	%xmm1, %xmm0
	movl	$1, %eax
	movl	%eax, (%rdi)
	mulsd	%xmm4, %xmm0
	movapd	%xmm1, %xmm4
	unpckhpd	%xmm4, %xmm4
	subsd	%xmm4, %xmm3
	mulsd	%xmm7, %xmm3
	subsd	%xmm3, %xmm0
	divsd	%xmm2, %xmm0
	unpcklpd	%xmm0, %xmm0
	mulpd	%xmm6, %xmm0
	addpd	%xmm1, %xmm0
	movaps	%xmm0, -24(%rsp)
	movsd	-16(%rsp), %xmm1
	movsd	-24(%rsp), %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L150:
	movsd	.LC2(%rip), %xmm7
	xorl	%eax, %eax
	movl	%eax, (%rdi)
	unpcklpd	%xmm7, %xmm7
	movaps	%xmm7, -24(%rsp)
	movsd	-16(%rsp), %xmm1
	movsd	-24(%rsp), %xmm0
	ret
	.cfi_endproc
.LFE26:
	.size	crossPoint, .-crossPoint
	.p2align 4
	.globl	uniq
	.type	uniq, @function
uniq:
.LFB27:
	.cfi_startproc
	testl	%esi, %esi
	je	.L152
	jmp	uniq.part.0
.L152:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE27:
	.size	uniq, .-uniq
	.p2align 4
	.globl	checklim
	.type	checklim, @function
checklim:
.LFB30:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movslq	%edi, %rbx
	movl	hi(,%rbx,4), %edx
	movl	lim(,%rbx,4), %eax
	cmpl	%eax, %edx
	jl	.L153
	testl	%eax, %eax
	je	.L157
	cmpl	%eax, %edx
	je	.L158
.L153:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L157:
	.cfi_restore_state
	movl	$8, lim(,%rbx,4)
	movl	$32, %edi
	movl	$0, hi(,%rbx,4)
	call	malloc
	movq	%rax, to(,%rbx,8)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L158:
	.cfi_restore_state
	movl	$128, %esi
	movq	to(,%rbx,8), %rdi
	cmpl	%esi, %edx
	cmovle	%edx, %esi
	addl	%edx, %esi
	movl	%esi, lim(,%rbx,4)
	movslq	%esi, %rsi
	salq	$2, %rsi
	call	realloc
	movq	%rax, to(,%rbx,8)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE30:
	.size	checklim, .-checklim
	.p2align 4
	.globl	pushback
	.type	pushback, @function
pushback:
.LFB31:
	.cfi_startproc
	cmpl	%esi, %edi
	je	.L165
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movslq	%edi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%esi, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movslq	hi(,%rbp,4), %rdx
	testl	%edx, %edx
	jle	.L161
	movq	to(,%rbp,8), %rax
	leaq	(%rax,%rdx,4), %rdx
	jmp	.L162
	.p2align 4,,10
	.p2align 3
.L168:
	addq	$4, %rax
	cmpq	%rdx, %rax
	je	.L161
.L162:
	cmpl	%ebx, (%rax)
	jne	.L168
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
.L161:
	.cfi_restore_state
	call	checklim
	movslq	hi(,%rbp,4), %rax
	movq	to(,%rbp,8), %rdx
	leal	1(%rax), %ecx
	movl	%ecx, hi(,%rbp,4)
	movl	%ebx, (%rdx,%rax,4)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L165:
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE31:
	.size	pushback, .-pushback
	.p2align 4
	.globl	segarrangement
	.type	segarrangement, @function
segarrangement:
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	n(%rip), %r10d
	movl	$1, sz(%rip)
	movq	%xmm1, 8(%rsp)
	movsd	8(%rsp), %xmm6
	movq	%xmm0, (%rsp)
	movapd	(%rsp), %xmm7
	movaps	%xmm7, tbl(%rip)
	testl	%r10d, %r10d
	jle	.L232
	movapd	%xmm7, %xmm4
	movl	$data, %eax
	movl	$tbl+16, %edi
	xorl	%esi, %esi
	movq	.LC0(%rip), %xmm3
	movsd	.LC1(%rip), %xmm2
	movl	$1, %r11d
	jmp	.L178
.L171:
	xorl	%r11d, %r11d
.L176:
	addl	$1, %esi
	addq	$4040, %rax
	addq	$32, %rdi
	cmpl	%r10d, %esi
	je	.L279
.L178:
	movslq	32(%rax), %rdx
	movslq	%esi, %r9
	movdqu	(%rax), %xmm0
	imulq	$4040, %r9, %rbx
	movdqu	16(%rax), %xmm5
	movq	%rdx, %rcx
	addq	$2, %rdx
	movaps	%xmm0, (%rdi)
	salq	$4, %rdx
	movaps	%xmm5, 16(%rdi)
	leal	2(%rcx), %r8d
	movups	%xmm0, data+8(%rdx,%rbx)
	leal	1(%rcx), %edx
	movdqu	16(%rax), %xmm5
	movslq	%edx, %rdx
	movl	%r8d, 32(%rax)
	addq	$2, %rdx
	salq	$4, %rdx
	movups	%xmm5, data+8(%rbx,%rdx)
	testl	%r11d, %r11d
	je	.L171
	movsd	(%rax), %xmm0
	movapd	%xmm4, %xmm1
	subsd	%xmm0, %xmm1
	andpd	%xmm3, %xmm1
	comisd	%xmm1, %xmm2
	jbe	.L172
	movapd	%xmm6, %xmm1
	subsd	8(%rax), %xmm1
	andpd	%xmm3, %xmm1
	comisd	%xmm1, %xmm2
	ja	.L171
.L172:
	movsd	16(%rax), %xmm5
	movapd	%xmm4, %xmm1
	movsd	24(%rax), %xmm8
	subsd	%xmm5, %xmm1
	andpd	%xmm3, %xmm1
	comisd	%xmm1, %xmm2
	jbe	.L174
	movapd	%xmm6, %xmm1
	subsd	%xmm8, %xmm1
	andpd	%xmm3, %xmm1
	comisd	%xmm1, %xmm2
	ja	.L171
.L174:
	movsd	8(%rax), %xmm1
	subsd	%xmm4, %xmm0
	subsd	%xmm6, %xmm8
	subsd	%xmm4, %xmm5
	subsd	%xmm6, %xmm1
	mulsd	%xmm8, %xmm0
	mulsd	%xmm5, %xmm1
	subsd	%xmm1, %xmm0
	andpd	%xmm3, %xmm0
	comisd	%xmm0, %xmm2
	jbe	.L176
	imulq	$4040, %r9, %r9
	movslq	%r8d, %rdx
	addl	$3, %ecx
	addq	$2, %rdx
	movl	%ecx, 32(%rax)
	salq	$4, %rdx
	movups	%xmm7, data+8(%rdx,%r9)
	jmp	.L171
.L279:
	leal	1(%r10,%r10), %eax
	movl	%eax, sz(%rip)
	cmpl	$1, %r10d
	je	.L180
	movl	%eax, %r11d
	xorl	%esi, %esi
	xorl	%r14d, %r14d
	movl	$1, %r8d
	movsd	.LC1(%rip), %xmm12
	movl	$-4, %r12d
.L179:
	movq	%rsi, %rcx
	addq	$4040, %rsi
	movl	%r8d, %edi
	xorl	%r13d, %r13d
	movq	%rsi, %rdx
	jmp	.L194
	.p2align 4,,10
	.p2align 3
.L283:
	movsd	.LC6(%rip), %xmm14
	comisd	%xmm11, %xmm14
	ja	.L234
	movapd	%xmm2, %xmm15
	movapd	%xmm1, %xmm11
	mulsd	%xmm10, %xmm15
	mulsd	%xmm5, %xmm11
	addsd	%xmm15, %xmm11
	comisd	%xmm11, %xmm14
	ja	.L184
	movapd	%xmm2, %xmm15
	movapd	%xmm1, %xmm11
	movl	%r13d, %ebp
	mulsd	%xmm2, %xmm15
	mulsd	%xmm1, %xmm11
	mulsd	%xmm5, %xmm5
	mulsd	%xmm10, %xmm10
	addsd	%xmm15, %xmm11
	addsd	%xmm10, %xmm5
	comisd	%xmm11, %xmm5
	seta	%bl
	seta	%r9b
	movzbl	%bl, %ebx
	movzbl	%r9b, %r9d
	addl	%ebx, %ebx
	comisd	%xmm11, %xmm5
	cmova	%r12d, %ebp
	sall	$2, %r9d
.L183:
	movapd	%xmm7, %xmm5
	movapd	%xmm6, %xmm10
	subsd	%xmm3, %xmm5
	subsd	%xmm4, %xmm10
	movapd	%xmm1, %xmm11
	movapd	%xmm2, %xmm15
	mulsd	%xmm10, %xmm11
	mulsd	%xmm5, %xmm15
	subsd	%xmm15, %xmm11
	comisd	%xmm12, %xmm11
	ja	.L186
.L231:
	comisd	%xmm11, %xmm14
	ja	.L236
.L284:
	movapd	%xmm2, %xmm15
	movapd	%xmm1, %xmm11
	mulsd	%xmm10, %xmm15
	mulsd	%xmm5, %xmm11
	addsd	%xmm15, %xmm11
	comisd	%xmm11, %xmm14
	ja	.L185
	mulsd	%xmm1, %xmm1
	mulsd	%xmm2, %xmm2
	mulsd	%xmm5, %xmm5
	mulsd	%xmm10, %xmm10
	addsd	%xmm2, %xmm1
	addsd	%xmm10, %xmm5
	comisd	%xmm1, %xmm5
	ja	.L280
.L186:
	subsd	%xmm0, %xmm7
	subsd	%xmm8, %xmm6
	subsd	%xmm0, %xmm3
	subsd	%xmm8, %xmm4
	movapd	%xmm7, %xmm1
	movapd	%xmm6, %xmm2
	mulsd	%xmm4, %xmm1
	mulsd	%xmm3, %xmm2
	subsd	%xmm2, %xmm1
	comisd	%xmm12, %xmm1
	ja	.L237
	comisd	%xmm1, %xmm14
	ja	.L238
	movapd	%xmm6, %xmm2
	movapd	%xmm7, %xmm1
	mulsd	%xmm4, %xmm2
	mulsd	%xmm3, %xmm1
	addsd	%xmm2, %xmm1
	comisd	%xmm1, %xmm14
	ja	.L239
	mulsd	%xmm3, %xmm3
	movapd	%xmm6, %xmm2
	movapd	%xmm7, %xmm1
	movl	%r13d, %ebp
	mulsd	%xmm6, %xmm2
	mulsd	%xmm7, %xmm1
	mulsd	%xmm4, %xmm4
	addsd	%xmm2, %xmm1
	addsd	%xmm4, %xmm3
	comisd	%xmm1, %xmm3
	seta	%bl
	seta	%r9b
	movzbl	%bl, %ebx
	movzbl	%r9b, %r9d
	addl	%ebx, %ebx
	comisd	%xmm1, %xmm3
	cmova	%r12d, %ebp
	sall	$2, %r9d
.L190:
	movapd	%xmm13, %xmm1
	subsd	%xmm0, %xmm9
	subsd	%xmm8, %xmm1
	movapd	%xmm7, %xmm2
	movapd	%xmm6, %xmm3
	mulsd	%xmm9, %xmm3
	mulsd	%xmm1, %xmm2
	subsd	%xmm3, %xmm2
	comisd	%xmm12, %xmm2
	ja	.L192
	comisd	%xmm2, %xmm14
	ja	.L241
.L290:
	movapd	%xmm1, %xmm3
	movapd	%xmm9, %xmm2
	mulsd	%xmm6, %xmm3
	mulsd	%xmm7, %xmm2
	addsd	%xmm3, %xmm2
	comisd	%xmm2, %xmm14
	ja	.L191
	mulsd	%xmm9, %xmm9
	movapd	%xmm6, %xmm3
	movapd	%xmm7, %xmm2
	mulsd	%xmm6, %xmm3
	mulsd	%xmm7, %xmm2
	mulsd	%xmm1, %xmm1
	addsd	%xmm3, %xmm2
	addsd	%xmm9, %xmm1
	comisd	%xmm2, %xmm1
	ja	.L281
.L192:
	movupd	data(%rcx), %xmm3
	movupd	data+16(%rcx), %xmm2
	subpd	%xmm3, %xmm2
	movapd	%xmm2, %xmm5
	movapd	%xmm2, %xmm1
	mulsd	%xmm6, %xmm1
	unpckhpd	%xmm5, %xmm5
	movapd	%xmm5, %xmm4
	mulsd	%xmm7, %xmm4
	subsd	%xmm4, %xmm1
	movapd	%xmm1, %xmm4
	andpd	.LC0(%rip), %xmm4
	comisd	%xmm4, %xmm12
	ja	.L188
	subsd	%xmm3, %xmm0
	movslq	%r11d, %r9
	movl	$1, %r14d
	addl	$1, %r11d
	salq	$4, %r9
	mulsd	%xmm6, %xmm0
	movapd	%xmm3, %xmm6
	unpckhpd	%xmm6, %xmm6
	subsd	%xmm6, %xmm8
	mulsd	%xmm7, %xmm8
	subsd	%xmm8, %xmm0
	divsd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	mulpd	%xmm2, %xmm0
	addpd	%xmm3, %xmm0
	movaps	%xmm0, tbl(%r9)
	movslq	data+32(%rcx), %r9
	leal	1(%r9), %ebx
	salq	$4, %r9
	movl	%ebx, data+32(%rcx)
	movups	%xmm0, data+40(%rcx,%r9)
	movslq	data+32(%rdx), %r9
	leal	1(%r9), %ebx
	salq	$4, %r9
	movl	%ebx, data+32(%rdx)
	movups	%xmm0, data+40(%rdx,%r9)
.L188:
	addl	$1, %edi
	addq	$4040, %rdx
	cmpl	%r10d, %edi
	jge	.L282
.L194:
	movsd	data(%rcx), %xmm3
	movsd	data+8(%rcx), %xmm4
	movsd	data(%rdx), %xmm0
	movsd	data+16(%rcx), %xmm9
	movsd	data+16(%rdx), %xmm7
	movsd	data+24(%rdx), %xmm6
	movsd	data+24(%rcx), %xmm13
	movapd	%xmm9, %xmm1
	movapd	%xmm0, %xmm5
	movsd	data+8(%rdx), %xmm8
	subsd	%xmm3, %xmm1
	subsd	%xmm3, %xmm5
	movapd	%xmm13, %xmm2
	movapd	%xmm8, %xmm10
	subsd	%xmm4, %xmm2
	subsd	%xmm4, %xmm10
	movapd	%xmm1, %xmm11
	mulsd	%xmm10, %xmm11
	movapd	%xmm2, %xmm15
	mulsd	%xmm5, %xmm15
	subsd	%xmm15, %xmm11
	comisd	%xmm12, %xmm11
	jbe	.L283
	movapd	%xmm7, %xmm5
	movapd	%xmm6, %xmm10
	movapd	%xmm1, %xmm11
	subsd	%xmm3, %xmm5
	subsd	%xmm4, %xmm10
	movapd	%xmm2, %xmm15
	mulsd	%xmm10, %xmm11
	mulsd	%xmm5, %xmm15
	subsd	%xmm15, %xmm11
	comisd	%xmm12, %xmm11
	ja	.L188
	movl	$-1, %ebx
	movl	$2, %ebp
	movsd	.LC6(%rip), %xmm14
	movl	$-2, %r9d
	comisd	%xmm11, %xmm14
	jbe	.L284
.L236:
	movl	%ebx, %ebp
.L185:
	testl	%ebp, %ebp
	jle	.L186
.L278:
	addl	$1, %edi
	addq	$4040, %rdx
	cmpl	%r10d, %edi
	jl	.L194
.L282:
	addl	$1, %r8d
	cmpl	%r10d, %r8d
	jne	.L179
	testb	%r14b, %r14b
	je	.L180
	movl	%r11d, sz(%rip)
	movslq	%r11d, %rsi
.L170:
	movl	$cmp, %ecx
	movl	$16, %edx
	movl	$tbl, %edi
	xorl	%ebx, %ebx
	call	qsort
	movl	sz(%rip), %esi
	testl	%esi, %esi
	je	.L196
	movl	$tbl, %edi
	call	uniq.part.0
	movl	$tbl, %r8d
	movl	$1, %esi
	movq	hashend(%rip), %rdx
	movl	%eax, sz(%rip)
	movl	%eax, %edi
	testl	%eax, %eax
	jle	.L277
	movq	.LC0(%rip), %xmm2
	movsd	.LC1(%rip), %xmm1
.L205:
	movapd	(%r8), %xmm5
	cvttsd2sil	%xmm5, %ecx
	movapd	%xmm5, %xmm7
	movapd	%xmm5, %xmm3
	unpckhpd	%xmm7, %xmm7
	cvttsd2sil	%xmm7, %r9d
	movapd	%xmm7, %xmm4
	movl	%ecx, %eax
	negl	%eax
	cmovs	%ecx, %eax
	movl	%r9d, %ecx
	sall	$10, %eax
	negl	%ecx
	cmovs	%r9d, %ecx
	leal	1(%rax,%rcx), %ecx
	movslq	%ecx, %rax
	movl	%ecx, %r9d
	imulq	$175916583, %rax, %rax
	sarl	$31, %r9d
	sarq	$44, %rax
	subl	%r9d, %eax
	imull	$100003, %eax, %eax
	subl	%eax, %ecx
	movslq	%ecx, %rax
	leaq	(%rax,%rax,2), %rax
	leaq	hash(,%rax,8), %rax
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L204:
	movapd	%xmm3, %xmm0
	subsd	8(%rax), %xmm0
	andpd	%xmm2, %xmm0
	comisd	%xmm0, %xmm1
	jbe	.L199
	movapd	%xmm4, %xmm0
	subsd	16(%rax), %xmm0
	andpd	%xmm2, %xmm0
	comisd	%xmm0, %xmm1
	ja	.L285
.L199:
	addq	$24, %rax
	movl	$hash, %ecx
	cmpq	%rdx, %rax
	cmove	%rcx, %rax
.L203:
	movl	(%rax), %ecx
	testl	%ecx, %ecx
	jne	.L204
	movl	%esi, (%rax)
	movl	%esi, %ecx
	movups	%xmm5, 8(%rax)
.L202:
	addq	$16, %r8
	addl	$1, %esi
	cmpl	%ecx, %edi
	jg	.L205
.L277:
	sall	$2, %edi
	movslq	%edi, %rbx
.L196:
	movq	%rbx, %rdx
	xorl	%esi, %esi
	movl	$hi, %edi
	call	memset
	movq	%rbx, %rdx
	xorl	%esi, %esi
	movl	$lim, %edi
	call	memset
	movl	n(%rip), %eax
	xorl	%ebx, %ebx
	movl	$0, (%rsp)
	movq	.LC0(%rip), %xmm2
	testl	%eax, %eax
	jle	.L169
.L206:
	movl	data+32(%rbx), %r12d
	testl	%r12d, %r12d
	jle	.L286
	movslq	%r12d, %rsi
	movq	hashend(%rip), %rcx
	movl	$u, %r8d
	movq	%rbx, %rdi
	movsd	.LC1(%rip), %xmm1
	leaq	u(,%rsi,4), %r9
	.p2align 4,,10
	.p2align 3
.L215:
	movsd	data+40(%rdi), %xmm3
	movsd	data+48(%rdi), %xmm4
	cvttsd2sil	%xmm3, %edx
	cvttsd2sil	%xmm4, %r10d
	movl	%edx, %eax
	negl	%eax
	cmovs	%edx, %eax
	movl	%r10d, %edx
	sall	$10, %eax
	negl	%edx
	cmovs	%r10d, %edx
	leal	1(%rax,%rdx), %edx
	movslq	%edx, %rax
	movl	%edx, %r10d
	imulq	$175916583, %rax, %rax
	sarl	$31, %r10d
	sarq	$44, %rax
	subl	%r10d, %eax
	imull	$100003, %eax, %eax
	subl	%eax, %edx
	movslq	%edx, %rdx
	leaq	(%rdx,%rdx,2), %rax
	leaq	hash(,%rax,8), %rax
	jmp	.L213
	.p2align 4,,10
	.p2align 3
.L214:
	movapd	%xmm3, %xmm0
	subsd	8(%rax), %xmm0
	andpd	%xmm2, %xmm0
	comisd	%xmm0, %xmm1
	jbe	.L209
	movapd	%xmm4, %xmm0
	subsd	16(%rax), %xmm0
	andpd	%xmm2, %xmm0
	comisd	%xmm0, %xmm1
	ja	.L287
.L209:
	addq	$24, %rax
	movl	$hash, %edx
	cmpq	%rcx, %rax
	cmove	%rdx, %rax
.L213:
	movl	(%rax), %edx
	testl	%edx, %edx
	jne	.L214
	movl	$-1, %edx
.L212:
	movl	%edx, (%r8)
	addq	$4, %r8
	addq	$16, %rdi
	cmpq	%r8, %r9
	jne	.L215
	movl	$cmp2, %ecx
	movl	$4, %edx
	movl	$u, %edi
	xorl	%r15d, %r15d
	call	qsort
	cmpl	$1, %r12d
	movq	.LC0(%rip), %xmm2
	leal	-1(%r12), %r13d
	je	.L217
	.p2align 4,,10
	.p2align 3
.L218:
	movl	u+4(,%r15,4), %r14d
	movl	u(,%r15,4), %r12d
	cmpl	%r12d, %r14d
	je	.L220
	movslq	%r12d, %rbp
	movslq	hi(,%rbp,4), %rdx
	testl	%edx, %edx
	jle	.L221
	movq	to(,%rbp,8), %rax
	leaq	(%rax,%rdx,4), %rdx
	jmp	.L223
	.p2align 4,,10
	.p2align 3
.L288:
	addq	$4, %rax
	cmpq	%rax, %rdx
	je	.L221
.L223:
	movl	(%rax), %edi
	cmpl	%edi, %r14d
	jne	.L288
.L222:
	cmpl	%edi, %r12d
	je	.L220
	movslq	%edi, %r14
	movslq	hi(,%r14,4), %rdx
	testl	%edx, %edx
	jle	.L225
	movq	to(,%r14,8), %rax
	leaq	(%rax,%rdx,4), %rdx
	jmp	.L226
	.p2align 4,,10
	.p2align 3
.L289:
	addq	$4, %rax
	cmpq	%rdx, %rax
	je	.L225
.L226:
	cmpl	%r12d, (%rax)
	jne	.L289
.L220:
	addq	$1, %r15
	cmpl	%r15d, %r13d
	jg	.L218
.L217:
	addl	$1, (%rsp)
	addq	$4040, %rbx
	movl	(%rsp), %eax
	cmpl	%eax, n(%rip)
	jg	.L206
.L169:
	addq	$24, %rsp
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
.L184:
	.cfi_restore_state
	movapd	%xmm7, %xmm5
	movapd	%xmm6, %xmm10
	movapd	%xmm1, %xmm11
	subsd	%xmm3, %xmm5
	subsd	%xmm4, %xmm10
	mulsd	%xmm10, %xmm11
	movapd	%xmm5, %xmm15
	mulsd	%xmm2, %xmm15
	subsd	%xmm15, %xmm11
	comisd	%xmm12, %xmm11
	ja	.L188
	movl	$-2, %ebx
	movl	$4, %ebp
	movl	$-4, %r9d
	jmp	.L231
	.p2align 4,,10
	.p2align 3
.L237:
	movl	$-1, %ebx
	movl	$2, %ebp
	movl	$-2, %r9d
.L189:
	movapd	%xmm13, %xmm1
	subsd	%xmm0, %xmm9
	movapd	%xmm7, %xmm2
	subsd	%xmm8, %xmm1
	movapd	%xmm6, %xmm3
	mulsd	%xmm9, %xmm3
	mulsd	%xmm1, %xmm2
	subsd	%xmm3, %xmm2
	comisd	%xmm12, %xmm2
	ja	.L188
	comisd	%xmm2, %xmm14
	jbe	.L290
.L241:
	movl	%ebx, %ebp
.L191:
	testl	%ebp, %ebp
	jg	.L188
	jmp	.L192
	.p2align 4,,10
	.p2align 3
.L221:
	movl	%r12d, %edi
	call	checklim
	movslq	hi(,%rbp,4), %rax
	movq	to(,%rbp,8), %rdx
	movq	.LC0(%rip), %xmm2
	leal	1(%rax), %esi
	movl	%esi, hi(,%rbp,4)
	movl	%r14d, (%rdx,%rax,4)
	movl	u(,%r15,4), %r12d
	movl	u+4(,%r15,4), %edi
	jmp	.L222
	.p2align 4,,10
	.p2align 3
.L225:
	call	checklim
	movslq	hi(,%r14,4), %rax
	movq	to(,%r14,8), %rdx
	addq	$1, %r15
	movq	.LC0(%rip), %xmm2
	leal	1(%rax), %ecx
	movl	%ecx, hi(,%r14,4)
	movl	%r12d, (%rdx,%rax,4)
	cmpl	%r15d, %r13d
	jg	.L218
	jmp	.L217
	.p2align 4,,10
	.p2align 3
.L287:
	subl	$1, %edx
	jmp	.L212
.L239:
	movl	$-2, %ebx
	movl	$4, %ebp
	movl	$-4, %r9d
	jmp	.L189
.L285:
	movl	%esi, %ecx
	jmp	.L202
.L286:
	movl	$cmp2, %ecx
	movl	$4, %edx
	xorl	%esi, %esi
	movl	$u, %edi
	call	qsort
	movq	.LC0(%rip), %xmm2
	jmp	.L217
.L234:
	movl	$1, %ebx
	movl	$-2, %ebp
	movl	$2, %r9d
	jmp	.L183
.L280:
	movl	%r9d, %ebp
	testl	%ebp, %ebp
	jg	.L278
	jmp	.L186
	.p2align 4,,10
	.p2align 3
.L180:
	movslq	%eax, %rsi
	jmp	.L170
.L238:
	movl	$1, %ebx
	movl	$-2, %ebp
	movl	$2, %r9d
	jmp	.L190
.L232:
	movl	$1, %esi
	jmp	.L170
.L281:
	movl	%r9d, %ebp
	testl	%ebp, %ebp
	jg	.L188
	jmp	.L192
	.cfi_endproc
.LFE32:
	.size	segarrangement, .-segarrangement
	.p2align 4
	.globl	dijkstra
	.type	dijkstra, @function
dijkstra:
.LFB33:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$69, %esi
	movl	$mk, %edi
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
	movslq	sz(%rip), %rdx
	movsd	%xmm0, 16(%rsp)
	salq	$3, %rdx
	movsd	%xmm1, 8(%rsp)
	call	memset
	movsd	16(%rsp), %xmm0
	movsd	8(%rsp), %xmm1
	movq	.LC0(%rip), %xmm4
	movsd	.LC1(%rip), %xmm3
	cvttsd2sil	%xmm0, %edx
	cvttsd2sil	%xmm1, %ecx
	movl	%edx, %eax
	negl	%eax
	cmovs	%edx, %eax
	movl	%ecx, %edx
	sall	$10, %eax
	negl	%edx
	cmovs	%ecx, %edx
	leal	1(%rax,%rdx), %edx
	movslq	%edx, %rax
	movl	%edx, %ecx
	imulq	$175916583, %rax, %rax
	sarl	$31, %ecx
	sarq	$44, %rax
	subl	%ecx, %eax
	movq	hashend(%rip), %rcx
	imull	$100003, %eax, %eax
	subl	%eax, %edx
	movslq	%edx, %rax
	leaq	(%rax,%rax,2), %rax
	leaq	hash(,%rax,8), %rax
	jmp	.L297
	.p2align 4,,10
	.p2align 3
.L298:
	movapd	%xmm0, %xmm2
	subsd	8(%rax), %xmm2
	andpd	%xmm4, %xmm2
	comisd	%xmm2, %xmm3
	jbe	.L293
	movapd	%xmm1, %xmm2
	subsd	16(%rax), %xmm2
	andpd	%xmm4, %xmm2
	comisd	%xmm2, %xmm3
	ja	.L331
.L293:
	addq	$24, %rax
	movl	$hash, %edx
	cmpq	%rcx, %rax
	cmove	%rdx, %rax
.L297:
	movl	(%rax), %edx
	testl	%edx, %edx
	jne	.L298
	movl	$-1, %edx
.L296:
	movl	qmax(%rip), %eax
	movl	%edx, que+8(%rip)
	movq	$0x000000000, que(%rip)
	testl	%eax, %eax
	jg	.L299
	movl	$1, qmax(%rip)
.L299:
	movslq	%edx, %rdi
	movl	$1, %ebx
	movq	$0x000000000, 8(%rsp)
	movq	$0x000000000, mk(,%rdi,8)
	movq	$0x000000000, 24(%rsp)
	.p2align 4,,10
	.p2align 3
.L316:
	subl	$1, %ebx
	xorl	%esi, %esi
	movslq	%ebx, %rax
	movl	%ebx, qsize(%rip)
	salq	$4, %rax
	movdqa	que(%rax), %xmm4
	movaps	%xmm4, que(%rip)
	jmp	.L305
	.p2align 4,,10
	.p2align 3
.L332:
	movslq	%edx, %rax
	salq	$4, %rax
	movsd	que(%rax), %xmm0
	movslq	%esi, %rax
	movq	%rax, %r8
	salq	$4, %r8
	movsd	que(%r8), %xmm1
	comisd	%xmm0, %xmm1
	jbe	.L300
	cmpl	%ecx, %ebx
	jle	.L318
	movslq	%ecx, %r8
	salq	$4, %r8
	comisd	que(%r8), %xmm0
	cmovbe	%edx, %ecx
.L304:
	cmpl	%ecx, %esi
	je	.L303
	movslq	%ecx, %rdx
	salq	$4, %rax
	salq	$4, %rdx
	movl	que+8(%rax), %esi
	movsd	que(%rax), %xmm0
	movdqa	que(%rdx), %xmm6
	movaps	%xmm6, que(%rax)
	movl	%esi, que+8(%rdx)
	movl	%ecx, %esi
	movsd	%xmm0, que(%rdx)
.L305:
	leal	(%rsi,%rsi), %edx
	leal	1(%rdx), %ecx
	cmpl	%edx, %ebx
	jg	.L332
.L300:
	cmpl	%ecx, %ebx
	jg	.L302
.L303:
	movsd	8(%rsp), %xmm3
	comisd	mk(,%rdi,8), %xmm3
	movapd	%xmm3, %xmm4
	maxsd	24(%rsp), %xmm4
	movsd	%xmm4, 24(%rsp)
	jbe	.L333
.L307:
	testl	%ebx, %ebx
	je	.L315
	movsd	que(%rip), %xmm3
	movslq	que+8(%rip), %rdi
	movsd	%xmm3, 8(%rsp)
	jmp	.L316
	.p2align 4,,10
	.p2align 3
.L302:
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	movq	%rax, %r8
	salq	$4, %rdx
	salq	$4, %r8
	movsd	que(%r8), %xmm0
	comisd	que(%rdx), %xmm0
	ja	.L304
	jmp	.L303
	.p2align 4,,10
	.p2align 3
.L318:
	movl	%edx, %ecx
	jmp	.L304
	.p2align 4,,10
	.p2align 3
.L333:
	movslq	hi(,%rdi,4), %rax
	testl	%eax, %eax
	jle	.L307
	movq	%rdi, %rdx
	movq	to(,%rdi,8), %r12
	salq	$4, %rdx
	movsd	tbl(%rdx), %xmm4
	movsd	tbl+8(%rdx), %xmm7
	leaq	(%r12,%rax,4), %rbp
	movq	%xmm4, %r15
	movsd	%xmm7, 16(%rsp)
	jmp	.L314
	.p2align 4,,10
	.p2align 3
.L308:
	addq	$4, %r12
	cmpq	%r12, %rbp
	je	.L307
.L314:
	movslq	(%r12), %r13
	movsd	16(%rsp), %xmm1
	movq	%r15, %xmm0
	movq	%r13, %rax
	salq	$4, %rax
	subsd	tbl+8(%rax), %xmm1
	subsd	tbl(%rax), %xmm0
	call	hypot
	addsd	8(%rsp), %xmm0
	movsd	mk(,%r13,8), %xmm1
	comisd	%xmm0, %xmm1
	jbe	.L308
	movsd	%xmm0, mk(,%r13,8)
	movslq	%ebx, %rax
	leal	1(%rbx), %edi
	salq	$4, %rax
	cmpl	qmax(%rip), %edi
	movl	%edi, qsize(%rip)
	movl	%r13d, que+8(%rax)
	movsd	%xmm0, que(%rax)
	jle	.L310
	movl	%edi, qmax(%rip)
.L310:
	testl	%ebx, %ebx
	jg	.L311
	jmp	.L312
	.p2align 4,,10
	.p2align 3
.L313:
	movslq	%ebx, %rbx
	movdqa	que(%rax), %xmm5
	salq	$4, %rbx
	movl	que+8(%rbx), %esi
	movaps	%xmm5, que(%rbx)
	movsd	%xmm0, que(%rax)
	movl	%esi, 8(%rcx)
	testl	%edx, %edx
	je	.L312
	movl	%edx, %ebx
.L311:
	movl	%ebx, %edx
	sarl	%edx
	movslq	%edx, %rax
	salq	$4, %rax
	movsd	que(%rax), %xmm1
	leaq	que(%rax), %rcx
	comisd	%xmm0, %xmm1
	ja	.L313
.L312:
	movl	%edi, %ebx
	jmp	.L308
	.p2align 4,,10
	.p2align 3
.L315:
	cvttsd2sil	24(%rsp), %eax
	cmpl	$60, %eax
	jne	.L291
	movsd	.LC8(%rip), %xmm4
	movsd	%xmm4, 24(%rsp)
.L291:
	movsd	24(%rsp), %xmm0
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
.L331:
	.cfi_restore_state
	subl	$1, %edx
	jmp	.L296
	.cfi_endproc
.LFE33:
	.size	dijkstra, .-dijkstra
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC9:
	.string	"%.8lf\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB34:
	.cfi_startproc
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
	.p2align 4,,10
	.p2align 3
.L335:
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L343:
	andl	$15, %eax
	leal	0(%rbp,%rbp,4), %edx
	leal	(%rax,%rdx,2), %ebp
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L343
	movl	%ebp, n(%rip)
	testl	%ebp, %ebp
	je	.L352
	movl	$2400192, %edx
	xorl	%esi, %esi
	movl	$hash, %edi
	xorl	%r12d, %r12d
	call	memset
	movl	$data, %ebx
	movl	$1, sz(%rip)
	testl	%ebp, %ebp
	jle	.L340
	.p2align 4,,10
	.p2align 3
.L339:
	xorl	%eax, %eax
	addl	$1, %r12d
	addq	$4040, %rbx
	call	dbl
	xorl	%eax, %eax
	movsd	%xmm0, -4040(%rbx)
	call	dbl
	xorl	%eax, %eax
	movsd	%xmm0, -4032(%rbx)
	call	dbl
	xorl	%eax, %eax
	movsd	%xmm0, -4024(%rbx)
	call	dbl
	movl	$0, -4008(%rbx)
	movsd	%xmm0, -4016(%rbx)
	cmpl	%r12d, n(%rip)
	jg	.L339
.L340:
	xorl	%eax, %eax
	call	dbl
	xorl	%eax, %eax
	movq	%xmm0, %rbx
	call	dbl
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	movsd	%xmm1, 8(%rsp)
	call	segarrangement
	movsd	8(%rsp), %xmm1
	movq	%rbx, %xmm0
	xorl	%ebx, %ebx
	call	dijkstra
	movl	$.LC9, %edi
	movl	$1, %eax
	call	printf
	movl	sz(%rip), %eax
	testl	%eax, %eax
	jle	.L335
.L337:
	movl	lim(,%rbx,4), %edx
	testl	%edx, %edx
	jne	.L353
.L341:
	addq	$1, %rbx
	cmpl	%ebx, %eax
	jle	.L335
	movl	lim(,%rbx,4), %edx
	testl	%edx, %edx
	je	.L341
.L353:
	movq	to(,%rbx,8), %rdi
	addq	$1, %rbx
	call	free
	movl	sz(%rip), %eax
	cmpl	%ebx, %eax
	jg	.L337
	jmp	.L335
	.p2align 4,,10
	.p2align 3
.L352:
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE34:
	.size	main, .-main
	.globl	mk
	.bss
	.align 32
	.type	mk, @object
	.size	mk, 320016
mk:
	.zero	320016
	.globl	to
	.align 32
	.type	to, @object
	.size	to, 320016
to:
	.zero	320016
	.globl	lim
	.align 32
	.type	lim, @object
	.size	lim, 160008
lim:
	.zero	160008
	.globl	hi
	.align 32
	.type	hi, @object
	.size	hi, 160008
hi:
	.zero	160008
	.globl	u
	.align 32
	.type	u, @object
	.size	u, 1000
u:
	.zero	1000
	.globl	sz
	.align 4
	.type	sz, @object
	.size	sz, 4
sz:
	.zero	4
	.globl	tbl
	.align 32
	.type	tbl, @object
	.size	tbl, 640032
tbl:
	.zero	640032
	.globl	n
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.globl	data
	.align 32
	.type	data, @object
	.size	data, 4048080
data:
	.zero	4048080
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
	.size	que, 16000
que:
	.zero	16000
	.globl	hashend
	.data
	.align 8
	.type	hashend, @object
	.size	hashend, 8
hashend:
	.quad	hash+2400072
	.globl	hash
	.bss
	.align 32
	.type	hash, @object
	.size	hash, 2400192
hash:
	.zero	2400192
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
	.long	-1598689907
	.long	1051772663
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.align 8
.LC4:
	.long	-1717986918
	.long	1069128089
	.section	.rodata.cst16
	.align 16
.LC5:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC6:
	.long	-1598689907
	.long	-1095710985
	.align 8
.LC8:
	.long	0
	.long	1079410688
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
