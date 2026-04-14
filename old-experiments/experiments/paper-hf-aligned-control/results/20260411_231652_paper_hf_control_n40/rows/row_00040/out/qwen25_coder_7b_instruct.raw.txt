```assembly
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	-798720(%rsp), %r11
	.cfi_def_cfa 11, 798768
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$1360, %rsp
	.cfi_def_cfa_offset 800128
	leaq	.LC0(%rip), %r14
	movq	%r14, %rdi
	movq	%fs:40, %rax
	movq	%rax, 800072(%rsp)
	xorl	%eax, %eax
	leaq	12(%rsp), %rsi
	leaq	400048(%rsp), %rbx
	call	__isoc99_scanf@PLT
	movl	$400020, %edx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	call	memset@PLT
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L2
	leaq	16(%rsp), %r12
	xorl	%r13d, %r13d
	movq	%r12, %rbp
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rbp, %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	addl	$1, %r13d
	call	__isoc99_scanf@PLT
	movslq	0(%rbp), %rax
	addq	$4, %rbp
	addl	$1, 400048(%rsp,%rax,4)
	movl	12(%rsp), %eax
	cmpl	%r13d, %eax
	jg	.L3
	testl	%eax, %eax
	jle	.L2
	subl	$1, %eax
	leaq	4(%r12), %rcx
	leaq	(%rcx,%rax,4), %rsi
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L12:
	addq	$4, %rcx
.L4:
	movl	(%r12), %eax
	leal	1(%rax), %edx
	subl	$1, %eax
	movl	%edx, (%r12)
	cltq
	movslq	%edx, %rdx
	movq	%rcx, %r12
	addl	$1, 400048(%rsp,%rdx,4)
	addl	$1, 400048(%rsp,%rax,4)
	cmpq	%rsi, %rcx
	jne	.L12
.L2:
	movq	%rbx, %rax
	leaq	800064(%rsp), %rdx
	pxor	%xmm2, %xmm2
	.p2align 4,,10
	.p2align 3
.L5:
	movdqa	%xmm2, %xmm0
	addq	$16, %rax
	pcmpgtd	-16(%rax), %xmm0
	pand	%xmm0, %xmm2
	pandn	-16(%rax), %xmm0
	por	%xmm0, %xmm2
	cmpq	%rdx, %rax
	jne	.L5
	movdqa	%xmm2, %xmm0
	movl	800064(%rsp), %eax
	movl	$1, %edi
	leaq	.LC1(%rip), %rsi
	psrldq	$8, %xmm0
	movdqa	%xmm0, %xmm1
	pcmpgtd	%xmm2, %xmm1
	pand	%xmm1, %xmm0
	pandn	%xmm2, %xmm1
	por	%xmm0, %xmm1
	movdqa	%xmm1, %xmm2
	psrldq	$4, %xmm2
	movdqa	%xmm2, %xmm0
	pcmpgtd	%xmm1, %xmm0
	pand	%xmm0, %xmm2
	pandn	%xmm1, %xmm0
	por	%xmm2, %xmm0
	movd	%xmm0, %edx
	cmpl	%eax, %edx
	cmovl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	800072(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L13
	addq	$800080, %rsp
	.cfi_remember_state
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
.L13:
	.cfi_restore_state
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
```