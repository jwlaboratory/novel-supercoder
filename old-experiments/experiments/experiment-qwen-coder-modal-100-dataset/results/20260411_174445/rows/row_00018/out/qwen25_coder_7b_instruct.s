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
	.globl	gcd
	.type	gcd, @function
gcd:
.LFB12:
	.cfi_startproc
	movq	%rdi, %rax
	movq	%rsi, %rdx
	testq	%rsi, %rsi
	je	.L13
	.p2align 4,,10
	.p2align 3
.L12:
	movq	%rdx, %rcx
	cqto
	idivq	%rcx
	movq	%rcx, %rax
	testq	%rdx, %rdx
	jne	.L12
	movq	%rcx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L13:
	movq	%rdi, %rcx
	movq	%rcx, %rax
	ret
	.cfi_endproc
.LFE12:
	.size	gcd, .-gcd
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lld"
.LC1:
	.string	"%lld%lld%lld%lld"
.LC2:
	.string	"No"
.LC3:
	.string	"Yes"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB13:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	movl	$n, %esi
	movl	$.LC0, %edi
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	call	__isoc99_scanf
	cmpq	$0, n(%rip)
	jle	.L16
	xorl	%ebx, %ebx
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L18:
	movq	16(%rsp), %r8
	cmpq	%r8, %rcx
	jg	.L29
.L20:
	movl	$.LC3, %edi
	addq	$1, %rbx
	call	puts
	cmpq	%rbx, n(%rip)
	jle	.L16
.L23:
	leaq	16(%rsp), %rcx
	movl	$.LC1, %edi
	movq	%rsp, %rsi
	xorl	%eax, %eax
	leaq	24(%rsp), %r8
	leaq	8(%rsp), %rdx
	call	__isoc99_scanf
	movq	(%rsp), %rdi
	movq	8(%rsp), %rcx
	cmpq	%rcx, %rdi
	jl	.L17
	movq	24(%rsp), %rdx
	cmpq	%rdx, %rcx
	jle	.L18
.L17:
	movl	$.LC2, %edi
	addq	$1, %rbx
	call	puts
	cmpq	%rbx, n(%rip)
	jg	.L23
.L16:
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L29:
	.cfi_restore_state
	movq	%rcx, %rax
	movq	%rcx, %rsi
	testq	%rdx, %rdx
	je	.L22
	.p2align 4,,10
	.p2align 3
.L21:
	movq	%rdx, %rsi
	cqto
	idivq	%rsi
	movq	%rsi, %rax
	testq	%rdx, %rdx
	jne	.L21
.L22:
	subq	$1, %rcx
	movq	%rcx, %rax
	cqto
	idivq	%rsi
	movq	%rdi, %rax
	subq	%rdx, %rcx
	cqto
	idivq	%rsi
	addq	%rdx, %rcx
	cmpq	%rcx, %r8
	jl	.L17
	jmp	.L20
	.cfi_endproc
.LFE13:
	.size	main, .-main
	.globl	a
	.bss
	.align 32
	.type	a, @object
	.size	a, 7992
a:
	.zero	7992
	.globl	ans
	.align 8
	.type	ans, @object
	.size	ans, 8
ans:
	.zero	8
	.globl	n
	.align 8
	.type	n, @object
	.size	n, 8
n:
	.zero	8
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
