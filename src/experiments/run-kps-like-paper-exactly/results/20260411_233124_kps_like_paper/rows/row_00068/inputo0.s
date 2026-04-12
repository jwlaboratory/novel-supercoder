	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"0.5"
.LC3:
	.string	"%lf"
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
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L2
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L3
.L2:
	movl	-16(%rbp), %eax
	addl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC2(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movl	-16(%rbp), %eax
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -12(%rbp)
	pxor	%xmm2, %xmm2
	cvtss2sd	-12(%rbp), %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L3:
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC2:
	.long	0
	.long	1073741824
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
