.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%c"
.LC1:
	.string	"%c : %d\n"
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
	subq	$176, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-160(%rbp), %rdx
	movl	$0, %eax
	movl	$13, %ecx
	movq	%rdx, %rdi
	rep stosq
	movabsq	$7523094288207667809, %rax
	movabsq	$8101815670912281193, %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movabsq	$8680537053616894577, %rax
	movq	%rax, -32(%rbp)
	movw	$31353, -24(%rbp)
.L2:
	leaq	-165(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$-1, %eax
	jne	.L6
	movl	$0, -164(%rbp)
	jmp	.L7
.L6:
	movzbl	-165(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower@PLT
	movb	%al, -165(%rbp)
	movl	$0, -164(%rbp)
.L3:
	movl	-164(%rbp), %eax
	cltq
	movzbl	-48(%rbp,%rax), %edx
	movzbl	-165(%rbp), %eax
	cmpb	%al, %dl
	jne	.L4
	movl	-164(%rbp), %eax
	cltq
	movl	-160(%rbp,%rax,4), %eax
	leal	1(%rax), %edx
	movl	-164(%rbp), %eax
	cltq
	movl	%edx, -160(%rbp,%rax,4)
.L4:
	addl	$1, -164(%rbp)
	cmpl	$25, -164(%rbp)
	jle	.L3
.L7:
	movl	$0, -164(%rbp)
.L8:
	movl	-164(%rbp), %eax
	cltq
	movl	-160(%rbp,%rax,4), %eax
	movl	-164(%rbp), %edx
	leal	97(%rdx), %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -164(%rbp)
	cmpl	$25, -164(%rbp)
	jle	.L8
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
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
