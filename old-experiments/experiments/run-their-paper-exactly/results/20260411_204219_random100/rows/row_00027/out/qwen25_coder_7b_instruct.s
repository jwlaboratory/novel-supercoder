.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%ld%ld"
.LC1:
	.string	"%ld"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %rdx
	leaq	8(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movq	8(%rsp), %r8
	movq	16(%rsp), %rax
	cmpq	%rax, %r8
	jge	.L2
	testq	%r8, %r8
	jle	.L6
	movq	$0, 8(%rsp)
	leaq	(%r8,%r8), %rdx
	subq	%rdx, %rax
	movq	%rax, 16(%rsp)
.L3:
	cmpq	$3, %rax
	jg	.L9
.L4:
	xorl	%eax, %eax
	movq	%r8, %rdx
	movl	$1, %edi
	leaq	.LC1(%rip), %rsi
	call	__printf_chk@PLT
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L10
	xorl	%eax, %eax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L2:
	.cfi_restore_state
	movl	$2, %ecx
	cqto
	idivq	%rcx
	movq	%rax, %r8
	jmp	.L4
.L9:
	sarq	$2, %rax
	addq	%rax, %r8
	jmp	.L4
.L6:
	xorl	%r8d, %r8d
	jmp	.L3
.L10:
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
