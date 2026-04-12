.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s %s"
.LC1:
	.string	"%d %d"
.LC2:
	.string	"%s"
.LC3:
	.string	"%d %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	leaq	.LC0(%rip), %rdi
	leaq	16(%rsp), %rsi
	leaq	32(%rsp), %rdx
	movq	%rsi, %r12
	movq	%rdx, %r13
	movq	%r13, %rdx
	movq	%r12, %rsi
	call	__isoc99_scanf@PLT
	leaq	4(%rsp), %rdx
	movq	%rsp, %rsi
	movq	%r13, %rdi
	call	__isoc99_scanf@PLT
	leaq	.LC2(%rip), %rdi
	movq	%r12, %rsi
	call	__isoc99_scanf@PLT
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2
	subl	$1, 16(%rsp)
.L3:
	movl	4(%rsp), %ecx
	movl	(%rsp), %edx
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	jmp	.L4
.L2:
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L3
	subl	$1, 4(%rsp)
.L4:
	movq	%rbp, %rsp
	.cfi_def_cfa_register 7
	popq	%rbp
	.cfi_def_cfa_register 6
	ret
	.cfi_endproc
.LFE25:
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
