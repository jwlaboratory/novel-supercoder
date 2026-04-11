	.file	"inputC.c"
	.text
	.p2align 4
	.globl	insert
	.type	insert, @function
insert:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%edi, %ebp
	movl	$32, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	root(%rip), %rbx
	call	malloc
	pxor	%xmm0, %xmm0
	movl	%ebp, 24(%rax)
	movups	%xmm0, (%rax)
	testq	%rbx, %rbx
	je	.L2
	.p2align 4,,10
	.p2align 3
.L7:
	movq	(%rbx), %rcx
	movq	8(%rbx), %rdx
	cmpl	24(%rbx), %ebp
	jge	.L3
.L14:
	testq	%rdx, %rdx
	je	.L13
	movq	%rdx, %rbx
	movq	(%rbx), %rcx
	movq	8(%rbx), %rdx
	cmpl	24(%rbx), %ebp
	jl	.L14
.L3:
	testq	%rcx, %rcx
	je	.L6
	movq	%rcx, %rbx
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L13:
	movq	%rbx, 16(%rax)
	movq	%rax, 8(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	.cfi_restore_state
	movq	%rbx, 16(%rax)
	movq	%rax, (%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	.cfi_restore_state
	movq	$0, 16(%rax)
	movq	%rax, root(%rip)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE8:
	.size	insert, .-insert
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	" %d"
	.text
	.p2align 4
	.globl	inorder
	.type	inorder, @function
inorder:
.LFB9:
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
	movq	%rdi, 24(%rsp)
.L34:
	movq	24(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L16
.L33:
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L17
.L32:
	movq	8(%rsp), %rax
	movq	8(%rax), %r12
	testq	%r12, %r12
	je	.L18
.L31:
	movq	8(%r12), %rbp
	testq	%rbp, %rbp
	je	.L19
.L30:
	movq	8(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L20
.L29:
	movq	8(%rbx), %r15
	testq	%r15, %r15
	je	.L21
.L28:
	movq	8(%r15), %r14
	testq	%r14, %r14
	je	.L22
.L27:
	movq	8(%r14), %r13
	testq	%r13, %r13
	je	.L23
.L26:
	movq	8(%r13), %rdi
	testq	%rdi, %rdi
	je	.L24
	call	inorder
	.p2align 4,,10
	.p2align 3
.L24:
	movl	24(%r13), %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	printf
	movq	0(%r13), %r13
	testq	%r13, %r13
	jne	.L26
.L23:
	movl	24(%r14), %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	printf
	movq	(%r14), %r14
	testq	%r14, %r14
	jne	.L27
.L22:
	movl	24(%r15), %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	printf
	movq	(%r15), %r15
	testq	%r15, %r15
	jne	.L28
.L21:
	movl	24(%rbx), %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	printf
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L29
.L20:
	movl	24(%rbp), %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	printf
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L30
.L19:
	movl	24(%r12), %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	printf
	movq	(%r12), %r12
	testq	%r12, %r12
	jne	.L31
.L18:
	movq	8(%rsp), %rbx
	movl	$.LC0, %edi
	xorl	%eax, %eax
	movl	24(%rbx), %esi
	call	printf
	movq	(%rbx), %rax
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	jne	.L32
.L17:
	movq	16(%rsp), %rbx
	movl	$.LC0, %edi
	xorl	%eax, %eax
	movl	24(%rbx), %esi
	call	printf
	movq	(%rbx), %rax
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	jne	.L33
.L16:
	movq	24(%rsp), %rbx
	movl	$.LC0, %edi
	xorl	%eax, %eax
	movl	24(%rbx), %esi
	call	printf
	movq	(%rbx), %rax
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	jne	.L34
	addq	$40, %rsp
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
	.cfi_endproc
.LFE9:
	.size	inorder, .-inorder
	.p2align 4
	.globl	preorder
	.type	preorder, @function
preorder:
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
	movq	%rdi, 24(%rsp)
.L90:
	movq	24(%rsp), %rbx
	movl	$.LC0, %edi
	xorl	%eax, %eax
	movl	24(%rbx), %esi
	call	printf
	movq	8(%rbx), %rax
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.L72
.L89:
	movq	16(%rsp), %rbx
	movl	$.LC0, %edi
	xorl	%eax, %eax
	movl	24(%rbx), %esi
	call	printf
	movq	8(%rbx), %rax
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L73
.L88:
	movq	8(%rsp), %rbx
	movl	$.LC0, %edi
	xorl	%eax, %eax
	movl	24(%rbx), %esi
	call	printf
	movq	8(%rbx), %r12
	testq	%r12, %r12
	je	.L74
.L87:
	movl	24(%r12), %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	printf
	movq	8(%r12), %rbp
	testq	%rbp, %rbp
	je	.L75
.L86:
	movl	24(%rbp), %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	printf
	movq	8(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L76
.L85:
	movl	24(%rbx), %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	printf
	movq	8(%rbx), %r15
	testq	%r15, %r15
	je	.L77
.L84:
	movl	24(%r15), %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	printf
	movq	8(%r15), %r14
	testq	%r14, %r14
	je	.L78
.L83:
	movl	24(%r14), %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	printf
	movq	8(%r14), %r13
	testq	%r13, %r13
	je	.L79
.L82:
	movl	24(%r13), %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	printf
	movq	8(%r13), %rdi
	testq	%rdi, %rdi
	je	.L80
	call	preorder
	movq	0(%r13), %r13
	testq	%r13, %r13
	jne	.L82
	.p2align 4,,10
	.p2align 3
.L79:
	movq	(%r14), %r14
	testq	%r14, %r14
	jne	.L83
.L78:
	movq	(%r15), %r15
	testq	%r15, %r15
	jne	.L84
.L77:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L85
.L76:
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L86
.L75:
	movq	(%r12), %r12
	testq	%r12, %r12
	jne	.L87
.L74:
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	jne	.L88
.L73:
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	jne	.L89
.L72:
	movq	24(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	jne	.L90
	addq	$40, %rsp
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
.L80:
	.cfi_restore_state
	movq	0(%r13), %r13
	testq	%r13, %r13
	jne	.L82
	movq	(%r14), %r14
	testq	%r14, %r14
	jne	.L83
	jmp	.L78
	.cfi_endproc
.LFE10:
	.size	preorder, .-preorder
	.section	.rodata.str1.1
.LC1:
	.string	"%d"
.LC2:
	.string	"%s"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$.LC1, %edi
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	leaq	8(%rsp), %rsi
	call	__isoc99_scanf
	movl	8(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L139
	xorl	%ebp, %ebp
	jmp	.L137
	.p2align 4,,10
	.p2align 3
.L129:
	cmpb	$112, %al
	je	.L143
.L136:
	addl	$1, %ebp
	cmpl	%ebp, 8(%rsp)
	jle	.L139
.L137:
	leaq	16(%rsp), %rsi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movzbl	16(%rsp), %eax
	cmpb	$105, %al
	jne	.L129
	leaq	12(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	12(%rsp), %r12d
	movl	$32, %edi
	movq	root(%rip), %rbx
	call	malloc
	pxor	%xmm0, %xmm0
	movl	%r12d, 24(%rax)
	movups	%xmm0, (%rax)
	testq	%rbx, %rbx
	je	.L130
	.p2align 4,,10
	.p2align 3
.L135:
	movq	(%rbx), %rdx
	movq	8(%rbx), %rcx
	cmpl	24(%rbx), %r12d
	jl	.L131
.L145:
	testq	%rdx, %rdx
	je	.L144
	movq	%rdx, %rbx
	movq	(%rbx), %rdx
	movq	8(%rbx), %rcx
	cmpl	24(%rbx), %r12d
	jge	.L145
.L131:
	testq	%rcx, %rcx
	je	.L134
	movq	%rcx, %rbx
	jmp	.L135
	.p2align 4,,10
	.p2align 3
.L143:
	movq	root(%rip), %rdi
	addl	$1, %ebp
	call	inorder
	movl	$10, %edi
	call	putchar
	movq	root(%rip), %rdi
	call	preorder
	movl	$10, %edi
	call	putchar
	cmpl	%ebp, 8(%rsp)
	jg	.L137
.L139:
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L144:
	.cfi_restore_state
	movq	%rbx, 16(%rax)
	movq	%rax, (%rbx)
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L134:
	movq	%rbx, 16(%rax)
	movq	%rax, 8(%rbx)
	jmp	.L136
.L130:
	xorl	%edx, %edx
	movq	%rax, root(%rip)
	movq	%rdx, 16(%rax)
	jmp	.L136
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.globl	root
	.bss
	.align 8
	.type	root, @object
	.size	root, 8
root:
	.zero	8
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
