.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"node %d: key = %d, "
.LC2:
	.string	"parent key = %d, "
.LC3:
	.string	"left key = %d, "
.LC4:
	.string	"right key = %d, "
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
	subq	$1040, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-1032(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$1, -1028(%rbp)
.L2:
	movl	-1032(%rbp), %eax
	cmpl	%eax, -1028(%rbp)
	jle	.L3
	leaq	-1024(%rbp), %rdx
	movl	-1028(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -1028(%rbp)
	jmp	.L2
.L3:
	movl	$1, -1028(%rbp)
.L4:
	movl	-1032(%rbp), %eax
	cmpl	%eax, -1028(%rbp)
	jle	.L5
	movl	-1028(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$1, -1028(%rbp)
	je	.L6
	movl	-1028(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cltq
	movl	-1024(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L6:
	movl	-1028(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-1032(%rbp), %eax
	cmpl	%eax, %edx
	jg	.L7
	movl	-1028(%rbp), %eax
	addl	%eax, %eax
	cltq
	movl	-1024(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L7:
	movl	-1028(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-1032(%rbp), %eax
	cmpl	%eax, %edx
	jge	.L8
	movl	-1028(%rbp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	cltq
	movl	-1024(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L8:
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -1028(%rbp)
	jmp	.L4
.L5:
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
