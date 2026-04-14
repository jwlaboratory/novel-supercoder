.file	"optimized_inputC.s"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lld"
.LC1:
	.string	"%d\n"
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
	leaq	8(%rsp), %rsi
	call	__isoc99_scanf
	movq	8(%rsp), %rax
	xorl	%esi, %esi
	testq	%rax, %rax
	je	.L2
	bsrq	%rax, %rax
	incq	%rax
	negq	%rax
	addq	$64, %rax
.L2:
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	printf
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
