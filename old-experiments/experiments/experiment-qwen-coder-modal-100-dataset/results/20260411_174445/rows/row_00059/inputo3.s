	.file	"inputC.c"
	.text
	.p2align 4
	.globl	bomb
	.type	bomb, @function
bomb:
.LFB4:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movslq	%esi, %rax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leal	-1(%rax), %ecx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%edx, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rax, %rbx
	salq	$5, %rax
	movq	%rax, %r15
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	%ecx, 8(%rsp)
.L27:
	movslq	%ebp, %r13
	movl	8(%rsp), %eax
	leal	1(%rbx), %esi
	salq	$2, %r13
	leaq	(%r15,%r13), %r14
	addq	%r12, %r14
	movl	$0, (%r14)
	testl	%eax, %eax
	js	.L3
	leaq	-32(%r15,%r13), %rdx
	addq	%r12, %rdx
	cmpl	$1, (%rdx)
	je	.L53
.L4:
	leal	-2(%rbx), %esi
	cmpl	$1, %ebx
	je	.L33
	leaq	-64(%r15,%r13), %rdx
	addq	%r12, %rdx
	cmpl	$1, (%rdx)
	je	.L54
	leal	-3(%rbx), %esi
	cmpl	$2, %ebx
	je	.L34
.L65:
	leaq	-96(%r15,%r13), %rdx
	addq	%r12, %rdx
	cmpl	$1, (%rdx)
	je	.L55
.L6:
	leal	1(%rbx), %esi
	cmpl	$7, %esi
	jg	.L11
	leaq	32(%r15), %rcx
	leaq	(%rcx,%r13), %rdx
	addq	%r12, %rdx
	cmpl	$1, (%rdx)
	je	.L56
.L10:
	leal	2(%rbx), %r8d
	cmpl	$6, %ebx
	je	.L11
.L31:
	leaq	32(%rcx,%r13), %rdx
	addq	%r12, %rdx
	cmpl	$1, (%rdx)
	je	.L57
.L12:
	leal	3(%rbx), %esi
	cmpl	$5, %ebx
	je	.L11
	leaq	64(%rcx,%r13), %rdx
	addq	%r12, %rdx
	cmpl	$1, (%rdx)
	je	.L58
.L11:
	movl	%ebp, %edx
	subl	$1, %edx
	js	.L59
	cmpl	$1, -4(%r14)
	je	.L60
.L18:
	leal	-2(%rbp), %edx
	cmpl	$1, %ebp
	je	.L19
	cmpl	$1, -8(%r14)
	je	.L61
.L20:
	leal	-3(%rbp), %edx
	cmpl	$2, %ebp
	je	.L21
	cmpl	$1, -12(%r14)
	je	.L62
.L22:
	leal	1(%rbp), %edx
	cmpl	$7, %edx
	jg	.L1
	cmpl	$1, 4(%r14)
	je	.L63
	leal	2(%rbp), %edx
	cmpl	$6, %ebp
	je	.L1
.L15:
	cmpl	$1, 8(%r14)
	je	.L30
	addl	$3, %ebp
	cmpl	$8, %ebp
	je	.L1
.L28:
	cmpl	$1, 12(%r14)
	je	.L64
.L1:
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
.L33:
	.cfi_restore_state
	movl	$2, %esi
.L3:
	leaq	32(%r15), %rcx
	leal	2(%rbx), %r8d
	leaq	(%rcx,%r13), %rdx
	addq	%r12, %rdx
	cmpl	$1, (%rdx)
	jne	.L31
	movl	$0, (%rdx)
	movq	%r12, %rdi
	movl	%ebp, %edx
	movl	%r8d, 12(%rsp)
	movq	%rcx, (%rsp)
	call	bomb
	movq	(%rsp), %rcx
	movl	12(%rsp), %r8d
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L53:
	movl	$0, (%rdx)
	movl	8(%rsp), %esi
	movl	%ebp, %edx
	movq	%r12, %rdi
	call	bomb
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L63:
	movl	$0, 4(%r14)
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	bomb
	leal	2(%rbp), %edx
	cmpl	$6, %ebp
	jne	.L15
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L36:
	movl	$3, %edx
	.p2align 4,,10
	.p2align 3
.L30:
	movl	$0, 8(%r14)
	movl	%ebx, %esi
	movq	%r12, %rdi
	addl	$3, %ebp
	call	bomb
	cmpl	$8, %ebp
	jne	.L28
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L57:
	movl	$0, (%rdx)
	movl	%r8d, %esi
	movl	%ebp, %edx
	movq	%r12, %rdi
	movq	%rcx, (%rsp)
	call	bomb
	movq	(%rsp), %rcx
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L54:
	movl	$0, (%rdx)
	movq	%r12, %rdi
	movl	%ebp, %edx
	call	bomb
	leal	-3(%rbx), %esi
	cmpl	$2, %ebx
	jne	.L65
.L34:
	movl	$3, %esi
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L58:
	movl	$0, (%rdx)
	movq	%r12, %rdi
	movl	%ebp, %edx
	call	bomb
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L55:
	movl	$0, (%rdx)
	movq	%r12, %rdi
	movl	%ebp, %edx
	call	bomb
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L60:
	movl	$0, -4(%r14)
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	bomb
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L61:
	movl	$0, -8(%r14)
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	bomb
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L56:
	movl	$0, (%rdx)
	movq	%r12, %rdi
	movl	%ebp, %edx
	movq	%rcx, (%rsp)
	call	bomb
	movq	(%rsp), %rcx
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L62:
	movl	$0, -12(%r14)
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	bomb
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L64:
	movl	$0, 12(%r14)
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L59:
	cmpl	$1, 4(%r14)
	leal	2(%rbp), %r13d
	je	.L66
.L14:
	cmpl	$1, 8(%r14)
	je	.L67
.L51:
	addl	$3, %ebp
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L19:
	cmpl	$1, 4(%r14)
	je	.L68
	cmpl	$1, 8(%r14)
	je	.L36
	movl	$4, %ebp
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L21:
	cmpl	$1, 4(%r14)
	movl	$4, %r13d
	jne	.L14
	movl	$0, 4(%r14)
	movl	$3, %edx
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	bomb
	movl	$4, %edx
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L67:
	movl	$0, 8(%r14)
	movl	%r13d, %edx
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	bomb
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L66:
	movl	$0, 4(%r14)
	leal	1(%rbp), %edx
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	bomb
	movl	%r13d, %edx
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L68:
	movl	$0, 4(%r14)
	movl	$2, %edx
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	bomb
	movl	$3, %edx
	jmp	.L15
	.cfi_endproc
.LFE4:
	.size	bomb, .-bomb
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%s"
.LC3:
	.string	"Data %d:\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	$.LC0, %edi
	xorl	%eax, %eax
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	$1, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$288, %rsp
	.cfi_def_cfa_offset 336
	leaq	4(%rsp), %rsi
	leaq	288(%rsp), %r12
	call	__isoc99_scanf
	movl	4(%rsp), %eax
	testl	%eax, %eax
	jle	.L71
	.p2align 4,,10
	.p2align 3
.L70:
	leaq	32(%rsp), %rbp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L72:
	leaq	16(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addq	$32, %rbp
	call	__isoc99_scanf
	movq	16(%rsp), %xmm0
	movq	%rbx, %xmm2
	movq	.LC2(%rip), %xmm5
	pcmpgtb	%xmm0, %xmm2
	movdqa	%xmm0, %xmm1
	punpcklbw	%xmm2, %xmm1
	punpcklbw	%xmm2, %xmm0
	pxor	%xmm2, %xmm2
	paddw	%xmm5, %xmm1
	pshufd	$78, %xmm0, %xmm0
	movdqa	%xmm2, %xmm3
	paddw	%xmm5, %xmm0
	pcmpgtw	%xmm1, %xmm3
	movdqa	%xmm1, %xmm4
	pcmpgtw	%xmm0, %xmm2
	punpcklwd	%xmm3, %xmm1
	punpcklwd	%xmm3, %xmm4
	pshufd	$78, %xmm1, %xmm1
	movq	%xmm4, -32(%rbp)
	movq	%xmm1, -24(%rbp)
	movdqa	%xmm2, %xmm1
	movdqa	%xmm0, %xmm2
	punpcklwd	%xmm1, %xmm0
	punpcklwd	%xmm1, %xmm2
	pshufd	$78, %xmm0, %xmm0
	movq	%xmm2, -16(%rbp)
	movq	%xmm0, -8(%rbp)
	cmpq	%rbp, %r12
	jne	.L72
	leaq	8(%rsp), %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	leaq	12(%rsp), %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	8(%rsp), %eax
	leaq	32(%rsp), %rdi
	leaq	64(%rsp), %rbp
	leal	-1(%rax), %edx
	movl	12(%rsp), %eax
	movl	%edx, 8(%rsp)
	leal	-1(%rax), %esi
	movl	%esi, 12(%rsp)
	call	bomb
	movl	%r13d, %esi
	movl	$.LC3, %edi
	xorl	%eax, %eax
	call	printf
	leaq	32(%rsp), %rax
	leaq	288(%rax), %r14
	.p2align 4,,10
	.p2align 3
.L73:
	leaq	-32(%rbp), %rbx
	.p2align 4,,10
	.p2align 3
.L74:
	movl	(%rbx), %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	printf
	cmpq	%rbx, %rbp
	jne	.L74
	movl	$10, %edi
	addq	$32, %rbp
	call	putchar
	cmpq	%rbp, %r14
	jne	.L73
	addl	$1, %r13d
	cmpl	%r13d, 4(%rsp)
	jge	.L70
.L71:
	addq	$288, %rsp
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
.LFE3:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.value	-48
	.value	-48
	.value	-48
	.value	-48
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
