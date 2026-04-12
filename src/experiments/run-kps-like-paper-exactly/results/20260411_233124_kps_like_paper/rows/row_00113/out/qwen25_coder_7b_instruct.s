.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d %d"
.LC1:
	.string	"#"
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
.L8:
	leaq	-20(%rbp), %rdx
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-24(%rbp), %eax
	testl	%eax, %eax
	jne	.L2
	movl	-20(%rbp), %eax
	testl	%eax, %eax
	je	.L12
.L2:
	movl	$0, -16(%rbp)
.L4:
	movl	-24(%rbp), %eax
	cmpl	%eax, -16(%rbp)
	jge	.L7
	movl	$0, -12(%rbp)
.L5:
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -12(%rbp)
	cmpl	-20(%rbp), -12(%rbp)
	jl	.L5
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -16(%rbp)
	jmp	.L4
.L7:
	movl	$10, %edi
	call	putchar@PLT
	jmp	.L8
.L12:
	nop
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
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
