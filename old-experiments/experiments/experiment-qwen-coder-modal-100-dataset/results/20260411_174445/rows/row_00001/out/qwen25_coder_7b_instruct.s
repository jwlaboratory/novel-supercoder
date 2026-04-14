.file	"optimized_inputC.s"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%dx%d=%d\n"
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
	subq	$16, %rsp
	movl	$1, %edi
	movl	$1, %esi
.L2:
	movl	%edi, %eax
	imul	%esi, %eax
	movl	%esi, %edx
	movl	%edi, %ecx
	movl	$.LC0, %edi
	movl	$1, %eax
	addl	%esi, %eax
	addl	%edi, %eax
	addl	$1, %eax
	call	printf
	incq	%rdi
	cmpq	$10, %rdi
	jne	.L2
	incq	%rsi
	cmpq	$10, %rsi
	jne	.L2
	movl	$0, %eax
 leave
	.cfi_def_cfa_register 7
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
