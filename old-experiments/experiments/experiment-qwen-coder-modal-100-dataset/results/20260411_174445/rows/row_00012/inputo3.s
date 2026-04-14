	.file	"inputC.c"
	.text
	.p2align 4
	.type	union_find_root, @function
union_find_root:
.LFB21:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movslq	%esi, %rdx
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdx, %rax
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	(%rdi), %rcx
	leaq	(%rcx,%rdx,4), %rbx
	movl	(%rbx), %edx
	cmpl	%eax, %edx
	jne	.L8
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
.L8:
	.cfi_restore_state
	movslq	%edx, %rax
	leaq	(%rcx,%rax,4), %rbp
	movl	0(%rbp), %eax
	cmpl	%eax, %edx
	je	.L3
	movslq	%eax, %rdx
	leaq	(%rcx,%rdx,4), %r12
	movl	(%r12), %edx
	cmpl	%edx, %eax
	jne	.L9
	movl	%edx, 0(%rbp)
	movl	%edx, %eax
.L3:
	movl	%eax, (%rbx)
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
.L9:
	.cfi_restore_state
	movslq	%edx, %rax
	leaq	(%rcx,%rax,4), %r13
	movl	0(%r13), %esi
	cmpl	%esi, %edx
	je	.L5
	call	union_find_root
	movl	%eax, 0(%r13)
	movl	%eax, %esi
.L5:
	movl	%esi, %edx
	movl	%esi, (%r12)
	movl	%edx, %eax
	movl	%edx, 0(%rbp)
	jmp	.L3
	.cfi_endproc
.LFE21:
	.size	union_find_root, .-union_find_root
	.p2align 4
	.type	union_find_size, @function
union_find_size:
.LFB22:
	.cfi_startproc
	movq	(%rdi), %rdx
	movslq	%esi, %rax
	movq	16(%rdi), %r9
	leaq	(%rdx,%rax,4), %r8
	movslq	(%r8), %rax
	cmpl	%eax, %esi
	jne	.L25
	movl	(%r9,%rax,4), %eax
	ret
	.p2align 4,,10
	.p2align 3
.L25:
	movslq	%eax, %rcx
	leaq	(%rdx,%rcx,4), %r10
	movl	(%r10), %ecx
	cmpl	%ecx, %eax
	je	.L21
	movslq	%ecx, %rax
	leaq	(%rdx,%rax,4), %r11
	movl	(%r11), %eax
	cmpl	%eax, %ecx
	jne	.L26
	movl	%eax, (%r10)
	movl	%eax, %ecx
.L21:
	movslq	%ecx, %rax
	movl	%ecx, (%r8)
	movl	(%r9,%rax,4), %eax
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	movslq	%eax, %rcx
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
	leaq	(%rdx,%rcx,4), %rbx
	movl	(%rbx), %ecx
	cmpl	%ecx, %eax
	je	.L14
	movslq	%ecx, %rax
	leaq	(%rdx,%rax,4), %rbp
	movl	0(%rbp), %eax
	cmpl	%eax, %ecx
	jne	.L27
.L15:
	movl	%eax, (%rbx)
	movl	%eax, %ecx
.L14:
	movslq	%ecx, %rax
	movl	%ecx, (%r11)
	movl	%ecx, (%r10)
	movl	%ecx, (%r8)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	(%r9,%rax,4), %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L27:
	.cfi_restore_state
	movslq	%eax, %rcx
	leaq	(%rdx,%rcx,4), %r12
	movl	(%r12), %ecx
	cmpl	%ecx, %eax
	je	.L16
	movslq	%ecx, %rax
	leaq	(%rdx,%rax,4), %r13
	movl	0(%r13), %esi
	cmpl	%esi, %ecx
	je	.L17
	movslq	%esi, %rax
	leaq	(%rdx,%rax,4), %r14
	movl	(%r14), %eax
	cmpl	%eax, %esi
	je	.L18
	movl	%eax, %esi
	call	union_find_root
	movl	%eax, (%r14)
.L18:
	movl	%eax, 0(%r13)
	movl	%eax, %esi
.L17:
	movl	%esi, (%r12)
	movl	%esi, %ecx
.L16:
	movl	%ecx, 0(%rbp)
	movl	%ecx, %eax
	jmp	.L15
	.cfi_endproc
.LFE22:
	.size	union_find_size, .-union_find_size
	.p2align 4
	.type	union_find_unite, @function
union_find_unite:
.LFB23:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movslq	%esi, %rax
	movl	%edx, %r9d
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
	movq	(%rdi), %r8
	leaq	(%r8,%rax,4), %r10
	movl	(%r10), %ebx
	cmpl	%ebx, %esi
	jne	.L57
.L29:
	movslq	%r9d, %rax
	leaq	(%r8,%rax,4), %r10
	movl	(%r10), %eax
	cmpl	%eax, %r9d
	jne	.L58
.L40:
	cmpl	%ebx, %eax
	je	.L28
	movq	8(%rdi), %rsi
	movslq	%eax, %r10
	movq	16(%rdi), %rdi
	movslq	%ebx, %rcx
	leaq	0(,%r10,4), %rdx
	leaq	(%rsi,%rdx), %r9
	addq	%rdi, %rdx
	leaq	(%rdi,%rcx,4), %rdi
	movl	(%r9), %r15d
	cmpl	%r15d, (%rsi,%rcx,4)
	jge	.L52
	movl	%eax, (%r8,%rcx,4)
	movl	(%rdi), %eax
	addl	%eax, (%rdx)
.L28:
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
.L52:
	.cfi_restore_state
	jle	.L53
	movl	%ebx, (%r8,%r10,4)
	movl	(%rdx), %eax
	addl	%eax, (%rdi)
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
.L58:
	.cfi_restore_state
	movslq	%eax, %rdx
	leaq	(%r8,%rdx,4), %r9
	movl	(%r9), %edx
	cmpl	%edx, %eax
	je	.L41
	movslq	%edx, %rax
	leaq	(%r8,%rax,4), %r11
	movl	(%r11), %eax
	cmpl	%eax, %edx
	jne	.L59
.L42:
	movl	%eax, (%r9)
	movl	%eax, %edx
.L41:
	movl	%edx, (%r10)
	movl	%edx, %eax
	jmp	.L40
	.p2align 4,,10
	.p2align 3
.L57:
	movslq	%ebx, %rax
	leaq	(%r8,%rax,4), %r11
	movl	(%r11), %eax
	cmpl	%eax, %ebx
	je	.L30
	movslq	%eax, %rdx
	leaq	(%r8,%rdx,4), %rbx
	movl	(%rbx), %edx
	cmpl	%edx, %eax
	jne	.L60
.L31:
	movl	%edx, (%r11)
	movl	%edx, %eax
.L30:
	movl	%eax, (%r10)
	movl	%eax, %ebx
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L53:
	movl	%eax, (%r8,%rcx,4)
	addl	$1, (%r9)
	movl	(%rdi), %eax
	addl	%eax, (%rdx)
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
.L60:
	.cfi_restore_state
	movslq	%edx, %rax
	leaq	(%r8,%rax,4), %rbp
	movl	0(%rbp), %eax
	cmpl	%eax, %edx
	je	.L32
	movslq	%eax, %rdx
	leaq	(%r8,%rdx,4), %r12
	movl	(%r12), %edx
	cmpl	%edx, %eax
	jne	.L61
.L33:
	movl	%edx, 0(%rbp)
	movl	%edx, %eax
.L32:
	movl	%eax, (%rbx)
	movl	%eax, %edx
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L59:
	movslq	%eax, %rdx
	leaq	(%r8,%rdx,4), %rbp
	movl	0(%rbp), %edx
	cmpl	%edx, %eax
	je	.L43
	movslq	%edx, %rax
	leaq	(%r8,%rax,4), %r12
	movl	(%r12), %eax
	cmpl	%eax, %edx
	jne	.L62
.L44:
	movl	%eax, 0(%rbp)
	movl	%eax, %edx
.L43:
	movl	%edx, (%r11)
	movl	%edx, %eax
	jmp	.L42
	.p2align 4,,10
	.p2align 3
.L62:
	movslq	%eax, %rdx
	leaq	(%r8,%rdx,4), %r13
	movl	0(%r13), %edx
	cmpl	%edx, %eax
	je	.L45
	movslq	%edx, %rax
	leaq	(%r8,%rax,4), %r14
	movl	(%r14), %eax
	cmpl	%eax, %edx
	je	.L46
	movslq	%eax, %rdx
	leaq	(%r8,%rdx,4), %r15
	movl	(%r15), %ecx
	cmpl	%ecx, %eax
	je	.L47
	movslq	%ecx, %rax
	leaq	(%r8,%rax,4), %rdx
	movl	(%rdx), %esi
	cmpl	%esi, %ecx
	je	.L48
	movslq	%esi, %rax
	leaq	(%r8,%rax,4), %rax
	movq	%rax, 8(%rsp)
	movl	(%rax), %eax
	cmpl	%eax, %esi
	je	.L55
	movslq	%eax, %rcx
	leaq	(%r8,%rcx,4), %rcx
	movl	(%rcx), %esi
	movq	%rcx, 24(%rsp)
	cmpl	%esi, %eax
	je	.L50
	movq	%rdx, 16(%rsp)
	call	union_find_root
	movq	24(%rsp), %rcx
	movq	16(%rsp), %rdx
	movl	%eax, %esi
	movl	%eax, (%rcx)
.L50:
	movq	8(%rsp), %rax
	movl	%esi, (%rax)
.L49:
	movl	%esi, (%rdx)
.L48:
	movl	%esi, (%r15)
	movl	%esi, %ecx
.L47:
	movl	%ecx, (%r14)
	movl	%ecx, %eax
.L46:
	movl	%eax, 0(%r13)
	movl	%eax, %edx
.L45:
	movl	%edx, (%r12)
	movl	%edx, %eax
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L61:
	movslq	%edx, %rax
	leaq	(%r8,%rax,4), %r13
	movl	0(%r13), %eax
	cmpl	%eax, %edx
	je	.L34
	movslq	%eax, %rdx
	leaq	(%r8,%rdx,4), %r14
	movl	(%r14), %edx
	cmpl	%edx, %eax
	je	.L35
	movslq	%edx, %rax
	leaq	(%r8,%rax,4), %r15
	movl	(%r15), %eax
	cmpl	%eax, %edx
	je	.L36
	movslq	%eax, %rdx
	leaq	(%r8,%rdx,4), %rdx
	movl	(%rdx), %esi
	cmpl	%esi, %eax
	je	.L37
	movslq	%esi, %rax
	leaq	(%r8,%rax,4), %rax
	movq	%rax, 8(%rsp)
	movl	(%rax), %eax
	cmpl	%eax, %esi
	je	.L54
	movslq	%eax, %rcx
	leaq	(%r8,%rcx,4), %rcx
	movl	(%rcx), %esi
	movq	%rcx, 24(%rsp)
	cmpl	%esi, %eax
	je	.L39
	movq	%rdx, 16(%rsp)
	call	union_find_root
	movq	24(%rsp), %rcx
	movq	16(%rsp), %rdx
	movl	%eax, %esi
	movl	%eax, (%rcx)
.L39:
	movq	8(%rsp), %rax
	movl	%esi, (%rax)
.L38:
	movl	%esi, (%rdx)
.L37:
	movl	%esi, (%r15)
	movl	%esi, %eax
.L36:
	movl	%eax, (%r14)
	movl	%eax, %edx
.L35:
	movl	%edx, 0(%r13)
	movl	%edx, %eax
.L34:
	movl	%eax, (%r12)
	movl	%eax, %edx
	jmp	.L33
.L55:
	movl	%eax, %esi
	jmp	.L49
.L54:
	movl	%eax, %esi
	jmp	.L38
	.cfi_endproc
.LFE23:
	.size	union_find_unite, .-union_find_unite
	.p2align 4
	.globl	nextint
	.type	nextint, @function
nextint:
.LFB13:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	call	getchar_unlocked
	leal	-48(%rax), %ecx
	cmpb	$9, %cl
	seta	%bl
	cmpb	$45, %al
	setne	%cl
	andb	%cl, %bl
	je	.L64
	.p2align 4,,10
	.p2align 3
.L65:
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpb	$45, %al
	leal	-48(%rax), %esi
	movsbl	%al, %edx
	setne	%bl
	cmpb	$9, %sil
	seta	%cl
	andb	%cl, %bl
	jne	.L65
	cmpb	$45, %al
	je	.L69
	cmpb	$9, %sil
	ja	.L75
.L67:
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L71:
	leal	0(%rbp,%rbp,4), %eax
	leal	(%rdx,%rax,2), %r12d
	xorl	%eax, %eax
	call	getchar_unlocked
	leal	-48(%r12), %ebp
	movsbl	%al, %edx
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L71
	movl	$48, %eax
	subl	%r12d, %eax
	testb	%bl, %bl
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	cmove	%ebp, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L64:
	.cfi_restore_state
	movsbl	%al, %edx
	cmpb	$45, %al
	jne	.L67
	.p2align 4,,10
	.p2align 3
.L69:
	xorl	%eax, %eax
	movl	$1, %ebx
	call	getchar_unlocked
	movsbl	%al, %edx
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L67
.L75:
	popq	%rbx
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE13:
	.size	nextint, .-nextint
	.p2align 4
	.globl	nextlong
	.type	nextlong, @function
nextlong:
.LFB14:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	call	getchar_unlocked
	leal	-48(%rax), %ecx
	movsbq	%al, %rdx
	cmpb	$9, %cl
	jbe	.L81
	cmpb	$45, %al
	je	.L81
	.p2align 4,,10
	.p2align 3
.L82:
	xorl	%eax, %eax
	call	getchar_unlocked
	movsbq	%al, %rdx
	leal	-48(%rax), %ecx
	cmpb	$45, %al
	je	.L87
	cmpb	$9, %cl
	ja	.L82
	cmpb	$45, %al
	je	.L87
	cmpb	$9, %cl
	ja	.L94
	xorl	%ebx, %ebx
.L85:
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L89:
	leaq	0(%rbp,%rbp,4), %rax
	leaq	(%rdx,%rax,2), %r12
	xorl	%eax, %eax
	call	getchar_unlocked
	leaq	-48(%r12), %rbp
	movsbq	%al, %rdx
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L89
	movl	$48, %eax
	subq	%r12, %rax
	testl	%ebx, %ebx
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	cmove	%rbp, %rax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L81:
	.cfi_restore_state
	xorl	%ebx, %ebx
	cmpb	$45, %al
	jne	.L85
	.p2align 4,,10
	.p2align 3
.L87:
	xorl	%eax, %eax
	movl	$1, %ebx
	call	getchar_unlocked
	movsbq	%al, %rdx
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L85
.L94:
	popq	%rbx
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE14:
	.size	nextlong, .-nextlong
	.p2align 4
	.globl	nextstr
	.type	nextstr, @function
nextstr:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%eax, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	getchar_unlocked
	cmpb	$32, %al
	je	.L120
	movl	%eax, %edx
	jmp	.L124
	.p2align 4,,10
	.p2align 3
.L120:
	xorl	%eax, %eax
	call	getchar_unlocked
	movl	%eax, %edx
	cmpb	$32, %al
	je	.L120
.L124:
	cmpb	$10, %al
	je	.L120
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L112:
	movb	%dl, (%rbx)
	xorl	%eax, %eax
	addq	$1, %rbx
	addl	$1, %ebp
	call	getchar_unlocked
	movl	%eax, %edx
	cmpb	$32, %al
	je	.L114
	cmpb	$10, %al
	jne	.L112
.L114:
	movb	$0, (%rbx)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movl	%ebp, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE15:
	.size	nextstr, .-nextstr
	.p2align 4
	.globl	printint
	.type	printint, @function
printint:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edi, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movq	stdout(%rip), %rsi
	testl	%edi, %edi
	js	.L144
	je	.L145
.L127:
	movl	%ebx, %eax
	movl	$3435973837, %ecx
	imulq	%rcx, %rax
	shrq	$35, %rax
	leal	(%rax,%rax,4), %edx
	addl	%edx, %edx
	subl	%edx, %ebx
	addl	$48, %ebx
	movb	%bl, 6(%rsp)
	testl	%eax, %eax
	je	.L129
	movl	%eax, %edx
	imulq	%rcx, %rdx
	shrq	$35, %rdx
	leal	(%rdx,%rdx,4), %edi
	addl	%edi, %edi
	subl	%edi, %eax
	addl	$48, %eax
	movb	%al, 7(%rsp)
	testl	%edx, %edx
	je	.L131
	movl	%edx, %eax
	imulq	%rcx, %rax
	shrq	$35, %rax
	leal	(%rax,%rax,4), %edi
	addl	%edi, %edi
	subl	%edi, %edx
	addl	$48, %edx
	movb	%dl, 8(%rsp)
	testl	%eax, %eax
	je	.L132
	movl	%eax, %edx
	imulq	%rcx, %rdx
	shrq	$35, %rdx
	leal	(%rdx,%rdx,4), %edi
	addl	%edi, %edi
	subl	%edi, %eax
	addl	$48, %eax
	movb	%al, 9(%rsp)
	testl	%edx, %edx
	je	.L133
	movl	%edx, %eax
	imulq	%rcx, %rax
	shrq	$35, %rax
	leal	(%rax,%rax,4), %edi
	addl	%edi, %edi
	subl	%edi, %edx
	addl	$48, %edx
	movb	%dl, 10(%rsp)
	testl	%eax, %eax
	je	.L134
	movl	%eax, %edx
	imulq	%rcx, %rdx
	shrq	$35, %rdx
	leal	(%rdx,%rdx,4), %edi
	addl	%edi, %edi
	subl	%edi, %eax
	addl	$48, %eax
	movb	%al, 11(%rsp)
	testl	%edx, %edx
	je	.L135
	movl	%edx, %eax
	imulq	%rcx, %rax
	shrq	$35, %rax
	leal	(%rax,%rax,4), %edi
	addl	%edi, %edi
	subl	%edi, %edx
	addl	$48, %edx
	movb	%dl, 12(%rsp)
	testl	%eax, %eax
	je	.L136
	movl	%eax, %edx
	imulq	%rcx, %rdx
	shrq	$35, %rdx
	leal	(%rdx,%rdx,4), %edi
	addl	%edi, %edi
	subl	%edi, %eax
	addl	$48, %eax
	movb	%al, 13(%rsp)
	testl	%edx, %edx
	je	.L137
	movl	%edx, %eax
	imulq	%rcx, %rax
	shrq	$35, %rax
	leal	(%rax,%rax,4), %ecx
	addl	%ecx, %ecx
	subl	%ecx, %edx
	addl	$48, %edx
	movb	%dl, 14(%rsp)
	testl	%eax, %eax
	je	.L138
	addl	$48, %eax
	movb	%al, 15(%rsp)
	movl	$9, %eax
.L129:
	cltq
	leaq	5(%rsp), %rbp
	leaq	6(%rsp,%rax), %rbx
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L146:
	movq	stdout(%rip), %rsi
.L130:
	movsbl	(%rbx), %edi
	subq	$1, %rbx
	call	putc
	cmpq	%rbp, %rbx
	jne	.L146
.L128:
	movq	stdout(%rip), %rsi
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$10, %edi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	putc
	.p2align 4,,10
	.p2align 3
.L145:
	.cfi_restore_state
	movl	$48, %edi
	call	putc
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L144:
	movl	$45, %edi
	negl	%ebx
	call	putc
	movq	stdout(%rip), %rsi
	jmp	.L127
.L134:
	movl	$4, %eax
	jmp	.L129
.L131:
	movl	$1, %eax
	jmp	.L129
.L132:
	movl	$2, %eax
	jmp	.L129
.L133:
	movl	$3, %eax
	jmp	.L129
.L135:
	movl	$5, %eax
	jmp	.L129
.L136:
	movl	$6, %eax
	jmp	.L129
.L137:
	movl	$7, %eax
	jmp	.L129
.L138:
	movl	$8, %eax
	jmp	.L129
	.cfi_endproc
.LFE16:
	.size	printint, .-printint
	.p2align 4
	.globl	printlong
	.type	printlong, @function
printlong:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	movq	stdout(%rip), %rsi
	testq	%rdi, %rdi
	js	.L156
	je	.L157
.L149:
	movabsq	$7378697629483820647, %rdi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L151:
	movq	%rbx, %rax
	imulq	%rdi
	movq	%rbx, %rax
	sarq	$63, %rax
	sarq	$2, %rdx
	subq	%rax, %rdx
	leaq	(%rdx,%rdx,4), %rax
	addq	%rax, %rax
	subq	%rax, %rbx
	movq	%rcx, %rax
	addl	$48, %ebx
	movb	%bl, (%rsp,%rcx)
	movq	%rdx, %rbx
	addq	$1, %rcx
	testq	%rdx, %rdx
	jne	.L151
	movslq	%eax, %rdx
	leaq	-1(%rsp,%rdx), %rbp
	leaq	(%rsp,%rdx), %rbx
	subq	%rax, %rbp
	jmp	.L152
	.p2align 4,,10
	.p2align 3
.L158:
	movq	stdout(%rip), %rsi
.L152:
	movsbl	(%rbx), %edi
	subq	$1, %rbx
	call	putc
	cmpq	%rbx, %rbp
	jne	.L158
.L150:
	movq	stdout(%rip), %rsi
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$10, %edi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	putc
	.p2align 4,,10
	.p2align 3
.L157:
	.cfi_restore_state
	movl	$48, %edi
	call	putc
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L156:
	movl	$45, %edi
	negq	%rbx
	call	putc
	movq	stdout(%rip), %rsi
	jmp	.L149
	.cfi_endproc
.LFE17:
	.size	printlong, .-printlong
	.p2align 4
	.globl	rsort_d32
	.type	rsort_d32, @function
rsort_d32:
.LFB18:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%edx, %eax
	movslq	%ecx, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	imull	%esi, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %ebx
	movl	%ebx, %r12d
	movl	%ebx, %r14d
	andl	$-4, %r12d
	andl	$3, %r14d
	subq	$1096, %rsp
	.cfi_def_cfa_offset 1152
	movq	%rdi, 24(%rsp)
	movslq	%eax, %rdi
	salq	$2, %rdi
	call	malloc
	movslq	%ebx, %r8
	leal	2(%r12), %ecx
	movl	%ebx, %r9d
	movq	%rax, %r11
	leal	-1(%rbp), %eax
	salq	$2, %r8
	movl	%ecx, 32(%rsp)
	movl	%eax, 40(%rsp)
	cltq
	shrl	$2, %r9d
	movq	24(%rsp), %rdx
	imulq	%r8, %rax
	movl	%r14d, 8(%rsp)
	salq	$4, %r9
	xorl	%r10d, %r10d
	leaq	0(,%r15,4), %rsi
	movq	%rsi, 56(%rsp)
	leaq	1088(%rsp), %rsi
	movq	%rax, 48(%rsp)
	leal	-1(%rbx), %eax
	movl	%eax, 44(%rsp)
	leal	1(%r12), %eax
	movslq	%r12d, %r12
	movl	%eax, 12(%rsp)
	movslq	%eax, %r13
	movslq	%ecx, %rax
	movq	%rax, 16(%rsp)
.L171:
	movl	$128, %ecx
	leaq	64(%rsp), %rdi
	xorl	%eax, %eax
	rep stosq
	testl	%ebp, %ebp
	jle	.L160
	movq	56(%rsp), %rax
	movl	%r10d, %ecx
	leaq	(%rdx,%rax), %rdi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L161:
	movl	(%rdi), %r14d
	addl	$1, %eax
	addq	%r8, %rdi
	sarl	%cl, %r14d
	movzbl	%r14b, %r14d
	addl	$1, 64(%rsp,%r14,4)
	cmpl	%eax, %ebp
	jne	.L161
	movl	%ecx, %r10d
.L160:
	movl	64(%rsp), %ecx
	leaq	68(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L162:
	addl	(%rax), %ecx
	addq	$4, %rax
	movl	%ecx, -4(%rax)
	cmpq	%rsi, %rax
	jne	.L162
	movl	40(%rsp), %r14d
	testl	%r14d, %r14d
	js	.L163
	movq	48(%rsp), %rax
	movq	%rdx, 24(%rsp)
	movl	%r10d, %ecx
	movl	%ebp, 36(%rsp)
	movl	44(%rsp), %ebp
	leaq	(%rdx,%rax), %rdi
	.p2align 4,,10
	.p2align 3
.L170:
	movl	(%rdi,%r15,4), %eax
	sarl	%cl, %eax
	movzbl	%al, %eax
	movl	64(%rsp,%rax,4), %edx
	subl	$1, %edx
	movl	%edx, 64(%rsp,%rax,4)
	testl	%ebx, %ebx
	jle	.L164
	movslq	%edx, %rdx
	imulq	%r8, %rdx
	addq	%r11, %rdx
	cmpl	$2, %ebp
	jbe	.L172
	leaq	4(%rdi), %rax
	movq	%rdx, %r10
	subq	%rax, %r10
	xorl	%eax, %eax
	cmpq	$8, %r10
	ja	.L166
	.p2align 4,,10
	.p2align 3
.L168:
	movl	(%rdi,%rax), %r10d
	movl	%r10d, (%rdx,%rax)
	addq	$4, %rax
	cmpq	%r8, %rax
	jne	.L168
.L164:
	subl	$1, %r14d
	subq	%r8, %rdi
	cmpl	$-1, %r14d
	jne	.L170
.L186:
	movq	24(%rsp), %rdx
	movl	36(%rsp), %ebp
	movl	%ecx, %r10d
.L163:
	addl	$8, %r10d
	movq	%r11, %rax
	movq	%rdx, %r11
	cmpl	$32, %r10d
	je	.L185
	movq	%rax, %rdx
	jmp	.L171
	.p2align 4,,10
	.p2align 3
.L166:
	movdqu	(%rdi,%rax), %xmm0
	movups	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpq	%rax, %r9
	jne	.L166
	movl	8(%rsp), %eax
	testl	%eax, %eax
	je	.L164
	movl	(%rdi,%r12,4), %eax
	movl	%eax, (%rdx,%r12,4)
	cmpl	%ebx, 12(%rsp)
	jge	.L164
	movl	(%rdi,%r13,4), %eax
	movl	%eax, (%rdx,%r13,4)
	movl	32(%rsp), %eax
	cmpl	%eax, %ebx
	jle	.L164
	movq	16(%rsp), %r10
	subl	$1, %r14d
	movl	(%rdi,%r10,4), %eax
	subq	%r8, %rdi
	movl	%eax, (%rdx,%r10,4)
	cmpl	$-1, %r14d
	jne	.L170
	jmp	.L186
	.p2align 4,,10
	.p2align 3
.L172:
	xorl	%eax, %eax
	jmp	.L168
.L185:
	addq	$1096, %rsp
	.cfi_def_cfa_offset 56
	movq	%rdx, %rdi
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
	jmp	free
	.cfi_endproc
.LFE18:
	.size	rsort_d32, .-rsort_d32
	.p2align 4
	.globl	rsortr_d32
	.type	rsortr_d32, @function
rsortr_d32:
.LFB19:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%edx, %eax
	movslq	%ecx, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	imull	%esi, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %ebx
	movl	%ebx, %r12d
	movl	%ebx, %r14d
	andl	$-4, %r12d
	andl	$3, %r14d
	subq	$1096, %rsp
	.cfi_def_cfa_offset 1152
	movq	%rdi, 24(%rsp)
	movslq	%eax, %rdi
	salq	$2, %rdi
	call	malloc
	movslq	%ebx, %r8
	leal	2(%r12), %ecx
	movl	%ebx, %r9d
	movq	%rax, %r11
	leal	-1(%rbp), %eax
	salq	$2, %r8
	movl	%ecx, 32(%rsp)
	movl	%eax, 40(%rsp)
	cltq
	shrl	$2, %r9d
	movq	24(%rsp), %rdx
	imulq	%r8, %rax
	movl	%r14d, 8(%rsp)
	salq	$4, %r9
	xorl	%r10d, %r10d
	leaq	0(,%r15,4), %rsi
	movq	%rsi, 56(%rsp)
	leaq	64(%rsp), %rsi
	movq	%rax, 48(%rsp)
	leal	-1(%rbx), %eax
	movl	%eax, 44(%rsp)
	leal	1(%r12), %eax
	movslq	%r12d, %r12
	movl	%eax, 12(%rsp)
	movslq	%eax, %r13
	movslq	%ecx, %rax
	movq	%rax, 16(%rsp)
.L199:
	movl	$128, %ecx
	movq	%rsi, %rdi
	xorl	%eax, %eax
	rep stosq
	testl	%ebp, %ebp
	jle	.L188
	movq	56(%rsp), %rax
	movl	%r10d, %ecx
	leaq	(%rdx,%rax), %rdi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L189:
	movl	(%rdi), %r14d
	addl	$1, %eax
	addq	%r8, %rdi
	sarl	%cl, %r14d
	movzbl	%r14b, %r14d
	addl	$1, 64(%rsp,%r14,4)
	cmpl	%eax, %ebp
	jne	.L189
	movl	%ecx, %r10d
.L188:
	movl	1084(%rsp), %ecx
	leaq	1080(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L190:
	addl	(%rax), %ecx
	movq	%rax, %rdi
	subq	$4, %rax
	movl	%ecx, 4(%rax)
	cmpq	%rsi, %rdi
	jne	.L190
	movl	40(%rsp), %r14d
	testl	%r14d, %r14d
	js	.L191
	movq	48(%rsp), %rax
	movq	%rdx, 24(%rsp)
	movl	%r10d, %ecx
	movl	%ebp, 36(%rsp)
	movl	44(%rsp), %ebp
	leaq	(%rdx,%rax), %rdi
	.p2align 4,,10
	.p2align 3
.L198:
	movl	(%rdi,%r15,4), %eax
	sarl	%cl, %eax
	movzbl	%al, %eax
	movl	64(%rsp,%rax,4), %edx
	subl	$1, %edx
	movl	%edx, 64(%rsp,%rax,4)
	testl	%ebx, %ebx
	jle	.L192
	movslq	%edx, %rdx
	imulq	%r8, %rdx
	addq	%r11, %rdx
	cmpl	$2, %ebp
	jbe	.L200
	leaq	4(%rdi), %rax
	movq	%rdx, %r10
	subq	%rax, %r10
	xorl	%eax, %eax
	cmpq	$8, %r10
	ja	.L194
	.p2align 4,,10
	.p2align 3
.L196:
	movl	(%rdi,%rax), %r10d
	movl	%r10d, (%rdx,%rax)
	addq	$4, %rax
	cmpq	%r8, %rax
	jne	.L196
.L192:
	subl	$1, %r14d
	subq	%r8, %rdi
	cmpl	$-1, %r14d
	jne	.L198
.L214:
	movq	24(%rsp), %rdx
	movl	36(%rsp), %ebp
	movl	%ecx, %r10d
.L191:
	addl	$8, %r10d
	movq	%r11, %rax
	movq	%rdx, %r11
	cmpl	$32, %r10d
	je	.L213
	movq	%rax, %rdx
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L194:
	movdqu	(%rdi,%rax), %xmm0
	movups	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpq	%rax, %r9
	jne	.L194
	movl	8(%rsp), %eax
	testl	%eax, %eax
	je	.L192
	movl	(%rdi,%r12,4), %eax
	movl	%eax, (%rdx,%r12,4)
	cmpl	%ebx, 12(%rsp)
	jge	.L192
	movl	(%rdi,%r13,4), %eax
	movl	%eax, (%rdx,%r13,4)
	movl	32(%rsp), %eax
	cmpl	%eax, %ebx
	jle	.L192
	movq	16(%rsp), %r10
	subl	$1, %r14d
	movl	(%rdi,%r10,4), %eax
	subq	%r8, %rdi
	movl	%eax, (%rdx,%r10,4)
	cmpl	$-1, %r14d
	jne	.L198
	jmp	.L214
	.p2align 4,,10
	.p2align 3
.L200:
	xorl	%eax, %eax
	jmp	.L196
.L213:
	addq	$1096, %rsp
	.cfi_def_cfa_offset 56
	movq	%rdx, %rdi
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
	jmp	free
	.cfi_endproc
.LFE19:
	.size	rsortr_d32, .-rsortr_d32
	.p2align 4
	.globl	union_find_init
	.type	union_find_init, @function
union_find_init:
.LFB24:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movslq	%esi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%r14, %r12
	salq	$2, %r14
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%r14, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	call	malloc
	movq	%r14, %rdi
	movq	%rax, 0(%r13)
	movq	%rax, %rbp
	call	malloc
	movq	%r14, %rdi
	movq	%rax, 8(%r13)
	movq	%rax, %rbx
	call	malloc
	movq	$union_find_size, 40(%r13)
	movq	%rax, 16(%r13)
	movq	%rax, %rdx
	movl	$union_find_root, %eax
	movq	%rax, %xmm0
	movhps	.LC3(%rip), %xmm0
	movups	%xmm0, 24(%r13)
	testl	%r12d, %r12d
	jle	.L215
	leal	-1(%r12), %eax
	cmpl	$2, %eax
	jbe	.L220
	movl	%r12d, %ecx
	movdqa	.LC0(%rip), %xmm0
	xorl	%eax, %eax
	movdqa	.LC1(%rip), %xmm3
	shrl	$2, %ecx
	movdqa	.LC2(%rip), %xmm1
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L218:
	movdqa	%xmm0, %xmm2
	movups	%xmm1, (%rbx,%rax)
	paddd	%xmm3, %xmm0
	movups	%xmm2, 0(%rbp,%rax)
	movups	%xmm1, (%rdx,%rax)
	addq	$16, %rax
	cmpq	%rax, %rcx
	jne	.L218
	movl	%r12d, %eax
	andl	$-4, %eax
	testb	$3, %r12b
	je	.L215
.L217:
	movslq	%eax, %rsi
	movl	%eax, 0(%rbp,%rsi,4)
	leaq	0(,%rsi,4), %rcx
	movl	$1, (%rbx,%rsi,4)
	movl	$1, (%rdx,%rsi,4)
	leal	1(%rax), %esi
	cmpl	%esi, %r12d
	jle	.L215
	addl	$2, %eax
	movl	%esi, 4(%rbp,%rcx)
	movl	$1, 4(%rbx,%rcx)
	movl	$1, 4(%rdx,%rcx)
	cmpl	%eax, %r12d
	jle	.L215
	movl	%eax, 8(%rbp,%rcx)
	movl	$1, 8(%rbx,%rcx)
	movl	$1, 8(%rdx,%rcx)
.L215:
	popq	%rbx
	.cfi_remember_state
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
.L220:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L217
	.cfi_endproc
.LFE24:
	.size	union_find_init, .-union_find_init
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
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
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	nextint
	movl	%eax, %r13d
	call	nextint
	leal	1(%r13), %esi
	movl	$d, %edi
	movl	%eax, %r14d
	call	union_find_init
	testl	%r14d, %r14d
	jle	.L244
	.p2align 4,,10
	.p2align 3
.L224:
	xorl	%eax, %eax
	call	getchar_unlocked
	leal	-48(%rax), %edx
	movsbl	%al, %esi
	cmpb	$9, %dl
	seta	%r12b
	cmpb	$45, %al
	setne	%dl
	andb	%dl, %r12b
	je	.L227
	.p2align 4,,10
	.p2align 3
.L228:
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpb	$45, %al
	leal	-48(%rax), %ecx
	movsbl	%al, %esi
	setne	%r12b
	cmpb	$9, %cl
	seta	%dl
	andb	%dl, %r12b
	jne	.L228
	cmpb	$45, %al
	je	.L232
	cmpb	$9, %cl
	ja	.L249
.L230:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L234:
	leal	(%rbx,%rbx,4), %eax
	leal	-48(%rsi,%rax,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	movsbl	%al, %esi
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L234
	testb	%r12b, %r12b
	je	.L274
	negl	%ebx
	.p2align 4,,10
	.p2align 3
.L274:
	xorl	%eax, %eax
	call	getchar_unlocked
	leal	-48(%rax), %ecx
	movsbl	%al, %edx
	cmpb	$9, %cl
	jbe	.L236
	cmpb	$45, %al
	jne	.L274
.L236:
	xorl	%r12d, %r12d
	cmpb	$45, %dl
	je	.L276
.L239:
	xorl	%r15d, %r15d
	.p2align 4,,10
	.p2align 3
.L241:
	leal	(%r15,%r15,4), %eax
	leal	-48(%rdx,%rax,2), %r15d
	xorl	%eax, %eax
	call	getchar_unlocked
	movsbl	%al, %edx
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L241
	movl	%r15d, %edx
	testb	%r12b, %r12b
	je	.L243
.L240:
	movl	%r15d, %edx
	negl	%edx
.L243:
	addl	$1, %ebp
	movl	%ebx, %esi
	movl	$d, %edi
	call	*d+32(%rip)
	cmpl	%ebp, %r14d
	jne	.L224
.L244:
	movl	$1, %ebx
	movl	$-1, %ebp
	testl	%r13d, %r13d
	jle	.L226
	.p2align 4,,10
	.p2align 3
.L225:
	movl	%ebx, %esi
	movl	$d, %edi
	call	*d+24(%rip)
	cmpl	%ebx, %eax
	sete	%al
	addl	$1, %ebx
	movzbl	%al, %eax
	addl	%eax, %ebp
	cmpl	%ebx, %r13d
	jge	.L225
.L226:
	movl	%ebp, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	addq	$8, %rsp
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
.L249:
	.cfi_restore_state
	xorl	%ebx, %ebx
	jmp	.L274
	.p2align 4,,10
	.p2align 3
.L227:
	cmpb	$45, %al
	jne	.L230
	.p2align 4,,10
	.p2align 3
.L232:
	xorl	%eax, %eax
	movl	$1, %r12d
	xorl	%ebx, %ebx
	call	getchar_unlocked
	movsbl	%al, %esi
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L230
	negl	%ebx
	jmp	.L274
	.p2align 4,,10
	.p2align 3
.L276:
	xorl	%eax, %eax
	call	getchar_unlocked
	movsbl	%al, %edx
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L251
	movl	$1, %r12d
	jmp	.L239
.L251:
	xorl	%r15d, %r15d
	jmp	.L240
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.globl	d
	.bss
	.align 32
	.type	d, @object
	.size	d, 48
d:
	.zero	48
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC1:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC2:
	.long	1
	.long	1
	.long	1
	.long	1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.quad	union_find_unite
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
