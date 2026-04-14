.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	.cfi_def_cfa_offset 40
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %r15
	movq	%rsp, %r14
.L11:
	movq	%r15, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L2
	jle	.L4
	xorl	%r12d, %r12d
.L3:
	movl	4(%rsp), %eax
	movl	%r12d, %ebp
	xorl	%ebx, %ebx
	andl	$1, %ebp
	testl	%eax, %eax
	jle	.L8
.L9:
	leal	(%rbx,%rbp), %eax
	testb	$1, %al
	jne	.L6
	movl	$35, %edi
	addl	$1, %ebx
	call	putchar@PLT
	cmpl	%ebx, 4(%rsp)
	jg	.L9
.L8:
	movl	$10, %edi
	addl	$1, %r12d
	call	putchar@PLT
	cmpl	%r12d, (%rsp)
	jg	.L3
	jmp	.L4
.L6:
	movl	$46, %edi
	addl	$1, %ebx
	call	putchar@PLT
	cmpl	%ebx, 4(%rsp)
	jg	.L9
	jmp	.L8
.L4:
	movl	$10, %edi
	call	putchar@PLT
	jmp	.L11
.L2:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L18
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_register 6
	.cfi_def_cfa_offset 8
	ret
.L18:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
