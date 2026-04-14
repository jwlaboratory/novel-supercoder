.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d"
.LC1:
	.string	"%d %s"
.LC2:
	.string	"kogakubu10gokan"
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
	subq	$1824, %rsp
	.cfi_def_cfa_offset 1872
	movq	%fs:40, %rax
	movq	%rax, 1816(%rsp)
	xorl	%eax, %eax
	leaq	12(%rsp), %rdx
	leaq	8(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movl	8(%rsp), %eax
	testl	%eax, %eax
	jle	.L2
	leaq	224(%rsp), %r12
	xorl	%ebx, %ebx
	leaq	16(%rsp), %r14
	movq	%r12, %rbp
	leaq	.LC1(%rip), %r13
.L3:
	leaq	(%r14,%rbx,4), %rsi
	movq	%rbp, %rdx
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	8(%rsp), %ecx
	addq	$1, %rbx
	addq	$31, %rbp
	cmpl	%ebx, %ecx
	jg	.L3
	movl	12(%rsp), %r9d
	cmpl	16(%rsp), %r9d
	jl	.L2
	testl	%ecx, %ecx
	jle	.L2
	leaq	20(%rsp), %rdx
	xorl	%eax, %eax
.L4:
	movslq	%eax, %r8
	addl	$1, %eax
	cmpl	%r9d, (%rdx)
	setle	%dil
	cmpl	%eax, %ecx
	setg	%sil
	addq	$4, %rdx
	testb	%sil, %dil
	jne	.L4
	movq	%r8, %rax
	salq	$5, %rax
	subq	%r8, %rax
	leaq	(%r12,%rax), %rdi
	call	puts@PLT
	jmp	.L6
.L2:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
.L6:
	movq	1816(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L19
	addq	$1824, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_register 6
	.cfi_def_cfa_offset 0
	ret
.L19:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
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
