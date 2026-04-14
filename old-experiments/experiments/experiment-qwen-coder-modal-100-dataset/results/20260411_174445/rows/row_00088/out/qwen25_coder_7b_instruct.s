.file	"optimized_inputC.s"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$.LC0, %edi
	xorl	%eax, %eax
	subq	$224, %rsp
	.cfi_def_cfa_offset 240
	leaq	12(%rsp), %rsi
	call	__isoc99_scanf
	movl	12(%rsp), %eax
	testl	%eax, %eax
	je	.L2
	movl	$1, %ecx
.L6:
	movl	%edx, 16(%rsp,%rcx,4)
	leaq	1(%rcx), %rdx
	testl	%eax, %eax
	je	.L13
.L4:
	movq	%rdx, %rcx
.L6:
	movl	%eax, %esi
	shrl	$31, %esi
	leal	(%rax,%rsi), %edx
	andl	$1, %edx
	subl	%esi, %edx
	movl	%eax, %esi
	shrl	$31, %esi
	addl	%esi, %eax
	sarl	%eax
	negl	%eax
	cmpl	$-1, %edx
	jne	.L14
	movl	$1, 16(%rsp,%rcx,4)
	addl	$1, %eax
	leaq	1(%rcx), %rdx
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L14:
	movl	%edx, 16(%rsp,%rcx,4)
	leaq	1(%rcx), %rdx
	testl	%eax, %eax
	je	.L13
.L4:
	movq	%rdx, %rcx
.L6:
	movl	%eax, %esi
	shrl	$31, %esi
	leal	(%rax,%rsi), %edx
	andl	$1, %edx
	subl	%esi, %edx
	movl	%eax, %esi
	shrl	$31, %esi
	addl	%esi, %eax
	sarl	%eax
	negl	%eax
	cmpl	$-1, %edx
	jne	.L14
	movl	$1, 16(%rsp,%rcx,4)
	addl	$1, %eax
	leaq	1(%rcx), %rdx
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L13:
	movl	$0, 12(%rsp)
	movslq	%ecx, %rbx
	.p2align 4,,10
	.p2align 3
.L8:
	movl	16(%rsp,%rbx,4), %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	subq	$1, %rbx
	call	printf
	testl	%ebx, %ebx
	jne	.L8
.L7:
	addq	$224, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L2:
	.cfi_restore_state
	movl	$48, %edi
	call	putchar
	jmp	.L7
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
