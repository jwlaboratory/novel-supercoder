	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%dx%d=%d\n"
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
	movl	%edi, -4(%rbp)
	movl	$8, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$954437177, %rdx, %rdx
	shrq	$32, %rdx
	sarl	%edx
	sarl	$31, %eax
	movl	%edx, %esi
	subl	%eax, %esi
	movl	-4(%rbp), %edx
	movslq	%edx, %rax
	imulq	$954437177, %rax, %rax
	shrq	$32, %rax
	sarl	%eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	movl	%eax, %ecx
	sall	$3, %ecx
	addl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	addl	$1, %eax
	imull	%eax, %esi
	movl	-4(%rbp), %edx
	movslq	%edx, %rax
	imulq	$954437177, %rax, %rax
	shrq	$32, %rax
	sarl	%eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	movl	%eax, %ecx
	sall	$3, %ecx
	addl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	leal	1(%rax), %edx
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	imulq	$954437177, %rcx, %rcx
	shrq	$32, %rcx
	sarl	%ecx
	sarl	$31, %eax
	movl	%eax, %edi
	movl	%ecx, %eax
	subl	%edi, %eax
	movl	%esi, %ecx
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L2:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	cmpl	$88, %eax
	jle	.L3
	movl	$0, %edi
	call	exit@PLT
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
