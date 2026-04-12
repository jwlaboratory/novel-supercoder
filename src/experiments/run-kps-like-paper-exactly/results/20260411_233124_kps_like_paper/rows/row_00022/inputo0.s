	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d %d %d %d"
.LC2:
	.string	" %d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$528, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-528(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -508(%rbp)
	jmp	.L2
.L7:
	movl	$0, -504(%rbp)
	jmp	.L3
.L6:
	movl	$0, -500(%rbp)
	jmp	.L4
.L5:
	movl	-500(%rbp), %eax
	movslq	%eax, %rsi
	movl	-508(%rbp), %eax
	cltq
	movl	-504(%rbp), %edx
	movslq	%edx, %rcx
	movq	%rax, %rdx
	salq	$4, %rdx
	subq	%rax, %rdx
	leaq	(%rdx,%rdx), %rax
	movq	%rax, %rdx
	movq	%rcx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rsi, %rax
	movl	$0, -496(%rbp,%rax,4)
	addl	$1, -500(%rbp)
.L4:
	cmpl	$9, -500(%rbp)
	jle	.L5
	addl	$1, -504(%rbp)
.L3:
	cmpl	$2, -504(%rbp)
	jle	.L6
	addl	$1, -508(%rbp)
.L2:
	cmpl	$3, -508(%rbp)
	jle	.L7
	movl	$0, -508(%rbp)
	jmp	.L8
.L9:
	leaq	-512(%rbp), %rsi
	leaq	-516(%rbp), %rcx
	leaq	-520(%rbp), %rdx
	leaq	-524(%rbp), %rax
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-524(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	-520(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-516(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rsi
	movslq	%ecx, %rax
	movslq	%edx, %rcx
	movq	%rax, %rdx
	salq	$4, %rdx
	subq	%rax, %rdx
	leaq	(%rdx,%rdx), %rax
	movq	%rax, %rdx
	movq	%rcx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rsi, %rax
	movl	-496(%rbp,%rax,4), %edi
	movl	-512(%rbp), %esi
	movl	-524(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	-520(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-516(%rbp), %eax
	subl	$1, %eax
	addl	%edi, %esi
	movslq	%eax, %rdi
	movslq	%ecx, %rax
	movslq	%edx, %rcx
	movq	%rax, %rdx
	salq	$4, %rdx
	subq	%rax, %rdx
	leaq	(%rdx,%rdx), %rax
	movq	%rax, %rdx
	movq	%rcx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rdi, %rax
	movl	%esi, -496(%rbp,%rax,4)
	addl	$1, -508(%rbp)
.L8:
	movl	-528(%rbp), %eax
	cmpl	%eax, -508(%rbp)
	jl	.L9
	movl	$0, -508(%rbp)
	jmp	.L10
.L18:
	movl	$0, -504(%rbp)
	jmp	.L11
.L14:
	movl	$0, -500(%rbp)
	jmp	.L12
.L13:
	movl	-500(%rbp), %eax
	movslq	%eax, %rsi
	movl	-508(%rbp), %eax
	cltq
	movl	-504(%rbp), %edx
	movslq	%edx, %rcx
	movq	%rax, %rdx
	salq	$4, %rdx
	subq	%rax, %rdx
	leaq	(%rdx,%rdx), %rax
	movq	%rax, %rdx
	movq	%rcx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rsi, %rax
	movl	-496(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -500(%rbp)
.L12:
	cmpl	$9, -500(%rbp)
	jle	.L13
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -504(%rbp)
.L11:
	cmpl	$2, -504(%rbp)
	jle	.L14
	cmpl	$2, -508(%rbp)
	jg	.L15
	movl	$0, -500(%rbp)
	jmp	.L16
.L17:
	movl	$35, %edi
	call	putchar@PLT
	addl	$1, -500(%rbp)
.L16:
	cmpl	$19, -500(%rbp)
	jle	.L17
	movl	$10, %edi
	call	putchar@PLT
.L15:
	addl	$1, -508(%rbp)
.L10:
	cmpl	$3, -508(%rbp)
	jle	.L18
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L20
	call	__stack_chk_fail@PLT
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
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
