	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"No"
.LC1:
	.string	"Yes"
.LC2:
	.string	"%d %d"
.LC3:
	.string	" %c"
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
	subq	$1250168, %rsp
	.cfi_def_cfa_offset 1250224
	leaq	60(%rsp), %rdx
	leaq	56(%rsp), %rsi
	call	__isoc99_scanf
	movl	56(%rsp), %edi
	movl	60(%rsp), %eax
	testl	%edi, %edi
	jle	.L9
	leaq	90064(%rsp), %rbx
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	testl	%eax, %eax
	jle	.L9
	.p2align 4,,10
	.p2align 3
.L10:
	leaq	64(%rsp), %rax
	xorl	%r14d, %r14d
	leaq	(%rax,%r12), %r13
	.p2align 4,,10
	.p2align 3
.L7:
	xorl	%eax, %eax
	movq	%r13, %rsi
	movl	$.LC3, %edi
	call	__isoc99_scanf
	cmpb	$37, 0(%r13)
	jne	.L4
	movl	%ebp, 450064(%rsp)
	movl	%r14d, 850112(%rsp)
	movb	$35, 0(%r13)
.L4:
	movl	$1000000000, (%rbx,%r14,4)
	movl	60(%rsp), %eax
	addq	$1, %r14
	addq	$1, %r13
	cmpl	%r14d, %eax
	jg	.L7
	movl	56(%rsp), %edi
	addl	$1, %ebp
	cmpl	%edi, %ebp
	jge	.L9
	addq	$1200, %rbx
	addq	$300, %r12
	testl	%eax, %eax
	jg	.L10
.L9:
	movslq	450064(%rsp), %rsi
	movslq	850112(%rsp), %r8
	movl	$1, %r9d
	movl	$1000000001, %r11d
	movq	%rsi, %rdx
	imulq	$300, %rsi, %rsi
	movq	%r8, %rcx
	addq	%r8, %rsi
	movl	$0, 90064(%rsp,%rsi,4)
	movl	Y(%rip), %esi
	movl	%esi, 12(%rsp)
	movl	X(%rip), %esi
	movl	%esi, 16(%rsp)
	movl	Y+4(%rip), %esi
	movl	%esi, 20(%rsp)
	movl	X+4(%rip), %esi
	movl	%esi, 24(%rsp)
	movl	Y+8(%rip), %esi
	movl	%esi, 28(%rsp)
	movl	X+8(%rip), %esi
	movl	%esi, 32(%rsp)
	movl	Y+12(%rip), %esi
	movl	%esi, 36(%rsp)
	movl	X+12(%rip), %esi
	movl	%esi, 40(%rsp)
	xorl	%esi, %esi
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L12:
	movl	20(%rsp), %ebx
	leal	(%rbx,%rdx), %r8d
	movl	24(%rsp), %ebx
	movslq	%r8d, %rbp
	imulq	$300, %rbp, %r12
	leal	(%rbx,%rcx), %r10d
	movslq	%r10d, %r13
	leaq	1250160(%r12), %rbx
	addq	%rsp, %rbx
	cmpl	%r8d, %edi
	movzbl	-1250096(%rbx,%r13), %r14d
	setle	%r15b
	cmpb	$35, %r14b
	sete	%bl
	orb	%r15b, %bl
	jne	.L15
	movl	%r8d, %ebx
	orl	%r10d, %ebx
	jns	.L38
.L15:
	movl	28(%rsp), %ebx
	leal	(%rbx,%rdx), %r8d
	movl	32(%rsp), %ebx
	movslq	%r8d, %rbp
	imulq	$300, %rbp, %r12
	leal	(%rbx,%rcx), %r10d
	movslq	%r10d, %r13
	leaq	1250160(%r12), %rbx
	addq	%rsp, %rbx
	movzbl	-1250096(%rbx,%r13), %r14d
	cmpb	$35, %r14b
	sete	%r15b
	cmpl	%r8d, %edi
	setle	%bl
	orb	%r15b, %bl
	jne	.L18
	movl	%r8d, %ebx
	orl	%r10d, %ebx
	jns	.L39
.L18:
	movl	36(%rsp), %ebx
	leal	(%rbx,%rdx), %r8d
	movl	40(%rsp), %ebx
	movslq	%r8d, %rbp
	imulq	$300, %rbp, %r12
	leal	(%rbx,%rcx), %r10d
	movslq	%r10d, %r13
	leaq	1250160(%r12), %rbx
	addq	%rsp, %rbx
	cmpl	%r8d, %edi
	movzbl	-1250096(%rbx,%r13), %r14d
	setle	%r15b
	cmpb	$35, %r14b
	sete	%bl
	orb	%r15b, %bl
	jne	.L21
	movl	%r8d, %ebx
	orl	%r10d, %ebx
	jns	.L40
.L21:
	addq	$1, %rsi
	cmpl	%esi, %r9d
	je	.L24
.L41:
	movslq	450064(%rsp,%rsi,4), %rdx
	movslq	850112(%rsp,%rsi,4), %rcx
.L25:
	movl	12(%rsp), %ebx
	leal	(%rbx,%rdx), %r8d
	movl	16(%rsp), %ebx
	movslq	%r8d, %rbp
	imulq	$300, %rbp, %r12
	leal	(%rbx,%rcx), %r10d
	movslq	%r10d, %r13
	leaq	1250160(%r12), %rbx
	addq	%rsp, %rbx
	movzbl	-1250096(%rbx,%r13), %r14d
	cmpb	$35, %r14b
	sete	%r15b
	cmpl	%edi, %r8d
	setge	%bl
	orb	%r15b, %bl
	jne	.L12
	movl	%r8d, %ebx
	orl	%r10d, %ebx
	js	.L12
	cmpl	%eax, %r10d
	jge	.L12
	imulq	$300, %rdx, %rdx
	addq	%r13, %r12
	addq	%rcx, %rdx
	movl	90064(%rsp,%rdx,4), %edx
	addl	$1, %edx
	movl	%edx, 90064(%rsp,%r12,4)
	cmpb	$64, %r14b
	je	.L28
	cmpl	%edx, %r11d
	cmovle	%r11d, %edx
	cmpb	$36, %r14b
	cmove	%edx, %r11d
.L13:
	imulq	$300, %rbp, %rbp
	movslq	%r9d, %rdx
	addl	$1, %r9d
	movl	%r10d, 850112(%rsp,%rdx,4)
	movl	%r8d, 450064(%rsp,%rdx,4)
	movslq	450064(%rsp,%rsi,4), %rdx
	leaq	1250160(%rbp), %rcx
	leaq	(%rsp,%rcx), %rbp
	movslq	850112(%rsp,%rsi,4), %rcx
	movb	$35, -1250096(%rbp,%r13)
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L39:
	cmpl	%eax, %r10d
	jge	.L18
	imulq	$300, %rdx, %rdx
	addq	%r13, %r12
	addq	%rcx, %rdx
	movl	90064(%rsp,%rdx,4), %edx
	addl	$1, %edx
	movl	%edx, 90064(%rsp,%r12,4)
	cmpb	$64, %r14b
	je	.L30
	cmpl	%edx, %r11d
	cmovle	%r11d, %edx
	cmpb	$36, %r14b
	cmove	%edx, %r11d
.L19:
	imulq	$300, %rbp, %rbp
	movslq	%r9d, %rdx
	addl	$1, %r9d
	movl	%r10d, 850112(%rsp,%rdx,4)
	movl	%r8d, 450064(%rsp,%rdx,4)
	movslq	450064(%rsp,%rsi,4), %rdx
	leaq	1250160(%rbp), %rcx
	leaq	(%rsp,%rcx), %rbp
	movslq	850112(%rsp,%rsi,4), %rcx
	movb	$35, -1250096(%rbp,%r13)
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L38:
	cmpl	%eax, %r10d
	jge	.L15
	imulq	$300, %rdx, %rdx
	addq	%r13, %r12
	addq	%rcx, %rdx
	movl	90064(%rsp,%rdx,4), %edx
	addl	$1, %edx
	movl	%edx, 90064(%rsp,%r12,4)
	cmpb	$64, %r14b
	je	.L29
	cmpl	%edx, %r11d
	cmovle	%r11d, %edx
	cmpb	$36, %r14b
	cmove	%edx, %r11d
.L16:
	imulq	$300, %rbp, %rbp
	movslq	%r9d, %rdx
	addl	$1, %r9d
	movl	%r10d, 850112(%rsp,%rdx,4)
	movl	%r8d, 450064(%rsp,%rdx,4)
	movslq	450064(%rsp,%rsi,4), %rdx
	leaq	1250160(%rbp), %rcx
	leaq	(%rsp,%rcx), %rbp
	movslq	850112(%rsp,%rsi,4), %rcx
	movb	$35, -1250096(%rbp,%r13)
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L40:
	cmpl	%eax, %r10d
	jge	.L21
	imulq	$300, %rdx, %rdx
	addq	%r13, %r12
	addq	%rcx, %rdx
	movl	90064(%rsp,%rdx,4), %edx
	addl	$1, %edx
	movl	%edx, 90064(%rsp,%r12,4)
	cmpb	$64, %r14b
	je	.L31
	cmpl	%edx, %r11d
	cmovle	%r11d, %edx
	cmpb	$36, %r14b
	cmove	%edx, %r11d
.L22:
	imulq	$300, %rbp, %rbp
	movslq	%r9d, %rdx
	addq	$1, %rsi
	addl	$1, %r9d
	movl	%r8d, 450064(%rsp,%rdx,4)
	movl	%r10d, 850112(%rsp,%rdx,4)
	leaq	1250160(%rbp), %rcx
	leaq	(%rsp,%rcx), %rbp
	movb	$35, -1250096(%rbp,%r13)
	cmpl	%esi, %r9d
	jne	.L41
	.p2align 4,,10
	.p2align 3
.L24:
	movl	44(%rsp), %eax
	cmpl	%r11d, %eax
	jge	.L33
	movl	$.LC1, %edi
	cmpl	$1000000000, %eax
	je	.L33
.L26:
	call	puts
	addq	$1250168, %rsp
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
.L28:
	.cfi_restore_state
	movl	%edx, 44(%rsp)
	jmp	.L13
.L30:
	movl	%edx, 44(%rsp)
	jmp	.L19
.L31:
	movl	%edx, 44(%rsp)
	jmp	.L22
.L29:
	movl	%edx, 44(%rsp)
	jmp	.L16
.L33:
	movl	$.LC0, %edi
	jmp	.L26
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.globl	Y
	.data
	.align 16
	.type	Y, @object
	.size	Y, 16
Y:
	.long	1
	.long	0
	.long	-1
	.long	0
	.globl	X
	.align 16
	.type	X, @object
	.size	X, 16
X:
	.long	0
	.long	1
	.long	0
	.long	-1
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
