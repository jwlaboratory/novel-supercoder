	.file	"inputC.c"
	.text
	.p2align 4
	.globl	cmp
	.type	cmp, @function
cmp:
.LFB9:
	.cfi_startproc
	movl	(%rdi), %eax
	subl	(%rsi), %eax
	ret
	.cfi_endproc
.LFE9:
	.size	cmp, .-cmp
	.p2align 4
	.globl	in
	.type	in, @function
in:
.LFB8:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L4:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L4
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE8:
	.size	in, .-in
	.p2align 4
	.globl	cminima
	.type	cminima, @function
cminima:
.LFB10:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movslq	%edx, %r15
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	%r8d, 12(%rsp)
	cmpl	%esi, %r15d
	jl	.L7
	movslq	%edi, %r12
	movl	%esi, %r14d
	movl	%ecx, %ebp
	je	.L10
.L11:
	leal	(%r15,%r14), %eax
	movl	12(%rsp), %r8d
	movl	%ebp, %ecx
	movl	%r12d, %edi
	movl	%eax, %ebx
	shrl	$31, %ebx
	addl	%eax, %ebx
	sarl	%ebx
	movl	%ebx, %edx
	movl	%ebx, %esi
	movslq	%ebx, %r13
	call	cminima
	movl	%ebp, %ecx
	movl	%r14d, %esi
	leal	-1(%rbx), %edx
	movl	minima(,%r13,4), %r8d
	movl	%r12d, %edi
	leal	1(%rbx), %r14d
	call	cminima
	movl	minima(,%r13,4), %ebp
	cmpl	%r15d, %r14d
	jg	.L7
	jne	.L11
.L10:
	movl	12(%rsp), %eax
	cmpl	%ebp, %eax
	jl	.L18
	movslq	%ebp, %rcx
	addl	$1, %eax
	xorl	%edx, %edx
	xorl	%esi, %esi
	imulq	$2002, %rcx, %rcx
	movl	%eax, %r13d
	movl	$-1, %r8d
	addq	%rcx, %r12
	addq	%r15, %rcx
	salq	$2, %r12
	salq	$2, %rcx
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L13:
	addq	$8008, %rdx
	cmpl	%r13d, %ebp
	je	.L12
.L15:
	movl	dp(%r12,%rdx), %eax
	addl	w+8008(%rcx,%rdx), %eax
	movl	%ebp, %edi
	addl	$1, %ebp
	cmpl	%esi, %eax
	jl	.L19
	testl	%r8d, %r8d
	jns	.L13
.L19:
	movl	%eax, %esi
	movl	%edi, %r8d
	addq	$8008, %rdx
	cmpl	%r13d, %ebp
	jne	.L15
.L12:
	movl	%r8d, minima(,%r15,4)
.L7:
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
.L18:
	.cfi_restore_state
	movl	$-1, %r8d
	jmp	.L12
	.cfi_endproc
.LFE10:
	.size	cminima, .-cminima
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"0"
.LC1:
	.string	"%d\n"
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	in
	movl	%eax, %ebp
	xorl	%eax, %eax
	call	in
	movl	%eax, %r13d
	xorl	%eax, %eax
	call	in
	movl	%eax, 12(%rsp)
	cmpl	%eax, %r13d
	jle	.L25
	movl	$1, %ebx
	testl	%ebp, %ebp
	jle	.L31
	.p2align 4,,10
	.p2align 3
.L26:
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L30:
	andl	$15, %eax
	leal	(%r12,%r12,4), %edx
	leal	(%rax,%rdx,2), %r12d
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L30
	movl	%r12d, x(,%rbx,4)
	addq	$1, %rbx
	cmpl	%ebx, %ebp
	jge	.L26
.L31:
	movslq	%r13d, %rbp
	movl	$t, %r12d
	leaq	t(,%rbp,4), %r15
	testl	%r13d, %r13d
	jle	.L83
	.p2align 4,,10
	.p2align 3
.L34:
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L32:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L32
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L33:
	andl	$15, %eax
	leal	(%r14,%r14,4), %edx
	leal	(%rax,%rdx,2), %r14d
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L33
	movslq	%r14d, %rdx
	addq	$4, %r12
	subl	x(,%rdx,4), %ebx
	movl	%ebx, -4(%r12)
	cmpq	%r15, %r12
	jne	.L34
	movl	$cmp, %ecx
	movl	$4, %edx
	movq	%rbp, %rsi
	movl	$t, %edi
	call	qsort
	cmpl	$1, 12(%rsp)
	je	.L84
	movl	$dp, %edi
	movl	$16032016, %edx
	movl	$48, %esi
	call	memset
	movl	$w-8008, %r8d
	leaq	-1(%rbp), %r9
	orq	$-1, %rdi
	.p2align 4,,10
	.p2align 3
.L42:
	cmpl	$-1, %edi
	je	.L45
	movl	t+4(,%rdi,4), %esi
	movl	8008(%r8), %eax
	movq	%r8, %rcx
	movq	%rdi, %rdx
	.p2align 4,,10
	.p2align 3
.L44:
	addl	%esi, %eax
	subl	t(,%rdx,4), %eax
	subq	$1, %rdx
	subq	$8008, %rcx
	movl	%eax, 8008(%rcx)
	cmpl	$-1, %edx
	jne	.L44
.L45:
	addq	$1, %rdi
	addq	$8012, %r8
	cmpq	%r9, %rdi
	jne	.L42
	leal	-1(%r13), %r9d
	cmpl	$2, %r9d
	jbe	.L57
	movl	%r13d, %r10d
	movl	$dp, %eax
	xorl	%edx, %edx
	shrl	$2, %r10d
	salq	$4, %r10
	.p2align 4,,10
	.p2align 3
.L47:
	movl	w+12(%rdx), %esi
	movl	w+8(%rdx), %edi
	addq	$16, %rdx
	addq	$32032, %rax
	movl	w-12(%rdx), %ecx
	movl	w-16(%rdx), %r8d
	movl	%edi, -16016(%rax)
	movl	%r8d, -32032(%rax)
	movl	%ecx, -24024(%rax)
	movl	%esi, -8008(%rax)
	cmpq	%r10, %rdx
	jne	.L47
	movl	%r13d, %eax
	andl	$-4, %eax
	testb	$3, %r13b
	je	.L49
.L46:
	movslq	%eax, %rdx
	imulq	$8008, %rdx, %rcx
	movl	w(,%rdx,4), %edx
	movl	%edx, dp(%rcx)
	leal	1(%rax), %edx
	cmpl	%edx, %r13d
	jle	.L49
	movslq	%edx, %rdx
	addl	$2, %eax
	imulq	$8008, %rdx, %rcx
	movl	w(,%rdx,4), %edx
	movl	%edx, dp(%rcx)
	cmpl	%eax, %r13d
	jle	.L49
	cltq
	imulq	$8008, %rax, %rdx
	movl	w(,%rax,4), %eax
	movl	%eax, dp(%rdx)
.L49:
	movl	12(%rsp), %r14d
	movl	$dp+4, %r10d
	xorl	%r11d, %r11d
	subl	$1, %r14d
	testl	%r14d, %r14d
	jle	.L40
	.p2align 4,,10
	.p2align 3
.L52:
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movl	%r11d, %edi
	movl	%r9d, %r8d
	movl	%r9d, %edx
	call	cminima
	movq	%r10, %rsi
	xorl	%ecx, %ecx
	movslq	%r11d, %rdi
	testl	%r13d, %r13d
	jle	.L53
	.p2align 4,,10
	.p2align 3
.L51:
	movslq	minima(,%rcx,4), %rax
	movslq	%ecx, %r8
	addq	$1, %rcx
	addq	$8008, %rsi
	leal	1(%rax), %edx
	movslq	%edx, %rdx
	imulq	$2002, %rax, %rax
	imulq	$2002, %rdx, %rdx
	addq	%rdi, %rax
	addq	%r8, %rdx
	movl	dp(,%rax,4), %eax
	addl	w(,%rdx,4), %eax
	movl	%eax, -8008(%rsi)
	cmpq	%rbp, %rcx
	jne	.L51
.L53:
	addl	$1, %r11d
	addq	$4, %r10
	cmpl	%r14d, %r11d
	jne	.L52
.L40:
	movslq	%r9d, %rax
	movslq	%r14d, %r14
	imulq	$2002, %rax, %rax
	addq	%r14, %rax
	movl	dp(,%rax,4), %esi
.L82:
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	printf
.L79:
	addq	$24, %rsp
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
.L84:
	.cfi_restore_state
	leal	-1(%r13), %eax
	movslq	%eax, %rdx
	movl	t(,%rdx,4), %ecx
	cmpl	$2, %eax
	jbe	.L56
	movl	%r13d, %edx
	movd	%ecx, %xmm3
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	shrl	$2, %edx
	pshufd	$0, %xmm3, %xmm2
	salq	$4, %rdx
	.p2align 4,,10
	.p2align 3
.L37:
	movdqa	%xmm2, %xmm1
	psubd	t(%rax), %xmm1
	addq	$16, %rax
	paddd	%xmm1, %xmm0
	cmpq	%rdx, %rax
	jne	.L37
	movdqa	%xmm0, %xmm1
	movl	%r13d, %eax
	psrldq	$8, %xmm1
	andl	$-4, %eax
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %esi
	testb	$3, %r13b
	je	.L82
.L36:
	movslq	%eax, %rdx
	movl	%ecx, %edi
	subl	t(,%rdx,4), %edi
	leal	1(%rax), %edx
	addl	%edi, %esi
	cmpl	%edx, %r13d
	jle	.L82
	movslq	%edx, %rdx
	movl	%ecx, %edi
	addl	$2, %eax
	subl	t(,%rdx,4), %edi
	addl	%edi, %esi
	cmpl	%eax, %r13d
	jle	.L82
	cltq
	subl	t(,%rax,4), %ecx
	addl	%ecx, %esi
	jmp	.L82
.L25:
	movl	$.LC0, %edi
	call	puts
	jmp	.L79
.L83:
	movl	$cmp, %ecx
	movl	$4, %edx
	movq	%rbp, %rsi
	movl	$t, %edi
	call	qsort
	cmpl	$1, 12(%rsp)
	je	.L59
	movl	$16032016, %edx
	movl	$48, %esi
	movl	$dp, %edi
	call	memset
	leal	-1(%r13), %r9d
	jmp	.L49
.L57:
	xorl	%eax, %eax
	jmp	.L46
.L59:
	xorl	%esi, %esi
	jmp	.L82
.L56:
	xorl	%esi, %esi
	xorl	%eax, %eax
	jmp	.L36
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.globl	minima
	.bss
	.align 32
	.type	minima, @object
	.size	minima, 8008
minima:
	.zero	8008
	.globl	dp
	.align 32
	.type	dp, @object
	.size	dp, 16032016
dp:
	.zero	16032016
	.globl	w
	.align 32
	.type	w, @object
	.size	w, 16032016
w:
	.zero	16032016
	.globl	x
	.align 32
	.type	x, @object
	.size	x, 8008
x:
	.zero	8008
	.globl	t
	.align 32
	.type	t, @object
	.size	t, 8008
t:
	.zero	8008
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
