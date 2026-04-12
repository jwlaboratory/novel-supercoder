.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%d %d %d %d"
.LC3:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC1(%rip), %rdi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	leaq	32(%rsp), %rcx
	leaq	28(%rsp), %rdx
	leaq	24(%rsp), %rsi
	leaq	36(%rsp), %r8
	call	__isoc99_scanf@PLT
	movl	24(%rsp), %eax
	testl	%eax, %eax
	js	.L20
	movl	32(%rsp), %esi
	movl	36(%rsp), %r9d
	addl	$1, %eax
	xorl	%r14d, %r14d
	movl	28(%rsp), %r15d
	movl	%eax, 12(%rsp)
	xorl	%r13d, %r13d
	xorl	%edx, %edx
	leal	1(%rsi), %r12d
	movd	%r9d, %xmm7
	movdqa	.LC2(%rip), %xmm5
	movl	%r12d, %edi
	leal	1(%r15), %ebp
	pshufd	$0, %xmm7, %xmm6
	movl	%r12d, %r11d
	shrl	$2, %edi
	andl	$-4, %r11d
	.p2align 4,,10
	.p2align 3
.L3:
	testl	%r15d, %r15d
	js	.L15
	movl	%r14d, %eax
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L18:
	testl	%esi, %esi
	js	.L17
	cmpl	$6, %esi
	jbe	.L21
	movd	%eax, %xmm7
	movdqa	.LC0(%rip), %xmm3
	xorl	%ecx, %ecx
	pxor	%xmm2, %xmm2
	pshufd	$0, %xmm7, %xmm4
	.p2align 4,,10
	.p2align 3
.L5:
	movdqa	%xmm3, %xmm1
	addl	$1, %ecx
	paddd	%xmm5, %xmm3
	movdqa	%xmm1, %xmm0
	pslld	$1, %xmm0
	paddd	%xmm1, %xmm0
	pslld	$3, %xmm0
	paddd	%xmm1, %xmm0
	pslld	$1, %xmm0
	paddd	%xmm4, %xmm0
	pcmpeqd	%xmm6, %xmm0
	psubd	%xmm0, %xmm2
	cmpl	%ecx, %edi
	jne	.L5
	movdqa	%xmm2, %xmm0
	psrldq	$8, %xmm0
	paddd	%xmm0, %xmm2
	movdqa	%xmm2, %xmm0
	psrldq	$4, %xmm0
	paddd	%xmm0, %xmm2
	movd	%xmm2, %ecx
	addl	%ecx, %edx
	movl	%r11d, %ecx
	cmpl	%r11d, %r12d
	je	.L17
.L4:
	imull	$50, %ecx, %r8d
	leal	(%rax,%r8), %ebx
	cmpl	%r9d, %ebx
	sete	%bl
	movzbl	%bl, %ebx
	addl	%ebx, %edx
	leal	1(%rcx), %ebx
	cmpl	%esi, %ebx
	jg	.L17
	leal	50(%r8,%rax), %ebx
	cmpl	%ebx, %r9d
	sete	%bl
	movzbl	%bl, %ebx
	addl	%ebx, %edx
	leal	2(%rcx), %ebx
	cmpl	%esi, %ebx
	jg	.L17
	leal	100(%r8,%rax), %ebx
	cmpl	%ebx, %r9d
	sete	%bl
	movzbl	%bl, %ebx
	addl	%ebx, %edx
	leal	3(%rcx), %ebx
	cmpl	%ebx, %esi
	jl	.L17
	leal	150(%r8,%rax), %ebx
	cmpl	%ebx, %r9d
	sete	%bl
	movzbl	%bl, %ebx
	addl	%ebx, %edx
	leal	4(%rcx), %ebx
	cmpl	%ebx, %esi
	jl	.L17
	leal	200(%r8,%rax), %ebx
	cmpl	%ebx, %r9d
	sete	%bl
	movzbl	%bl, %ebx
	addl	%ebx, %edx
	leal	5(%rcx), %ebx
	cmpl	%ebx, %esi
	jl	.L17
	leal	250(%r8,%rax), %ebx
	cmpl	%ebx, %r9d
	sete	%bl
	addl	$6, %ecx
	movzbl	%bl, %ebx
	addl	%ebx, %edx
	cmpl	%ecx, %esi
	jl	.L17
	leal	300(%r8,%rax), %ecx
	cmpl	%ecx, %r9d
	sete	%cl
	movzbl	%cl, %ecx
	addl	%ecx, %edx
.L17:
	addl	$1, %r10d
	addl	$100, %eax
	cmpl	%ebp, %r10d
	jne	.L18
.L15:
	addl	$1, %r13d
	addl	$500, %r14d
	cmpl	12(%rsp), %r13d
	jne	.L3
.L2:
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L27
	addq	$56, %rsp
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
	popq
