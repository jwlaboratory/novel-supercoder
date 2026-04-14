	.file	"inputC.c"
	.text
	.globl	e
	.bss
	.align 4
	.type	e, @object
	.size	e, 4
e:
	.zero	4
	.globl	f
	.align 8
	.type	f, @object
	.size	f, 8
f:
	.zero	8
	.text
	.globl	check
	.type	check, @function
check:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	f(%rip), %rax
	cmpq	%rax, -8(%rbp)
	jg	.L2
	cmpl	$7, -12(%rbp)
	jne	.L2
	movl	e(%rip), %eax
	addl	$1, %eax
	movl	%eax, e(%rip)
.L2:
	movq	f(%rip), %rax
	cmpq	%rax, -8(%rbp)
	jg	.L3
	movl	-12(%rbp), %eax
	orl	$1, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rcx
	movq	%rcx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	addq	%rax, %rax
	addq	$3, %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	check
	movl	-12(%rbp), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rcx
	movq	%rcx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	addq	%rax, %rax
	addq	$5, %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	check
	movl	-12(%rbp), %eax
	orl	$4, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rcx
	movq	%rcx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	addq	%rax, %rax
	addq	$7, %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	check
.L3:
	movl	e(%rip), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	check, .-check
	.section	.rodata
.LC0:
	.string	"%lld"
.LC1:
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
	subq	$16, %rsp
	leaq	f(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, %esi
	movl	$0, %edi
	call	check
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
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
