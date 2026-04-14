.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"Yes"
.LC2:
	.string	"No"
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
	subq	$544, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -528(%rbp)
	movl	$0, -520(%rbp)
	jmp	.L2
.L5:
	movl	$0, -516(%rbp)
	jmp	.L3
.L4:
	leaq	-512(%rbp), %rcx
	movl	-516(%rbp), %eax
	movslq	%eax, %rsi
	movl	-520(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rsi, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-516(%rbp), %eax
	movslq	%eax, %rcx
	movl	-520(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movl	$0, -464(%rbp,%rax,4)
	addl	$1, -516(%rbp)
.L3:
	cmpl	$2, -516(%rbp)
	jle	.L4
	addl	$1, -520(%rbp)
.L2:
	cmpl	$2, -520(%rbp)
	jle	.L5
	leaq	-532(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -524(%rbp)
	jmp	.L6
.L12:
	leaq	-416(%rbp), %rdx
	movl	-524(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -520(%rbp)
	jmp	.L7
.L11:
	movl	$0, -516(%rbp)
	jmp	.L8
.L10:
	movl	-516(%rbp), %eax
	movslq	%eax, %rcx
	movl	-520(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movl	-512(%rbp,%rax,4), %edx
	movl	-524(%rbp), %eax
	cltq
	movl	-416(%rbp,%rax,4), %eax
	cmpl	%eax, %edx
	jne	.L9
	movl	-516(%rbp), %eax
	movslq	%eax, %rcx
	movl	-520(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movl	$1, -464(%rbp,%rax,4)
.L9:
	addl	$1, -516(%rbp)
.L8:
	cmpl	$2, -516(%rbp)
	jle	.L10
	addl	$1, -520(%rbp)
.L7:
	cmpl	$2, -520(%rbp)
	jle	.L11
	addl	$1, -524(%rbp)
.L6:
	movl	-532(%rbp), %eax
	cmpl	%eax, -524(%rbp)
	jl	.L12
	movl	$0, -524(%rbp)
	jmp	.L13
.L15:
	movl	-524(%rbp), %eax
	cltq
	movl	-464(%rbp,%rax,4), %eax
	cmpl	$1, %eax
	jne	.L14
	movl	-524(%rbp), %eax
	cltq
	addq	$3, %rax
	movl	-464(%rbp,%rax,4), %eax
	cmpl	$1, %eax
	jne	.L14
	movl	-524(%rbp), %eax
	cltq
	addq	$6, %rax
	movl	-464(%rbp,%rax,4), %eax
	cmpl	$1, %eax
	jne	.L14
	movl	$1, -528(%rbp)
.L14:
	addl	$1, -524(%rbp)
.L13:
	cmpl	$2, -524(%rbp)
	jle	.L15
	movl	$0, -524(%rbp)
	jmp	.L16
.L18:
	movl	-524(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$464, %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L17
	movl	-524(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$460, %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L17
	movl	-524(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$456, %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L17
	movl	$1, -528(%rbp)
.L17:
	addl	$1, -524(%rbp)
.L16:
	cmpl	$2, -524(%rbp)
	jle	.L18
	movl	-464(%rbp), %eax
	cmpl	$1, %eax
	jne	.L19
	movl	-448(%rbp), %eax
	cmpl	$1, %eax
	jne	.L19
	movl	-432(%rbp), %eax
	cmpl	$1, %eax
	jne	.L19
