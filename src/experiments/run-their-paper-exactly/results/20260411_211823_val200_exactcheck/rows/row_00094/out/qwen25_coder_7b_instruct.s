.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.cfi_def_cfa_offset 24
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	leaq	.LC0(%rip), %rdi
	movl	-4(%rbp), %esi
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L5
	cmpl	$0, -4(%rbp)
	jle	.L10
	leaq	a(%rip), %rdi
	movl	-4(%rbp), %esi
	movl	$0, -8(%rbp)
	movl	$0, -12(%rbp)
.L6:
	movslq	-4(%rbp), %rax
	addl	$1, -8(%rbp)
	addq	$4, %rdi
	cmpl	-8(%rbp), %eax
	jle	.L15
.L16:
	movslq	-4(%rbp), %rax
	movl	(%rdi,%rax,4), %esi
	cmpl	-12(%rbp), %esi
	jge	.L7
	movl	%esi, -12(%rbp)
	movl	-8(%rbp), %edi
.L7:
	addq	$1, %rdi
	cmpq	-4(%rbp), %rdi
	jne	.L16
.L15:
	movl	-12(%rbp), %edi
	addl	$1, %edi
	leaq	.LC1(%rip), %rsi
	movl	$1, %eax
	xorl	%edx, %edx
	call	__printf_chk@PLT
	jmp	.L1
.L5:
	movl	$1, %eax
.L1:
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_register 6
	ret
.L10:
	xorl	%eax, %eax
	jmp	.L1
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.globl	a
	.bss
	.align 32
	.type	a, @object
	.size	a, 458056
a:
	.zero	458056
	.globl	N
	.align 4
	.type	N, @object
	.size	N, 4
N:
	.zero	4
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
