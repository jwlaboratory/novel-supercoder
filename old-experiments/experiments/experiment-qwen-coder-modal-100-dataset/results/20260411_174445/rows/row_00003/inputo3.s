	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d:%d"
.LC10:
	.string	"alert"
.LC11:
	.string	"safe"
.LC12:
	.string	"warning"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$.LC0, %edi
	xorl	%eax, %eax
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	leaq	12(%rsp), %rsi
	movl	$0, 4(%rsp)
	movl	$0, 8(%rsp)
	call	__isoc99_scanf
	movl	12(%rsp), %eax
	subl	$1, %eax
	cmpl	$9999, %eax
	ja	.L2
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L19:
	leaq	8(%rsp), %rdx
	leaq	4(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	4(%rsp), %eax
	cmpl	$11, %eax
	ja	.L3
	movl	8(%rsp), %edx
	cmpl	$59, %edx
	ja	.L3
	imull	$30, %eax, %ecx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%edx, %xmm0
	mulsd	.LC2(%rip), %xmm0
	pxor	%xmm2, %xmm2
	pxor	%xmm3, %xmm3
	cvtsi2sdl	%ecx, %xmm1
	leal	(%rdx,%rdx,2), %ecx
	addl	%ecx, %ecx
	cvtsi2sdl	%ecx, %xmm2
	addsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	subsd	%xmm2, %xmm0
	comisd	%xmm0, %xmm3
	ja	.L34
	comisd	.LC6(%rip), %xmm0
	jbe	.L35
.L6:
	cmpl	$30, %edx
	jle	.L12
	cmpl	$5, %eax
	jle	.L36
.L12:
	addsd	.LC9(%rip), %xmm2
	subsd	%xmm1, %xmm2
	movapd	%xmm2, %xmm0
.L13:
	pxor	%xmm1, %xmm1
	comisd	%xmm1, %xmm0
	jb	.L8
.L7:
	movsd	.LC7(%rip), %xmm1
	comisd	%xmm0, %xmm1
	ja	.L10
	comisd	.LC8(%rip), %xmm0
	jb	.L8
	movsd	.LC6(%rip), %xmm1
	comisd	%xmm0, %xmm1
	jnb	.L11
.L8:
	movl	$.LC12, %edi
	call	puts
	.p2align 4,,10
	.p2align 3
.L3:
	addl	$1, %ebx
	cmpl	%ebx, 12(%rsp)
	jg	.L19
.L2:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L35:
	.cfi_restore_state
	comisd	%xmm3, %xmm0
	jb	.L8
	movsd	.LC7(%rip), %xmm1
	comisd	%xmm0, %xmm1
	ja	.L10
	comisd	.LC8(%rip), %xmm0
	jb	.L8
.L11:
	movl	$.LC11, %edi
	call	puts
	jmp	.L3
.L34:
	movsd	.LC4(%rip), %xmm3
	comisd	%xmm0, %xmm3
	ja	.L6
	xorpd	.LC5(%rip), %xmm0
	jmp	.L7
.L10:
	movl	$.LC10, %edi
	call	puts
	jmp	.L3
.L36:
	addsd	.LC9(%rip), %xmm1
	subsd	%xmm2, %xmm1
	movapd	%xmm1, %xmm0
	jmp	.L13
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1071644672
	.align 8
.LC4:
	.long	0
	.long	-1067024384
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC5:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC6:
	.long	0
	.long	1080459264
	.align 8
.LC7:
	.long	0
	.long	1077805056
	.align 8
.LC8:
	.long	0
	.long	1079410688
	.align 8
.LC9:
	.long	0
	.long	1081507840
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
