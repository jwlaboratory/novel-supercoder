```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"0"
.LC3:
	.string	"%ld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	.LC0(%rip), %rdi
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-12(%rbp), %rsi
	call	__isoc99_scanf@PLT
	movslq	-12(%rbp), %rdi
	movq	%rsp, %rcx
	leal	1(%rdi), %eax
	cltq
	leaq	15(,%rax,8), %rax
	movq	%rax, %rdx
	andq	$-4096, %rax
	subq	%rax, %rcx
	andq	$-16, %rdx
	cmpq	%rcx, %rsp
	je	.L3
.L22:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rcx, %rsp
	jne	.L22
.L3:
	andl	$4095, %edx
	subq	%rdx, %rsp
	testq	%rdx, %rdx
	jne	.L23
.L4:
	leaq	7(%rsp), %r10
	leal	-1(%rdi), %edx
	movq	%r10, %rax
	andq	$-8, %r10
	shrq	$3, %rax
	cmpl	$1, %edx
	jbe	.L24
	movdqa	.LC2(%rip), %xmm0
	movq	$0, 16(,%rax,8)
	movups	%xmm0, 0(,%rax,8)
	cmpl	$2, %edi
	jle	.L11
	movq	$1, 24(,%rax,8)
	cmpl	$3, %edi
	je	.L11
	leal	-4(%rdi), %eax
	leaq	8(%r10), %rsi
	movabsq	$-8543223828751151131, %r9
	leaq	16(%r10,%rax,8), %r8
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L25:
	movq	%rcx, %rax
	addq	$8, %rsi
	imulq	%r9
	movq	%rcx, %rax
	sarq	$63, %rax
	addq	%rcx, %rdx
	sarq	$29, %rdx
	subq	%rax, %rdx
	imulq	$1000000007, %rdx, %rdx
	subq	%rdx, %rcx
	movq	%rcx, 16(%rsi)
	cmpq	%rsi, %r8
	je	.L11
.L10:
	movq	16(%rsi), %rcx
	addq	(%rsi), %rcx
	cmpq	$1000000006, %rcx
	jg	.L25
	movq	%rcx, 24(%rsi)
	addq	$8, %rsi
	cmpq	%rsi, %r8
	jne	.L10
.L11:
	movq	(%r10,%rdi,8), %rdx
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L6:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L26
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	xorl	%eax, %eax
	ret
.L24:
	.cfi_restore_state
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	jmp	.L6
.L23:
	orq	$0, -8(%rsp,%rdx)
	jmp	.L4
.L26:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.quad	1
	.quad	0
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
```