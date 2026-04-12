.file	"optimized_inputC.s"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d %d"
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
	leaq	12(%rsp), %rcx
	leaq	8(%rsp), %rdx
	leaq	4(%rsp), %rsi
	call	__isoc99_scanf
	movl	4(%rsp), %edi
	movl	12(%rsp), %eax
	movl	8(%rsp), %esi
	leal	0(,%rdi,8), %ecx
	cltd
	subl	%edi, %ecx
	addl	%ecx, %esi
	idivl	%esi
	leal	0(,%rax,8), %esi
	movl	%edx, 12(%rsp)
	subl	%eax, %esi
	leal	7(%rsi), %eax
	cmpl	%edx, %ecx
	jle	.L4
	movl	%edx, %eax
	cltd
	idivl	%edi
	testl	%edx, %edx
	jne	.L3
	addl	%esi, %eax
.L4:
	movl	%eax, %esi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	printf
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	leal	1(%rsi,%rax), %eax
	jmp	.L4
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
