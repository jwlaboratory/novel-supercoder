.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%ld"
.LC1:
	.string	"%ld\n"
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
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rsi
	movq	$0, (%rsp)
	call	__isoc99_scanf@PLT
	movq	(%rsp), %rcx
	movl	$1, %edx
.L2:
	movq	%rdx, %rbp
	addq	$1, %rdx
	movq	%rbp, %rax
	imulq	%rdx, %rax
	sarq	%rax
	cmpq	%rbp, %rcx
	jg	.L2
	subq	%rcx, %rax
	movl	$1, %r12d
	leaq	.LC1(%rip), %r13
	movq	%rax, %rbx
.L8:
	cmpq	%r12, %rbx
	je	.L5
	movq	%r12, %rdx
	movq	%r13, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$1, %r12
	cmpq	%r12, %rbp
	jge	.L8
.L5:
	leaq	1(%rbx), %r12
	cmpq	%r12, %rbp
	jge	.L8
.L7:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L12
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_register 6
	ret
.L12:
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
