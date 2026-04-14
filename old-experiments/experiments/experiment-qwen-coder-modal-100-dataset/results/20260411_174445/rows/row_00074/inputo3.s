	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"yes"
.LC1:
	.string	"no"
.LC2:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$.LC2, %edi
	xorl	%eax, %eax
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
	leaq	44(%rsp), %rsi
	call	__isoc99_scanf
	movl	44(%rsp), %r11d
	testl	%r11d, %r11d
	jle	.L2
	movl	$c, %ebp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rbp, %rsi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf
	movl	44(%rsp), %r11d
	addq	$4, %rbp
	cmpl	%ebx, %r11d
	jg	.L3
	cmpl	$1, %r11d
	jle	.L2
	movl	$dp+2, %r10d
	movl	c(%rip), %edx
	movl	%r11d, %edi
	movl	$1, %eax
	movq	%r10, %rcx
	.p2align 4,,10
	.p2align 3
.L6:
	movl	%edx, %esi
	movl	c(,%rax,4), %edx
	cmpl	%esi, %edx
	jne	.L5
	movb	$1, (%rcx)
.L5:
	addq	$1, %rax
	addq	$103, %rcx
	cmpq	%rdi, %rax
	jne	.L6
	movl	$2, %eax
	movl	%r11d, 16(%rsp)
	leal	1(%r11), %ebx
	movl	$8, %r15d
	movq	%rax, %rdi
	movl	$4, %r13d
	movq	%r10, %rax
	movq	%rdi, %r10
	.p2align 4,,10
	.p2align 3
.L18:
	movl	16(%rsp), %r12d
	movq	%r10, (%rsp)
	leal	-2(%r10), %r11d
	movq	%rax, %rdi
	movq	%rbx, 8(%rsp)
	movl	%r10d, %esi
	movq	%rax, %rcx
	xorl	%r9d, %r9d
	movl	%r11d, 20(%rsp)
	subl	%r10d, %r12d
	movl	$1, %r8d
	xorl	%edx, %edx
	movq	%rax, %r11
	.p2align 4,,10
	.p2align 3
.L17:
	movl	c(,%rdx,4), %ebx
	movzbl	(%rcx), %eax
	cmpl	c-4(%r15,%rdx,4), %ebx
	je	.L7
	movq	%rcx, %rbp
	movq	%r8, %r10
	.p2align 4,,10
	.p2align 3
.L8:
	movzbl	dp(%r9,%r10), %r14d
	andb	102(%rbp), %r14b
	addq	$1, %r10
	addq	$102, %rbp
	orl	%r14d, %eax
	movb	%al, (%rcx)
	cmpl	%r10d, %esi
	jg	.L8
	xorl	%eax, %eax
	cmpl	%r8d, %esi
	leaq	102(%r9), %rbp
	cmovg	20(%rsp), %eax
	leal	2(%rax,%rdx), %eax
.L13:
	testl	%ebx, %ebx
	je	.L15
	movl	c(%r13,%rdx,4), %r9d
	testl	%r9d, %r9d
	je	.L15
	testq	%rdx, %rdx
	je	.L16
	cmpl	c-4(,%rdx,4), %ebx
	jne	.L16
	leal	-1(%rdx), %r10d
	cltq
	movslq	%r10d, %r10
	imulq	$102, %r10, %r10
	leaq	dp(%rax,%r10), %r10
	movzbl	(%r10), %eax
	orb	(%rcx), %al
	movb	%al, (%r10)
	.p2align 4,,10
	.p2align 3
.L16:
	cmpl	%esi, 16(%rsp)
	jle	.L15
	cmpl	c(%r15,%rdx,4), %r9d
	jne	.L15
	movzbl	(%rcx), %eax
	orb	%al, 1(%rcx)
	.p2align 4,,10
	.p2align 3
.L15:
	leaq	1(%rdx), %rax
	addq	$1, %r8
	addq	$103, %rcx
	addl	$1, %esi
	movq	%rbp, %r9
	addq	$1, %rdi
	cmpq	%r12, %rdx
	je	.L35
	movq	%rax, %rdx
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L35:
	movq	(%rsp), %r10
	movq	8(%rsp), %rbx
	movq	%r11, %rax
	addq	$4, %r13
	addq	$4, %r15
	addq	$1, %rax
	addq	$1, %r10
	cmpq	%rbx, %r10
	jne	.L18
	movl	16(%rsp), %r11d
.L2:
	movslq	%r11d, %r11
	movl	$.LC0, %eax
	movl	$.LC1, %edi
	cmpb	$0, dp(%r11)
	cmovne	%rax, %rdi
	call	puts
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
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	movq	%r8, 24(%rsp)
	leaq	-1(%rcx), %r14
	movq	%r8, %r10
	leaq	102(%r9), %rbp
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L37:
	addq	$1, %r10
	addq	$102, %r14
	cmpl	%r10d, %esi
	jle	.L36
.L12:
	imulq	$102, %r10, %r8
	movzbl	(%rdi,%r8), %r8d
	andb	dp(%r9,%r10), %r8b
	orl	%eax, %r8d
	movzbl	101(%rcx), %eax
	orl	%r8d, %eax
	movb	%al, (%rcx)
	cmpl	c(,%r10,4), %ebx
	jne	.L37
	movzbl	dp(%rbp,%r10), %r8d
	andb	204(%r14), %r8b
	addq	$1, %r10
	addq	$102, %r14
	orl	%r8d, %eax
	movb	%al, (%rcx)
	cmpl	%r10d, %esi
	jg	.L12
.L36:
	movq	24(%rsp), %r8
	xorl	%eax, %eax
	cmpl	%r8d, %esi
	cmovg	20(%rsp), %eax
	leal	2(%rax,%rdx), %eax
	jmp	.L13
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.globl	dp
	.bss
	.align 32
	.type	dp, @object
	.size	dp, 10404
dp:
	.zero	10404
	.globl	c
	.align 32
	.type	c, @object
	.size	c, 408
c:
	.zero	408
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
