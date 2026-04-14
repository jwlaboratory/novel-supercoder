.file	"optimized_inputC.s"
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
	movapd	%xmm8, %
