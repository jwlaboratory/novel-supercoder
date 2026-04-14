	.file	"inputC.c"
	.text
	.p2align 4
	.globl	insert
	.type	insert, @function
insert:
.LFB8:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movslq	%esi, %rax
	imull	$107, %esi, %esi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movsbl	-1(%rdi,%rax), %ebx
	movsbl	(%rdi), %eax
	movq	hashend(%rip), %r13
	imull	$101, %eax, %eax
	imull	$103, %ebx, %ebx
	addl	%eax, %ebx
	addl	%esi, %ebx
	movslq	%ebx, %rax
	movl	%ebx, %edx
	imulq	$-2109059487, %rax, %rax
	sarl	$31, %edx
	shrq	$32, %rax
	addl	%ebx, %eax
	sarl	$8, %eax
	subl	%edx, %eax
	imull	$503, %eax, %eax
	subl	%eax, %ebx
	movslq	%ebx, %rbx
	salq	$4, %rbx
	addq	$hash, %rbx
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%rbp, %rsi
	call	strcmp
	testl	%eax, %eax
	je	.L10
	addq	$16, %rbx
	movl	$hash, %eax
	cmpq	%rbx, %r13
	cmove	%rax, %rbx
.L5:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	jne	.L6
	movq	%rbp, (%rbx)
	movl	$-1, %eax
	movl	%r12d, 8(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	.cfi_restore_state
	movl	8(%rbx), %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE8:
	.size	insert, .-insert
	.p2align 4
	.globl	lookup
	.type	lookup, @function
lookup:
.LFB9:
	.cfi_startproc
	movslq	%esi, %rax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	imull	$107, %esi, %esi
	movq	hashend(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movsbl	-1(%rdi,%rax), %ebx
	movsbl	(%rdi), %eax
	imull	$103, %ebx, %ebx
	imull	$101, %eax, %eax
	addl	%eax, %ebx
	addl	%esi, %ebx
	movslq	%ebx, %rax
	movl	%ebx, %edx
	imulq	$-2109059487, %rax, %rax
	sarl	$31, %edx
	shrq	$32, %rax
	addl	%ebx, %eax
	sarl	$8, %eax
	subl	%edx, %eax
	imull	$503, %eax, %eax
	subl	%eax, %ebx
	movslq	%ebx, %rbx
	salq	$4, %rbx
	addq	$hash, %rbx
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L16:
	movq	%rbp, %rsi
	call	strcmp
	testl	%eax, %eax
	je	.L19
	addq	$16, %rbx
	movl	$hash, %eax
	cmpq	%rbx, %r12
	cmove	%rax, %rbx
.L15:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	jne	.L16
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$-1, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	.cfi_restore_state
	movl	8(%rbx), %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE9:
	.size	lookup, .-lookup
	.p2align 4
	.globl	found
	.type	found, @function
found:
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
	movslq	%edi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movl	sz(%rip), %edx
	movl	%esi, cross(,%rbp,4)
	testl	%edx, %edx
	jle	.L20
	imulq	$202, %rbp, %r14
	movl	%esi, %ecx
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	negl	%esi
.L49:
	movl	cross(,%rbx,4), %r11d
	testl	%r11d, %r11d
	jne	.L22
	cmpb	$0, rel(%rbp,%rax)
	jne	.L23
	cmpb	$0, rel(%r14,%rbx)
	je	.L22
.L23:
	movl	%esi, cross(,%rbx,4)
	testl	%edx, %edx
	jle	.L20
	xorl	%r15d, %r15d
	movl	%ecx, %r8d
	xorl	%r13d, %r13d
	movq	%r14, %rcx
	movq	%r15, %r14
.L48:
	movl	cross(,%r13,4), %r10d
	testl	%r10d, %r10d
	jne	.L25
	cmpb	$0, rel(%rbx,%r14)
	jne	.L26
	cmpb	$0, rel(%rax,%r13)
	je	.L25
.L26:
	movl	%r8d, cross(,%r13,4)
	testl	%edx, %edx
	jle	.L59
	movq	%rbx, 56(%rsp)
	xorl	%r15d, %r15d
	movq	%r14, %rdi
	movq	%rcx, %r10
	movq	%rax, 64(%rsp)
	movq	%r13, %r14
	xorl	%r12d, %r12d
	movq	%r15, %r13
	movq	%rbp, %rcx
	movq	%rdi, %r15
.L47:
	movl	cross(,%r12,4), %r9d
	testl	%r9d, %r9d
	jne	.L27
	cmpb	$0, rel(%r14,%r13)
	jne	.L28
	cmpb	$0, rel(%r15,%r12)
	je	.L27
.L28:
	movl	%esi, cross(,%r12,4)
	testl	%edx, %edx
	jle	.L60
	movq	%r14, 40(%rsp)
	xorl	%eax, %eax
	movq	%r10, %r11
	xorl	%ebp, %ebp
	movq	%r15, 48(%rsp)
	movq	%rcx, %r10
	movq	%r13, %r15
	movq	%r12, %r13
	movq	%rax, %r12
.L46:
	movl	cross(,%rbp,4), %edi
	testl	%edi, %edi
	jne	.L29
	cmpb	$0, rel(%r13,%r12)
	jne	.L30
	cmpb	$0, rel(%r15,%rbp)
	je	.L29
.L30:
	movl	%r8d, cross(,%rbp,4)
	testl	%edx, %edx
	jle	.L61
	movq	%r15, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%ebx, %ebx
	movq	%r12, %r14
	movq	%r13, 24(%rsp)
	movq	%rbp, %rax
	movq	%r9, %r12
	movq	%rbx, %r13
.L45:
	movl	cross(,%r13,4), %ecx
	testl	%ecx, %ecx
	jne	.L31
	cmpb	$0, rel(%rax,%r12)
	jne	.L32
	cmpb	$0, rel(%r14,%r13)
	je	.L31
.L32:
	movl	%esi, cross(,%r13,4)
	testl	%edx, %edx
	jle	.L62
	movq	%rax, 16(%rsp)
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	movq	%r13, %r15
	movq	%r12, %rcx
	movq	%rbp, %r13
	movq	%rbx, %r12
.L44:
	movl	cross(,%r12,4), %eax
	testl	%eax, %eax
	jne	.L33
	cmpb	$0, rel(%r15,%r13)
	jne	.L34
	cmpb	$0, rel(%rcx,%r12)
	je	.L33
.L34:
	movl	%r8d, cross(,%r12,4)
	testl	%edx, %edx
	jle	.L63
	xorl	%ebp, %ebp
	movq	%rcx, 8(%rsp)
	movq	%r13, %r9
	xorl	%eax, %eax
	movq	%r12, %r13
	movq	%r14, %rcx
	movq	%rbp, %r12
.L43:
	movl	cross(,%r12,4), %ebp
	testl	%ebp, %ebp
	jne	.L35
	cmpb	$0, rel(%r13,%rax)
	jne	.L36
	cmpb	$0, rel(%r9,%r12)
	je	.L35
.L36:
	movl	%esi, cross(,%r12,4)
	testl	%edx, %edx
	jle	.L64
	xorl	%r14d, %r14d
	movl	%edx, %edi
	xorl	%ebp, %ebp
	movq	%r15, %rdx
	movq	%r13, %r15
	movq	%r12, %r13
	movq	%r14, %r12
.L42:
	movl	cross(,%rbp,4), %ebx
	testl	%ebx, %ebx
	jne	.L37
	cmpb	$0, rel(%r13,%r12)
	jne	.L38
	cmpb	$0, rel(%rax,%rbp)
	je	.L37
.L38:
	movl	%r8d, cross(,%rbp,4)
	testl	%edi, %edi
	jle	.L65
	leaq	rel(%rbp), %r14
	xorl	%ebx, %ebx
.L41:
	cmpl	$0, cross(,%rbx,4)
	jne	.L39
	cmpb	$0, (%r14)
	jne	.L40
	cmpb	$0, rel(%r12,%rbx)
	je	.L39
.L40:
	movl	%ebx, %edi
	movq	%r10, 120(%rsp)
	movl	%r8d, 116(%rsp)
	movq	%r11, 104(%rsp)
	movq	%rcx, 96(%rsp)
	movq	%rdx, 88(%rsp)
	movq	%r9, 80(%rsp)
	movq	%rax, 72(%rsp)
	movl	%esi, 112(%rsp)
	call	found
	movl	sz(%rip), %edi
	movq	120(%rsp), %r10
	movl	116(%rsp), %r8d
	movq	104(%rsp), %r11
	movq	96(%rsp), %rcx
	movq	88(%rsp), %rdx
	movq	80(%rsp), %r9
	movq	72(%rsp), %rax
	movl	112(%rsp), %esi
	.p2align 4,,10
	.p2align 3
.L39:
	addq	$1, %rbx
	addq	$202, %r14
	cmpl	%ebx, %edi
	jg	.L41
.L37:
	addq	$1, %rbp
	addq	$202, %r12
	cmpl	%ebp, %edi
	jg	.L42
.L65:
	movq	%r13, %r12
	movq	%r15, %r13
	movq	%rdx, %r15
	movl	%edi, %edx
.L35:
	addq	$1, %r12
	addq	$202, %rax
	cmpl	%r12d, %edx
	jg	.L43
.L64:
	movq	%rcx, %r14
	movq	8(%rsp), %rcx
	movq	%r13, %r12
	movq	%r9, %r13
.L33:
	addq	$1, %r12
	addq	$202, %r13
	cmpl	%r12d, %edx
	jg	.L44
.L63:
	movq	16(%rsp), %rax
	movq	%r15, %r13
	movq	%rcx, %r12
.L31:
	addq	$1, %r13
	addq	$202, %r12
	cmpl	%r13d, %edx
	jg	.L45
.L62:
	movq	24(%rsp), %r13
	movq	32(%rsp), %r15
	movq	%rax, %rbp
	movq	%r14, %r12
.L29:
	addq	$1, %rbp
	addq	$202, %r12
	cmpl	%ebp, %edx
	jg	.L46
.L61:
	movq	%r13, %r12
	movq	40(%rsp), %r14
	movq	%r15, %r13
	movq	48(%rsp), %r15
	movq	%r10, %rcx
	movq	%r11, %r10
.L27:
	addq	$1, %r12
	addq	$202, %r13
	cmpl	%r12d, %edx
	jg	.L47
.L60:
	movq	56(%rsp), %rbx
	movq	64(%rsp), %rax
	movq	%r14, %r13
	movq	%rcx, %rbp
	movq	%r15, %r14
	movq	%r10, %rcx
.L25:
	addq	$1, %r13
	addq	$202, %r14
	cmpl	%r13d, %edx
	jg	.L48
.L59:
	movq	%rcx, %r14
	movl	%r8d, %ecx
.L22:
	addq	$1, %rbx
	addq	$202, %rax
	cmpl	%ebx, %edx
	jg	.L49
.L20:
	addq	$136, %rsp
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
.LFE10:
	.size	found, .-found
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\n"
.LC1:
	.string	"YES"
.LC2:
	.string	"NO"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB11:
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	leaq	16(%rsp), %r12
.L68:
	movq	stdin(%rip), %rdx
	movl	$10, %esi
	movq	%r12, %rdi
	call	fgets
	testq	%rax, %rax
	je	.L167
	cmpb	$48, 16(%rsp)
	je	.L167
	xorl	%eax, %eax
	movl	$1010, %ecx
	movl	$hash, %edi
	xorl	%esi, %esi
	rep stosq
	movl	$40804, %edx
	movl	$rel, %edi
	call	memset
	xorl	%esi, %esi
	movl	$10, %edx
	movq	%r12, %rdi
	call	strtol
	movl	$0, sz(%rip)
	movl	%eax, %esi
	testl	%eax, %eax
	je	.L69
	xorl	%esi, %esi
	movl	%eax, 12(%rsp)
	movl	%esi, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L86:
	movslq	8(%rsp), %r13
	movq	stdin(%rip), %rdx
	movl	$35, %esi
	leaq	0(%r13,%r13,8), %rax
	leaq	name(,%rax,4), %rdi
	call	fgets
	movslq	sz(%rip), %rax
	leaq	(%rax,%rax,8), %rsi
	movl	%eax, 8(%rsp)
	leaq	0(,%rsi,4), %r8
	cmpb	$45, name(,%rsi,4)
	leaq	name(%r8), %r14
	movq	%r14, %r15
	je	.L145
	.p2align 4,,10
	.p2align 3
.L71:
	addq	$1, %r15
	cmpb	$45, (%r15)
	jne	.L71
	movq	%r15, %rax
	subq	%r14, %rax
	imull	$107, %eax, %edx
	movslq	%eax, %rdi
	subq	$1, %rdi
.L70:
	movb	$0, (%r15)
	movsbl	name(,%rsi,4), %esi
	leaq	1(%r15), %rbp
	movsbl	name(%rdi,%r8), %eax
	movq	hashend(%rip), %rbx
	imull	$101, %esi, %esi
	imull	$103, %eax, %eax
	addl	%esi, %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movl	%eax, %esi
	imulq	$-2109059487, %rdx, %rdx
	sarl	$31, %esi
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$8, %edx
	subl	%esi, %edx
	imull	$503, %edx, %edx
	subl	%edx, %eax
	movslq	%eax, %rdx
	salq	$4, %rdx
	leaq	hash(%rdx), %r13
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L77:
	movq	%r14, %rsi
	call	strcmp
	testl	%eax, %eax
	je	.L227
	addq	$16, %r13
	movl	$hash, %eax
	cmpq	%rbx, %r13
	cmove	%rax, %r13
.L76:
	movq	0(%r13), %rdi
	testq	%rdi, %rdi
	jne	.L77
	movl	8(%rsp), %eax
	movq	%r14, 0(%r13)
	movl	%eax, 8(%r13)
	movl	%eax, %r14d
.L74:
	leal	1(%r14), %eax
	movl	%eax, sz(%rip)
	movl	%eax, 8(%rsp)
.L75:
	cmpb	$32, 1(%r15)
	jle	.L146
	movq	%rbp, %rax
	.p2align 4,,10
	.p2align 3
.L79:
	movq	%rax, %rdx
	addq	$1, %rax
	cmpb	$32, (%rax)
	jg	.L79
	subq	%r15, %rdx
	movslq	%edx, %rsi
	imull	$107, %edx, %edx
	addq	%r15, %rsi
.L78:
	movb	$0, (%rax)
	movsbl	1(%r15), %eax
	movsbl	(%rsi), %ecx
	imull	$101, %eax, %eax
	imull	$103, %ecx, %ecx
	addl	%ecx, %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movl	%eax, %ecx
	imulq	$-2109059487, %rdx, %rdx
	sarl	$31, %ecx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$8, %edx
	subl	%ecx, %edx
	imull	$503, %edx, %edx
	subl	%edx, %eax
	movslq	%eax, %rdx
	salq	$4, %rdx
	leaq	hash(%rdx), %r15
	jmp	.L84
	.p2align 4,,10
	.p2align 3
.L85:
	movq	%rbp, %rsi
	call	strcmp
	testl	%eax, %eax
	je	.L228
	addq	$16, %r15
	movl	$hash, %eax
	cmpq	%r15, %rbx
	cmove	%rax, %r15
.L84:
	movq	(%r15), %rdi
	testq	%rdi, %rdi
	jne	.L85
	movl	8(%rsp), %eax
	movq	%rbp, (%r15)
	movl	%eax, 8(%r15)
.L82:
	leal	1(%rax), %edx
	movl	%edx, sz(%rip)
	movl	%edx, 8(%rsp)
.L83:
	movslq	%eax, %rdx
	movslq	%r14d, %rax
	imulq	$202, %rax, %rax
	subl	$1, 12(%rsp)
	movb	$1, rel(%rdx,%rax)
	jne	.L86
	movl	8(%rsp), %esi
.L69:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	printf
	movl	$cross, %edx
	movl	sz(%rip), %ebx
	xorl	%eax, %eax
	movl	$101, %ecx
	movq	%rdx, %rdi
	rep stosq
	testl	%ebx, %ebx
	jle	.L89
	xorl	%r15d, %r15d
	xorl	%r13d, %r13d
	movl	$1, %r14d
	movl	%ebx, %eax
	jmp	.L93
.L88:
	addq	$1, %r13
	addq	$202, %r15
	cmpl	%r13d, %eax
	jle	.L229
.L93:
	movl	cross(,%r13,4), %ecx
	testl	%ecx, %ecx
	jne	.L88
	leal	1(%r14), %ebx
	movl	%r14d, cross(,%r13,4)
	movl	%ebx, 8(%rsp)
	testl	%eax, %eax
	jle	.L89
	leaq	rel(%r13), %rbx
	xorl	%ebp, %ebp
	negl	%r14d
.L92:
	movl	cross(,%rbp,4), %edx
	testl	%edx, %edx
	jne	.L90
	cmpb	$0, (%rbx)
	jne	.L91
	cmpb	$0, rel(%r15,%rbp)
	je	.L90
.L91:
	movl	%r14d, %esi
	movl	%ebp, %edi
	call	found
	movl	sz(%rip), %eax
.L90:
	addq	$1, %rbp
	addq	$202, %rbx
	cmpl	%ebp, %eax
	jg	.L92
	addq	$1, %r13
	movl	8(%rsp), %r14d
	addq	$202, %r15
	cmpl	%r13d, %eax
	jg	.L93
.L229:
	movl	%eax, %ebx
	xorl	%esi, %esi
	movl	$40804, %edx
	movl	$tmp, %edi
	call	memset
	testl	%ebx, %ebx
	jle	.L95
	movslq	%ebx, %rcx
	xorl	%ebp, %ebp
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L96:
	xorl	%r10d, %r10d
	xorl	%edi, %edi
	movl	%r11d, %esi
	.p2align 4,,10
	.p2align 3
.L105:
	movl	%edi, %r8d
	cmpl	%edi, %r11d
	je	.L97
	leaq	rel(%r11), %rdx
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L231:
	cmpb	$0, (%rdx)
	je	.L98
	testb	%r9b, %r9b
	jne	.L97
	movq	%rdx, %r9
	subq	%r11, %r9
	cmpb	$0, (%r9,%rdi)
	movl	$1, %r9d
	cmovne	%r9d, %r14d
	.p2align 4,,10
	.p2align 3
.L98:
	addq	$1, %rax
	addq	$202, %rdx
	cmpq	%rax, %rcx
	je	.L230
.L104:
	cmpl	%eax, %esi
	je	.L98
	cmpl	%eax, %r8d
	je	.L98
	cmpb	$0, rel(%rbp,%rax)
	movzbl	rel(%r10,%rax), %r9d
	je	.L231
	movq	%rdx, %r13
	subq	%r11, %r13
	movzbl	0(%r13,%rdi), %r13d
	testb	%r9b, %r9b
	jne	.L103
	testb	%r13b, %r13b
	je	.L98
.L97:
	leaq	1(%rdi), %rax
	addq	$202, %r10
	cmpq	%rax, %rcx
	je	.L232
.L147:
	movq	%rax, %rdi
	jmp	.L105
.L227:
	movl	8(%r13), %r14d
	testl	%r14d, %r14d
	jns	.L75
	movl	8(%rsp), %r14d
	jmp	.L74
.L228:
	movl	8(%r15), %eax
	testl	%eax, %eax
	jns	.L83
	movl	8(%rsp), %eax
	jmp	.L82
.L146:
	movq	%r15, %rsi
	movq	%rbp, %rax
	xorl	%edx, %edx
	jmp	.L78
.L145:
	xorl	%edx, %edx
	movq	$-1, %rdi
	jmp	.L70
	.p2align 4,,10
	.p2align 3
.L103:
	testb	%r13b, %r13b
	jne	.L97
	cmpb	$0, (%rdx)
	jne	.L97
	addq	$1, %rax
	movl	$1, %r14d
	addq	$202, %rdx
	cmpq	%rax, %rcx
	jne	.L104
	.p2align 4,,10
	.p2align 3
.L230:
	testl	%r14d, %r14d
	je	.L97
	leaq	1(%rdi), %rax
	movb	$1, tmp(%rbp,%rdi)
	addq	$202, %r10
	cmpq	%rax, %rcx
	jne	.L147
.L232:
	leaq	1(%r11), %rdx
	addq	$202, %rbp
	cmpq	%rdi, %r11
	je	.L106
	movq	%rdx, %r11
	jmp	.L96
.L236:
	addl	$1, %r10d
	addq	$202, %rdx
	cmpl	%r10d, %r11d
	jne	.L108
.L109:
	imulq	$202, %rax, %r8
	movl	$rel, %r9d
	xorl	%esi, %esi
	leaq	(%rax,%r9), %r10
	.p2align 4,,10
	.p2align 3
.L114:
	movq	%r9, %rdx
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L123:
	xorl	%eax, %eax
.L122:
	cmpb	$0, (%rdx)
	jne	.L233
.L118:
	addq	$202, %rcx
	addq	$202, %rdx
	cmpq	%rcx, %r8
	jne	.L123
	addq	$1, %r9
	addq	$202, %rsi
	cmpq	%r9, %r10
	jne	.L114
.L95:
	movq	stdin(%rip), %rdx
	movl	$10, %esi
	movq	%r12, %rdi
	call	fgets
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%r12, %rdi
	call	strtol
	movl	%eax, %r13d
	testl	%eax, %eax
	je	.L68
	.p2align 4,,10
	.p2align 3
.L140:
	movq	stdin(%rip), %rdx
	movl	$35, %esi
	movq	%r12, %rdi
	call	fgets
	cmpb	$45, 16(%rsp)
	je	.L150
	movq	%r12, %rbp
	.p2align 4,,10
	.p2align 3
.L125:
	addq	$1, %rbp
	cmpb	$45, 0(%rbp)
	jne	.L125
	movq	%rbp, %rax
	subq	%r12, %rax
	imull	$107, %eax, %edx
	movslq	%eax, %rcx
	subq	$1, %rcx
.L124:
	movb	$0, 0(%rbp)
	movsbl	16(%rsp,%rcx), %eax
	movsbl	16(%rsp), %ecx
	movq	hashend(%rip), %r14
	imull	$103, %eax, %eax
	imull	$101, %ecx, %ecx
	addl	%ecx, %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movl	%eax, %ecx
	imulq	$-2109059487, %rdx, %rdx
	sarl	$31, %ecx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$8, %edx
	subl	%ecx, %edx
	imull	$503, %edx, %edx
	subl	%edx, %eax
	movslq	%eax, %rbx
	salq	$4, %rbx
	addq	$hash, %rbx
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L131:
	movq	%r12, %rsi
	call	strcmp
	testl	%eax, %eax
	je	.L234
	addq	$16, %rbx
	movl	$hash, %eax
	cmpq	%r14, %rbx
	cmove	%rax, %rbx
.L130:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	jne	.L131
.L128:
	movl	$.LC2, %edi
	call	puts
.L139:
	subl	$1, %r13d
	jne	.L140
	jmp	.L68
.L234:
	movslq	8(%rbx), %r15
	testl	%r15d, %r15d
	js	.L128
	cmpb	$32, 1(%rbp)
	leaq	1(%rbp), %rbx
	jle	.L151
	movq	%rbx, %rdx
	.p2align 4,,10
	.p2align 3
.L133:
	movq	%rdx, %rax
	addq	$1, %rdx
	cmpb	$32, (%rdx)
	jg	.L133
	subq	%rbp, %rax
	movslq	%eax, %rcx
	imull	$107, %eax, %eax
	addq	%rbp, %rcx
.L132:
	movb	$0, (%rdx)
	movsbl	1(%rbp), %edx
	movsbl	(%rcx), %ecx
	imull	$101, %edx, %edx
	imull	$103, %ecx, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	movslq	%eax, %rdx
	movl	%eax, %ecx
	imulq	$-2109059487, %rdx, %rdx
	sarl	$31, %ecx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$8, %edx
	subl	%ecx, %edx
	imull	$503, %edx, %edx
	subl	%edx, %eax
	movslq	%eax, %rbp
	salq	$4, %rbp
	addq	$hash, %rbp
	jmp	.L137
	.p2align 4,,10
	.p2align 3
.L138:
	movq	%rbx, %rsi
	call	strcmp
	testl	%eax, %eax
	je	.L235
	addq	$16, %rbp
	movl	$hash, %eax
	cmpq	%rbp, %r14
	cmove	%rax, %rbp
.L137:
	movq	0(%rbp), %rdi
	testq	%rdi, %rdi
	jne	.L138
	jmp	.L128
.L235:
	movslq	8(%rbp), %rax
	testl	%eax, %eax
	js	.L128
	movl	cross(,%rax,4), %edx
	addl	cross(,%r15,4), %edx
	jne	.L128
	imulq	$202, %r15, %r15
	cmpb	$0, rel(%rax,%r15)
	je	.L128
	movl	$.LC1, %edi
	call	puts
	jmp	.L139
.L150:
	xorl	%edx, %edx
	movq	$-1, %rcx
	movq	%r12, %rbp
	jmp	.L124
.L151:
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	jmp	.L132
.L106:
	movl	%ebx, %r9d
	movl	%ebx, %r11d
	leal	-1(%rbx), %edi
	xorl	%edx, %edx
	shrl	$4, %r9d
	andl	$-16, %r11d
	xorl	%r10d, %r10d
	jmp	.L113
	.p2align 4,,10
	.p2align 3
.L108:
	movdqu	rel(%rdx), %xmm0
	movdqu	tmp(%rdx), %xmm2
	por	%xmm2, %xmm0
	movups	%xmm0, rel(%rdx)
	cmpl	$1, %r9d
	je	.L112
	movdqu	rel+16(%rdx), %xmm0
	movdqu	tmp+16(%rdx), %xmm3
	por	%xmm3, %xmm0
	movups	%xmm0, rel+16(%rdx)
	cmpl	$2, %r9d
	je	.L112
	movdqu	rel+32(%rdx), %xmm0
	movdqu	tmp+32(%rdx), %xmm4
	por	%xmm4, %xmm0
	movups	%xmm0, rel+32(%rdx)
	cmpl	$3, %r9d
	je	.L112
	movdqu	rel+48(%rdx), %xmm0
	movdqu	tmp+48(%rdx), %xmm5
	por	%xmm5, %xmm0
	movups	%xmm0, rel+48(%rdx)
	cmpl	$4, %r9d
	je	.L112
	movdqu	rel+64(%rdx), %xmm0
	movdqu	tmp+64(%rdx), %xmm6
	por	%xmm6, %xmm0
	movups	%xmm0, rel+64(%rdx)
	cmpl	$5, %r9d
	je	.L112
	movdqu	rel+80(%rdx), %xmm0
	movdqu	tmp+80(%rdx), %xmm7
	por	%xmm7, %xmm0
	movups	%xmm0, rel+80(%rdx)
	cmpl	$6, %r9d
	je	.L112
	movdqu	rel+96(%rdx), %xmm0
	movdqu	tmp+96(%rdx), %xmm7
	por	%xmm7, %xmm0
	movups	%xmm0, rel+96(%rdx)
	cmpl	$7, %r9d
	je	.L112
	movdqu	rel+112(%rdx), %xmm0
	movdqu	tmp+112(%rdx), %xmm6
	por	%xmm6, %xmm0
	movups	%xmm0, rel+112(%rdx)
	cmpl	$8, %r9d
	je	.L112
	movdqu	rel+128(%rdx), %xmm0
	movdqu	tmp+128(%rdx), %xmm5
	por	%xmm5, %xmm0
	movups	%xmm0, rel+128(%rdx)
	cmpl	$9, %r9d
	je	.L112
	movdqu	rel+144(%rdx), %xmm0
	movdqu	tmp+144(%rdx), %xmm4
	por	%xmm4, %xmm0
	movups	%xmm0, rel+144(%rdx)
	cmpl	$10, %r9d
	je	.L112
	movdqu	rel+160(%rdx), %xmm0
	movdqu	tmp+160(%rdx), %xmm6
	por	%xmm6, %xmm0
	movups	%xmm0, rel+160(%rdx)
	cmpl	$12, %r9d
	jne	.L112
	movdqu	rel+176(%rdx), %xmm7
	movdqu	tmp+176(%rdx), %xmm0
	por	%xmm7, %xmm0
	movups	%xmm0, rel+176(%rdx)
	.p2align 4,,10
	.p2align 3
.L112:
	cmpl	%ebx, %r11d
	je	.L236
	movl	%r11d, %ecx
	movl	%r11d, %esi
.L107:
	movl	%ebx, %r8d
	subl	%ecx, %r8d
	leal	-1(%r8), %ebp
	cmpl	$6, %ebp
	jbe	.L110
	addq	%rdx, %rcx
	movq	rel(%rcx), %xmm1
	movq	tmp(%rcx), %xmm0
	por	%xmm1, %xmm0
	movq	%xmm0, rel(%rcx)
	movl	%r8d, %ecx
	andl	$-8, %ecx
	addl	%ecx, %esi
	andl	$7, %r8d
	je	.L111
.L110:
	movslq	%r10d, %r8
	movslq	%esi, %rcx
	imulq	$202, %r8, %r8
	leaq	rel(%r8), %rbp
	leaq	0(%rbp,%rcx), %r13
	movzbl	0(%r13), %r14d
	orb	tmp(%rcx,%r8), %r14b
	leal	1(%rsi), %ecx
	addq	$tmp, %r8
	movb	%r14b, 0(%r13)
	cmpl	%ebx, %ecx
	jge	.L111
	movslq	%ecx, %rcx
	movzbl	(%r8,%rcx), %r13d
	orb	%r13b, 0(%rbp,%rcx)
	leal	2(%rsi), %ecx
	cmpl	%ebx, %ecx
	jge	.L111
	movslq	%ecx, %rcx
	leaq	0(%rbp,%rcx), %r14
	movzbl	(%r14), %r13d
	orb	(%r8,%rcx), %r13b
	leal	3(%rsi), %ecx
	movb	%r13b, (%r14)
	cmpl	%ebx, %ecx
	jge	.L111
	movslq	%ecx, %rcx
	movzbl	(%r8,%rcx), %r13d
	orb	%r13b, 0(%rbp,%rcx)
	leal	4(%rsi), %ecx
	cmpl	%ebx, %ecx
	jge	.L111
	movslq	%ecx, %rcx
	leaq	0(%rbp,%rcx), %r14
	movzbl	(%r14), %r13d
	orb	(%r8,%rcx), %r13b
	leal	5(%rsi), %ecx
	movb	%r13b, (%r14)
	cmpl	%ebx, %ecx
	jge	.L111
	movslq	%ecx, %rcx
	leaq	0(%rbp,%rcx), %r14
	movzbl	(%r14), %r13d
	orb	(%r8,%rcx), %r13b
	leal	6(%rsi), %ecx
	movb	%r13b, (%r14)
	cmpl	%ebx, %ecx
	jge	.L111
	movslq	%ecx, %rcx
	movzbl	(%r8,%rcx), %esi
	orb	%sil, 0(%rbp,%rcx)
.L111:
	addl	$1, %r10d
	addq	$202, %rdx
	cmpl	%ebx, %r10d
	je	.L109
.L113:
	cmpl	$14, %edi
	ja	.L108
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L233:
	cmpb	$0, rel(%rsi,%rax)
	je	.L226
	movb	$1, rel(%rcx,%rax)
.L226:
	cmpq	%rax, %rdi
	je	.L118
	addq	$1, %rax
	jmp	.L122
.L89:
	movl	$40804, %edx
	xorl	%esi, %esi
	movl	$tmp, %edi
	call	memset
	jmp	.L95
.L167:
	addq	$72, %rsp
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
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.globl	cross
	.bss
	.align 32
	.type	cross, @object
	.size	cross, 808
cross:
	.zero	808
	.globl	tmp
	.align 32
	.type	tmp, @object
	.size	tmp, 40804
tmp:
	.zero	40804
	.globl	rel
	.align 32
	.type	rel, @object
	.size	rel, 40804
rel:
	.zero	40804
	.globl	sz
	.align 4
	.type	sz, @object
	.size	sz, 4
sz:
	.zero	4
	.globl	name
	.align 32
	.type	name, @object
	.size	name, 7272
name:
	.zero	7272
	.globl	hashend
	.data
	.align 8
	.type	hashend, @object
	.size	hashend, 8
hashend:
	.quad	hash+8048
	.globl	hash
	.bss
	.align 32
	.type	hash, @object
	.size	hash, 8080
hash:
	.zero	8080
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
