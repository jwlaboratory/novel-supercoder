.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%s"
.LC1:
	.string	"dreameraser"
.LC2:
	.string	"dreamerase"
.LC3:
	.string	"eraser"
.LC4:
	.string	"dreamer"
.LC5:
	.string	"dream"
.LC6:
	.string	"erase"
.LC7:
	.string	"NO"
.LC8:
	.string	"YES"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1728, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -100016(%rbp)
	movq	$0, -100008(%rbp)
	leaq	-100000(%rbp), %rax
	movl	$99985, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -100028(%rbp)
	leaq	-100016(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-100016(%rbp), %rax
	movq	%rax, -100024(%rbp)
.L2:
	movq	-100024(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L10
.L9:
	cmpl	$0, -100028(%rbp)
	jne	.L11
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L11:
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0"
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
