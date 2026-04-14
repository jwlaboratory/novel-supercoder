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
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	.LC0(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%r13, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$456, %rsp
	.cfi_def_cfa_offset 496
	movq	%fs:40, %rax
	movq	%rax, 440(%rsp)
	xorl	%eax, %eax
	leaq	12(%rsp), %rsi
	leaq	16(%rsp), %rbx
	movq	%rbx, %r12
	call	__isoc99_scanf@PLT
	movl	12(%rsp), %r8d
	testl	%r8d, %r8d
	jle	.L2
.L3:
	movq	%r12, %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	addl	$1, %ebp
	call	__isoc99_scanf@PLT
	movl	12(%rsp), %r8d
	addq	$4, %r12
	cmpl	%ebp, %r8d
	jg	.L3
.L2:
	movl	%r8d, %eax
	movl	%r8d, %r10d
	leal	-1(%r8), %r11d
	movl	$-100, %edx
	shrl	$2, %eax
	andl	$-4, %r10d
	movl	$99999999, %r9d
	subl	$1, %eax
	salq	$4, %rax
	leaq	32(%rsp,%rax), %rsi
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jle	.L10
	cmpl	$2, %r11d
	jbe	.L12
	movd	%edx, %xmm4
	movq	%rbx, %rax
	pxor	%xmm2, %xmm2
	pshufd	$0, %xmm4, %xmm3
	.p2align 4,,10
	.p2align 3
.L6:
	movdqa	(%rax), %xmm0
	addq	$16, %rax
	psubd	%xmm3, %xmm0
	movdqa	%xmm0, %xmm1
	pmuludq	%xmm0, %xmm1
	psrlq	$32, %xmm0
	pmuludq	%xmm0, %xmm0
	pshufd	$8, %xmm1, %xmm1
	pshufd	$8, %xmm0, %xmm0
	punpckldq	%xmm0, %xmm1
	paddd	%xmm1, %xmm2
	cmpq	%rsi, %rax
	jne	.L6
	movdqa	%xmm2, %xmm0
	movl	%r10d, %ecx
	psrldq	$8, %xmm0
	paddd	%xmm0, %xmm2
	movdqa	%xmm2, %xmm0
	psrldq	$4, %xmm0
	paddd	%xmm0, %xmm2
	movd	%xmm2, %eax
	cmpl	%r10d, %r8d
	je	.L10
.L5:
	movslq	%ecx, %rdi
	movl	16(%rsp,%rdi,4), %edi
	subl	%edx, %edi
	imull	%edi, %edi
	addl	%edi, %eax
	leal	1(%rcx), %edi
	cmpl	%edi, %r8d
	jle	.L10
	movslq	%edi, %rdi
	addl	$2, %ecx
	movl	16(%rsp,%rdi,4), %edi
	subl	%edx, %edi
	imull	%edi, %edi
	addl	%edi, %eax
	cmpl	%ecx, %r8d
	jle	.L10
	movslq	%ecx, %rcx
	movl	16(%rsp,%rcx,4), %ecx
	subl	%edx, %ecx
	imull	%ecx, %ecx
	addl	%ecx, %eax
.L10:
	cmpl	%eax, %r9d
	cmovg	%eax, %r9d
	addl	$1, %edx
	cmpl	$101, %edx
	jne	.L4
	xorl	%eax, %eax
	movl	%r9d, %edx
	movl	$1, %edi
	leaq	.LC1(%rip), %rsi
	call	__printf_chk@PLT
	movq	440(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L19
	addq	$456, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L12:
	.cfi_restore_state
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	.L5
.L19:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
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
