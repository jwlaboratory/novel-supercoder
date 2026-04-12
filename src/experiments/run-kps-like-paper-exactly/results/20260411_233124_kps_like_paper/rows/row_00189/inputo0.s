	.file	"inputC.c"
	.text
	.globl	s
	.bss
	.type	s, @object
	.size	s, 1
s:
	.zero	1
	.section	.rodata
.LC0:
	.string	"%lf"
.LC2:
	.string	"%f\n"
.LC3:
	.string	"%s"
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
	leaq	s(%rip), %rax
	movq	%rax, -16(%rbp)
	jmp	.L2
.L12:
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	s(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	sscanf@PLT
	cmpl	$1, %eax
	je	.L3
	movq	-16(%rbp), %rax
	leaq	-8(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movsd	(%rax), %xmm0
	movsd	%xmm0, -8(%rbp)
	movzbl	s(%rip), %eax
	movsbl	%al, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L4
	movzbl	s(%rip), %eax
	cmpb	$47, %al
	je	.L5
	movq	-16(%rbp), %rax
	movsd	(%rax), %xmm1
	movzbl	s(%rip), %eax
	cmpb	$45, %al
	jne	.L6
	movsd	-8(%rbp), %xmm0
	movq	.LC1(%rip), %xmm2
	xorpd	%xmm2, %xmm0
	jmp	.L7
.L6:
	movsd	-8(%rbp), %xmm0
.L7:
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	movsd	%xmm0, (%rax)
	movq	-16(%rbp), %rax
	movsd	(%rax), %xmm0
	jmp	.L9
.L5:
	movq	-16(%rbp), %rax
	movsd	(%rax), %xmm0
	divsd	-8(%rbp), %xmm0
	jmp	.L9
.L4:
	movq	-16(%rbp), %rax
	movsd	(%rax), %xmm0
	mulsd	-8(%rbp), %xmm0
.L9:
	movq	-16(%rbp), %rax
	movsd	%xmm0, (%rax)
	jmp	.L10
.L3:
	addq	$8, -16(%rbp)
.L10:
	movl	$0, %eax
	call	getchar@PLT
	andl	$2, %eax
	testl	%eax, %eax
	je	.L2
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %xmm0
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	testl	%eax, %eax
.L2:
	leaq	s(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	scanf@PLT
	cmpl	$-1, %eax
	jne	.L12
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 16
.LC1:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
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
