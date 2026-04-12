.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s"
.LC1:
	.string	"%c%d%c\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	subq	$120, %rsp
	.cfi_def_cfa_offset 128
	movl	$.LC0, %edi
	xorl	%eax, %eax
	movq	%rsp, %rsi
	call	__isoc99_scanf
	movq	%rsp, %rdi
	call	strlen
	movsbl	(%rsp), %esi
	movl	$.LC1, %edi
	leal	-1(%rax), %edx
	movslq	%edx, %rdx
	movsbl	(%rsp,%rdx), %ecx
	leal	-2(%rax), %edx
	xorl	%eax, %eax
	call	printf
	xorl	%eax, %eax
	addq	$120, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
