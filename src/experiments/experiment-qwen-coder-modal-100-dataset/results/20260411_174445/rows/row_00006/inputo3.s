	.file	"inputC.c"
	.text
	.p2align 4
	.globl	cmp
	.type	cmp, @function
cmp:
.LFB21:
	.cfi_startproc
	movl	(%rsi), %eax
	subl	(%rdi), %eax
	ret
	.cfi_endproc
.LFE21:
	.size	cmp, .-cmp
	.p2align 4
	.globl	init
	.type	init, @function
init:
.LFB8:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L3
	leal	-1(%rdi), %eax
	cmpl	$2, %eax
	jbe	.L8
	movdqa	.LC0(%rip), %xmm0
	movl	%edi, %eax
	shrl	$2, %eax
	movaps	%xmm0, id(%rip)
	movdqa	.LC1(%rip), %xmm0
	movaps	%xmm0, size(%rip)
	cmpl	$1, %eax
	je	.L6
	movdqa	.LC2(%rip), %xmm1
	movaps	%xmm0, size+16(%rip)
	movaps	%xmm1, id+16(%rip)
.L6:
	movl	%edi, %eax
	andl	$-4, %eax
	testb	$3, %dil
	je	.L12
.L5:
	movslq	%eax, %rdx
	movl	%eax, id(,%rdx,4)
	movl	$1, size(,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%edx, %edi
	jle	.L3
	movslq	%edx, %rcx
	addl	$2, %eax
	movl	%edx, id(,%rcx,4)
	movl	$1, size(,%rcx,4)
	cmpl	%eax, %edi
	jle	.L3
	movslq	%eax, %rdx
	movl	%eax, id(,%rdx,4)
	movl	$1, size(,%rdx,4)
.L3:
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	ret
.L8:
	xorl	%eax, %eax
	jmp	.L5
	.cfi_endproc
.LFE8:
	.size	init, .-init
	.p2align 4
	.globl	root
	.type	root, @function
root:
.LFB9:
	.cfi_startproc
	movslq	%edi, %rax
	movslq	id(,%rax,4), %rax
	cmpl	%eax, %edi
	je	.L13
	.p2align 4,,10
	.p2align 3
.L15:
	movslq	id(,%rax,4), %rax
	movslq	%edi, %rdx
	movl	%eax, id(,%rdx,4)
	movq	%rax, %rdi
	movslq	id(,%rax,4), %rax
	cmpl	%eax, %edi
	jne	.L15
.L13:
	ret
	.cfi_endproc
.LFE9:
	.size	root, .-root
	.p2align 4
	.globl	connected
	.type	connected, @function
connected:
.LFB10:
	.cfi_startproc
	movslq	%edi, %rax
	movslq	id(,%rax,4), %rax
	cmpl	%eax, %edi
	je	.L18
	.p2align 4,,10
	.p2align 3
.L19:
	movl	%edi, %edx
	movl	id(,%rax,4), %edi
	movslq	%edx, %rax
	movl	%edi, id(,%rax,4)
	movslq	%edi, %rax
	movslq	id(,%rax,4), %rax
	cmpl	%edi, %eax
	jne	.L19
.L18:
	movslq	%esi, %rax
	movslq	id(,%rax,4), %rax
	cmpl	%eax, %esi
	je	.L20
	.p2align 4,,10
	.p2align 3
.L21:
	movl	%esi, %edx
	movl	id(,%rax,4), %esi
	movslq	%edx, %rax
	movl	%esi, id(,%rax,4)
	movslq	%esi, %rax
	movslq	id(,%rax,4), %rax
	cmpl	%esi, %eax
	jne	.L21
.L20:
	xorl	%eax, %eax
	cmpl	%edi, %esi
	sete	%al
	ret
	.cfi_endproc
.LFE10:
	.size	connected, .-connected
	.p2align 4
	.globl	unite
	.type	unite, @function
unite:
.LFB11:
	.cfi_startproc
	movslq	%edi, %rdi
	movslq	id(,%rdi,4), %rdx
	movq	%rdi, %rax
	cmpl	%edx, %edi
	je	.L27
	.p2align 4,,10
	.p2align 3
.L28:
	movslq	id(,%rdx,4), %rdi
	movl	%eax, %ecx
	movslq	%ecx, %rdx
	movl	%edi, id(,%rdx,4)
	movslq	id(,%rdi,4), %rdx
	movq	%rdi, %rax
	cmpl	%edi, %edx
	jne	.L28
.L27:
	movslq	%esi, %rcx
	movslq	id(,%rcx,4), %rdx
	cmpl	%edx, %esi
	je	.L29
	.p2align 4,,10
	.p2align 3
.L30:
	movl	%esi, %ecx
	movl	id(,%rdx,4), %esi
	movslq	%ecx, %rdx
	movslq	%esi, %rcx
	movl	%esi, id(,%rdx,4)
	movslq	id(,%rcx,4), %rdx
	cmpl	%esi, %edx
	jne	.L30
.L29:
	cmpl	%eax, %esi
	je	.L26
	movl	size(,%rdi,4), %r8d
	movl	size(,%rcx,4), %edx
	leal	(%r8,%rdx), %r9d
	cmpl	%edx, %r8d
	jge	.L32
	movl	%esi, id(,%rdi,4)
	movl	%r9d, size(,%rcx,4)
	ret
	.p2align 4,,10
	.p2align 3
.L32:
	movl	%eax, id(,%rcx,4)
	movl	%r9d, size(,%rdi,4)
.L26:
	ret
	.cfi_endproc
.LFE11:
	.size	unite, .-unite
	.p2align 4
	.globl	dcmp
	.type	dcmp, @function
dcmp:
.LFB12:
	.cfi_startproc
	movsd	.LC4(%rip), %xmm2
	movapd	%xmm0, %xmm1
	xorl	%eax, %eax
	andpd	.LC3(%rip), %xmm1
	comisd	%xmm1, %xmm2
	ja	.L37
	pxor	%xmm1, %xmm1
	comisd	%xmm0, %xmm1
	sbbl	%eax, %eax
	andl	$2, %eax
	subl	$1, %eax
.L37:
	ret
	.cfi_endproc
.LFE12:
	.size	dcmp, .-dcmp
	.p2align 4
	.globl	vset
	.type	vset, @function
vset:
.LFB13:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE13:
	.size	vset, .-vset
	.p2align 4
	.globl	vadd
	.type	vadd, @function
vadd:
.LFB14:
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
.LFE14:
	.size	vadd, .-vadd
	.p2align 4
	.globl	vsub
	.type	vsub, @function
vsub:
.LFB15:
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
.LFE15:
	.size	vsub, .-vsub
	.p2align 4
	.globl	vsmul
	.type	vsmul, @function
vsmul:
.LFB16:
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
.LFE16:
	.size	vsmul, .-vsmul
	.p2align 4
	.globl	vmul
	.type	vmul, @function
vmul:
.LFB17:
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
.LFE17:
	.size	vmul, .-vmul
	.p2align 4
	.globl	centerLine
	.type	centerLine, @function
centerLine:
.LFB18:
	.cfi_startproc
	movq	%xmm0, -40(%rsp)
	movq	%xmm1, -32(%rsp)
	movsd	.LC7(%rip), %xmm1
	movq	%xmm2, -24(%rsp)
	pxor	%xmm2, %xmm2
	movq	%xmm3, -16(%rsp)
	movapd	-24(%rsp), %xmm0
	unpcklpd	%xmm1, %xmm1
	addpd	-40(%rsp), %xmm0
	mulpd	%xmm1, %xmm0
	movapd	%xmm0, %xmm3
	subpd	-40(%rsp), %xmm3
	movups	%xmm0, (%rdi)
	movapd	%xmm3, %xmm1
	shufpd	$1, %xmm3, %xmm1
	mulpd	%xmm2, %xmm1
	movapd	%xmm1, %xmm2
	addpd	%xmm3, %xmm1
	subpd	%xmm3, %xmm2
	shufpd	$1, %xmm1, %xmm2
	addpd	%xmm2, %xmm0
	movups	%xmm0, 16(%rdi)
	ret
	.cfi_endproc
.LFE18:
	.size	centerLine, .-centerLine
	.p2align 4
	.globl	isParaLL
	.type	isParaLL, @function
isParaLL:
.LFB19:
	.cfi_startproc
	movsd	64(%rsp), %xmm0
	movsd	24(%rsp), %xmm1
	xorl	%eax, %eax
	subsd	8(%rsp), %xmm1
	subsd	48(%rsp), %xmm0
	movsd	56(%rsp), %xmm2
	subsd	40(%rsp), %xmm2
	mulsd	%xmm1, %xmm0
	movsd	32(%rsp), %xmm1
	subsd	16(%rsp), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movsd	.LC4(%rip), %xmm1
	andpd	.LC3(%rip), %xmm0
	comisd	%xmm0, %xmm1
	seta	%al
	ret
	.cfi_endproc
.LFE19:
	.size	isParaLL, .-isParaLL
	.p2align 4
	.globl	identicalLL
	.type	identicalLL, @function
identicalLL:
.LFB20:
	.cfi_startproc
	movsd	24(%rsp), %xmm3
	movsd	32(%rsp), %xmm12
	xorl	%eax, %eax
	movsd	56(%rsp), %xmm7
	movsd	64(%rsp), %xmm10
	movsd	8(%rsp), %xmm5
	movapd	%xmm3, %xmm8
	movapd	%xmm12, %xmm9
	movsd	16(%rsp), %xmm6
	movsd	40(%rsp), %xmm1
	movsd	48(%rsp), %xmm4
	movapd	%xmm10, %xmm0
	movapd	%xmm7, %xmm2
	subsd	%xmm5, %xmm8
	subsd	%xmm6, %xmm9
	movq	.LC3(%rip), %xmm11
	subsd	%xmm4, %xmm0
	subsd	%xmm1, %xmm2
	mulsd	%xmm8, %xmm0
	mulsd	%xmm9, %xmm2
	subsd	%xmm2, %xmm0
	movsd	.LC4(%rip), %xmm2
	andpd	%xmm11, %xmm0
	comisd	%xmm0, %xmm2
	ja	.L64
.L50:
	ret
	.p2align 4,,10
	.p2align 3
.L64:
	movapd	%xmm5, %xmm0
	subsd	%xmm1, %xmm0
	andpd	%xmm11, %xmm0
	comisd	%xmm0, %xmm2
	jbe	.L53
	movapd	%xmm6, %xmm0
	movl	$1, %eax
	subsd	%xmm4, %xmm0
	andpd	%xmm11, %xmm0
	comisd	%xmm0, %xmm2
	ja	.L50
.L53:
	subsd	%xmm7, %xmm3
	andpd	%xmm11, %xmm3
	comisd	%xmm3, %xmm2
	jbe	.L55
	subsd	%xmm10, %xmm12
	movl	$1, %eax
	andpd	%xmm11, %xmm12
	comisd	%xmm12, %xmm2
	ja	.L50
.L55:
	subsd	%xmm5, %xmm1
	subsd	%xmm6, %xmm4
	xorl	%eax, %eax
	mulsd	%xmm9, %xmm1
	mulsd	%xmm8, %xmm4
	subsd	%xmm4, %xmm1
	andpd	%xmm11, %xmm1
	comisd	%xmm1, %xmm2
	seta	%al
	ret
	.cfi_endproc
.LFE20:
	.size	identicalLL, .-identicalLL
	.p2align 4
	.globl	update
	.type	update, @function
update:
.LFB22:
	.cfi_startproc
	movl	sz(%rip), %ecx
	testl	%ecx, %ecx
	jle	.L66
	movsd	24(%rsp), %xmm12
	movsd	32(%rsp), %xmm13
	movl	$line, %eax
	xorl	%edx, %edx
	movsd	8(%rsp), %xmm10
	movsd	16(%rsp), %xmm11
	movapd	%xmm13, %xmm9
	movapd	%xmm12, %xmm8
	movq	.LC3(%rip), %xmm5
	movsd	.LC4(%rip), %xmm4
	subsd	%xmm11, %xmm9
	subsd	%xmm10, %xmm8
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L67:
	addl	$1, %edx
	addq	$32, %rax
	cmpl	%ecx, %edx
	je	.L66
.L76:
	movsd	24(%rax), %xmm15
	movsd	8(%rax), %xmm3
	movapd	%xmm9, %xmm0
	movsd	16(%rax), %xmm1
	movsd	(%rax), %xmm2
	movapd	%xmm15, %xmm7
	subsd	%xmm3, %xmm7
	movapd	%xmm1, %xmm6
	subsd	%xmm2, %xmm6
	movapd	%xmm7, %xmm14
	mulsd	%xmm6, %xmm0
	mulsd	%xmm8, %xmm14
	subsd	%xmm14, %xmm0
	andpd	%xmm5, %xmm0
	comisd	%xmm0, %xmm4
	jbe	.L67
	movapd	%xmm2, %xmm0
	subsd	%xmm10, %xmm0
	andpd	%xmm5, %xmm0
	comisd	%xmm0, %xmm4
	jbe	.L69
	movapd	%xmm3, %xmm0
	subsd	%xmm11, %xmm0
	andpd	%xmm5, %xmm0
	comisd	%xmm0, %xmm4
	ja	.L71
.L69:
	subsd	%xmm12, %xmm1
	andpd	%xmm5, %xmm1
	comisd	%xmm1, %xmm4
	jbe	.L72
	subsd	%xmm13, %xmm15
	andpd	%xmm5, %xmm15
	comisd	%xmm15, %xmm4
	ja	.L71
.L72:
	movapd	%xmm10, %xmm0
	movapd	%xmm11, %xmm1
	subsd	%xmm2, %xmm0
	subsd	%xmm3, %xmm1
	mulsd	%xmm7, %xmm0
	mulsd	%xmm6, %xmm1
	subsd	%xmm1, %xmm0
	andpd	%xmm5, %xmm0
	comisd	%xmm0, %xmm4
	jbe	.L67
.L71:
	movslq	%edx, %rdx
	imulq	$228, %rdx, %r9
	leaq	0(,%rdx,8), %r8
	subq	%rdx, %r8
	leaq	(%rdx,%r8,8), %rdx
	movslq	tbl(%r9), %rcx
	movq	%rcx, %rax
	addq	%rdx, %rcx
	movl	%edi, tbl+4(,%rcx,4)
	leal	2(%rax), %ecx
	addl	$1, %eax
	cltq
	movl	%ecx, tbl(%r9)
	addq	%rax, %rdx
	xorl	%eax, %eax
	movl	%esi, tbl+4(,%rdx,4)
	ret
	.p2align 4,,10
	.p2align 3
.L66:
	movslq	%ecx, %rax
	movdqu	8(%rsp), %xmm4
	movdqu	24(%rsp), %xmm5
	addl	$1, %ecx
	imulq	$228, %rax, %r10
	leaq	0(,%rax,8), %r8
	movl	%ecx, sz(%rip)
	subq	%rax, %r8
	leaq	(%rax,%r8,8), %r8
	salq	$5, %rax
	movslq	tbl(%r10), %r9
	movaps	%xmm4, line(%rax)
	movaps	%xmm5, line+16(%rax)
	movl	$1, %eax
	movq	%r9, %rdx
	addq	%r8, %r9
	movl	%edi, tbl+4(,%r9,4)
	leal	2(%rdx), %edi
	addl	$1, %edx
	movslq	%edx, %rdx
	movl	%edi, tbl(%r10)
	addq	%rdx, %r8
	movl	%esi, tbl+4(,%r8,4)
	ret
	.cfi_endproc
.LFE22:
	.size	update, .-update
	.p2align 4
	.globl	action
	.type	action, @function
action:
.LFB23:
	.cfi_startproc
	movl	N(%rip), %r8d
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	testl	%r8d, %r8d
	jle	.L123
	leal	-1(%r8), %eax
	cmpl	$2, %eax
	jbe	.L106
	movdqa	.LC0(%rip), %xmm0
	movl	%r8d, %eax
	shrl	$2, %eax
	movaps	%xmm0, id(%rip)
	movdqa	.LC1(%rip), %xmm0
	movaps	%xmm0, size(%rip)
	cmpl	$1, %eax
	je	.L87
	movdqa	.LC2(%rip), %xmm1
	movaps	%xmm0, size+16(%rip)
	movaps	%xmm1, id+16(%rip)
.L87:
	movl	%r8d, %eax
	andl	$-4, %eax
	testb	$3, %r8b
	je	.L122
.L86:
	movslq	%eax, %rdx
	movl	%eax, id(,%rdx,4)
	movl	$1, size(,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%edx, %r8d
	jle	.L92
	movslq	%edx, %rcx
	addl	$2, %eax
	movl	%edx, id(,%rcx,4)
	movl	$1, size(,%rcx,4)
	cmpl	%eax, %r8d
	jle	.L122
	movslq	%eax, %rdx
	movl	%eax, id(,%rdx,4)
	movl	$1, size(,%rdx,4)
.L122:
	testl	%ebp, %ebp
	jle	.L94
.L83:
	movl	$1, %ebx
	.p2align 4,,10
	.p2align 3
.L96:
	movl	r(,%rbx,4), %eax
	xorl	%r10d, %r10d
	leal	-1(%rax), %r11d
	movslq	%r11d, %r11
	imulq	$228, %r11, %r11
	movl	tbl(%r11), %eax
	testl	%eax, %eax
	jle	.L99
	.p2align 4,,10
	.p2align 3
.L98:
	movl	tbl+8(%r11,%r10,4), %esi
	movl	tbl+4(%r11,%r10,4), %edi
	addq	$2, %r10
	call	unite
	cmpl	%r10d, tbl(%r11)
	jg	.L98
.L99:
	addq	$1, %rbx
	cmpl	%ebx, %ebp
	jge	.L96
	movl	N(%rip), %r8d
.L90:
	movslq	id(%rip), %rax
	testl	%eax, %eax
	je	.L107
.L84:
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L101:
	movl	%edi, %edx
	movl	id(,%rax,4), %edi
	movslq	%edx, %rax
	movl	%edi, id(,%rax,4)
	movslq	%edi, %rax
	movslq	id(,%rax,4), %rax
	cmpl	%edi, %eax
	jne	.L101
.L100:
	cmpl	$1, %r8d
	jle	.L85
.L88:
	movl	$1, %esi
	.p2align 4,,10
	.p2align 3
.L102:
	movslq	id(,%rsi,4), %rdx
	movl	%esi, %eax
	cmpl	%esi, %edx
	je	.L105
	.p2align 4,,10
	.p2align 3
.L103:
	movl	%eax, %ecx
	movl	id(,%rdx,4), %eax
	movslq	%ecx, %rdx
	movl	%eax, id(,%rdx,4)
	movslq	%eax, %rdx
	movslq	id(,%rdx,4), %rdx
	cmpl	%eax, %edx
	jne	.L103
.L105:
	cmpl	%edi, %eax
	jne	.L108
	addq	$1, %rsi
	cmpl	%esi, %r8d
	jg	.L102
.L85:
	movl	$1, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L108:
	.cfi_restore_state
	xorl	%eax, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L107:
	.cfi_restore_state
	xorl	%edi, %edi
	jmp	.L100
.L123:
	testl	%edi, %edi
	jg	.L83
	movslq	id(%rip), %rax
	testl	%eax, %eax
	jne	.L84
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L94:
	movslq	id(%rip), %rax
	xorl	%edi, %edi
	testl	%eax, %eax
	jne	.L84
	jmp	.L88
.L106:
	xorl	%eax, %eax
	jmp	.L86
.L92:
	testl	%ebp, %ebp
	jg	.L83
	jmp	.L90
	.cfi_endproc
.LFE23:
	.size	action, .-action
	.p2align 4
	.globl	combin
	.type	combin, @function
combin:
.LFB24:
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
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	cmpl	%esi, %edi
	jg	.L202
	movl	%edi, %ebx
	leal	-1(%rdi), %eax
	movl	sz(%rip), %edi
	cltq
	movl	r(,%rax,4), %r12d
	movl	%edi, %eax
	subl	%esi, %eax
	addl	%ebx, %eax
	cmpl	%eax, %r12d
	jge	.L169
	leal	1(%rbx), %eax
	addl	$2, %r12d
	leal	5(%rbx), %r11d
	movslq	%ebx, %r13
	movl	%eax, 92(%rsp)
	leal	2(%rbx), %eax
	movl	%r12d, %r14d
	leal	7(%rbx), %ebp
	movl	%eax, 96(%rsp)
	leal	3(%rbx), %eax
	movl	%edi, %r9d
	movl	%ebx, %r15d
	movl	%eax, 80(%rsp)
	leal	4(%rbx), %eax
	movl	%esi, %r12d
	movl	%eax, 116(%rsp)
	leal	6(%rbx), %eax
	movl	%eax, 84(%rsp)
	leal	8(%rbx), %eax
	movl	%eax, 88(%rsp)
	leal	9(%rbx), %eax
	movl	%eax, 136(%rsp)
.L168:
	leal	-1(%r14), %eax
	movl	%eax, r(,%r13,4)
	cmpl	%r12d, 92(%rsp)
	jg	.L203
	movl	92(%rsp), %eax
	movl	%r9d, %edi
	movl	%r14d, %ebx
	subl	%r12d, %edi
	addl	%edi, %eax
	cmpl	%eax, %r14d
	leal	1(%r14), %eax
	jg	.L131
	movslq	92(%rsp), %rcx
	movl	%r14d, 140(%rsp)
	movl	%r11d, %r8d
	movl	%eax, 148(%rsp)
	movq	%rcx, 120(%rsp)
	movl	%r15d, 144(%rsp)
	movl	%r12d, %r15d
	movl	%ebp, %r12d
	movl	%eax, %ebp
.L167:
	movq	120(%rsp), %rcx
	leal	-1(%rbp), %eax
	movl	%eax, r(,%rcx,4)
	movl	96(%rsp), %eax
	cmpl	%eax, %r15d
	jl	.L204
	movl	%r9d, %edi
	movl	%ebp, %ebx
	leal	1(%rbp), %ebp
	subl	%r15d, %edi
	addl	%edi, %eax
	cmpl	%ebx, %eax
	jl	.L135
	movslq	96(%rsp), %rax
	movl	%ebx, 152(%rsp)
	movl	%ebp, %r14d
	movl	%r8d, %ecx
	movl	116(%rsp), %ebx
	movl	%ebp, 156(%rsp)
	movl	%r15d, %ebp
	movq	%rax, 128(%rsp)
.L166:
	movq	128(%rsp), %rsi
	leal	-1(%r14), %eax
	movl	%eax, r(,%rsi,4)
	movl	80(%rsp), %eax
	cmpl	%eax, %ebp
	jl	.L205
	movl	%r9d, %edi
	movl	%r14d, %edx
	leal	1(%r14), %r15d
	subl	%ebp, %edi
	addl	%edi, %eax
	cmpl	%eax, %r14d
	jg	.L139
	movslq	80(%rsp), %r10
	movl	%r15d, %r14d
	movl	%edx, 160(%rsp)
	movl	%ecx, %r8d
	movl	%r15d, 164(%rsp)
	movq	%r13, 168(%rsp)
	movq	%r10, %r15
	movl	%r14d, %r13d
	movl	%ebp, %r14d
	movl	%r12d, %ebp
.L165:
	leal	-1(%r13), %eax
	movl	%eax, r(,%r15,4)
	cmpl	%ebx, %r14d
	jl	.L206
	movl	%r9d, %edi
	movl	%r13d, %edx
	leal	1(%r13), %r13d
	subl	%r14d, %edi
	leal	(%rbx,%rdi), %eax
	cmpl	%eax, %edx
	jg	.L143
	movslq	%ebx, %rax
	movl	%edx, 100(%rsp)
	movl	%r13d, %r12d
	movq	%rax, 40(%rsp)
	movl	%r13d, 112(%rsp)
	movq	%r15, 104(%rsp)
	movl	%ebx, %r15d
	movl	%ebp, %ebx
.L164:
	movq	40(%rsp), %rsi
	leal	-1(%r12), %eax
	movl	%eax, r(,%rsi,4)
	cmpl	%r8d, %r14d
	jl	.L207
	movl	%r9d, %edi
	movl	%r12d, %r13d
	leal	1(%r12), %r12d
	subl	%r14d, %edi
	leal	(%r8,%rdi), %eax
	cmpl	%eax, %r13d
	jg	.L147
	movslq	84(%rsp), %rsi
	movslq	%r8d, %rax
	movl	%r8d, 48(%rsp)
	movq	%rax, 32(%rsp)
	movq	%rsi, 8(%rsp)
	movl	%r13d, 56(%rsp)
	movl	88(%rsp), %r13d
	movl	%r15d, 52(%rsp)
	movl	%ebx, %r15d
	movl	%r12d, %ebx
	movl	%r12d, 60(%rsp)
	movl	%esi, %r12d
.L163:
	movq	32(%rsp), %rcx
	leal	-1(%rbx), %eax
	movl	%eax, r(,%rcx,4)
	cmpl	%r12d, %r14d
	jl	.L208
	movl	%r9d, %edi
	movl	%ebx, %ebp
	leal	1(%rbx), %ebx
	subl	%r14d, %edi
	leal	(%rdi,%r12), %eax
	cmpl	%ebp, %eax
	jl	.L151
	movslq	%r15d, %rax
	movl	%ebx, 4(%rsp)
	movq	%rax, 16(%rsp)
	movslq	%r13d, %rax
	movq	%rax, 24(%rsp)
.L162:
	movq	8(%rsp), %rcx
	leal	-1(%rbx), %eax
	movl	%eax, r(,%rcx,4)
	cmpl	%r15d, %r14d
	jl	.L209
	movl	%r9d, %edi
	movl	%ebx, %eax
	subl	%r14d, %edi
	leal	(%r15,%rdi), %edx
	cmpl	%edx, %ebx
	leal	1(%rbx), %edx
	jg	.L155
	movl	%eax, 68(%rsp)
	movl	%edx, %ebx
	movl	%ebp, 64(%rsp)
	movl	%r14d, %ebp
	movl	%edx, %r14d
.L161:
	movq	16(%rsp), %rsi
	leal	-1(%rbx), %eax
	movl	%eax, r(,%rsi,4)
	cmpl	%r13d, %ebp
	jl	.L210
	movl	%r9d, %edi
	movl	%ebx, %r8d
	subl	%ebp, %edi
	leal	0(%r13,%rdi), %eax
	cmpl	%eax, %ebx
	jg	.L159
	movl	%ebx, %r10d
.L160:
	movq	24(%rsp), %rax
	movl	136(%rsp), %edi
	movl	%ebp, %esi
	movl	%r8d, 76(%rsp)
	movl	%r10d, 72(%rsp)
	movl	%r10d, r(,%rax,4)
	call	combin
	testl	%eax, %eax
	jne	.L129
	movl	sz(%rip), %r9d
	movl	72(%rsp), %r10d
	movl	76(%rsp), %r8d
	movl	%r9d, %edi
	addl	$1, %r10d
	subl	%ebp, %edi
	leal	0(%r13,%rdi), %eax
	cmpl	%eax, %r10d
	jle	.L160
.L159:
	leal	(%rdi,%r15), %eax
	addl	$1, %ebx
	cmpl	%r8d, %eax
	jge	.L161
.L211:
	movl	%r14d, %edx
	movl	68(%rsp), %eax
	movl	%ebp, %r14d
	movl	64(%rsp), %ebp
.L155:
	leal	(%r12,%rdi), %esi
	movl	%edx, %ebx
	cmpl	%eax, %esi
	jge	.L162
	movl	4(%rsp), %ebx
.L151:
	movl	48(%rsp), %eax
	addl	%edi, %eax
	cmpl	%ebp, %eax
	jge	.L163
	movl	%r15d, %ebx
	movl	48(%rsp), %r8d
	movl	56(%rsp), %r13d
	movl	52(%rsp), %r15d
	movl	60(%rsp), %r12d
.L147:
	leal	(%r15,%rdi), %eax
	cmpl	%r13d, %eax
	jge	.L164
	movl	%ebx, %ebp
	movl	100(%rsp), %edx
	movl	%r15d, %ebx
	movl	112(%rsp), %r13d
	movq	104(%rsp), %r15
.L143:
	movl	80(%rsp), %eax
	addl	%edi, %eax
	cmpl	%edx, %eax
	jge	.L165
	movl	160(%rsp), %edx
	movl	164(%rsp), %r15d
	movl	%ebp, %r12d
	movl	%r8d, %ecx
	movq	168(%rsp), %r13
	movl	%r14d, %ebp
.L139:
	movl	96(%rsp), %eax
	movl	%r15d, %r14d
	addl	%edi, %eax
	cmpl	%edx, %eax
	jge	.L166
	movl	%ebp, %r15d
	movl	152(%rsp), %ebx
	movl	156(%rsp), %ebp
	movl	%ecx, %r8d
.L135:
	movl	92(%rsp), %eax
	addl	%edi, %eax
	cmpl	%ebx, %eax
	jge	.L167
	movl	%r12d, %ebp
	movl	140(%rsp), %ebx
	movl	%r15d, %r12d
	movl	%r8d, %r11d
	movl	144(%rsp), %r15d
	movl	148(%rsp), %eax
.L131:
	addl	%r15d, %edi
	movl	%eax, %r14d
	cmpl	%ebx, %edi
	jge	.L168
.L169:
	xorl	%eax, %eax
	jmp	.L124
	.p2align 4,,10
	.p2align 3
.L210:
	movl	%ebp, %edi
	call	action
	testl	%eax, %eax
	jne	.L129
	movl	sz(%rip), %r9d
	movl	%ebx, %r8d
	addl	$1, %ebx
	movl	%r9d, %edi
	subl	%ebp, %edi
	leal	(%rdi,%r15), %eax
	cmpl	%r8d, %eax
	jge	.L161
	jmp	.L211
	.p2align 4,,10
	.p2align 3
.L208:
	movl	%r14d, %edi
	call	action
	testl	%eax, %eax
	jne	.L129
	movl	sz(%rip), %r9d
	movl	%ebx, %ebp
	leal	1(%rbx), %ebx
	movl	%r9d, %edi
	subl	%r14d, %edi
	jmp	.L151
	.p2align 4,,10
	.p2align 3
.L209:
	movl	%r14d, %edi
	call	action
	testl	%eax, %eax
	jne	.L129
	movl	sz(%rip), %r9d
	movl	%ebx, %eax
	leal	1(%rbx), %edx
	movl	%r9d, %edi
	subl	%r14d, %edi
	jmp	.L155
.L207:
	movl	%r14d, %edi
	movl	%r8d, 4(%rsp)
	call	action
	movl	4(%rsp), %r8d
	testl	%eax, %eax
	jne	.L129
	movl	sz(%rip), %r9d
	movl	%r12d, %r13d
	leal	1(%r12), %r12d
	movl	%r9d, %edi
	subl	%r14d, %edi
	jmp	.L147
.L206:
	movl	%r14d, %edi
	movl	%r8d, 4(%rsp)
	call	action
	movl	4(%rsp), %r8d
	testl	%eax, %eax
	jne	.L129
	movl	sz(%rip), %r9d
	movl	%r13d, %edx
	leal	1(%r13), %r13d
	movl	%r9d, %edi
	subl	%r14d, %edi
	jmp	.L143
.L205:
	movl	%ebp, %edi
	movl	%ecx, 4(%rsp)
	call	action
	movl	4(%rsp), %ecx
	testl	%eax, %eax
	jne	.L129
	movl	sz(%rip), %r9d
	movl	%r14d, %edx
	leal	1(%r14), %r15d
	movl	%r9d, %edi
	subl	%ebp, %edi
	jmp	.L139
.L204:
	movl	%r15d, %edi
	movl	%r8d, 4(%rsp)
	call	action
	movl	4(%rsp), %r8d
	testl	%eax, %eax
	jne	.L129
	movl	sz(%rip), %r9d
	movl	%ebp, %ebx
	leal	1(%rbp), %ebp
	movl	%r9d, %edi
	subl	%r15d, %edi
	jmp	.L135
.L203:
	movl	%r12d, %edi
	movl	%r11d, 4(%rsp)
	call	action
	movl	4(%rsp), %r11d
	testl	%eax, %eax
	jne	.L129
	movl	sz(%rip), %r9d
	movl	%r14d, %ebx
	leal	1(%r14), %eax
	movl	%r9d, %edi
	subl	%r12d, %edi
	jmp	.L131
.L202:
	movl	%esi, %edi
	call	action
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
.L124:
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
.L129:
	.cfi_restore_state
	movl	$1, %eax
	jmp	.L124
	.cfi_endproc
.LFE24:
	.size	combin, .-combin
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC8:
	.string	"%d"
.LC9:
	.string	"%d%d"
.LC10:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$N, %esi
	movl	$.LC8, %edi
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
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	call	__isoc99_scanf
	movl	N(%rip), %eax
	leal	-1(%rax), %r15d
	cmpl	$3, %eax
	jle	.L220
	xorl	%ebx, %ebx
.L214:
	leaq	48(%rsp), %rdx
	leaq	44(%rsp), %rsi
	movl	$.LC9, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movd	44(%rsp), %xmm0
	movd	48(%rsp), %xmm6
	movq	%rbx, %rax
	salq	$4, %rax
	addq	$1, %rbx
	punpckldq	%xmm6, %xmm0
	cvtdq2pd	%xmm0, %xmm0
	movaps	%xmm0, pp(%rax)
	movl	N(%rip), %eax
	cmpl	%ebx, %eax
	jg	.L214
	testl	%eax, %eax
	jle	.L220
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
.L218:
	movl	%r12d, %ebp
	addl	$1, %r12d
	cmpl	%eax, %r12d
	jge	.L215
	movq	%r13, %r11
	movl	%r12d, %esi
	.p2align 4,,10
	.p2align 3
.L217:
	movapd	pp(%r13), %xmm0
	pxor	%xmm4, %xmm4
	subq	$32, %rsp
	.cfi_def_cfa_offset 176
	movl	%ebp, %edi
	addpd	pp+16(%r11), %xmm0
	mulpd	.LC6(%rip), %xmm0
	movapd	%xmm0, %xmm1
	movaps	%xmm0, 80(%rsp)
	subpd	pp(%r13), %xmm1
	movapd	%xmm1, %xmm3
	shufpd	$1, %xmm1, %xmm3
	mulpd	%xmm4, %xmm3
	movapd	%xmm3, %xmm2
	subpd	%xmm1, %xmm2
	addpd	%xmm3, %xmm1
	shufpd	$1, %xmm1, %xmm2
	addpd	%xmm0, %xmm2
	movaps	%xmm2, 96(%rsp)
	movdqa	96(%rsp), %xmm5
	movups	%xmm0, (%rsp)
	movups	%xmm5, 16(%rsp)
	call	update
	addq	$32, %rsp
	.cfi_def_cfa_offset 144
	testl	%eax, %eax
	movl	$1, %eax
	cmove	%eax, %ebx
	movl	N(%rip), %eax
	addl	$1, %esi
	addq	$16, %r11
	cmpl	%esi, %eax
	jg	.L217
	addq	$16, %r13
	cmpl	%r12d, %eax
	jg	.L218
.L215:
	testl	%ebx, %ebx
	jne	.L279
.L220:
	movl	%r15d, %esi
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	printf
	addq	$88, %rsp
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
.L279:
	.cfi_restore_state
	movslq	sz(%rip), %rsi
	movl	$cmp, %ecx
	movl	$228, %edx
	movl	%r15d, %r14d
	movl	$tbl, %edi
	movl	$2, %ebx
	call	qsort
	movl	%ebx, %r15d
.L251:
	leal	(%r15,%r14), %ebp
	sarl	%ebp
	testl	%ebp, %ebp
	jle	.L280
	movl	sz(%rip), %edx
	movl	r(%rip), %ecx
	movl	%edx, %eax
	subl	%ebp, %eax
	cmpl	%eax, %ecx
	jg	.L224
	leal	2(%rcx), %ebx
	movl	%r14d, 28(%rsp)
	movl	%ebx, %r14d
.L250:
	leal	-1(%r14), %ebx
	movl	%ebx, r+4(%rip)
	cmpl	$1, %ebp
	je	.L281
	movl	%edx, %eax
	subl	%ebp, %eax
	leal	2(%rax), %ecx
	cmpl	%ecx, %r14d
	jg	.L278
	addl	$1, %r14d
	movl	%ebx, 20(%rsp)
	movl	%r14d, 24(%rsp)
	movl	%r14d, %ebx
.L249:
	leal	-1(%rbx), %eax
	movl	%eax, r+8(%rip)
	cmpl	$2, %ebp
	je	.L282
	movl	%edx, %eax
	movl	%ebx, %ecx
	leal	1(%rbx), %ebx
	subl	%ebp, %eax
	leal	3(%rax), %esi
	cmpl	%esi, %ecx
	jg	.L232
	movl	%ecx, 12(%rsp)
	movl	%ebx, %r13d
	movl	%ebx, 16(%rsp)
.L248:
	leal	-1(%r13), %eax
	movl	%eax, r+12(%rip)
	cmpl	$3, %ebp
	je	.L283
	movl	%edx, %eax
	movl	%r13d, %esi
	subl	%ebp, %eax
	leal	4(%rax), %ecx
	cmpl	%r13d, %ecx
	leal	1(%r13), %ecx
	jl	.L236
	movl	%esi, 4(%rsp)
	movl	%ecx, %r13d
	movl	%ecx, 8(%rsp)
.L247:
	leal	-1(%r13), %eax
	movl	%eax, r+16(%rip)
	cmpl	$4, %ebp
	je	.L284
	movl	%edx, %eax
	movl	%r13d, %r12d
	leal	1(%r13), %r13d
	subl	%ebp, %eax
	leal	5(%rax), %ecx
	cmpl	%ecx, %r12d
	jg	.L240
	movl	%r12d, (%rsp)
	movl	%r13d, %ebx
.L246:
	leal	-1(%rbx), %eax
	movl	%eax, r+20(%rip)
	cmpl	$5, %ebp
	je	.L285
	movl	%edx, %eax
	movl	%ebx, %r12d
	subl	%ebp, %eax
	leal	6(%rax), %esi
	cmpl	%ebx, %esi
	jl	.L244
	movl	%ebx, %r14d
.L245:
	movl	%ebp, %esi
	movl	$7, %edi
	movl	%r14d, r+24(%rip)
	call	combin
	testl	%eax, %eax
	jne	.L222
	movl	sz(%rip), %edx
	addl	$1, %r14d
	movl	%edx, %eax
	subl	%ebp, %eax
	leal	6(%rax), %ecx
	cmpl	%ecx, %r14d
	jle	.L245
.L244:
	leal	5(%rax), %esi
	addl	$1, %ebx
	cmpl	%r12d, %esi
	jge	.L246
	movl	(%rsp), %r12d
.L240:
	leal	4(%rax), %ecx
	cmpl	%r12d, %ecx
	jge	.L247
	movl	4(%rsp), %esi
	movl	8(%rsp), %ecx
.L236:
	movl	%ecx, %r13d
	leal	3(%rax), %ecx
	cmpl	%esi, %ecx
	jge	.L248
	movl	12(%rsp), %ecx
	movl	16(%rsp), %ebx
.L232:
	leal	2(%rax), %esi
	cmpl	%ecx, %esi
	jge	.L249
	movl	20(%rsp), %ebx
	movl	24(%rsp), %r14d
.L228:
	cmpl	%eax, %ebx
	jle	.L250
	movl	28(%rsp), %r14d
.L224:
	leal	1(%rbp), %r15d
.L223:
	cmpl	%r15d, %r14d
	jg	.L251
	movl	%r14d, %r15d
	jmp	.L220
	.p2align 4,,10
	.p2align 3
.L285:
	movl	$5, %edi
	call	action
	testl	%eax, %eax
	jne	.L222
	movl	sz(%rip), %edx
	movl	%ebx, %r12d
	leal	-5(%rdx), %eax
	jmp	.L244
	.p2align 4,,10
	.p2align 3
.L284:
	movl	$4, %edi
	call	action
	testl	%eax, %eax
	jne	.L222
	movl	sz(%rip), %edx
	movl	%r13d, %r12d
	leal	1(%r13), %r13d
	leal	-4(%rdx), %eax
	jmp	.L240
	.p2align 4,,10
	.p2align 3
.L283:
	movl	$3, %edi
	call	action
	testl	%eax, %eax
	jne	.L222
	movl	sz(%rip), %edx
	movl	%r13d, %esi
	leal	1(%r13), %ecx
	leal	-3(%rdx), %eax
	jmp	.L236
.L282:
	movl	$2, %edi
	call	action
	testl	%eax, %eax
	jne	.L222
	movl	sz(%rip), %edx
	movl	%ebx, %ecx
	leal	1(%rbx), %ebx
	leal	-2(%rdx), %eax
	jmp	.L232
.L281:
	movl	$1, %edi
	call	action
	testl	%eax, %eax
	jne	.L222
	movl	sz(%rip), %edx
	leal	-1(%rdx), %eax
.L278:
	addl	$1, %r14d
	jmp	.L228
.L280:
	movl	%ebp, %edi
	call	action
	testl	%eax, %eax
	je	.L224
.L222:
	movl	%ebp, %r14d
	jmp	.L223
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.globl	r
	.bss
	.align 32
	.type	r, @object
	.size	r, 40
r:
	.zero	40
	.globl	pp
	.align 32
	.type	pp, @object
	.size	pp, 160
pp:
	.zero	160
	.globl	sz
	.align 4
	.type	sz, @object
	.size	sz, 4
sz:
	.zero	4
	.globl	line
	.align 32
	.type	line, @object
	.size	line, 960
line:
	.zero	960
	.globl	tbl
	.align 32
	.type	tbl, @object
	.size	tbl, 6840
tbl:
	.zero	6840
	.globl	N
	.align 4
	.type	N, @object
	.size	N, 4
N:
	.zero	4
	.globl	size
	.align 32
	.type	size, @object
	.size	size, 40
size:
	.zero	40
	.globl	id
	.align 32
	.type	id, @object
	.size	id, 40
id:
	.zero	40
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC1:
	.long	1
	.long	1
	.long	1
	.long	1
	.align 16
.LC2:
	.long	4
	.long	5
	.long	6
	.long	7
	.align 16
.LC3:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	-500134854
	.long	1044740494
	.section	.rodata.cst16
	.align 16
.LC6:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.set	.LC7,.LC6
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
