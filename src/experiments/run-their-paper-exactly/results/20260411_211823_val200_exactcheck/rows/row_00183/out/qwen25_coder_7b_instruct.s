.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%*d"
.LC1:
	.string	"%c%d "
.LC2:
	.string	"%ld"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	movabsq	$-1000000000000000000, %rax
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	leaq	o(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	.LC1(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	%rax, c(%rip)
	movl	%edi, 12(%rsp)
	leaq	.LC0(%rip), %rdi
	leaq	12(%rsp), %r13
	movq	%rax, b(%rip)
	xorl	%eax, %eax
	call	scanf@PLT
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L9:
	subq	%rdx, %rcx
	movq	c(%rip), %r14
	addq	%rdx, %rbx
	movq	b(%rip), %r15
	movq	a(%rip), %rbx
	addq	%rdx, %r15
	movq	%r15, c(%rip)
	movq	%rbx, a(%rip)
	movq	%r14, b(%rip)
.L2:
	xorl	%eax, %eax
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	scanf@PLT
	cmpl	$-1, %eax
	je	.L8
	imull	$-1431655765, o(%rip), %eax
	movslq	12(%rsp), %rdx
	movq	b(%rip), %rcx
	movq	a(%rip), %rbx
	addl	$715827882, %eax
	cmpl	$1431655764, %eax
	ja	.L9
	leaq	(%rdx,%rcx), %r14
	movq	%r14, c(%rip)
	movq	%rbx, a(%rip)
	movq	%r14, b(%rip)
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L8:
	movq	a(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	addq	$16, %rsp
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	o
	.bss
	.align 4
	.type	o, @object
	.size	o, 4
o:
	.zero	4
	.globl	c
	.align 8
	.type	c, @object
	.size	c, 8
c:
	.zero	8
	.globl	b
	.align 8
	.type	b, @object
	.size	b, 8
b:
	.zero	8
	.globl	a
	.align 8
	.type	a, @object
	.size	a, 8
a:
	.zero	8
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
