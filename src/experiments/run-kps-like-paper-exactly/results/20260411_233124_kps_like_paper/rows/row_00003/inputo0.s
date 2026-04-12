	.file	"inputC.c"
	.text
	.section	.rodata
.LC1:
	.string	"%d %d"
.LC5:
	.string	"%.10lf\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -40(%rbp)
	leaq	-52(%rbp), %rdx
	leaq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$1, -44(%rbp)
	jmp	.L2
.L8:
	movl	-52(%rbp), %eax
	pxor	%xmm3, %xmm3
	cvtsi2ssl	%eax, %xmm3
	movd	%xmm3, %eax
	movd	%eax, %xmm0
	call	log2f@PLT
	movd	%xmm0, %ebx
	pxor	%xmm4, %xmm4
	cvtsi2ssl	-44(%rbp), %xmm4
	movd	%xmm4, %eax
	movd	%eax, %xmm0
	call	log2f@PLT
	movd	%ebx, %xmm1
	subss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtss2sd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-32(%rbp), %xmm0
	cvttsd2sil	%xmm0, %eax
	movl	%eax, -48(%rbp)
	pxor	%xmm0, %xmm0
	cvtsi2sdl	-48(%rbp), %xmm0
	ucomisd	-32(%rbp), %xmm0
	jp	.L11
	ucomisd	-32(%rbp), %xmm0
	je	.L3
.L11:
	addl	$1, -48(%rbp)
.L3:
	movl	-52(%rbp), %eax
	cmpl	%eax, -44(%rbp)
	jge	.L5
	movl	-56(%rbp), %eax
	movl	%eax, -80(%rbp)
	fildl	-80(%rbp)
	fstpt	-80(%rbp)
	fildl	-48(%rbp)
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	fldt	.LC2(%rip)
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	call	powl@PLT
	addq	$32, %rsp
	fldt	-80(%rbp)
	fmulp	%st, %st(1)
	fld1
	fdivp	%st, %st(1)
	fldl	-40(%rbp)
	faddp	%st, %st(1)
	fstpl	-40(%rbp)
	jmp	.L12
.L5:
	movl	-56(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movl	-52(%rbp), %eax
	pxor	%xmm2, %xmm2
	cvtsi2sdl	%eax, %xmm2
	movapd	%xmm0, %xmm1
	subsd	%xmm2, %xmm1
	movsd	.LC4(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movl	-56(%rbp), %eax
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	divsd	%xmm1, %xmm0
	movsd	-40(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	jmp	.L7
.L12:
	addl	$1, -44(%rbp)
.L2:
	movl	-56(%rbp), %eax
	cmpl	%eax, -44(%rbp)
	jle	.L8
.L7:
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 16
.LC2:
	.long	0
	.long	-2147483648
	.long	16384
	.long	0
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
