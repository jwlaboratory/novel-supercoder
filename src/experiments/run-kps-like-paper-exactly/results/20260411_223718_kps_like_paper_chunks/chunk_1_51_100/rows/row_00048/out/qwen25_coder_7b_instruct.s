.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"1x%d=%d\n"
.LC1:
	.string	"2x%d=%d\n"
.LC2:
	.string	"3x%d=%d\n"
.LC3:
	.string	"4x%d=%d\n"
.LC4:
	.string	"5x%d=%d\n"
.LC5:
	.string	"6x%d=%d\n"
.LC6:
	.string	"7x%d=%d\n"
.LC7:
	.string	"8x%d=%d\n"
.LC8:
	.string	"9x%d=%d\n"
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
	movl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	$9, %eax
	jg	.L10
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
	jmp	.L2
.L10:
	movl	$2, -4(%rbp)
.L3:
	movl	-4(%rbp), %eax
	cmpl	$9, %eax
	jg	.L18
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
	jmp	.L3
.L18:
	movl	$3, -4(%rbp)
.L4:
	movl	-4(%rbp), %eax
	cmpl	$9, %eax
	jg	.L26
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
	jmp	.L4
.L26:
	movl	$4, -4(%rbp)
.L5:
	movl	-4(%rbp), %eax
	cmpl	$9, %eax
	jg	.L34
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
	jmp	.L5
.L34:
	movl	$5, -4(%rbp)
.L6:
	movl	-4(%rbp), %eax
	cmpl	$9, %eax
	jg	.L42
	movl	%eax, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
	jmp	.L6
.L42:
	movl	$6, -4(%rbp)
.L7:
	movl	-4(%rbp), %eax
	cmpl	$9, %eax
	jg	.L50
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
	jmp	.L7
.L50:
	movl	$7, -4(%rbp)
.L8:
	movl	-4(%rbp), %eax
	cmpl	$9, %eax
	jg	.L58
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
	jmp	.L8
.L58:
	movl	$8, -4(%rbp)
.L9:
	movl	-4(%rbp), %eax
	cmpl	$9, %eax
	jg	.L66
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
	jmp	.L9
.L66:
	movl	$9, -4(%rbp)
.L10:
	movl	-4(%rbp), %eax
	cmpl	$9, %eax
	jg	.L74
	movl	%eax, %esi
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
	jmp	.L10
.L74:
	movl	$0, %eax
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
