.file	"inputC.c"
	.text
	.section	.rodata
	.align 4
	.type	N, @object
	.size	N, 4
N:
	.long	100
.LC0:
	.string	"%d"
.LC1:
	.string	"%d%d"
.LC2:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$112, %rsp
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %r14
	movl	$100, %eax
	addl	$1, %eax
	cltq
	subq	$1, %rax
	movq	%rax, -80(%rbp)
	movl	$100, %eax
	addl	$1, %eax
	cltq
	movq	%rax, -128(%rbp)
	movq	$0, -120(%rbp)
	movl	$100, %eax
	addl	$1, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ebx
	movl	$0, %edx
	divq	%rbx
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L2:
	cmpq	%rdx, %rsp
	je	.L3
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L2
.L3:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L4
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L4:
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -72(%rbp)
	movl	$100, %eax
	addl	$1, %eax
	cltq
	subq	$1, %rax
	movq	%rax, -64(%rbp)
	movl	$100, %eax
	addl	$1, %eax
	cltq
	movq	%rax, -144(%rbp)
	movq	$0, -136(%rbp)
	movl	$100, %eax
	addl	$1, %eax
	cltq
	leaq	0(,%rax,4), %rbx
	movl	$100, %eax
	addl	$1, %eax
	cltq
	subq	$1, %rax
	movq	%rax, -56(%rbp)
	movl	$100, %eax
	addl	$1, %eax
	cltq
	movq	%rax, %r12
	movl	$0, %r13d
	movl	$100, %eax
	addl	$1, %eax
	cltq
	movq	%rax, %r10
	movl	$0, %r11d
	movq	%r13, %rdx
	imulq	%r10, %rdx
	movq	%r11, %rax
	imulq	%r12, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r12, %rax
	mulq	%r10
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movl	$100, %eax
	addl	$1, %eax
	cltq
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$100, %eax
	addl	$1, %eax
	cltq
	movq	%rax, %rsi
	movl	$0, %edi
	movq	%r9, %rdx
	imulq	%rsi, %rdx
	movq	%rdi, %rax
	imulq	%r8, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r8, %rax
	mulq	%rsi
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movl	$100, %eax
	addl	$1, %eax
	movslq	%eax, %rdx
	movl	$100, %eax
	addl	$1, %eax
	cltq
	imulq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %edi
	movl	$0, %edx
	divq	%rdi
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L5:
	cmpq	%rdx, %rsp
	je	.L6
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L5
.L6:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L7
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L7:
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -48(%rbp)
	leaq	-100(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$1, -96(%rbp)
	jmp	.L8
.L9:
	movl	-96(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-72(%rbp), %rax
	addq	%rax, %rdx
	movl	-96(%rbp), %eax
	subl	$1, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-72(%rbp), %rax
	addq	%rcx, %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl
