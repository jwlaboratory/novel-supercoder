	.file	"inputC.c"
	.text
	.p2align 4
	.globl	upll
	.type	upll, @function
upll:
.LFB8:
	.cfi_startproc
	movq	(%rsi), %rax
	cmpq	%rax, (%rdi)
	movl	$-1, %edx
	setg	%al
	movzbl	%al, %eax
	cmovl	%edx, %eax
	ret
	.cfi_endproc
.LFE8:
	.size	upll, .-upll
	.p2align 4
	.globl	downll
	.type	downll, @function
downll:
.LFB9:
	.cfi_startproc
	movq	(%rsi), %rdx
	movl	$1, %eax
	cmpq	%rdx, (%rdi)
	jl	.L5
	setg	%al
	movzbl	%al, %eax
	negl	%eax
.L5:
	ret
	.cfi_endproc
.LFE9:
	.size	downll, .-downll
	.p2align 4
	.globl	sort
	.type	sort, @function
sort:
.LFB13:
	.cfi_startproc
	movq	8(%rsi), %rax
	cmpq	%rax, 8(%rdi)
	setge	%al
	movzbl	%al, %eax
	leal	-1(%rax,%rax), %eax
	ret
	.cfi_endproc
.LFE13:
	.size	sort, .-sort
	.p2align 4
	.globl	sortup
	.type	sortup, @function
sortup:
.LFB10:
	.cfi_startproc
	movslq	%esi, %rsi
	movl	$upll, %ecx
	movl	$8, %edx
	jmp	qsort
	.cfi_endproc
.LFE10:
	.size	sortup, .-sortup
	.p2align 4
	.globl	sortdown
	.type	sortdown, @function
sortdown:
.LFB11:
	.cfi_startproc
	movslq	%esi, %rsi
	movl	$downll, %ecx
	movl	$8, %edx
	jmp	qsort
	.cfi_endproc
.LFE11:
	.size	sortdown, .-sortdown
	.p2align 4
	.globl	pom
	.type	pom, @function
pom:
.LFB12:
	.cfi_startproc
	movq	%rdi, %rax
	movslq	%edx, %r8
	movl	$1, %edi
	cqto
	idivq	%r8
	movq	%rdx, %rcx
	testq	%rsi, %rsi
	je	.L13
	.p2align 4,,10
	.p2align 3
.L16:
	testb	$1, %sil
	je	.L15
	movq	%rdi, %rax
	imulq	%rcx, %rax
	cqto
	idivq	%r8
	movq	%rdx, %rdi
.L15:
	imulq	%rcx, %rcx
	movq	%rcx, %rax
	cqto
	idivq	%r8
	movq	%rsi, %rax
	shrq	$63, %rax
	addq	%rax, %rsi
	sarq	%rsi
	movq	%rdx, %rcx
	jne	.L16
.L13:
	movq	%rdi, %rax
	ret
	.cfi_endproc
.LFE12:
	.size	pom, .-pom
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lld%lld"
.LC1:
	.string	"%lld%lld%lld"
.LC2:
	.string	"0"
.LC3:
	.string	"%lld"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB14:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$.LC0, %edi
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
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	leaq	184(%rsp), %rsi
	leaq	192(%rsp), %rdx
	call	__isoc99_scanf
	movq	192(%rsp), %rsi
	testq	%rsi, %rsi
	jle	.L23
	movl	$c, %ebx
	xorl	%ebp, %ebp
.L24:
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addq	$1, %rbp
	addq	$24, %rbx
	leaq	200(%rsp), %rsi
	leaq	216(%rsp), %rcx
	leaq	208(%rsp), %rdx
	call	__isoc99_scanf
	movq	216(%rsp), %rax
	movq	200(%rsp), %xmm0
	movhps	208(%rsp), %xmm0
	movq	%rax, -8(%rbx)
	movq	192(%rsp), %rsi
	movups	%xmm0, -24(%rbx)
	cmpq	%rbp, %rsi
	jg	.L24
.L23:
	movl	$sort, %ecx
	movl	$24, %edx
	movl	$c, %edi
	call	qsort
	cmpq	$1, c+8(%rip)
	jne	.L49
	movl	$c+16, %eax
	xorl	%ecx, %ecx
	jmp	.L28
.L26:
	addq	$24, %rax
	addq	$1, %rcx
	cmpq	$1, -8(%rax)
	jne	.L25
.L28:
	cmpq	$1, (%rax)
	jle	.L26
	movl	$.LC2, %edi
	call	puts
.L27:
	addq	$232, %rsp
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
.L49:
	.cfi_restore_state
	xorl	%ecx, %ecx
.L25:
	movq	184(%rsp), %rdi
	movq	$1, dp+8(%rip)
	movq	$1, dp+2480(%rip)
	movq	$1, dp+768800(%rip)
	cmpq	$1, %rdi
	jle	.L29
	movl	$dp, %r8d
	leaq	1(%rdi), %rax
	movq	$dp+1540088, 64(%rsp)
	movq	$-4944, %r15
	movq	$dp+1537600, 80(%rsp)
	movq	%r8, %rsi
	movl	$dp+768816, %r9d
	movabsq	$-8543223828751151131, %rbp
	movq	$dp+4960, 88(%rsp)
	movq	%r15, %r13
	movq	%rax, 136(%rsp)
	movq	$-1537584, 128(%rsp)
	movq	$1532640, 32(%rsp)
	movq	$-766320, 56(%rsp)
	movq	$1537600, 8(%rsp)
	movq	$-768800, 24(%rsp)
	movq	$2, 120(%rsp)
	movq	%rdi, 144(%rsp)
	movq	%r8, 152(%rsp)
.L30:
	movq	120(%rsp), %rbx
	movq	%rcx, 96(%rsp)
	movq	%r9, %r12
	xorl	%r14d, %r14d
	movq	%r9, 104(%rsp)
	leaq	4968(%rsi), %r8
	xorl	%r11d, %r11d
	leaq	2496(%rsi), %r15
	imulq	$771280, %rbx, %rax
	movq	%rbx, %rdx
	movq	%rsi, 112(%rsp)
	negq	%rdx
	imulq	$768800, %rbx, %rdi
	movq	%r13, 160(%rsp)
	movq	%r8, %r13
	leaq	0(,%rdx,8), %r10
	movq	%rbx, %rdx
	addq	$dp-768800, %rax
	movq	%r10, 48(%rsp)
	movq	%rax, 16(%rsp)
	imulq	$768808, %rbx, %rax
	movl	$dp, %ebx
	subq	%r10, %rbx
	movq	%rdi, 168(%rsp)
	subq	$8, %rbx
	addq	$dp-8, %rax
	movq	%rbx, 72(%rsp)
	movq	%rax, 40(%rsp)
	imulq	$766320, %rdx, %rax
	subq	$766320, %rax
	movq	%rax, (%rsp)
	.p2align 4,,10
	.p2align 3
.L45:
	movq	48(%rsp), %rax
	movq	40(%rsp), %r9
	movq	16(%rsp), %r8
	leaq	(%r12,%rax), %rdi
	movq	72(%rsp), %rax
	leaq	(%rax,%r14), %rsi
	.p2align 4,,10
	.p2align 3
.L31:
	movq	24(%rsp), %rax
	movq	8(%rsp), %rbx
	movq	(%rdi), %rcx
	leaq	(%rdi,%rax), %r10
	addq	(%r10,%rbx), %rcx
	movq	8(%rsp), %rbx
	movq	%rcx, %rax
	imulq	%rbp
	leaq	(%rdx,%rcx), %rax
	movq	%rcx, %rdx
	sarq	$63, %rdx
	sarq	$29, %rax
	subq	%rdx, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	movq	%rcx, (%r10,%rbx)
	movq	(%rdi), %rcx
	addq	(%r8), %rcx
	movq	%rcx, %rax
	movq	%rcx, %r10
	imulq	%rbp
	sarq	$63, %r10
	leaq	(%rdx,%rcx), %rax
	sarq	$29, %rax
	subq	%r10, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	movq	%rcx, (%r8)
	movq	(%rdi), %rcx
	addq	(%r12), %rcx
	movq	%rcx, %rax
	movq	%rcx, %r10
	imulq	%rbp
	sarq	$63, %r10
	leaq	(%rdx,%rcx), %rax
	movq	56(%rsp), %rdx
	sarq	$29, %rax
	subq	%r10, %rax
	leaq	(%r8,%rdx), %rbx
	leaq	(%rdi,%rdx), %r10
	movq	32(%rsp), %rdx
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	movq	%rcx, (%r12)
	movq	(%r10,%r11), %rcx
	addq	(%rbx,%rdx), %rcx
	movq	%rcx, %rax
	imulq	%rbp
	leaq	(%rdx,%rcx), %rax
	movq	%rcx, %rdx
	sarq	$63, %rdx
	sarq	$29, %rax
	subq	%rdx, %rax
	movq	32(%rsp), %rdx
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	movq	24(%rsp), %rax
	movq	%rcx, (%rbx,%rdx)
	movq	(%r10,%r11), %rcx
	leaq	(%r8,%rax), %rbx
	addq	(%rbx,%r14), %rcx
	movq	%rcx, %rax
	imulq	%rbp
	leaq	(%rdx,%rcx), %rax
	movq	%rcx, %rdx
	sarq	$63, %rdx
	sarq	$29, %rax
	subq	%rdx, %rax
	addq	$8, %rdi
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	movq	%rcx, (%rbx,%r14)
	movq	(%r10,%r11), %rcx
	addq	(%r15), %rcx
	movq	%rcx, %rax
	movq	%rcx, %r10
	imulq	%rbp
	sarq	$63, %r10
	leaq	(%rdx,%rcx), %rax
	sarq	$29, %rax
	subq	%r10, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	movq	%rcx, (%r15)
	movq	(%rsi), %rcx
	addq	(%r9), %rcx
	movq	%rcx, %rax
	movq	%rcx, %r10
	imulq	%rbp
	sarq	$63, %r10
	leaq	(%rdx,%rcx), %rax
	sarq	$29, %rax
	subq	%r10, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	movq	%rcx, (%r9)
	movq	(%rsi), %rcx
	addq	0(%r13), %rcx
	movq	%rcx, %rax
	movq	%rcx, %r10
	imulq	%rbp
	sarq	$63, %r10
	leaq	(%rdx,%rcx), %rax
	sarq	$29, %rax
	subq	%r10, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	movq	%rcx, 0(%r13)
	movq	(%rsi), %rcx
	addq	8(%rsi), %rcx
	movq	%rcx, %rax
	movq	%rcx, %r10
	imulq	%rbp
	sarq	$63, %r10
	leaq	(%rdx,%rcx), %rax
	sarq	$29, %rax
	subq	%r10, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	movq	64(%rsp), %rax
	addq	$8, %r8
	addq	$2480, %r9
	movq	%rcx, 8(%rsi)
	addq	$2480, %rsi
	cmpq	%rax, %r9
	jne	.L31
	movq	(%rsp), %rax
	addq	$766320, %r11
	addq	$2480, %r12
	addq	$768800, %r14
	addq	$768800, %r15
	addq	$768800, %r13
	cmpq	%rax, %r11
	jne	.L45
	movq	96(%rsp), %rcx
	movq	104(%rsp), %r9
	movq	112(%rsp), %rsi
	movq	160(%rsp), %r13
	leaq	(%rcx,%rcx,2), %rax
	movq	168(%rsp), %rdi
	movq	120(%rsp), %rbx
	leaq	c(,%rax,8), %rax
	cmpq	%rbx, 8(%rax)
	jne	.L33
	imulq	$2480, %rbx, %rdx
	movq	%rcx, 104(%rsp)
	movq	128(%rsp), %r15
	movq	%r9, 160(%rsp)
	movq	%rsi, 168(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%rdi, 112(%rsp)
	movq	%rbx, %rdi
	.p2align 4,,10
	.p2align 3
.L34:
	movq	(%rax), %rbx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rax, 96(%rsp)
	movq	$0, 16(%rsp)
	movq	16(%rax), %rsi
	cmpq	%rdi, %rbx
	movq	%rbx, %r12
	movq	%rbx, 48(%rsp)
	movq	72(%rsp), %r11
	movq	$0, (%rsp)
	movq	112(%rsp), %r10
	cmovg	%rdi, %r12
	.p2align 4,,10
	.p2align 3
.L43:
	movq	48(%rsp), %rax
	movq	(%rsp), %rbx
	cmpq	%rbx, %rax
	setle	40(%rsp)
	testq	%rax, %rax
	jg	.L42
	xorl	%eax, %eax
.L40:
	movq	16(%rsp), %r14
	imulq	$2480, %rax, %rcx
	movq	8(%rsp), %rbx
	leaq	(%r14,%rbx), %rdx
	imulq	$768800, %rax, %rbx
	leaq	dp(%rcx,%rdx), %rcx
	movq	72(%rsp), %rdx
	addq	%r14, %rdx
	cmpb	$1, 40(%rsp)
	leaq	dp(%rbx,%rdx), %rdx
	sbbl	%ebx, %ebx
	leal	3(%rbx), %r14d
	.p2align 4,,10
	.p2align 3
.L36:
	cmpq	%r14, %rsi
	je	.L35
	movq	$0, dp(%r10,%rax,8)
	leaq	(%rcx,%r8), %rbx
	movq	$0, (%rcx)
	movq	$0, dp(%r11,%rax,8)
	movq	$0, (%rdx)
	movq	$0, (%rbx,%r15)
	leaq	(%rdx,%r9), %rbx
	movq	$0, (%rbx,%r13)
.L35:
	addq	$1, %rax
	addq	$2480, %rcx
	addq	$768800, %rdx
	cmpq	%rax, %rdi
	jg	.L36
.L37:
	addq	$1, (%rsp)
	movq	(%rsp), %rax
	addq	$2480, %r10
	addq	$768800, %r11
	addq	$8, 16(%rsp)
	addq	$768792, %r8
	addq	$2472, %r9
	cmpq	%rdi, %rax
	jne	.L43
	movq	96(%rsp), %rax
	addq	$1, 104(%rsp)
	addq	$24, %rax
	cmpq	%rdi, 8(%rax)
	je	.L34
	movq	104(%rsp), %rcx
	movq	160(%rsp), %r9
	movq	168(%rsp), %rsi
.L33:
	addq	$1, 120(%rsp)
	movq	120(%rsp), %rax
	addq	$768808, %r9
	addq	$2488, %rsi
	movq	136(%rsp), %rdi
	subq	$2472, %r13
	subq	$768800, 24(%rsp)
	addq	$768800, 8(%rsp)
	subq	$766320, 56(%rsp)
	addq	$766320, 32(%rsp)
	addq	$771288, 64(%rsp)
	subq	$768792, 128(%rsp)
	addq	$768800, 80(%rsp)
	addq	$2480, 88(%rsp)
	cmpq	%rdi, %rax
	jne	.L30
	movq	144(%rsp), %rdi
	movq	152(%rsp), %r8
.L44:
	imulq	$2472, %rdi, %rax
	xorl	%esi, %esi
	imulq	$768800, %rdi, %r11
	movq	%rsi, %rcx
	imulq	$2480, %rdi, %r10
	imulq	$771280, %rdi, %rbx
	subq	%rax, %r8
	movq	%r8, %rbp
	movabsq	$-8543223828751151131, %r8
.L47:
	leaq	0(%rbp,%r10), %r9
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L48:
	addq	dp(%r11,%rsi,8), %rcx
	addq	$2480, %r9
	movq	%rcx, %rax
	imulq	%r8
	leaq	(%rdx,%rcx), %rax
	movq	%rcx, %rdx
	sarq	$63, %rdx
	sarq	$29, %rax
	subq	%rdx, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %rcx
	addq	dp(%r10,%rsi,8), %rcx
	addq	$1, %rsi
	movq	%rcx, %rax
	movq	%rcx, %r12
	imulq	%r8
	leaq	(%rdx,%rcx), %rax
	movq	%rcx, %rdx
	sarq	$63, %rdx
	sarq	$29, %rax
	subq	%rdx, %rax
	imulq	$1000000007, %rax, %rax
	subq	%rax, %r12
	addq	-2480(%r9), %r12
	movq	%r12, %rax
	imulq	%r8
	movq	%r12, %rax
	sarq	$63, %rax
	leaq	(%rdx,%r12), %rcx
	sarq	$29, %rcx
	subq	%rax, %rcx
	imulq	$1000000007, %rcx, %rax
	movq	%r12, %rcx
	subq	%rax, %rcx
	cmpq	%rsi, %rdi
	jne	.L48
	addq	$768800, %r10
	addq	$2480, %r11
	cmpq	%r10, %rbx
	jne	.L47
	movq	%rcx, %rsi
.L46:
	movl	$.LC3, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L42:
	movq	16(%rsp), %rax
	movq	80(%rsp), %rbx
	cmpb	$1, 40(%rsp)
	leaq	(%rax,%rbx), %rcx
	movq	88(%rsp), %rbx
	sbbq	%r14, %r14
	addq	$2, %r14
	leaq	(%rax,%rbx), %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L39:
	cmpq	%rsi, %r14
	je	.L38
	movq	$0, dp(%r10,%rax,8)
	leaq	(%rcx,%r8), %rbx
	movq	$0, (%rcx)
	movq	$0, dp(%r11,%rax,8)
	movq	$0, (%rdx)
	movq	$0, (%rbx,%r15)
	leaq	(%rdx,%r9), %rbx
	movq	$0, (%rbx,%r13)
.L38:
	addq	$1, %rax
	addq	$2480, %rcx
	addq	$768800, %rdx
	cmpq	%r12, %rax
	jl	.L39
	cmpq	%rdi, %rax
	jl	.L40
	jmp	.L37
.L29:
	jne	.L50
	movl	$dp, %r8d
	jmp	.L44
.L50:
	xorl	%esi, %esi
	jmp	.L46
	.cfi_endproc
.LFE14:
	.size	main, .-main
	.globl	c
	.bss
	.align 32
	.type	c, @object
	.size	c, 7440
c:
	.zero	7440
	.globl	dp
	.align 32
	.type	dp, @object
	.size	dp, 238328000
dp:
	.zero	238328000
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
