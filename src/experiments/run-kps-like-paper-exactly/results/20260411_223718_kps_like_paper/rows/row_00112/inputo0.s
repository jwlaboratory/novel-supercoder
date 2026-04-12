	.file	"inputC.c"
	.text
	.globl	X
	.bss
	.align 4
	.type	X, @object
	.size	X, 4
X:
	.zero	4
	.section	.rodata
.LC0:
	.string	"%dx%d=%d\n"
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
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	jmp	.L2
.L5:
	movl	$0, -4(%rbp)
	jmp	.L3
.L4:
	addl	$1, -4(%rbp)
	movl	X(%rip), %eax
	imull	-4(%rbp), %eax
	movl	%eax, %ecx
	movl	X(%rip), %eax
	movl	-4(%rbp), %edx
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L3:
	cmpl	$8, -4(%rbp)
	jle	.L4
.L2:
	movl	X(%rip), %eax
	addl	$1, %eax
	movl	%eax, X(%rip)
	movl	X(%rip), %eax
	cmpl	$9, %eax
	jle	.L5
	movl	$0, %edi
	call	exit@PLT
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
