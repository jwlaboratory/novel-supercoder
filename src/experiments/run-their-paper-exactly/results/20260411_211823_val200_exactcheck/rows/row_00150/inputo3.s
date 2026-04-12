.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lld%lld%lld"
.LC1:
	.string	"Yes"
.LC2:
	.string	"No"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB53:
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
	call	__isoc99_scanf@PLT
	movq	(%rsp), %rdx
	movq	16(%rsp), %rax
	movq	8(%rsp), %rcx
	subq	%rdx, %rax
	subq	%rcx, %rax
	testq	%rax, %rax
	jle	.L2
	imulq	%rcx, %rdx
	imulq	%rax, %rax
	salq	$2, %rdx
	cmpq	%rax, %rdx
	jl	.L7
.L2:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
.L3:
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L8
	xorl	%eax, %eax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	jmp	.L3
.L8:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE53:
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