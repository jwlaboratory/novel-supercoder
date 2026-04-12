.file	"optimized_inputC.s"
	.text
	.p2align 4
	.globl	cmp
	.type	cmp, @function
cmp:
.LFB8:
	.cfi_startproc
	movq	(%rsi), %rax
	cmpq	%rax, (%rdi)
	je	.L7
	setl	%al
	movl	$1, %edx
	movzbl	%al, %eax
	negl	%eax
	testl	%eax, %eax
	cmove	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	movq	8(%rdi), %rax
	subl	8(%rsi), %eax
	movl	$1, %edx
	testl	%eax, %eax
	cmove	%edx, %eax
	ret
	.cfi_endproc
.LFE8:
	.size	cmp, .-cmp
	.section	.text.main,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$.LC0, %edi
	xorl	%eax, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	leaq	12(%rsp), %rsi
	call	__isoc99_scanf
	movslq	12(%rsp), %rsi
	testl	%esi, %esi
	jle	.L9
	movl	$art, %ebx
	xorl	%ebp, %ebp
.L10:
	movq	%rbx, %rsi
	leaq	8(%rbx), %rdx
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movslq	12(%rsp), %rsi
	addl	$1, %ebp
	addq	$16, %rbx
	cmpl	%ebp, %esi
	jg	.L10
.L9:
	movl	$cmp, %ecx
	movl	$16, %edx
	movl	$art, %edi
	call	qsort
	movl	12(%rsp), %edx
	movq	art(%rip), %r10
	movq	art+8(%rip), %rcx
	cmpl	$1, %edx
	jle	.L15
	leal	-2(%rdx), %r11d
	movl	$art+16, %eax
	movq	%rcx, %rsi
	salq	$4, %r11
	addq	$art+32, %r11
	jmp	.L14
.L19:
	cmpq	%rdx, %rsi
	movq	%rdx, %rcx
	movq	%r8, %r10
	cmovl	%rdx, %rsi
	addq	$16, %rax
	cmpq	%r11, %rax
	je	.L11
.L14:
	movq	8(%rax), %rdx
	movq	(%rax), %r8
	addq	%rdx, %rcx
	movq	%r8, %r9
	subq	%r10, %r9
	movq	%rcx, %rdi
	subq	%r9, %rdi
	cmpq	%rdx, %rdi
	jl	.L19
	cmpq	%rdi, %rsi
	cmovl	%rdi, %rsi
	addq	$16, %rax
	cmpq	%r11, %rax
	jne	.L14
.L11:
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	printf
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore_state
	movq	%rcx, %rsi
	jmp	.L11
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.globl	art
	.bss
	.align 32
	.type	art, @object
	.size	art, 8000000
art:
	.zero	8000000
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
