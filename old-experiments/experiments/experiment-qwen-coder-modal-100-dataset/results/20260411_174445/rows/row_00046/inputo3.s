	.file	"inputC.c"
	.text
	.p2align 4
	.globl	check
	.type	check, @function
check:
.LFB3:
	.cfi_startproc
	movl	%edi, %eax
	xorl	%edx, %edx
	orl	%esi, %eax
	js	.L1
	movl	w(%rip), %eax
	addl	$1, %eax
	cmpl	%edi, %eax
	jge	.L6
.L1:
	movl	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	movl	h(%rip), %eax
	xorl	%edx, %edx
	addl	$1, %eax
	cmpl	%eax, %esi
	setle	%dl
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE3:
	.size	check, .-check
	.p2align 4
	.globl	getWay
	.type	getWay, @function
getWay:
.LFB4:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
.L14:
	movslq	%ebp, %rdx
	movslq	%r12d, %rax
	leal	1(%r12), %ebx
	movl	%ebp, %edi
	leaq	(%rdx,%rdx,2), %rcx
	leaq	(%rdx,%rcx,4), %rdx
	movb	$2, map(%rax,%rdx,8)
	movl	%ebx, %eax
	shrl	$31, %eax
	addl	%eax, %ebx
	andl	$1, %ebx
	subl	%eax, %ebx
	movslq	%ebx, %rbx
	leaq	(%rbx,%rbx,2), %rax
	addl	dx(,%rax,8), %edi
	js	.L8
	movl	dy(,%rax,8), %esi
	movl	w(%rip), %eax
	addl	$1, %eax
	addl	%r12d, %esi
	cmpl	%edi, %eax
	jl	.L8
	testl	%esi, %esi
	jns	.L35
.L8:
	leaq	(%rbx,%rbx,2), %rax
	movl	%ebp, %edi
	salq	$3, %rax
	addl	dx+4(%rax), %edi
	js	.L9
	movl	dy+4(%rax), %esi
	movl	w(%rip), %eax
	addl	$1, %eax
	addl	%r12d, %esi
	cmpl	%eax, %edi
	jg	.L9
	testl	%esi, %esi
	jns	.L36
.L9:
	leaq	(%rbx,%rbx,2), %rax
	movl	%ebp, %edi
	salq	$3, %rax
	addl	dx+8(%rax), %edi
	js	.L10
	movl	dy+8(%rax), %esi
	movl	w(%rip), %eax
	addl	$1, %eax
	addl	%r12d, %esi
	cmpl	%eax, %edi
	jg	.L10
	testl	%esi, %esi
	jns	.L37
.L10:
	leaq	(%rbx,%rbx,2), %rax
	movl	%ebp, %edi
	salq	$3, %rax
	addl	dx+12(%rax), %edi
	js	.L11
	movl	dy+12(%rax), %esi
	movl	w(%rip), %eax
	addl	$1, %eax
	addl	%r12d, %esi
	cmpl	%eax, %edi
	jg	.L11
	testl	%esi, %esi
	jns	.L38
.L11:
	leaq	(%rbx,%rbx,2), %rax
	movl	%ebp, %edi
	salq	$3, %rax
	addl	dx+16(%rax), %edi
	js	.L12
	movl	dy+16(%rax), %esi
	movl	w(%rip), %eax
	addl	$1, %eax
	addl	%r12d, %esi
	cmpl	%eax, %edi
	jg	.L12
	testl	%esi, %esi
	jns	.L39
.L12:
	leaq	(%rbx,%rbx,2), %rax
	salq	$3, %rax
	addl	dx+20(%rax), %ebp
	js	.L7
	addl	dy+20(%rax), %r12d
	movl	w(%rip), %eax
	addl	$1, %eax
	cmpl	%eax, %ebp
	jg	.L7
	testl	%r12d, %r12d
	jns	.L40
.L7:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L35:
	.cfi_restore_state
	movl	h(%rip), %eax
	addl	$1, %eax
	cmpl	%eax, %esi
	jg	.L8
	movslq	%edi, %rdx
	movslq	%esi, %rax
	leaq	(%rdx,%rdx,2), %rcx
	leaq	(%rdx,%rcx,4), %rdx
	cmpb	$0, map(%rax,%rdx,8)
	jne	.L8
	call	getWay
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L36:
	movl	h(%rip), %eax
	addl	$1, %eax
	cmpl	%eax, %esi
	jg	.L9
	movslq	%edi, %rdx
	movslq	%esi, %rax
	leaq	(%rdx,%rdx,2), %rcx
	leaq	(%rdx,%rcx,4), %rdx
	cmpb	$0, map(%rax,%rdx,8)
	jne	.L9
	call	getWay
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L37:
	movl	h(%rip), %eax
	addl	$1, %eax
	cmpl	%eax, %esi
	jg	.L10
	movslq	%edi, %rdx
	movslq	%esi, %rax
	leaq	(%rdx,%rdx,2), %rcx
	leaq	(%rdx,%rcx,4), %rdx
	cmpb	$0, map(%rax,%rdx,8)
	jne	.L10
	call	getWay
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L38:
	movl	h(%rip), %eax
	addl	$1, %eax
	cmpl	%eax, %esi
	jg	.L11
	movslq	%edi, %rdx
	movslq	%esi, %rax
	leaq	(%rdx,%rdx,2), %rcx
	leaq	(%rdx,%rcx,4), %rdx
	cmpb	$0, map(%rax,%rdx,8)
	jne	.L11
	call	getWay
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L39:
	movl	h(%rip), %eax
	addl	$1, %eax
	cmpl	%eax, %esi
	jg	.L12
	movslq	%edi, %rdx
	movslq	%esi, %rax
	leaq	(%rdx,%rdx,2), %rcx
	leaq	(%rdx,%rcx,4), %rdx
	cmpb	$0, map(%rax,%rdx,8)
	jne	.L12
	call	getWay
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L40:
	movl	h(%rip), %eax
	addl	$1, %eax
	cmpl	%eax, %r12d
	jg	.L7
	movslq	%ebp, %rdx
	movslq	%r12d, %rax
	leaq	(%rdx,%rdx,2), %rcx
	leaq	(%rdx,%rcx,4), %rdx
	cmpb	$0, map(%rax,%rdx,8)
	jne	.L7
	jmp	.L14
	.cfi_endproc
.LFE4:
	.size	getWay, .-getWay
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
.LFB5:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$10816, %edx
	xorl	%esi, %esi
	movl	$map, %edi
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	memset
	movl	$h, %edx
	movl	$w, %esi
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	__isoc99_scanf
	movl	h(%rip), %ebp
	testl	%ebp, %ebp
	jle	.L42
	movl	w(%rip), %eax
	movl	$1, %r12d
	testl	%eax, %eax
	jle	.L42
	.p2align 4,,10
	.p2align 3
.L46:
	leaq	map+104(%r12), %rbp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L44:
	movq	%rbp, %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf
	movl	w(%rip), %eax
	addq	$104, %rbp
	cmpl	%eax, %ebx
	jl	.L44
	movl	h(%rip), %ebp
	cmpl	%r12d, %ebp
	jle	.L42
	addq	$1, %r12
	testl	%eax, %eax
	jg	.L46
.L42:
	movl	dx+24(%rip), %edi
	movb	$2, map(%rip)
	leal	1(%rbp), %r8d
	testl	%edi, %edi
	js	.L48
	movl	w(%rip), %eax
	movl	dy+24(%rip), %esi
	addl	$1, %eax
	cmpl	%eax, %edi
	jg	.L48
	testl	%esi, %esi
	jns	.L127
.L48:
	movl	dx+28(%rip), %edi
	testl	%edi, %edi
	js	.L49
	movl	w(%rip), %eax
	movl	dy+28(%rip), %esi
	addl	$1, %eax
	cmpl	%eax, %edi
	jg	.L49
	testl	%esi, %esi
	jns	.L128
.L49:
	movl	dx+32(%rip), %edi
	testl	%edi, %edi
	js	.L50
	movl	w(%rip), %eax
	movl	dy+32(%rip), %esi
	addl	$1, %eax
	cmpl	%eax, %edi
	jg	.L50
	testl	%esi, %esi
	jns	.L129
.L50:
	movl	dx+36(%rip), %edi
	testl	%edi, %edi
	js	.L51
	movl	w(%rip), %eax
	movl	dy+36(%rip), %esi
	addl	$1, %eax
	cmpl	%eax, %edi
	jg	.L51
	testl	%esi, %esi
	jns	.L130
.L51:
	movl	dx+40(%rip), %edi
	testl	%edi, %edi
	js	.L52
	movl	w(%rip), %eax
	movl	dy+40(%rip), %esi
	addl	$1, %eax
	cmpl	%eax, %edi
	jg	.L52
	testl	%esi, %esi
	jns	.L131
.L52:
	movl	dx+44(%rip), %edi
	testl	%edi, %edi
	js	.L53
	movl	w(%rip), %eax
	movl	dy+44(%rip), %esi
	leal	1(%rax), %edx
	cmpl	%edx, %edi
	jg	.L53
	testl	%esi, %esi
	jns	.L132
.L53:
	testl	%r8d, %r8d
	js	.L67
	movl	w(%rip), %eax
.L54:
	leal	1(%rax), %r10d
	movl	$map, %r12d
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	leal	2(%rax), %edx
	.p2align 4,,10
	.p2align 3
.L56:
	movl	%ebx, %edi
	movq	%r12, %rcx
	addl	$1, %ebx
	xorl	%eax, %eax
	testl	%r10d, %r10d
	js	.L66
	movl	%ebx, %esi
	andl	$1, %esi
	leaq	(%rsi,%rsi,2), %rsi
	salq	$3, %rsi
	jmp	.L64
	.p2align 4,,10
	.p2align 3
.L57:
	addl	$1, %eax
	addq	$104, %rcx
	cmpl	%edx, %eax
	je	.L66
.L64:
	cmpb	$1, (%rcx)
	jne	.L57
	movl	dx(%rsi), %r14d
	movl	dy(%rsi), %r11d
	addl	%eax, %r14d
	addl	%edi, %r11d
	movl	%r14d, %r9d
	orl	%r11d, %r9d
	notl	%r9d
	shrl	$31, %r9d
	cmpl	%r8d, %r11d
	setle	%r15b
	testb	%r9b, %r15b
	je	.L58
	cmpl	%r14d, %r10d
	jge	.L133
.L58:
	movl	dy+4(%rsi), %r11d
	movl	dx+4(%rsi), %r14d
	addl	%edi, %r11d
	addl	%eax, %r14d
	movl	%r11d, %r9d
	orl	%r14d, %r9d
	notl	%r9d
	shrl	$31, %r9d
	cmpl	%r8d, %r11d
	setle	%r15b
	testb	%r9b, %r15b
	je	.L59
	cmpl	%r10d, %r14d
	jle	.L134
.L59:
	movl	dy+8(%rsi), %r11d
	movl	dx+8(%rsi), %r14d
	addl	%edi, %r11d
	addl	%eax, %r14d
	movl	%r11d, %r9d
	orl	%r14d, %r9d
	notl	%r9d
	shrl	$31, %r9d
	cmpl	%r8d, %r11d
	setle	%r15b
	testb	%r9b, %r15b
	je	.L60
	cmpl	%r14d, %r10d
	jge	.L135
.L60:
	movl	dx+12(%rsi), %r14d
	movl	dy+12(%rsi), %r11d
	addl	%eax, %r14d
	addl	%edi, %r11d
	movl	%r14d, %r9d
	orl	%r11d, %r9d
	notl	%r9d
	shrl	$31, %r9d
	cmpl	%r11d, %r8d
	setge	%r15b
	testb	%r9b, %r15b
	je	.L61
	cmpl	%r14d, %r10d
	jge	.L136
.L61:
	movl	dx+16(%rsi), %r14d
	movl	dy+16(%rsi), %r11d
	addl	%eax, %r14d
	addl	%edi, %r11d
	movl	%r14d, %r9d
	orl	%r11d, %r9d
	notl	%r9d
	shrl	$31, %r9d
	cmpl	%r11d, %r8d
	setge	%r15b
	testb	%r9b, %r15b
	je	.L62
	cmpl	%r14d, %r10d
	jge	.L137
.L62:
	movl	dx+20(%rsi), %r14d
	movl	dy+20(%rsi), %r11d
	addl	%eax, %r14d
	addl	%edi, %r11d
	movl	%r14d, %r9d
	orl	%r11d, %r9d
	notl	%r9d
	shrl	$31, %r9d
	cmpl	%r8d, %r11d
	setle	%r15b
	testb	%r9b, %r15b
	je	.L57
	cmpl	%r10d, %r14d
	jg	.L57
	movslq	%r14d, %r14
	movslq	%r11d, %r11
	leaq	(%r14,%r14,2), %r9
	leaq	(%r14,%r9,4), %r9
	cmpb	$2, map(%r11,%r9,8)
	sete	%r9b
	addl	$1, %eax
	addq	$104, %rcx
	movzbl	%r9b, %r9d
	addl	%r9d, %r13d
	cmpl	%edx, %eax
	jne	.L64
	.p2align 4,,10
	.p2align 3
.L66:
	addq	$1, %r12
	cmpl	%ebp, %edi
	jle	.L56
.L55:
	movl	%r13d, %esi
	movl	$.LC2, %edi
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
.L133:
	.cfi_restore_state
	movslq	%r14d, %r14
	movslq	%r11d, %r11
	leaq	(%r14,%r14,2), %r9
	leaq	(%r14,%r9,4), %r9
	cmpb	$2, map(%r11,%r9,8)
	sete	%r9b
	movzbl	%r9b, %r9d
	addl	%r9d, %r13d
	jmp	.L58
.L136:
	movslq	%r14d, %r14
	movslq	%r11d, %r11
	leaq	(%r14,%r14,2), %r9
	leaq	(%r14,%r9,4), %r9
	cmpb	$2, map(%r11,%r9,8)
	sete	%r9b
	movzbl	%r9b, %r9d
	addl	%r9d, %r13d
	jmp	.L61
.L137:
	movslq	%r14d, %r14
	movslq	%r11d, %r11
	leaq	(%r14,%r14,2), %r9
	leaq	(%r14,%r9,4), %r9
	cmpb	$2, map(%r11,%r9,8)
	sete	%r9b
	movzbl	%r9b, %r9d
	addl	%r9d, %r13d
	jmp	.L62
.L134:
	movslq	%r14d, %r14
	movslq	%r11d, %r11
	leaq	(%r14,%r14,2), %r9
	leaq	(%r14,%r9,4), %r9
	cmpb	$2, map(%r11,%r9,8)
	sete	%r9b
	movzbl	%r9b, %r9d
	addl	%r9d, %r13d
	jmp	.L59
.L135:
	movslq	%r14d, %r14
	movslq	%r11d, %r11
	leaq	(%r14,%r14,2), %r9
	leaq	(%r14,%r9,4), %r9
	cmpb	$2, map(%r11,%r9,8)
	sete	%r9b
	movzbl	%r9b, %r9d
	addl	%r9d, %r13d
	jmp	.L60
.L127:
	cmpl	%esi, %r8d
	jl	.L48
	movslq	%edi, %rax
	movslq	%esi, %rdx
	imulq	$104, %rax, %rax
	cmpb	$0, map(%rdx,%rax)
	jne	.L48
	call	getWay
	movl	h(%rip), %ebp
	leal	1(%rbp), %r8d
	jmp	.L48
.L128:
	cmpl	%esi, %r8d
	jl	.L49
	movslq	%edi, %rax
	movslq	%esi, %rdx
	imulq	$104, %rax, %rax
	cmpb	$0, map(%rdx,%rax)
	jne	.L49
	call	getWay
	movl	h(%rip), %ebp
	leal	1(%rbp), %r8d
	jmp	.L49
.L129:
	cmpl	%esi, %r8d
	jl	.L50
	movslq	%edi, %rax
	movslq	%esi, %rdx
	imulq	$104, %rax, %rax
	cmpb	$0, map(%rdx,%rax)
	jne	.L50
	call	getWay
	movl	h(%rip), %ebp
	leal	1(%rbp), %r8d
	jmp	.L50
.L130:
	cmpl	%esi, %r8d
	jl	.L51
	movslq	%edi, %rax
	movslq	%esi, %rdx
	imulq	$104, %rax, %rax
	cmpb	$0, map(%rdx,%rax)
	jne	.L51
	call	getWay
	movl	h(%rip), %ebp
	leal	1(%rbp), %r8d
	jmp	.L51
.L131:
	cmpl	%esi, %r8d
	jl	.L52
	movslq	%edi, %rax
	movslq	%esi, %rdx
	imulq	$104, %rax, %rax
	cmpb	$0, map(%rdx,%rax)
	jne	.L52
	call	getWay
	movl	h(%rip), %ebp
	leal	1(%rbp), %r8d
	jmp	.L52
.L132:
	cmpl	%r8d, %esi
	jg	.L53
	movslq	%edi, %rdx
	movslq	%esi, %rcx
	imulq	$104, %rdx, %rdx
	cmpb	$0, map(%rcx,%rdx)
	jne	.L54
	call	getWay
	movl	h(%rip), %ebp
	leal	1(%rbp), %r8d
	jmp	.L53
.L67:
	xorl	%r13d, %r13d
	jmp	.L55
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.globl	dy
	.data
	.align 32
	.type	dy, @object
	.size	dy, 48
dy:
	.long	-1
	.long	1
	.long	-1
	.long	0
	.long	1
	.long	0
	.long	-1
	.long	1
	.long	0
	.long	-1
	.long	0
	.long	1
	.globl	dx
	.align 32
	.type	dx, @object
	.size	dx, 48
dx:
	.long	0
	.long	0
	.long	1
	.long	1
	.long	1
	.long	-1
	.long	0
	.long	0
	.long	1
	.long	-1
	.long	-1
	.long	-1
	.globl	map
	.bss
	.align 32
	.type	map, @object
	.size	map, 10816
map:
	.zero	10816
	.globl	h
	.align 4
	.type	h, @object
	.size	h, 4
h:
	.zero	4
	.globl	w
	.align 4
	.type	w, @object
	.size	w, 4
w:
	.zero	4
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
