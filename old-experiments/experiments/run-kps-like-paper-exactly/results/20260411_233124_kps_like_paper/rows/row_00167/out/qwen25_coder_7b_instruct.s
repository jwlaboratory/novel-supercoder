.file	"inputC.c"
	.text
	.globl	descending_compare
	.type	descending_compare, @function
descending_compare:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jle	.L2
	movl	$-1, %eax
	jmp	.L3
.L2:
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L4
	movl	$0, %eax
	jmp	.L3
.L4:
	movl	$1, %eax
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	descending_compare, .-descending_compare
	.globl	ascending_compare
	.type	ascending_compare, @function
ascending_compare:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jge	.L6
	movl	$-1, %eax
	jmp	.L7
.L6:
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L8
	movl	$0, %eax
	jmp	.L7
.L8:
	movl	$1, %eax
.L7:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	ascending_compare, .-ascending_compare
	.globl	lower_bound
	.type	lower_bound, @function
lower_bound:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	$0, -12(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -8(%rbp)
	jmp	.L10
.L15:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -32(%rbp)
	jle	.L11
	movl	-8(%rbp), %eax
	movl	%eax, -12(%rbp)
	jmp	.L12
.L11:
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
.L12:
	movl	-12(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -8(%rbp)
.L10:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -8(%rbp)
	jne	.L13
	movl	-8(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -4(%rbp)
	je	.L14
.L13:
	movl	-8(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jne	.L15
.L14:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -32(%rbp)
	jg	.L16
	movl	-12(%rbp), %eax
	jmp	.L17
.L16:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -32(%rbp)
	jg	.L18
	movl	-8(%rbp), %eax
	jmp	.L17
.L18:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -32(%rbp)
	jg	.L19
	movl	-4(%rbp), %eax
	jmp	.L17
.L19:
	movl	-28(%rbp), %eax
.L17:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	lower_bound, .-lower_bound
	.globl	c
	.bss
	.align 32
	.type	c, @object
	.size	c, 2020
c:
	.zero	2020
	.globl	s
	.align 32
	.type	s, @object
	.size	s, 2020
s:
	.zero	2020
	.globl	f
	.align 32
	.type	f, @object
	.size	f, 2020
f:
	.zero	2020
	.globl	answer
	.align 32
	.type	answer, @object
	.size	answer, 4040
answer:
	.zero	4040
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d %d %d"
.LC2:
	.string	"%lu\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
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
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	mov
