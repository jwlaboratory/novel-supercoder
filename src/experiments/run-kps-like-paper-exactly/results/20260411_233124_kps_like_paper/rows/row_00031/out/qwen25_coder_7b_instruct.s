.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d %d %d"
.LC1:
	.string	"%d"
.LC2:
	.string	"%lli"
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
	subq	$2480, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-240032(%rbp), %rcx
	leaq	-240036(%rbp), %rdx
	leaq	-240040(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -240028(%rbp)
.L2:
	movl	$0, -240024(%rbp)
.L3:
	movl	-240024(%rbp), %eax
	movslq	%eax, %rcx
	movl	-240028(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movq	$0, -80016(%rbp,%rax,8)
	addl	$1, -240024(%rbp)
	cmpl	%eax, -240032(%rbp)
	jl	.L3
	addl	$1, -240028(%rbp)
.L4:
	movl	-240028(%rbp), %eax
	cmpl	%eax, -240032(%rbp)
	jl	.L4
	movl	$0, -240028(%rbp)
.L5:
	movl	$0, -240024(%rbp)
.L6:
	movl	-240024(%rbp), %eax
	movslq	%eax, %rcx
	movl	-240028(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -240024(%rbp)
	cmpl	%eax, -240036(%rbp)
	jl	.L6
	addl	$1, -240028(%rbp)
.L7:
	movl	-240036(%rbp), %eax
	cmpl	%eax, -240028(%rbp)
	jl	.L7
	movl	$0, -240028(%rbp)
.L8:
	movl	$0, -240024(%rbp)
.L9:
	movl	-240024(%rbp), %eax
	movslq	%eax, %rcx
	movl	-240028(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -240024(%rbp)
	cmpl	%eax, -240032(%rbp)
	jl	.L9
	addl	$1, -240028(%rbp)
.L10:
	movl	-240040(%rbp), %eax
	cmpl	%eax, -240028(%rbp)
	jl	.L10
	movl	$0, -240028(%rbp)
.L11:
	movl	$0, -240024(%rbp)
.L12:
	movl	-240024(%rbp), %eax
	movslq	%eax, %rcx
	movl	-240028(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movq	-80016(%rbp,%rax,8), %rsi
	movl	-240024(%rbp), %eax
	movslq	%eax, %rcx
	movl	-240028(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movq	-240016(%rbp,%rax,8), %rcx
	movl	-240024(%rbp), %eax
	movslq	%eax, %rdi
	movl	-240020(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rdi, %rax
	movq	-160016(%rbp,%rax,8), %rax
	imulq	%rcx, %rax
	leaq	(%rsi,%rax), %rcx
	movl	-240024(%rbp), %eax
	movslq	%eax, %rsi
	movl	-240028(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rsi, %rax
	movq	%rcx, -80016(%rbp,%rax,8)
	addl	$1, -240020(%rbp)
	cmpl	%eax, -240032(%rbp)
	jl	.L12
	addl	$1, -240024(%rbp)
.L13:
	movl	-240028(%rbp), %eax
	cmpl	%eax, -2
