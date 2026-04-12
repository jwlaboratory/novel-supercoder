.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lld %lld %lld"
.LC1:
	.string	"%lld\n"
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
	leaq	16(%rsp), %rcx
	leaq	8(%rsp), %rdx
	movq	%rsp, %rsi
	movq	$0, (%rsp)
	movq	$0, 8(%rsp)
	movq	$0, 16(%rsp)
	call	__isoc99_scanf@PLT
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	cmpq	%rdx, %rcx
	jle	.L2
	movq	%rcx, %rax
	movq	%rdx, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%rdx, %rcx
	movq	%rax, %rdx
.L2:
	movq	%rdx, %rax
	subq	%rcx, %rax
	testb	$1, %al
	je	.L8
	movq	(%rsp), %rsi
	leaq	-1(%rdx,%rcx), %rax
	cmpq	%rsi, %rax
	jg	.L5
.L8:
	cqto
	movl	$2, %ecx
	movl	$1, %edi
	idivq	%rcx
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L10
	xorl	%eax, %eax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	movq	%rsi, %rax
	subq	%rcx, %rax
	addq	%rsi, %rax
	subq	%rdx, %rax
	addq	$1, %rax
	jmp	.L8
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
