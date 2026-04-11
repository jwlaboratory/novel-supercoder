	.file	"inputC.c"
	.text
	.p2align 4
	.globl	pow2
	.type	pow2, @function
pow2:
.LFB3:
	.cfi_startproc
	movabsq	$-8543223828751151131, %r9
	movq	%rdi, %rax
	movq	%rsi, %r8
	movl	$1, %esi
	imulq	%r9
	movq	%rdi, %rax
	sarq	$63, %rax
	leaq	(%rdx,%rdi), %rcx
	sarq	$29, %rcx
	subq	%rax, %rcx
	imulq	$1000000007, %rcx, %rax
	movq	%rdi, %rcx
	subq	%rax, %rcx
	testq	%r8, %r8
	je	.L1
	.p2align 4,,10
	.p2align 3
.L4:
	testb	$1, %r8b
	je	.L3
	imulq	%rcx, %rsi
	movq	%rsi, %rax
	movq	%rsi, %rdi
	imulq	%r9
	movq	%rdi, %rax
	sarq	$63, %rax
	leaq	(%rdx,%rsi), %rsi
	sarq	$29, %rsi
	subq	%rax, %rsi
	imulq	$1000000007, %rsi, %rax
	movq	%rdi, %rsi
	subq	%rax, %rsi
.L3:
	imulq	%rcx, %rcx
	movq	%rcx, %rax
	movq	%rcx, %rdi
	mulq	%r9
	shrq	$29, %rdx
	imulq	$1000000007, %rdx, %rax
	subq	%rax, %rdi
	movq	%r8, %rax
	shrq	$63, %rax
	movq	%rdi, %rcx
	addq	%r8, %rax
	sarq	%rax
	movq	%rax, %r8
	jne	.L4
.L1:
	movq	%rsi, %rax
	ret
	.cfi_endproc
.LFE3:
	.size	pow2, .-pow2
	.p2align 4
	.globl	com
	.type	com, @function
com:
.LFB4:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L16
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movslq	%esi, %r11
	movl	$1, %eax
	movabsq	$-8543223828751151131, %r9
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movslq	%edi, %rbx
	subq	%r11, %rbx
	.p2align 4,,10
	.p2align 3
.L15:
	leaq	(%rbx,%r11), %rcx
	movl	$30, %r8d
	movl	$1, %esi
	movl	$1000000005, %ebp
	imulq	%rax, %rcx
	movq	%rcx, %rax
	imulq	%r9
	movq	%rcx, %rax
	sarq	$63, %rax
	leaq	(%rdx,%rcx), %r10
	sarq	$29, %r10
	subq	%rax, %r10
	imulq	$1000000007, %r10, %rax
	subq	%rax, %rcx
	movq	%r11, %rax
	mulq	%r9
	movq	%rcx, %r10
	movq	%r11, %rcx
	shrq	$29, %rdx
	imulq	$1000000007, %rdx, %rax
	subq	%rax, %rcx
	.p2align 4,,10
	.p2align 3
.L14:
	testb	$1, %bpl
	je	.L13
	imulq	%rcx, %rsi
	movq	%rsi, %rax
	movq	%rsi, %rdi
	imulq	%r9
	movq	%rdi, %rax
	sarq	$63, %rax
	leaq	(%rdx,%rsi), %rsi
	sarq	$29, %rsi
	subq	%rax, %rsi
	imulq	$1000000007, %rsi, %rax
	movq	%rdi, %rsi
	subq	%rax, %rsi
.L13:
	imulq	%rcx, %rcx
	movq	%rcx, %rax
	movq	%rcx, %rdi
	mulq	%r9
	shrq	$29, %rdx
	imulq	$1000000007, %rdx, %rax
	subq	%rax, %rdi
	movq	%rdi, %rcx
	movq	%rbp, %rdi
	shrq	$63, %rdi
	addq	%rbp, %rdi
	sarq	%rdi
	movq	%rdi, %rbp
	subl	$1, %r8d
	jne	.L14
	imulq	%rsi, %r10
	movq	%r10, %rax
	imulq	%r9
	leaq	(%rdx,%r10), %rax
	movq	%r10, %rdx
	sarq	$63, %rdx
	sarq	$29, %rax
	subq	%rdx, %rax
	imulq	$1000000007, %rax, %rdx
	movq	%r10, %rax
	subq	%rdx, %rax
	subq	$1, %r11
	jne	.L15
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L16:
	.cfi_restore 3
	.cfi_restore 6
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE4:
	.size	com, .-com
	.p2align 4
	.globl	g
	.type	g, @function
g:
.LFB5:
	.cfi_startproc
	leal	1(%rdi), %edx
	leal	(%rdx,%rsi), %eax
	testl	%edx, %edx
	jle	.L31
	leal	1(%rax), %r11d
	cltq
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$1, %ecx
	movabsq	$-8543223828751151131, %r9
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rax, %rbp
	movslq	%r11d, %r11
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movslq	%edi, %rbx
	subq	%rbx, %rbp
	subq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L30:
	imulq	%r11, %rcx
	leaq	(%rbx,%r11), %rsi
	movl	$30, %r8d
	movl	$1000000005, %r12d
	movq	%rcx, %rax
	imulq	%r9
	movq	%rcx, %rax
	sarq	$63, %rax
	leaq	(%rdx,%rcx), %r10
	sarq	$29, %r10
	subq	%rax, %r10
	imulq	$1000000007, %r10, %rax
	subq	%rax, %rcx
	movq	%rsi, %rax
	imulq	%r9
	movq	%rcx, %r10
	movq	%rsi, %rax
	sarq	$63, %rax
	leaq	(%rdx,%rsi), %rcx
	sarq	$29, %rcx
	subq	%rax, %rcx
	imulq	$1000000007, %rcx, %rax
	subq	%rax, %rsi
	movq	%rsi, %rcx
	movl	$1, %esi
	.p2align 4,,10
	.p2align 3
.L29:
	testb	$1, %r12b
	je	.L28
	imulq	%rcx, %rsi
	movq	%rsi, %rax
	movq	%rsi, %rdi
	imulq	%r9
	movq	%rdi, %rax
	sarq	$63, %rax
	leaq	(%rdx,%rsi), %rsi
	sarq	$29, %rsi
	subq	%rax, %rsi
	imulq	$1000000007, %rsi, %rax
	movq	%rdi, %rsi
	subq	%rax, %rsi
.L28:
	imulq	%rcx, %rcx
	movq	%rcx, %rax
	movq	%rcx, %rdi
	mulq	%r9
	shrq	$29, %rdx
	imulq	$1000000007, %rdx, %rax
	subq	%rax, %rdi
	movq	%rdi, %rcx
	movq	%r12, %rdi
	shrq	$63, %rdi
	addq	%r12, %rdi
	sarq	%rdi
	movq	%rdi, %r12
	subl	$1, %r8d
	jne	.L29
	imulq	%rsi, %r10
	subq	$1, %r11
	movq	%r10, %rax
	imulq	%r9
	movq	%r10, %rax
	sarq	$63, %rax
	leaq	(%rdx,%r10), %rcx
	sarq	$29, %rcx
	subq	%rax, %rcx
	imulq	$1000000007, %rcx, %rax
	movq	%r10, %rcx
	subq	%rax, %rcx
	cmpq	%r11, %rbp
	jne	.L30
	popq	%rbx
	.cfi_def_cfa_offset 24
	movq	%rcx, %rax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L31:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE5:
	.size	g, .-g
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d %d %d"
.LC1:
	.string	"%lld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	$c2, %r8d
	movl	$r2, %ecx
	xorl	%eax, %eax
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	$c1, %edx
	movl	$r1, %esi
	movl	$.LC0, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	__isoc99_scanf
	movl	r2(%rip), %eax
	movl	c2(%rip), %r12d
	leal	1(%rax), %ebx
	leal	2(%r12,%rax), %edi
	movl	%ebx, %esi
	call	com
	movl	%ebx, %esi
	movq	%rax, %rbp
	movl	c1(%rip), %eax
	leal	(%rbx,%rax), %edi
	leal	-1(%rax), %r13d
	call	com
	movl	r1(%rip), %ebx
	subq	%rax, %rbp
	leal	1(%r12,%rbx), %edi
	movl	%ebx, %esi
	call	com
	leal	1(%r13,%rbx), %edi
	movl	%ebx, %esi
	subq	%rax, %rbp
	call	com
	movl	$.LC1, %edi
	leaq	1000000007(%rbp,%rax), %rsi
	movabsq	$-8543223828751151131, %rax
	imulq	%rsi
	movq	%rsi, %rax
	sarq	$63, %rax
	addq	%rsi, %rdx
	sarq	$29, %rdx
	subq	%rax, %rdx
	xorl	%eax, %eax
	imulq	$1000000007, %rdx, %rdx
	subq	%rdx, %rsi
	call	printf
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
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
.LFE6:
	.size	main, .-main
	.globl	ans
	.bss
	.align 8
	.type	ans, @object
	.size	ans, 8
ans:
	.zero	8
	.globl	la
	.align 4
	.type	la, @object
	.size	la, 4
la:
	.zero	4
	.globl	st
	.align 4
	.type	st, @object
	.size	st, 4
st:
	.zero	4
	.globl	c2
	.align 4
	.type	c2, @object
	.size	c2, 4
c2:
	.zero	4
	.globl	r2
	.align 4
	.type	r2, @object
	.size	r2, 4
r2:
	.zero	4
	.globl	c1
	.align 4
	.type	c1, @object
	.size	c1, 4
c1:
	.zero	4
	.globl	r1
	.align 4
	.type	r1, @object
	.size	r1, 4
r1:
	.zero	4
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
