	.file	"inputC.c"
	.text
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
	subq	$48, %rsp
	movl	$1, -40(%rbp)
	movl	$1, -36(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L2
.L3:
	movl	-36(%rbp), %edx
	movl	-40(%rbp), %eax
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -40(%rbp)
	addl	$1, -36(%rbp)
	addl	$1, -44(%rbp)
.L2:
	cmpl	$8, -44(%rbp)
	jle	.L3
	movl	$1, -40(%rbp)
	movl	$2, -32(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L4
.L5:
	movl	-32(%rbp), %edx
	movl	-40(%rbp), %eax
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	$2, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -40(%rbp)
	addl	$2, -32(%rbp)
	addl	$1, -44(%rbp)
.L4:
	cmpl	$8, -44(%rbp)
	jle	.L5
	movl	$1, -40(%rbp)
	movl	$3, -28(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L6
.L7:
	movl	-28(%rbp), %edx
	movl	-40(%rbp), %eax
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	$3, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -40(%rbp)
	addl	$3, -28(%rbp)
	addl	$1, -44(%rbp)
.L6:
	cmpl	$8, -44(%rbp)
	jle	.L7
	movl	$1, -40(%rbp)
	movl	$4, -24(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L8
.L9:
	movl	-24(%rbp), %edx
	movl	-40(%rbp), %eax
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	$4, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -40(%rbp)
	addl	$4, -24(%rbp)
	addl	$1, -44(%rbp)
.L8:
	cmpl	$8, -44(%rbp)
	jle	.L9
	movl	$1, -40(%rbp)
	movl	$5, -20(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L10
.L11:
	movl	-20(%rbp), %edx
	movl	-40(%rbp), %eax
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	$5, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -40(%rbp)
	addl	$5, -20(%rbp)
	addl	$1, -44(%rbp)
.L10:
	cmpl	$8, -44(%rbp)
	jle	.L11
	movl	$1, -40(%rbp)
	movl	$6, -16(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L12
.L13:
	movl	-16(%rbp), %edx
	movl	-40(%rbp), %eax
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	$6, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -40(%rbp)
	addl	$6, -16(%rbp)
	addl	$1, -44(%rbp)
.L12:
	cmpl	$8, -44(%rbp)
	jle	.L13
	movl	$1, -40(%rbp)
	movl	$7, -12(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L14
.L15:
	movl	-12(%rbp), %edx
	movl	-40(%rbp), %eax
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	$7, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -40(%rbp)
	addl	$7, -12(%rbp)
	addl	$1, -44(%rbp)
.L14:
	cmpl	$8, -44(%rbp)
	jle	.L15
	movl	$1, -40(%rbp)
	movl	$8, -8(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L16
.L17:
	movl	-8(%rbp), %edx
	movl	-40(%rbp), %eax
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	$8, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -40(%rbp)
	addl	$8, -8(%rbp)
	addl	$1, -44(%rbp)
.L16:
	cmpl	$8, -44(%rbp)
	jle	.L17
	movl	$1, -40(%rbp)
	movl	$9, -4(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L18
.L19:
	movl	-4(%rbp), %edx
	movl	-40(%rbp), %eax
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	$9, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -40(%rbp)
	addl	$9, -4(%rbp)
	addl	$1, -44(%rbp)
.L18:
	cmpl	$8, -44(%rbp)
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
