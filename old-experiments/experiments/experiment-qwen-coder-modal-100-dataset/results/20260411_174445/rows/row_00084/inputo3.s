	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d"
.LC1:
	.string	"%d %s"
.LC2:
	.string	"%d %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$400040, %edx
	xorl	%esi, %esi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$400064, %rsp
	.cfi_def_cfa_offset 400096
	leaq	16(%rsp), %rdi
	call	memset
	leaq	12(%rsp), %rdx
	leaq	8(%rsp), %rsi
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	__isoc99_scanf
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L7
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L4:
	movl	$-1, 16(%rsp,%rdx,4)
	addl	%eax, %r12d
	addl	$1, %ebp
.L5:
	addl	$1, %ebx
	cmpl	%ebx, 12(%rsp)
	jle	.L2
.L6:
	leaq	1(%rsp), %rdx
	leaq	4(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movslq	4(%rsp), %rdx
	movl	16(%rsp,%rdx,4), %eax
	testl	%eax, %eax
	js	.L5
	cmpb	$87, 1(%rsp)
	jne	.L4
	addl	$1, %eax
	addl	$1, %ebx
	movl	%eax, 16(%rsp,%rdx,4)
	cmpl	%ebx, 12(%rsp)
	jg	.L6
.L2:
	movl	%r12d, %edx
	movl	%ebp, %esi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	printf
	addq	$400064, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	jmp	.L2
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
