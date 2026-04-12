	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC3:
	.string	"%d\n"
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
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -32(%rbp)
	leaq	-36(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L2
.L14:
	movl	$0, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -32(%rbp)
	movq	$1, -16(%rbp)
	jmp	.L3
.L13:
	movl	$2, -24(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, -28(%rbp)
	cmpq	$1, -16(%rbp)
	je	.L4
	cmpq	$2, -16(%rbp)
	jne	.L6
	addl	$1, -32(%rbp)
	movq	-16(%rbp), %rax
	movl	%eax, %edx
	movl	-20(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -20(%rbp)
	jmp	.L4
.L10:
	movl	-28(%rbp), %eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	cqto
	idivq	%rcx
	movq	%rdx, %rax
	testq	%rax, %rax
	jne	.L7
	movl	$0, -24(%rbp)
	jmp	.L8
.L7:
	movl	$1, -24(%rbp)
.L8:
	addl	$1, -28(%rbp)
.L6:
	pxor	%xmm2, %xmm2
	cvtsi2sdl	-28(%rbp), %xmm2
	movsd	%xmm2, -56(%rbp)
	pxor	%xmm3, %xmm3
	cvtsi2sdq	-16(%rbp), %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	movsd	.LC1(%rip), %xmm1
	addsd	%xmm1, %xmm0
	comisd	-56(%rbp), %xmm0
	jbe	.L4
	cmpl	$0, -24(%rbp)
	jne	.L10
.L4:
	cmpq	$1, -16(%rbp)
	je	.L11
	pxor	%xmm4, %xmm4
	cvtsi2sdl	-28(%rbp), %xmm4
	movsd	%xmm4, -56(%rbp)
	pxor	%xmm5, %xmm5
	cvtsi2sdq	-16(%rbp), %xmm5
	movq	%xmm5, %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	movsd	.LC2(%rip), %xmm1
	addsd	%xmm1, %xmm0
	movsd	-56(%rbp), %xmm4
	comisd	%xmm0, %xmm4
	jbe	.L11
	addl	$1, -32(%rbp)
	movq	-16(%rbp), %rax
	movl	%eax, %edx
	movl	-20(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -20(%rbp)
.L11:
	addq	$1, -16(%rbp)
.L3:
	movl	-36(%rbp), %eax
	cmpl	%eax, -32(%rbp)
	jl	.L13
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-36(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
.L2:
	movl	-36(%rbp), %eax
	testl	%eax, %eax
	jne	.L14
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.align 8
.LC2:
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
