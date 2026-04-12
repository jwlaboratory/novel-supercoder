.file	"optimized_inputC.s"
	.text
	.p2align 4
	.type	max_score.part.0, @function
max_score.part.0:
.LFB11:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movslq	%edi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movslq	%esi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	as(,%r15,4), %r13d
	movl	c(%rip), %r8d
	orl	%r14d, %r13d
	testl	%r8d, %r8d
	jle	.L2
	addl	$1, %edi
	movl	$1, %ebp
	movl	%r13d, %esi
	movslq	%edi, %rcx
	andl	bs-4(,%rbp,4), %esi
	je	.L17
.L31:
	movl	%esi, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L5:
	movl	%eax, %edx
	andl	$1, %edx
	cmpl	$1, %edx
	sbbl	$-1, %ebx
	sarl	%eax
	jne	.L5
	cmpl	n(%rip), %edi
	jge	.L6
.L32:
	xorl	%r13d, %esi
	movq	%rcx, %rax
	movslq	%esi, %rdx
	salq	$16, %rax
	addq	%rdx, %rax
	movl	mscache(,%rax,4), %eax
	testl	%eax, %eax
	jns	.L30
	movq	%rcx, 8(%rsp)
	movl	%edi, 4(%rsp)
	call	max_score.part.0
	movl	c(%rip), %r8d
	movl	4(%rsp), %edi
	movq	8(%rsp), %rcx
	addl	%ebx, %eax
.L8:
	cmpl	%eax, %r12d
	cmovl	%eax, %r12d
	cmpl	%ebp, %r8d
	jle	.L2
	addq	$1, %rbp
	movl	%r13d, %esi
	andl	bs-4(,%rbp,4), %esi
	jne	.L31
.L17:
	xorl	%ebx, %ebx
	cmpl	n(%rip), %edi
	jl	.L32
	.p2align 4,,10
	.p2align 3
.L6:
	cmpl	%ebx, %r12d
	cmovl	%ebx, %r12d
	cmpl	%ebp, %r8d
	jle	.L2
.L12:
	movl	%r13d, %eax
	xorl	%edx, %edx
	andl	bs(,%rbp,4), %eax
	je	.L9
	.p2align 4,,10
	.p2align 3
.L11:
	movl	%eax, %ecx
	andl	$1, %ecx
	cmpl	$1, %ecx
	sbbl	$-1, %edx
	sarl	%eax
	jne	.L11
.L9:
	cmpl	%edx, %r12d
	cmovl	%edx, %r12d
	addq	$1, %rbp
	cmpl	%ebp, %r8d
	jg	.L12
.L2:
	salq	$16, %r15
	movl	%r12d, %eax
	addq	%r14, %r15
	movl	%r12d, mscache(,%r15,4)
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
.L30:
	.cfi_restore_state
	addl	%ebx, %eax
	jmp	.L8
	.cfi_endproc
.LFE11:
	.size	max_score.part.0, .-max_score.part.0
	.p2align 4
	.globl	count_bits
	.type	count_bits, @function
count_bits:
.LFB8:
	.cfi_startproc
	xorl	%eax, %eax
	testl	%edi, %edi
	je	.L37
	.p2align 4,,10
	.p2align 3
.L36:
	movl	%edi, %edx
	andl	$1, %edx
	cmpl	$1, %edx
	sbbl	$-1, %eax
	sarl	%edi
	jne	.L36
	ret
	.p2align 4,,10
	.p2align 3
.L37:
	ret
	.cfi_endproc
.LFE8:
	.size	count_bits, .-count_bits
	.p2align 4
	.globl	max_score
	.type	max_score, @function
max_score:
.LFB9:
	.cfi_startproc
	cmpl	%edi, n(%rip)
	jle	.L43
	movslq	%edi, %rax
	movslq	%esi, %rdx
	salq	$16, %rax
	addq	%rdx, %rax
	movl	mscache(,%rax,4), %eax
	testl	%eax, %eax
	jns	.L41
	jmp	max_score.part.0
	.p2align 4,,10
	.p2align 3
.L43:
	xorl	%eax, %eax
.L41:
	ret
	.cfi_endproc
.LFE9:
	.size	max_score, .-max_score
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d"
.LC1:
	.string	"%d"
.LC2:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
.L70:
	movl	$c, %edx
	movl	$n, %esi
	movl	$.LC0, %
