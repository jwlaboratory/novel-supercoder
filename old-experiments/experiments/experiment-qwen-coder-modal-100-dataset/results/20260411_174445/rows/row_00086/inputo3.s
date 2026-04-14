	.file	"inputC.c"
	.text
	.p2align 4
	.globl	calc
	.type	calc, @function
calc:
.LFB8:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%eax, %eax
	movl	$882, %ecx
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
	movslq	%edx, %rbp
	movl	$28224, %edx
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx
	movl	$c, %edi
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	rep stosq
	movl	%esi, 4(%rsp)
	movl	$a, %edi
	xorl	%esi, %esi
	call	memset
	movl	$28224, %edx
	xorl	%esi, %esi
	movl	$s, %edi
	call	memset
	movl	$a, %eax
	movl	$1, c(%rip)
	fld1
	fld	%st(0)
	fstpt	s(%rip)
	.p2align 4,,10
	.p2align 3
.L2:
	addq	$32, %rax
	fld	%st(0)
	fstpt	-32(%rax)
	fld	%st(0)
	fstpt	-16(%rax)
	cmpq	$a+672, %rax
	jne	.L2
	fstp	%st(0)
	testl	%ebp, %ebp
	jle	.L3
	leal	1(%rbp), %eax
	movl	%ebx, 12(%rsp)
	fildl	12(%rsp)
	xorl	%edi, %edi
	movl	%eax, (%rsp)
	movl	$c+172, %r10d
	xorl	%r15d, %r15d
	xorl	%r8d, %r8d
	movl	4(%rsp), %eax
	movl	$688, %r9d
	xorl	%r13d, %r13d
	movq	$-168, %rcx
	movq	$-672, %r14
	movl	$672, %esi
	movl	$1, %r12d
	addl	%ebx, %eax
	movl	%eax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L4:
	movl	$c, %eax
	movl	c+168(%rdi), %edx
	subq	%rcx, %rax
	.p2align 4,,10
	.p2align 3
.L5:
	leaq	(%rax,%rcx), %r11
	addq	$4, %rax
	movl	(%r11,%rdi), %r11d
	addl	%r11d, %edx
	movl	%edx, -4(%rax)
	movl	(%rax), %edx
	addl	%r11d, %edx
	movl	%edx, (%rax)
	cmpq	%r10, %rax
	jne	.L5
	movl	(%rsp), %eax
	fildl	8(%rsp)
	leaq	a(%r13), %rdx
	cmpl	%r12d, %eax
	movl	%eax, %ebx
	cmovg	%r12d, %ebx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L6:
	leaq	(%rdx,%r8), %r11
	addl	$1, %eax
	addq	$16, %rdx
	fldt	-16(%rdx)
	fmul	%st(2), %st
	fdiv	%st(1), %st
	fstpt	(%r11,%rsi)
	cmpl	%eax, %ebx
	jg	.L6
	cmpl	%eax, %ebp
	jl	.L27
	fildl	4(%rsp)
	movslq	%eax, %rdx
	addq	%r15, %rdx
	salq	$4, %rdx
	addq	$a, %rdx
	.p2align 4,,10
	.p2align 3
.L8:
	fldt	(%rdx)
	leaq	(%rdx,%r8), %r11
	addl	$1, %eax
	addq	$16, %rdx
	fmul	%st(1), %st
	fdiv	%st(2), %st
	fstpt	(%r11,%rsi)
	cmpl	%eax, %ebp
	jge	.L8
	fstp	%st(0)
	fstp	%st(0)
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L27:
	fstp	%st(0)
.L9:
	fldt	s(%rsi)
	movl	$c-168, %edx
	movq	%rsi, %rax
	subq	%rcx, %rdx
	leaq	0(%r13,%r14), %r11
	.p2align 4,,10
	.p2align 3
.L11:
	fldt	s(%r11,%rax)
	addq	$16, %rax
	addq	$4, %rdx
	fadd	%st, %st(1)
	fxch	%st(1)
	fstpt	s-16(%rax)
	fildl	-4(%rdx)
	fldt	a-16(%rax)
	fmulp	%st, %st(1)
	fsubrp	%st, %st(1)
	fldt	s(%rax)
	faddp	%st, %st(1)
	fld	%st(0)
	fstpt	s(%rax)
	cmpq	%r9, %rax
	jne	.L11
	fstp	%st(0)
	movl	(%rsp), %eax
	addl	$1, %r12d
	addq	$672, %rsi
	addq	$672, %r13
	subq	$672, %r14
	subq	$672, %r8
	addq	$42, %r15
	addq	$688, %r9
	subq	$168, %rcx
	addq	$168, %rdi
	addq	$172, %r10
	cmpl	%eax, %r12d
	jne	.L4
	fstp	%st(0)
.L12:
	leaq	0(%rbp,%rbp,4), %rax
	fldz
	leaq	0(%rbp,%rax,4), %rdx
	movq	%rdx, %rax
	leaq	1(%rbp,%rdx,2), %rdx
	salq	$5, %rax
	salq	$4, %rdx
	.p2align 4,,10
	.p2align 3
.L14:
	fldt	s(%rax)
	addq	$16, %rax
	fldt	a-16(%rax)
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	cmpq	%rdx, %rax
	jne	.L14
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
.L3:
	.cfi_restore_state
	je	.L12
	fldz
	jmp	.L1
	.cfi_endproc
.LFE8:
	.size	calc, .-calc
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"%d%d%d%d%d%d"
.LC6:
	.string	"%.12Lf\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	subq	$64, %rsp
	.cfi_def_cfa_offset 72
	movl	$.LC5, %edi
	leaq	52(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 80
	xorl	%eax, %eax
	leaq	56(%rsp), %r9
	leaq	52(%rsp), %r8
	leaq	48(%rsp), %rcx
	leaq	44(%rsp), %rdx
	leaq	40(%rsp), %rsi
	call	__isoc99_scanf
	movl	48(%rsp), %edx
	movl	44(%rsp), %esi
	movl	40(%rsp), %edi
	call	calc
	movl	52(%rsp), %edi
	movl	60(%rsp), %edx
	fstpt	16(%rsp)
	movl	56(%rsp), %esi
	call	calc
	fldt	16(%rsp)
	movl	$.LC6, %edi
	xorl	%eax, %eax
	subq	$16, %rsp
	.cfi_def_cfa_offset 96
	fmulp	%st, %st(1)
	fstpt	(%rsp)
	call	printf
	xorl	%eax, %eax
	addq	$88, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.globl	s
	.bss
	.align 32
	.type	s, @object
	.size	s, 28224
s:
	.zero	28224
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 28224
a:
	.zero	28224
	.globl	c
	.align 32
	.type	c, @object
	.size	c, 7056
c:
	.zero	7056
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
