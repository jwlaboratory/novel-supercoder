.file	"optimized_inputC.s"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%s"
.LC2:
	.string	"HIT"
.LC3:
	.string	"HOMERUN"
.LC4:
	.string	"OUT"
.LC5:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	.cfi_def_cfa_offset 40
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	(%rsp), %eax
	testl	%eax, %eax
	je	.L23
.L2:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
.L16:
	xorl	%eax, %eax
	leaq	8(%rsp), %rsi
	movl	$.LC1, %edi
	call	__isoc99_scanf
	cmpl	$5523784, 8(%rsp)
	je	.L28
	movl	$.LC3, %esi
	leaq	8(%rsp), %rdi
	call	strcmp
	testl	%eax, %eax
	je	.L29
	cmpl	$5526863, 8(%rsp)
	jne	.L16
	addl	$1, %r14d
	cmpl	$3, %r14d
	jne	.L16
	xorl	%eax, %eax
	movl	%ebx, %esi
	movl	$.LC5, %edi
	call	printf
	subl	$1, (%rsp)
	jne	.L2
.L23:
	movq	%rbp, %rsp
	.cfi_def_cfa_register 7
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L28:
	leal	1(%r13), %eax
	cmpl	$1, %eax
	jle	.L30
	addl	$1, %ecx
.L6:
	cmpl	$1, %ecx
	jle	.L7
	addl	$1, %r12d
	subl	$1, %ecx
.L7:
	cmpl	$1, %r12d
	jle	.L16
	addl	$1, %ebx
	subl	$1, %r12d
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L29:
	cmpl	$1, %r13d
	jne	.L10
	addl	$1, %ebx
	xorl	%r13d, %r13d
.L10:
	cmpl	$1, %ecx
	jne	.L11
	addl	$1, %ebx
	xorl	%ecx, %ecx
.L11:
	cmpl	$1, %r12d
	jne	.L12
	addl	$1, %ebx
	xorl	%r12d, %r12d
.L12:
	addl	$1, %ebx
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L30:
	movl	%eax, %r13d
	jmp	.L6
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
