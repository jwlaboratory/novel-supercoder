	.file	"inputC.c"
	.text
	.p2align 4
	.type	cp_cmp, @function
cp_cmp:
.LFB10:
	.cfi_startproc
	movq	8(%rdi), %rdx
	subq	8(%rsi), %rdx
	xorl	%eax, %eax
	testq	%rdx, %rdx
	movl	$-1, %edx
	setg	%al
	cmovs	%edx, %eax
	ret
	.cfi_endproc
.LFE10:
	.size	cp_cmp, .-cp_cmp
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
.L6:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L6
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE8:
	.size	in, .-in
	.p2align 4
	.globl	out
	.type	out, @function
out:
.LFB9:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L19
	movabsq	$7378697629483820647, %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%ecx, %ecx
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	.p2align 4,,10
	.p2align 3
.L10:
	movq	%rdi, %rax
	imulq	%rsi
	movq	%rdi, %rax
	sarq	$63, %rax
	sarq	$2, %rdx
	subq	%rax, %rdx
	leaq	(%rdx,%rdx,4), %rax
	addq	%rax, %rax
	subq	%rax, %rdi
	movq	%rcx, %rax
	addl	$48, %edi
	movb	%dil, (%rsp,%rcx)
	movq	%rdx, %rdi
	addq	$1, %rcx
	testq	%rdx, %rdx
	jne	.L10
	movslq	%eax, %rdx
	leaq	-1(%rsp,%rdx), %rbp
	leaq	(%rsp,%rdx), %rbx
	subq	%rax, %rbp
	.p2align 4,,10
	.p2align 3
.L11:
	movsbl	(%rbx), %edi
	xorl	%eax, %eax
	subq	$1, %rbx
	call	putchar_unlocked
	cmpq	%rbp, %rbx
	jne	.L11
	addq	$56, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	.cfi_restore 3
	.cfi_restore 6
	movl	$48, %edi
	xorl	%eax, %eax
	jmp	putchar_unlocked
	.cfi_endproc
.LFE9:
	.size	out, .-out
	.p2align 4
	.globl	compact
	.type	compact, @function
compact:
.LFB11:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movslq	%esi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	movq	%r14, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	salq	$4, %rdi
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	call	malloc
	testq	%rax, %rax
	je	.L30
	movq	%r14, %r12
	movq	%rax, %rbx
	testl	%r14d, %r14d
	jle	.L22
	movq	%rax, %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L23:
	movq	0(%r13,%rax,8), %rsi
	movl	%eax, (%rcx)
	addq	$1, %rax
	addq	$16, %rcx
	movq	%rsi, -8(%rcx)
	cmpq	%rax, %r14
	jne	.L23
	movl	$cp_cmp, %ecx
	movl	$16, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	qsort
	movslq	(%rbx), %rax
	movl	$0, 0(%rbp,%rax,4)
	cmpl	$1, %r12d
	jne	.L34
.L25:
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L27:
	movq	%rbx, %rdi
	movl	%eax, 12(%rsp)
	call	free
	movl	12(%rsp), %eax
.L20:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
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
	.p2align 4,,10
	.p2align 3
.L34:
	.cfi_restore_state
	leaq	16(%rbx), %rcx
	movl	%r12d, %r8d
	movl	$1, %edx
	xorl	%esi, %esi
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L26:
	movslq	(%rcx), %r9
	movslq	%esi, %rdi
	movq	8(%rcx), %r10
	salq	$4, %rdi
	leaq	0(%rbp,%r9,4), %r9
	cmpq	8(%rbx,%rdi), %r10
	je	.L28
	cmpl	%edx, %eax
	je	.L29
	movq	%r10, 24(%rbx,%rdi)
.L29:
	movl	%eax, %esi
	addl	$1, %eax
.L28:
	addq	$1, %rdx
	movl	%esi, (%r9)
	addq	$16, %rcx
	cmpq	%rdx, %r8
	je	.L27
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L22:
	movq	%rax, %rdi
	movl	$cp_cmp, %ecx
	movl	$16, %edx
	movq	%r14, %rsi
	call	qsort
	movslq	(%rbx), %rax
	movl	$0, 0(%rbp,%rax,4)
	jmp	.L25
.L30:
	xorl	%eax, %eax
	jmp	.L20
	.cfi_endproc
.LFE11:
	.size	compact, .-compact
	.p2align 4
	.globl	find
	.type	find, @function
find:
.LFB12:
	.cfi_startproc
	xorl	%edx, %edx
	testl	%edi, %edi
	jle	.L35
	.p2align 4,,10
	.p2align 3
.L37:
	movslq	%edi, %rax
	addl	bit_data(,%rax,4), %edx
	leal	-1(%rdi), %eax
	andl	%eax, %edi
	jne	.L37
.L35:
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE12:
	.size	find, .-find
	.p2align 4
	.globl	add
	.type	add, @function
add:
.LFB13:
	.cfi_startproc
	movl	bit_n(%rip), %edx
	addl	$1, %edi
	cmpl	%edx, %edi
	jg	.L40
	.p2align 4,,10
	.p2align 3
.L42:
	movslq	%edi, %rax
	addl	%esi, bit_data(,%rax,4)
	movl	%edi, %eax
	negl	%eax
	andl	%edi, %eax
	addl	%eax, %edi
	cmpl	%edx, %edi
	jle	.L42
.L40:
	ret
	.cfi_endproc
.LFE13:
	.size	add, .-add
	.p2align 4
	.globl	size
	.type	size, @function
size:
.LFB14:
	.cfi_startproc
	movl	bit_cnt(%rip), %eax
	ret
	.cfi_endproc
.LFE14:
	.size	size, .-size
	.p2align 4
	.globl	count
	.type	count, @function
count:
.LFB15:
	.cfi_startproc
	leal	1(%rdi), %eax
	xorl	%ecx, %ecx
	testl	%eax, %eax
	jle	.L45
	.p2align 4,,10
	.p2align 3
.L47:
	movslq	%eax, %rdx
	movl	bit_data(,%rdx,4), %esi
	leal	-1(%rax), %edx
	addl	%ecx, %esi
	movl	%esi, %ecx
	andl	%edx, %eax
	jne	.L47
	testl	%edi, %edi
	je	.L45
	.p2align 4,,10
	.p2align 3
.L48:
	movslq	%edi, %rdx
	addl	bit_data(,%rdx,4), %eax
	leal	-1(%rdi), %edx
	andl	%edx, %edi
	jne	.L48
	movl	%esi, %ecx
	subl	%eax, %ecx
.L45:
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE15:
	.size	count, .-count
	.p2align 4
	.globl	insert
	.type	insert, @function
insert:
.LFB16:
	.cfi_startproc
	movl	bit_n(%rip), %edx
	addl	$1, %edi
	cmpl	%edx, %edi
	jg	.L56
	.p2align 4,,10
	.p2align 3
.L57:
	movslq	%edi, %rax
	addl	$1, bit_data(,%rax,4)
	movl	%edi, %eax
	negl	%eax
	andl	%edi, %eax
	addl	%eax, %edi
	cmpl	%edx, %edi
	jle	.L57
.L56:
	addl	$1, bit_cnt(%rip)
	ret
	.cfi_endproc
.LFE16:
	.size	insert, .-insert
	.p2align 4
	.globl	erase
	.type	erase, @function
erase:
.LFB17:
	.cfi_startproc
	movl	bit_n(%rip), %edx
	addl	$1, %edi
	cmpl	%edx, %edi
	jg	.L60
	.p2align 4,,10
	.p2align 3
.L61:
	movslq	%edi, %rax
	subl	$1, bit_data(,%rax,4)
	movl	%edi, %eax
	negl	%eax
	andl	%edi, %eax
	addl	%eax, %edi
	cmpl	%edx, %edi
	jle	.L61
.L60:
	subl	$1, bit_cnt(%rip)
	ret
	.cfi_endproc
.LFE17:
	.size	erase, .-erase
	.p2align 4
	.globl	_clzsi2
	.type	_clzsi2, @function
_clzsi2:
.LFB18:
	.cfi_startproc
	movl	%edi, %ecx
	shrl	$16, %ecx
	jne	.L70
	movl	%edi, %ecx
	movl	$24, %eax
	movl	$32, %esi
.L64:
	movl	%ecx, %edx
	shrl	$8, %edx
	jne	.L65
	movl	%esi, %eax
	movl	%ecx, %edx
.L65:
	movl	%edx, %ecx
	shrl	$4, %ecx
	je	.L66
	subl	$4, %eax
	movl	%ecx, %edx
.L66:
	movl	%edx, %ecx
	shrl	$2, %ecx
	je	.L67
	subl	$2, %eax
	movl	%ecx, %edx
.L67:
	leal	-2(%rax), %ecx
	subl	%edx, %eax
	shrl	%edx
	cmovne	%ecx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L70:
	movl	$8, %eax
	movl	$16, %esi
	jmp	.L64
	.cfi_endproc
.LFE18:
	.size	_clzsi2, .-_clzsi2
	.p2align 4
	.globl	kth_element
	.type	kth_element, @function
kth_element:
.LFB19:
	.cfi_startproc
	movl	bit_n(%rip), %esi
	movl	%esi, %ecx
	shrl	$16, %ecx
	jne	.L87
	movl	%esi, %ecx
	movl	$24, %edx
	movl	$32, %r8d
.L78:
	movl	%ecx, %eax
	shrl	$8, %eax
	jne	.L79
	movl	%r8d, %edx
	movl	%ecx, %eax
.L79:
	movl	%eax, %ecx
	shrl	$4, %ecx
	je	.L80
	subl	$4, %edx
	movl	%ecx, %eax
.L80:
	movl	%eax, %ecx
	shrl	$2, %ecx
	je	.L81
	subl	$2, %edx
	movl	%ecx, %eax
.L81:
	movl	%eax, %ecx
	shrl	%ecx
	jne	.L97
	subl	%edx, %eax
	leal	32(%rax), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	xorl	%ecx, %ecx
	sarl	%eax
	je	.L77
.L83:
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L86:
	leal	(%rcx,%rax), %edx
	cmpl	%edx, %esi
	jl	.L85
	movslq	%edx, %r8
	movl	bit_data(,%r8,4), %r8d
	cmpl	%edi, %r8d
	jg	.L85
	subl	%r8d, %edi
	movl	%edx, %ecx
.L85:
	sarl	%eax
	jne	.L86
.L77:
	movl	%ecx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L87:
	movl	$8, %edx
	movl	$16, %r8d
	jmp	.L78
	.p2align 4,,10
	.p2align 3
.L97:
	movl	$34, %ecx
	movl	$1, %eax
	subl	%edx, %ecx
	sall	%cl, %eax
	sarl	%eax
	jmp	.L83
	.cfi_endproc
.LFE19:
	.size	kth_element, .-kth_element
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB20:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	xorl	%eax, %eax
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
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	call	in
	movl	%eax, N(%rip)
	xorl	%eax, %eax
	call	in
	movl	N(%rip), %edx
	movl	%eax, %ebp
	testl	%edx, %edx
	jle	.L105
	leal	-1(%rdx), %eax
	cmpl	$2, %eax
	jbe	.L145
	movl	%edx, %ecx
	movd	%edx, %xmm4
	movdqa	.LC0(%rip), %xmm1
	xorl	%eax, %eax
	shrl	$2, %ecx
	movdqa	.LC1(%rip), %xmm5
	pshufd	$0, %xmm4, %xmm6
	pxor	%xmm4, %xmm4
	salq	$5, %rcx
	.p2align 4,,10
	.p2align 3
.L103:
	movdqa	%xmm1, %xmm2
	movdqa	%xmm6, %xmm0
	paddd	%xmm5, %xmm1
	addq	$32, %rax
	psubd	%xmm2, %xmm0
	movdqa	%xmm4, %xmm2
	pcmpgtd	%xmm0, %xmm2
	movdqa	%xmm0, %xmm3
	punpckldq	%xmm2, %xmm3
	punpckhdq	%xmm2, %xmm0
	movaps	%xmm3, data-32(%rax)
	movaps	%xmm0, data-16(%rax)
	cmpq	%rax, %rcx
	jne	.L103
	movl	%edx, %eax
	andl	$-4, %eax
	addl	$1, %eax
	testb	$3, %dl
	je	.L105
.L102:
	movl	%edx, %esi
	leal	-1(%rax), %ecx
	subl	%eax, %esi
	movslq	%ecx, %rcx
	movslq	%esi, %rsi
	movq	%rsi, data(,%rcx,8)
	leal	1(%rax), %ecx
	cmpl	%ecx, %edx
	jl	.L105
	movl	%edx, %esi
	movslq	%eax, %rdi
	addl	$2, %eax
	subl	%ecx, %esi
	movslq	%esi, %rsi
	movq	%rsi, data(,%rdi,8)
	cmpl	%eax, %edx
	jl	.L105
	movl	%edx, %esi
	movslq	%ecx, %rcx
	subl	%eax, %esi
	movslq	%esi, %rax
	movq	%rax, data(,%rcx,8)
.L105:
	movl	$0, csz(%rip)
	xorl	%ebx, %ebx
	movl	%edx, dsz(%rip)
	testl	%ebp, %ebp
	jle	.L101
	.p2align 4,,10
	.p2align 3
.L100:
	xorl	%eax, %eax
	call	getchar_unlocked
	andl	$1, %eax
	movl	%eax, %r13d
	xorl	%eax, %eax
	call	getchar_unlocked
	xorl	%eax, %eax
	testl	%r13d, %r13d
	jne	.L109
	call	getchar_unlocked
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L110:
	andl	$15, %eax
	leal	(%r12,%r12,4), %edx
	leal	(%rax,%rdx,2), %r12d
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L110
	xorl	%eax, %eax
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L111:
	andl	$15, %eax
	leal	0(%r13,%r13,4), %edx
	leal	(%rax,%rdx,2), %r13d
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L111
	movslq	csz(%rip), %rax
	movslq	dsz(%rip), %rcx
	movslq	%r12d, %rsi
	movslq	%r13d, %r13
	leal	1(%rax), %edx
	movl	%ecx, cmd(,%rax,4)
	movq	last(,%rsi,8), %rax
	movl	%edx, csz(%rip)
	movl	N(%rip), %edx
	addq	%rax, %r13
	movq	%rax, %xmm0
	subl	%r12d, %edx
	movq	%r13, %xmm7
	movq	%r13, last(,%rsi,8)
	movslq	%edx, %rdi
	punpcklqdq	%xmm7, %xmm0
	leal	2(%rcx), %edx
	movq	%rdi, %xmm1
	psllq	$17, %xmm0
	movl	%edx, dsz(%rip)
	punpcklqdq	%xmm1, %xmm1
	por	%xmm1, %xmm0
	movups	%xmm0, data(,%rcx,8)
.L112:
	addl	$1, %ebx
	cmpl	%ebx, %ebp
	jne	.L100
.L101:
	movl	dsz(%rip), %esi
	movl	$data, %edx
	movl	$small, %edi
	leal	10(%rsi), %eax
	movl	%eax, bit_n(%rip)
	call	compact
	movslq	dsz(%rip), %rsi
	xorl	%eax, %eax
	testl	%esi, %esi
	jle	.L108
	.p2align 4,,10
	.p2align 3
.L116:
	movslq	small(,%rax,4), %rdx
	movq	data(,%rax,8), %rcx
	addq	$1, %rax
	movq	%rcx, s2d(,%rdx,8)
	cmpq	%rax, %rsi
	jne	.L116
.L108:
	movl	N(%rip), %r8d
	testl	%r8d, %r8d
	jle	.L188
	movslq	%r8d, %rax
	movl	bit_n(%rip), %ecx
	movl	$small, %esi
	movl	bit_cnt(%rip), %r9d
	leaq	small(,%rax,4), %rdi
	.p2align 4,,10
	.p2align 3
.L118:
	movl	(%rsi), %eax
	addl	$1, %eax
	cmpl	%ecx, %eax
	jg	.L120
	.p2align 4,,10
	.p2align 3
.L117:
	movslq	%eax, %rdx
	addl	$1, bit_data(,%rdx,4)
	movl	%eax, %edx
	negl	%edx
	andl	%eax, %edx
	addl	%edx, %eax
	cmpl	%ecx, %eax
	jle	.L117
.L120:
	addq	$4, %rsi
	cmpq	%rsi, %rdi
	jne	.L118
	leal	(%r8,%r9), %eax
	movl	%eax, bit_cnt(%rip)
.L115:
	movl	csz(%rip), %esi
	xorl	%ebp, %ebp
	movl	%r8d, dsz(%rip)
	movabsq	$7378697629483820647, %rbx
	testl	%esi, %esi
	jle	.L186
	.p2align 4,,10
	.p2align 3
.L121:
	movl	cmd(,%rbp,4), %r8d
	movl	bit_n(%rip), %edi
	testl	%r8d, %r8d
	jns	.L122
	movslq	N(%rip), %rsi
	movl	%edi, %ecx
	addl	%esi, %r8d
	shrl	$16, %ecx
	jne	.L147
	movl	%edi, %ecx
	movl	$24, %edx
	movl	$32, %r9d
.L123:
	movl	%ecx, %eax
	shrl	$8, %eax
	jne	.L124
	movl	%r9d, %edx
	movl	%ecx, %eax
.L124:
	movl	%eax, %ecx
	shrl	$4, %ecx
	je	.L125
	subl	$4, %edx
	movl	%ecx, %eax
.L125:
	movl	%eax, %ecx
	shrl	$2, %ecx
	je	.L126
	subl	$2, %edx
	movl	%ecx, %eax
.L126:
	movl	%eax, %ecx
	shrl	%ecx
	jne	.L189
	subl	%edx, %eax
	leal	32(%rax), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	xorl	%ecx, %ecx
	sarl	%eax
	je	.L129
.L128:
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L131:
	leal	(%rcx,%rax), %edx
	cmpl	%edi, %edx
	jg	.L130
	movslq	%edx, %r9
	movl	bit_data(,%r9,4), %r9d
	cmpl	%r8d, %r9d
	jg	.L130
	subl	%r9d, %r8d
	movslq	%edx, %rcx
.L130:
	sarl	%eax
	jne	.L131
.L129:
	movq	s2d(,%rcx,8), %r12
	xorl	%edi, %edi
	movq	%rsp, %rcx
	movq	%r12, %rax
	andl	$131071, %eax
	subq	%rax, %rsi
	je	.L190
	.p2align 4,,10
	.p2align 3
.L132:
	movq	%rsi, %rax
	imulq	%rbx
	movq	%rsi, %rax
	sarq	$63, %rax
	sarq	$2, %rdx
	subq	%rax, %rdx
	leaq	(%rdx,%rdx,4), %rax
	addq	%rax, %rax
	subq	%rax, %rsi
	movq	%rdi, %rax
	addl	$48, %esi
	movb	%sil, (%rcx,%rdi)
	movq	%rdx, %rsi
	addq	$1, %rdi
	testq	%rdx, %rdx
	jne	.L132
	movslq	%eax, %rdx
	leaq	-1(%rsp,%rdx), %r14
	leaq	(%rcx,%rdx), %r13
	subq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L134:
	movsbl	0(%r13), %edi
	xorl	%eax, %eax
	subq	$1, %r13
	call	putchar_unlocked
	cmpq	%r13, %r14
	jne	.L134
.L133:
	movl	$32, %edi
	xorl	%eax, %eax
	call	putchar_unlocked
	movq	%r12, %rsi
	xorl	%edi, %edi
	movq	%rsp, %rcx
	sarq	$17, %rsi
	je	.L191
	.p2align 4,,10
	.p2align 3
.L135:
	movq	%rsi, %rax
	imulq	%rbx
	movq	%rsi, %rax
	sarq	$63, %rax
	sarq	$2, %rdx
	subq	%rax, %rdx
	leaq	(%rdx,%rdx,4), %rax
	addq	%rax, %rax
	subq	%rax, %rsi
	movq	%rdi, %rax
	addl	$48, %esi
	movb	%sil, (%rcx,%rdi)
	movq	%rdx, %rsi
	addq	$1, %rdi
	testq	%rdx, %rdx
	jne	.L135
	movslq	%eax, %rdx
	leaq	-1(%rsp,%rdx), %r13
	leaq	(%rcx,%rdx), %r12
	subq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L137:
	movsbl	(%r12), %edi
	xorl	%eax, %eax
	subq	$1, %r12
	call	putchar_unlocked
	cmpq	%r13, %r12
	jne	.L137
.L136:
	movl	$10, %edi
	xorl	%eax, %eax
	call	putchar_unlocked
	movl	csz(%rip), %esi
.L138:
	addq	$1, %rbp
	cmpl	%ebp, %esi
	jg	.L121
.L186:
	addq	$48, %rsp
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L122:
	.cfi_restore_state
	movslq	dsz(%rip), %rax
	movq	%rax, %rcx
	leal	1(%rax), %r8d
	movl	small(,%rax,4), %eax
	addl	$1, %eax
	cmpl	%edi, %eax
	jg	.L142
	.p2align 4,,10
	.p2align 3
.L139:
	movslq	%eax, %rdx
	subl	$1, bit_data(,%rdx,4)
	movl	%eax, %edx
	negl	%edx
	andl	%eax, %edx
	addl	%edx, %eax
	cmpl	%edi, %eax
	jle	.L139
.L142:
	movslq	%r8d, %r8
	addl	$2, %ecx
	movl	small(,%r8,4), %eax
	movl	%ecx, dsz(%rip)
	addl	$1, %eax
	cmpl	%edi, %eax
	jg	.L138
	.p2align 4,,10
	.p2align 3
.L140:
	movslq	%eax, %rdx
	addl	$1, bit_data(,%rdx,4)
	movl	%eax, %edx
	negl	%edx
	andl	%eax, %edx
	addl	%edx, %eax
	cmpl	%edi, %eax
	jle	.L140
	jmp	.L138
	.p2align 4,,10
	.p2align 3
.L109:
	call	getchar_unlocked
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L113:
	andl	$15, %eax
	leal	(%r12,%r12,4), %edx
	leal	(%rax,%rdx,2), %r12d
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L113
	movslq	csz(%rip), %rax
	negl	%r12d
	leal	1(%rax), %edx
	movl	%r12d, cmd(,%rax,4)
	movl	%edx, csz(%rip)
	jmp	.L112
	.p2align 4,,10
	.p2align 3
.L147:
	movl	$8, %edx
	movl	$16, %r9d
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L189:
	movl	$34, %ecx
	movl	$1, %eax
	subl	%edx, %ecx
	sall	%cl, %eax
	sarl	%eax
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L191:
	movl	$48, %edi
	xorl	%eax, %eax
	call	putchar_unlocked
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L190:
	movl	$48, %edi
	xorl	%eax, %eax
	call	putchar_unlocked
	jmp	.L133
.L188:
	xorl	%r8d, %r8d
	jmp	.L115
.L145:
	movl	$1, %eax
	jmp	.L102
	.cfi_endproc
.LFE20:
	.size	main, .-main
	.globl	s2d
	.bss
	.align 32
	.type	s2d, @object
	.size	s2d, 4000000
s2d:
	.zero	4000000
	.globl	small
	.align 32
	.type	small, @object
	.size	small, 2000000
small:
	.zero	2000000
	.globl	dsz
	.align 4
	.type	dsz, @object
	.size	dsz, 4
dsz:
	.zero	4
	.globl	data
	.align 32
	.type	data, @object
	.size	data, 4000000
data:
	.zero	4000000
	.globl	csz
	.align 4
	.type	csz, @object
	.size	csz, 4
csz:
	.zero	4
	.globl	cmd
	.align 32
	.type	cmd, @object
	.size	cmd, 400020
cmd:
	.zero	400020
	.globl	last
	.align 32
	.type	last, @object
	.size	last, 800040
last:
	.zero	800040
	.globl	N
	.align 4
	.type	N, @object
	.size	N, 4
N:
	.zero	4
	.globl	bit_data
	.align 32
	.type	bit_data, @object
	.size	bit_data, 2000000
bit_data:
	.zero	2000000
	.globl	bit_cnt
	.align 4
	.type	bit_cnt, @object
	.size	bit_cnt, 4
bit_cnt:
	.zero	4
	.globl	bit_n
	.align 4
	.type	bit_n, @object
	.size	bit_n, 4
bit_n:
	.zero	4
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	1
	.long	2
	.long	3
	.long	4
	.align 16
.LC1:
	.long	4
	.long	4
	.long	4
	.long	4
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
