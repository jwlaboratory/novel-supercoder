.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d\n"
.LC2:
	.string	"0"
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
	subq	$2240, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-80052(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -80044(%rbp)
.L2:
	movl	-80052(%rbp), %eax
	cmpl	%eax, -80044(%rbp)
	jl	.L3
	leaq	-80032(%rbp), %rdx
	movl	-80044(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -80044(%rbp)
	jmp	.L2
.L3:
	movl	$0, -80044(%rbp)
.L4:
	movl	-80052(%rbp), %eax
	cmpl	%eax, -80044(%rbp)
	jl	.L5
	leaq	-80032(%rbp), %rdx
	movl	-80044(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -80044(%rbp)
	jmp	.L4
.L5:
	movl	$0, -80044(%rbp)
.L6:
	movl	-80052(%rbp), %eax
	cmpl	%eax, -80044(%rbp)
	jl	.L7
	leaq	-80032(%rbp), %rdx
	movl	-80044(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -80044(%rbp)
	jmp	.L6
.L7:
	movl	$0, -80044(%rbp)
.L8:
	movl	-80052(%rbp), %eax
	cmpl	%eax, -80044(%rbp)
	jl	.L9
	leaq	-80032(%rbp), %rdx
	movl	-80044(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -80044(%rbp)
	jmp	.L8
.L9:
	movl	$0, -80044(%rbp)
.L10:
	movl	-80052(%rbp), %eax
	cmpl	%eax, -80044(%rbp)
	jl	.L11
	leaq	-80032(%rbp), %rdx
	movl	-80044(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -80044(%rbp)
	jmp	.L10
.L11:
	movl	$0, -80044(%rbp)
.L12:
	movl	-80052(%rbp), %eax
	cmpl	%eax, -80044(%rbp)
	jl	.L13
	leaq	-80032(%rbp), %rdx
	movl	-80044(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -80044(%rbp)
	jmp	.L12
.L13:
	movl	$0, -80044(%rbp)
.L14:
	movl	-80052(%rbp), %eax
	cmpl	%eax, -80044(%rbp)
	jl	.L15
	leaq	-80032(%rbp), %rdx
	movl	-80044(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -80044(%rbp)
	jmp	.L14
.L15:
	movl	$0, -80044(%rbp)
.L16:
	movl	-80052(%rbp), %eax
	cmpl	%eax, -80044(%rbp)
	jl	.L17
	leaq	-80032(%rbp), %rdx
	movl	-80044(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -80044(%rbp)
	jmp	.L16
.L17:
	movl	$0, -80044(%rbp)
.L18:
	movl	-80052(%rbp), %eax
	cmpl	%eax, -80044(%rbp)
	jl	.L19
	leaq	-80032(%rbp), %rdx
	movl	-80044(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl
