	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s%*c"
.LC1:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	subq	$100024, %rsp
	.cfi_def_cfa_offset 100032
	movl	$.LC0, %edi
	xorl	%eax, %eax
	movq	%rsp, %rsi
	call	__isoc99_scanf
	movq	%rsp, %rdi
	call	strlen
	testl	%eax, %eax
	je	.L7
	xorl	%edx, %edx
	xorl	%esi, %esi
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L10:
	cmpb	$103, %cl
	sete	%cl
	addq	$1, %rdx
	movzbl	%cl, %ecx
	addl	%ecx, %esi
	cmpq	%rdx, %rax
	je	.L2
.L5:
	movzbl	(%rsp,%rdx), %ecx
	testb	$1, %dl
	jne	.L10
	cmpb	$112, %cl
	sete	%cl
	addq	$1, %rdx
	movzbl	%cl, %ecx
	subl	%ecx, %esi
	cmpq	%rdx, %rax
	jne	.L5
.L2:
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	printf
	xorl	%eax, %eax
	addq	$100024, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	movl	%eax, %esi
	jmp	.L2
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
