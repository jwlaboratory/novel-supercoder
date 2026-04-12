.file	"optimized_inputC.s"
	.text
	.p2align 4
	.globl	upll
	.type	upll, @function
upll:
.LFB8:
	.cfi_startproc
	movq	(%rsi), %rax
	cmpq	%rax, (%rdi)
	movl	$-1, %edx
	setg	%al
	movzbl	%al, %eax
	cmovl	%edx, %eax
	ret
	.cfi_endproc
.LFE8:
	.size	upll, .-upll
	.p2align 4
	.globl	downll
	.type	downll, @function
downll:
.LFB9:
	.cfi_startproc
	movq	(%rsi), %rdx
	movl	$1, %eax
	cmpq	%rdx, (%rdi)
	jl	.L5
	setg	%al
	movzbl	%al, %eax
	negl	%eax
.L5:
	ret
	.cfi_endproc
.LFE9:
	.size	downll, .-downll
	.p2align 4
	.globl	sort
	.type	sort, @function
sort:
.LFB13:
	.cfi_startproc
	movq	8(%rsi), %rax
	cmpq	%rax, 8(%rdi)
	setge	%al
	movzbl	%al, %eax
	leal	-1(%rax,%rax), %eax
	ret
	.cfi_endproc
.LFE13:
	.size	sort, .-sort
	.p2align 4
	.globl	sortup
	.type	sortup, @function
sortup:
.LFB10:
	.cfi_startproc
	movslq	%esi, %rsi
	movl	$upll, %ecx
	movl	$8, %edx
	jmp	qsort
	.cfi_endproc
.LFE10:
	.size	sortup, .-sortup
	.p2align 4
	.globl	sortdown
	.type	sortdown, @function
sortdown:
.LFB11:
	.cfi_startproc
	movslq	%esi, %rsi
	movl	$downll, %ecx
	movl	$8, %edx
	jmp	qsort
	.cfi_endproc
.LFE11:
	.size	sortdown, .-sortdown
	.p2align 4
	.globl	pom
	.type	pom, @function
pom:
.LFB12:
	.cfi_startproc
	movq	%rdi, %rax
	movslq	%edx, %r8
	movl	$1, %edi
	cqto
	idivq	%r8
	movq	%rdx, %rcx
	testq	%rsi, %rsi
	je	.L13
	.p2align 4,,10
	.p2align 3
.L16:
	testb	$1, %sil
	je	.L15
	movq	%rdi, %rax
	imulq	%rcx, %rax
	cqto
	idivq	%r8
	movq	%rdx, %rdi
.L15:
	imulq	%rcx, %rcx
	movq	%rcx, %rax
	cqto
	idivq	%r8
	movq	%rsi, %rax
	shrq	$63, %rax
	addq	%rax, %rsi
	sarq	%rsi
	movq	%rdx, %rcx
	jne	.L16
.L13:
	movq	%rdi, %rax
	ret
	.cfi_endproc
.LFE12:
	.size	pom, .-pom
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB14:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$.LC0, %edi
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	leaq	184(%rsp), %rsi
	leaq	192(%rsp), %rdx
	call	__isoc99_scanf
	movq	192(%rsp), %rsi
	testq	%rsi, %rsi
	jle	.L23
	movl	$c, %ebx
	xorl	%ebp, %ebp
.L24:
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addq	$1, %rbp
	addq	$24, %rbx
	leaq	200(%rsp), %rsi
	leaq	216(%rsp), %rcx
	leaq	208(%rsp), %rdx
	call	__isoc99_scanf
	movq	216(%rsp), %rax
	movq	200(%rsp), %xmm0
	movhps	208(%rsp), %xmm0
	movq	%rax, -8(%rbx)
	movq	192(%rsp), %rsi
	movups	%xmm0, -24(%rbx)
	cmpq	%rbp, %rsi
	jg	.L24
.L23:
	movl	$sort, %ecx
	movl	$24, %edx
	movl	$c, %edi
	call	qsort
	cmpq	$1, c+8(%rip)
	jne	.L49
	movl	$c+16, %eax
	xorl	%ecx, %ecx
	jmp	.L28
.L26:
	addq	$24, %rax
	addq	$1, %rcx
	cmpq	$1, -8(%rax)
	jne	.L25
.L28:
	cmpq	$1, (%rax)
	jle	.L26
	movl	$.LC2, %edi
	call	puts
.L27:
	addq	$232, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L49:
	.cfi_restore_state
	xorl	%ecx, %ecx
.L25:
	movq	184(%rsp), %rdi
	movq	$1, dp+8(%rip)
	movq	$1, dp+2480(%rip)
	movq	$1, dp+768800(%rip)
	cmpq	$1, %rdi
	jle	.L29
	movl	$dp, %r8d
	leaq	1(%rdi), %rax
	movq	$dp+1540088, 64(%rsp)
	movq	$-4944, %r15
	movq	$dp+1537600, 80(%rsp)
	movq	%r8, %rsi
	movl	$dp+768816, %r9d
	movabsq	$-8543223828751151131, %rbp
	movq	$dp+4960, 88(%rsp)
	movq	%r15, %r13
	movq	%rax, 13
