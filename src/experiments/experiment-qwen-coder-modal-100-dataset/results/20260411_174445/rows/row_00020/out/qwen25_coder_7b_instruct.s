.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s"
.LC3:
	.string	"YES"
.LC4:
	.string	"NO"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	movl	$.LC0, %edi
	movq	%rsp, %rsi
	call	__isoc99_scanf
	movzbl	(%rsp), %esi
	movzbl	1(%rsp), %edx
	movzbl	2(%rsp), %ecx
	movzbl	3(%rsp), %ebx
	movzbl	4(%rsp), %ebp
	movzbl	5(%rsp), %edi
	movzbl	6(%rsp), %esi
	movzbl	7(%rsp), %edx
	movzbl	8(%rsp), %ecx
	movzbl	9(%rsp), %ebx
	movzbl	10(%rsp), %ebp
	movzbl	11(%rsp), %edi
	movzbl	12(%rsp), %esi
	movzbl	13(%rsp), %edx
	movzbl	14(%rsp), %ecx
	movzbl	15(%rsp), %ebx
	movzbl	16(%rsp), %ebp
	movzbl	17(%rsp), %edi
	movzbl	18(%rsp), %esi
	movzbl	19(%rsp), %edx
	movl	%esi, %eax
	movl	%edx, %ecx
	movl	%ecx, %edx
	addl	%ebx, %eax
	addl	%ebp, %edx
	addl	%edi, %ecx
	addl	%esi, %edx
	shrl	$2, %eax
	shrl	$2, %ecx
	shrl	$2, %edx
	addl	%eax, %ecx
	addl	%ecx, %edx
	cmpl	$7, %edx
	jle	.L13
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L9
.L13:
	movl	$.LC3, %edi
	xorl	%eax, %eax
	call	printf
.L9:
	xorl	%eax, %eax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
