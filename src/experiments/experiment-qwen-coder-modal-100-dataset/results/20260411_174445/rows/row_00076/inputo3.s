	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d %d"
.LC1:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$.LC0, %edi
	xorl	%eax, %eax
	leaq	12(%rsp), %rcx
	leaq	8(%rsp), %rdx
	leaq	4(%rsp), %rsi
	call	__isoc99_scanf
	movl	12(%rsp), %eax
	movl	4(%rsp), %edx
	movl	8(%rsp), %ecx
	cmpl	%edx, %eax
	jl	.L2
	cmpl	%ecx, %eax
	jge	.L10
.L3:
	imull	$10, %ecx, %esi
	movl	$.LC1, %edi
	addl	%eax, %esi
	xorl	%eax, %eax
	addl	%edx, %esi
	call	printf
.L6:
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L2:
	.cfi_restore_state
	cmpl	%ecx, %edx
	jle	.L3
	imull	$10, %edx, %esi
	movl	$.LC1, %edi
	addl	%eax, %esi
	xorl	%eax, %eax
	addl	%ecx, %esi
	call	printf
	jmp	.L6
.L10:
	imull	$10, %eax, %esi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addl	%ecx, %esi
	addl	%edx, %esi
	call	printf
	jmp	.L6
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
