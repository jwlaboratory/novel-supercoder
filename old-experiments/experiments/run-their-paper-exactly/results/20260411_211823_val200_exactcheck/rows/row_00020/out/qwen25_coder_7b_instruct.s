.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%ld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	.LC0(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r13, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$456, %rsp
	.cfi_def_cfa_offset 512
	movq	%fs:40, %rax
	movq	%rax, 440(%rsp)
	xorl	%eax, %eax
	leaq	12(%rsp), %rsi
	call	__isoc99_scanf@PLT
	xorl	%eax, %eax
	leaq	16(%rsp), %rdi
	movl	$52, %ecx
	rep stosq
	movl	12(%rsp), %eax
	movl	$0, (%rdi)
	testl	%eax, %eax
	jle	.L5
	leaq	20(%rsp), %rbp
	movl	$1, %r15d
	movl	$-200, %r12d
	movl	$200, %ebx
	movq	%rbp, %r14
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%r14, %rsi
	xorl	%eax, %eax
	movq	%r13, %rdi
	call	__isoc99_scanf@PLT
	movl	(%r14), %eax
	movl	12(%rsp), %ecx
	cmpl	%eax, %ebx
	cmovg	%eax, %ebx
	cmpl	%eax, %r12d
	cmovl	%eax, %r12d
	addl	$1, %r15d
	addq	$4, %r14
	cmpl	%r15d, %ecx
	jge	.L4
	cmpl	%r12d, %ebx
	jg	.L5
	movl	%ecx, %eax
	movl	%ecx, %edi
	leal	-1(%rcx), %r9d
	movl	$100000000, %r8d
	shrl	$2, %eax
	andl	$-4, %edi
	pxor	%xmm5, %xmm5
	subl	$1, %eax
	leal	1(%rdi), %r10d
	salq	$4, %rax
	leaq	36(%rsp,%rax), %rsi
	.p2align 4,,10
	.p2align 3
.L6:
	testl	%ecx, %ecx
	jle	.L20
	cmpl	$2, %r9d
	jbe	.L12
	movd	%ebx, %xmm6
	movq	%rbp, %rax
	pxor	%xmm2, %xmm2
	pshufd	$0, %xmm6, %xmm4
	.p2align 4,,10
	.p2align 3
.L8:
	movdqu	(%rax), %xmm0
	addq	$16, %rax
	psubd	%xmm4, %xmm0
	movdqa	%xmm0, %xmm1
	pmuludq	%xmm0, %xmm1
	psrlq	$32, %xmm0
	pmuludq	%xmm0, %xmm0
	pshufd	$8, %xmm1, %xmm1
	pshufd	$8, %xmm0, %xmm0
	punpckldq	%xmm0, %xmm1
	movdqa	%xmm5, %xmm0
	pcmpgtd	%xmm1, %xmm0
	movdqa	%xmm1, %xmm3
	punpckldq	%xmm0, %xmm3
	punpckhdq	%xmm0, %xmm1
	paddq	%xmm3, %xmm2
	paddq	%xmm1, %xmm2
	cmpq	%rsi, %rax
	jne	.L8
	movdqa	%xmm2, %xmm0
	movl	%r10d, %r11d
	psrldq	$8, %xmm0
	paddq	%xmm0, %xmm2
	movq	%xmm2, %rax
	cmpl	%ecx, %edi
	je	.L9
.L7:
	movslq	%r11d, %rdx
	movl	16(%rsp,%rdx,4), %edx
	subl	%ebx, %edx
	imull	%edx, %edx
	movslq	%edx, %rdx
	addq	%rdx, %rax
	leal	1(%r11), %edx
	cmpl	%edx, %ecx
	jl	.L9
	movslq	%edx, %rdx
	addl	$2, %r11d
	movl	16(%rsp,%rdx,4), %edx
	subl	%ebx, %edx
	imull	%edx, %edx
	movslq	%edx, %rdx
	addq	%rdx, %rax
	cmpl	%r11d, %ecx
	jl	.L9
	movslq	%r11d, %r11
	movl	16(%rsp,%r11,4), %edx
	subl	%ebx, %edx
	imull	%edx, %edx
	movslq	%edx, %rdx
	addq	%rdx, %rax
.L9:
	cmpq	%rax, %r8
	cmovg	%rax, %r8
	testq	%r8, %r8
	je	.L3
	addl	$1, %ebx
	cmpl	%r12d, %ebx
	jle	.L6
.L3:
	xorl	%eax, %eax
	movq	%r8, %rdx
	movl	$1, %edi
	leaq	.LC1(%rip), %rsi
	call	__printf_chk@PLT
	movq	440(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L21
	addq	$456, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L20:
	.cfi_restore_state
	xorl	%r8d, %r8d
	jmp	.L3
.L12:
	movl	$1, %r11d
	xorl	%eax, %eax
	jmp	.L7
.L5:
	movl	$100000000, %r8d
	jmp	.L3
.L21:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23
