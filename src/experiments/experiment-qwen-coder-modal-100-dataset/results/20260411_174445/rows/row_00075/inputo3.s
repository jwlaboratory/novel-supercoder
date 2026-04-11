	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d%d%d"
.LC1:
	.string	"Bob"
.LC2:
	.string	"Alice"
.LC3:
	.string	"Draw"
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
	leaq	12(%rsp), %r8
	leaq	8(%rsp), %rcx
	movq	%rsp, %rsi
	leaq	4(%rsp), %rdx
	call	__isoc99_scanf
	movl	8(%rsp), %eax
	cmpl	$-1, %eax
	je	.L2
	movl	12(%rsp), %edx
	cmpl	$-1, %edx
	je	.L2
	cmpl	%edx, %eax
	jg	.L7
	jl	.L8
.L6:
	movl	$.LC3, %edi
	call	puts
.L5:
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L2:
	.cfi_restore_state
	movl	4(%rsp), %eax
	cmpl	%eax, (%rsp)
	jg	.L8
	jge	.L6
.L7:
	movl	$.LC2, %edi
	call	puts
	jmp	.L5
.L8:
	movl	$.LC1, %edi
	call	puts
	jmp	.L5
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
