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
	jmp	.L2
.L3:
	movl	-4(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L2:
	cmpl	$9, -4(%rbp)
	jle	.L3
	movl	$1, -4(%rbp)
	jmp	.L4
.L5:
	movl	-4(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L4:
	cmpl	$9, -4(%rbp)
	jle	.L5
	movl	$1, -4(%rbp)
	jmp	.L6
.L7:
	movl	-4(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%eax, %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L6:
	cmpl	$9, -4(%rbp)
	jle	.L7
	movl	$1, -4(%rbp)
	jmp	.L8
.L9:
	movl	-4(%rbp), %eax
	leal	0(,%rax,4), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L8:
	cmpl	$9, -4(%rbp)
	jle	.L9
	movl	$1, -4(%rbp)
	jmp	.L10
.L11:
	movl	-4(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L10:
	cmpl	$9, -4(%rbp)
	jle	.L11
	movl	$1, -4(%rbp)
	jmp	.L12
.L13:
	movl	-4(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L12:
	cmpl	$9, -4(%rbp)
	jle	.L13
	movl	$1, -4(%rbp)
	jmp	.L14
.L15:
	movl	-4(%rbp), %ecx
	movl	%ecx, %eax
	sall	$3, %eax
	subl	%ecx, %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L14:
	cmpl	$9, -4(%rbp)
	jle	.L15
	movl	$1, -4(%rbp)
	jmp	.L16
.L17:
	movl	-4(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L16:
	cmpl	$9, -4(%rbp)
	jle	.L17
	movl	$1, -4(%rbp)
	jmp	.L18
.L19:
	movl	-4(%rbp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%eax, %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L18:
	cmpl	$9, -4(%rbp)
	jle	.L19
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
