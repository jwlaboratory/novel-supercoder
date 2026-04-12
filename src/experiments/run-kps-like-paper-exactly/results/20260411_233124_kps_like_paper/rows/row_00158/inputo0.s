	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d\n"
.LC1:
	.string	"%d %c %d"
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
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	nop
	jmp	.L3
.L11:
	movzbl	-17(%rbp), %eax
	movsbl	%al, %eax
	subl	$42, %eax
	cmpl	$21, %eax
	ja	.L3
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L5(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L5(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L5:
	.long	.L9-.L5
	.long	.L8-.L5
	.long	.L3-.L5
	.long	.L7-.L5
	.long	.L3-.L5
	.long	.L6-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L4-.L5
	.text
.L8:
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L3
.L7:
	movl	-16(%rbp), %eax
	movl	-12(%rbp), %edx
	subl	%edx, %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L3
.L9:
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	imull	%edx, %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L3
.L6:
	movl	-16(%rbp), %eax
	movl	-12(%rbp), %ecx
	cltd
	idivl	%ecx
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L3
.L4:
	movl	$0, %eax
	jmp	.L12
.L3:
	leaq	-12(%rbp), %rcx
	leaq	-17(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movzbl	-17(%rbp), %eax
	cmpb	$63, %al
	jne	.L11
	movl	$0, %eax
.L12:
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
