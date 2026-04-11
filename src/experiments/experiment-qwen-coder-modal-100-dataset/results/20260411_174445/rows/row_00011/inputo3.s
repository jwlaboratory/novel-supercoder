	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d %d"
.LC2:
	.string	"%d:"
.LC3:
	.string	"0%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	$720, %ecx
	xorl	%eax, %eax
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movl	$2, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$5784, %rsp
	.cfi_def_cfa_offset 5824
	leaq	16(%rsp), %r12
	movq	%r12, %rdi
	rep stosq
.L4:
	leaq	4(%rsp), %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	4(%rsp), %esi
	testl	%esi, %esi
	jle	.L2
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L3:
	leaq	12(%rsp), %rdx
	leaq	8(%rsp), %rsi
	xorl	%eax, %eax
	addl	$1, %ebx
	movl	$.LC1, %edi
	call	__isoc99_scanf
	movslq	8(%rsp), %rdx
	movslq	12(%rsp), %rcx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	leaq	(%rcx,%rax,4), %rax
	movl	$1, 16(%rsp,%rax,4)
	cmpl	%ebx, 4(%rsp)
	jg	.L3
.L2:
	cmpl	$1, %ebp
	je	.L24
	movl	$1, %ebp
	jmp	.L4
.L24:
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L5:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L14:
	movl	(%r12,%rbx,4), %ecx
	testl	%ecx, %ecx
	jle	.L6
	movl	%ebx, %ebp
	testl	%eax, %eax
	jne	.L10
.L7:
	movl	%r13d, %esi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	printf
	movl	%ebp, %esi
	cmpl	$9, %ebx
	jle	.L25
	movl	$.LC0, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	printf
	cmpq	$60, %rbx
	je	.L16
	movl	(%r12,%rbx,4), %eax
	movl	%ebx, %ebp
	testl	%eax, %eax
	jle	.L26
.L10:
	movl	$32, %edi
	call	putchar
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L26:
	movl	$1, %eax
.L6:
	addq	$1, %rbx
	cmpq	$60, %rbx
	jne	.L14
.L12:
	addl	$1, %r13d
	addq	$240, %r12
	cmpl	$24, %r13d
	jne	.L5
	movl	$10, %edi
	call	putchar
	addq	$5784, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L25:
	.cfi_restore_state
	movl	$.LC3, %edi
	xorl	%eax, %eax
	call	printf
	movl	4(%r12,%rbx,4), %edx
	leaq	1(%rbx), %rax
	testl	%edx, %edx
	jle	.L9
	movl	%eax, %ebp
	movq	%rax, %rbx
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L9:
	addq	$2, %rbx
	movl	$1, %eax
	jmp	.L14
.L16:
	movl	$1, %eax
	jmp	.L12
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
