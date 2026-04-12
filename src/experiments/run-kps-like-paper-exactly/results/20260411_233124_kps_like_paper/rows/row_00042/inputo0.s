	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%lld\n"
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
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$1, -20(%rbp)
	jmp	.L2
.L4:
	movl	-20(%rbp), %edx
	movslq	%edx, %rax
	imulq	$1431655766, %rax, %rax
	shrq	$32, %rax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	movl	%eax, %ecx
	addl	%ecx, %ecx
	addl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	testl	%eax, %eax
	je	.L3
	movl	-20(%rbp), %edx
	movslq	%edx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	sarl	%eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	movl	%eax, %ecx
	sall	$2, %ecx
	addl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	testl	%eax, %eax
	je	.L3
	movl	-20(%rbp), %eax
	cltq
	addq	%rax, -16(%rbp)
.L3:
	addl	$1, -20(%rbp)
.L2:
	movl	-24(%rbp), %eax
	cmpl	%eax, -20(%rbp)
	jle	.L4
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
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
