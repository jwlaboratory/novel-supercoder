.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
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
	subq	$4096, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-5128(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -5124(%rbp)
	jmp	.L2
.L3:
	leaq	-5120(%rbp), %rdx
	movl	-5124(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-5124(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$4092, %rax
	movl	$0, (%rax)
	movl	-5124(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$4088, %rax
	movl	$1, (%rax)
	movl	-5124(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$4084, %rax
	movl	$1, (%rax)
	addl	$1, -5124(%rbp)
.L2:
	movl	-5128(%rbp), %eax
	cmpl	%eax, -5124(%rbp)
	jl	.L3
	movl	-5128(%rbp), %edx
	leaq	-5120(%rbp), %rcx
	leaq	-4096(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	insert
	movl	-5128(%rbp), %edx
	leaq	-4096(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	Print
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
	.globl	insert
	.type	insert, @function
insert:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L7
.L9:
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movq	%rdx, %rcx
	salq	$4, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	cmpl	$1, -4(%rbp)
	jle	.L8
	movl	-8(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	movl	%eax, 4(%rdx)
.L8:
	movl	-8(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	addl	%edx, %edx
	movl	%edx, 8(%rax)
	movl	-4(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-8(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	addl	$1, %edx
	movl	%edx, 12(%rax)
	addl	$1, -8(%rbp)
.L7:
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L9
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	insert, .-insert
	.section	.rodata
.LC1:
	.string	"node %d: key = %d, "
.LC2:
	.string	"parent key = %d, "
.LC3:
	.string	"left key = %d, "
.LC4:
	.string	"right key = %d, "
	.text
	.globl	Print
	.type	Print, @function
Print:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L11
.L15:
	movl	-8(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	-8(%rbp), %edx
	leal	1(%rdx), %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-8(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	je	.L12
	movl	-8(%
