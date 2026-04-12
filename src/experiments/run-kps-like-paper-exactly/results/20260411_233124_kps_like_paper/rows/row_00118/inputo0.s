	.file	"inputC.c"
	.text
	.globl	road
	.bss
	.align 32
	.type	road, @object
	.size	road, 1600
road:
	.zero	1600
	.globl	count
	.align 4
	.type	count, @object
	.size	count, 4
count:
	.zero	4
	.text
	.globl	sroad
	.type	sroad, @function
sroad:
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
	movl	%esi, -8(%rbp)
	movl	-8(%rbp), %eax
	movslq	%eax, %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	road(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$2, %eax
	jne	.L2
	movl	count(%rip), %eax
	addl	$1, %eax
	movl	%eax, count(%rip)
.L2:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	-8(%rbp), %eax
	movslq	%eax, %rcx
	movslq	%edx, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	road(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	je	.L3
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	%edx, %edi
	call	sroad
.L3:
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	road(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	je	.L4
	movl	-8(%rbp), %eax
	leal	1(%rax), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	sroad
.L4:
	movl	count(%rip), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	sroad, .-sroad
	.section	.rodata
.LC0:
	.string	"%d %d"
.LC1:
	.string	"%d"
.LC2:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
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
.L19:
	leaq	-24(%rbp), %rdx
	leaq	-28(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-28(%rbp), %eax
	testl	%eax, %eax
	jne	.L7
	movl	-24(%rbp), %eax
	testl	%eax, %eax
	je	.L23
.L7:
	movl	$0, -16(%rbp)
	jmp	.L9
.L12:
	movl	$0, -12(%rbp)
	jmp	.L10
.L11:
	movl	-12(%rbp), %eax
	movslq	%eax, %rcx
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	road(%rip), %rax
	movl	$0, (%rdx,%rax)
	addl	$1, -12(%rbp)
.L10:
	cmpl	$19, -12(%rbp)
	jle	.L11
	addl	$1, -16(%rbp)
.L9:
	cmpl	$19, -16(%rbp)
	jle	.L12
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$1, -16(%rbp)
	jmp	.L13
.L16:
	movl	$1, -12(%rbp)
	jmp	.L14
.L15:
	movl	-12(%rbp), %eax
	movslq	%eax, %rcx
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	road(%rip), %rax
	movl	$1, (%rdx,%rax)
	addl	$1, -12(%rbp)
.L14:
	movl	-24(%rbp), %eax
	cmpl	%eax, -12(%rbp)
	jle	.L15
	addl	$1, -16(%rbp)
.L13:
	movl	-28(%rbp), %eax
	cmpl	%eax, -16(%rbp)
	jle	.L16
	movl	-28(%rbp), %eax
	movl	-24(%rbp), %edx
	movslq	%edx, %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	road(%rip), %rax
	movl	$2, (%rdx,%rax)
	movl	$0, -16(%rbp)
	jmp	.L17
.L18:
	leaq	-24(%rbp), %rdx
	leaq	-28(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-28(%rbp), %eax
	movl	-24(%rbp), %edx
	movslq	%edx, %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	road(%rip), %rax
	movl	$0, (%rdx,%rax)
	addl	$1, -16(%rbp)
.L17:
	movl	-20(%rbp), %eax
	cmpl	%eax, -16(%rbp)
	jl	.L18
	movl	$0, count(%rip)
	movl	$1, %esi
	movl	$1, %edi
	call	sroad
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L19
.L23:
	nop
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
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
