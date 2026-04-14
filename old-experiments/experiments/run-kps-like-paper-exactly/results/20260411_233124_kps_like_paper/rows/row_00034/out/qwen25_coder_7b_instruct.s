.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%4d"
	.text
	.globl	solve
	.type	solve, @function
solve:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -100(%rbp)
	movq	%fs:40, %rcx
	movq	%rcx, -56(%rbp)
	xorl	%ecx, %ecx
	movq	%rsp, %rcx
	movq	%rcx, %r15
	movl	-100(%rbp), %ecx
	movl	-100(%rbp), %esi
	movslq	%ecx, %rdi
	subq	$1, %rdi
	movq	%rdi, -80(%rbp)
	movslq	%ecx, %rdi
	movq	%rdi, -128(%rbp)
	movq	$0, -120(%rbp)
	movslq	%ecx, %rdi
	leaq	0(,%rdi,4), %rbx
	movslq	%esi, %rdi
	subq	$1, %rdi
	movq	%rdi, -72(%rbp)
	movslq	%ecx, %rdi
	movq	%rdi, %r12
	movl	$0, %r13d
	movslq	%esi, %rdi
	movq	%rdi, %rax
	movl	$0, %edx
	movq	%r13, %r14
	imulq	%rax, %r14
	movq	%rdx, %rdi
	imulq	%r12, %rdi
	addq	%r14, %rdi
	mulq	%r12
	addq	%rdx, %rdi
	movq	%rdi, %rdx
	movslq	%ecx, %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movslq	%esi, %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	%r11, %rdx
	imulq	%r8, %rdx
	movq	%r9, %rax
	imulq	%r10, %rax
	leaq	(%rdx,%rax), %rdi
	movq	%r10, %rax
	mulq	%r8
	addq	%rdx, %rdi
	movq	%rdi, %rdx
	movslq	%ecx, %rdx
	movslq	%esi, %rax
	imulq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
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
	movq	%rax, -64(%rbp)
	movl	$0, -88(%rbp)
	jmp	.L5
.L8:
	movl	$0, -92(%rbp)
	jmp	.L6
.L7:
	movq	%rbx, %rcx
	shrq	$2, %rcx
	movq	-64(%rbp), %rax
	movl	-92(%rbp), %edx
	movslq	%edx, %rsi
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rcx, %rdx
	addq	%rsi, %rdx
	movl	$0, (%rax,%rdx,4)
	addl	$1, -92(%rbp)
.L6:
	movl	-92(%rbp), %eax
	cmpl	-100(%rbp), %eax
	jl	.L7
	addl	$1, -88(%rbp)
.L5:
	movl	-88(%rbp), %eax
	cmpl	-100(%rbp), %eax
	jl	.L8
	movl	-100(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -92(%rbp)
	movl	-92(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -88(%rbp)
	movq	%rbx, %rcx
	shrq	$2, %rcx
	movq	-64(%rbp), %rax
	movl	-92(%rbp), %edx
	movslq	%edx, %rsi
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rcx, %rdx
	addq	%rsi, %rdx
	movl	$1, (%rax,%rdx,4)
	movl	$1, -84(%rbp)
	jmp	.L9
.L13:
	movl	-92(%rbp), %eax
	addl	$1, %eax
	cltd
	idivl	-100(%rbp)
	movl	%edx, -92(%rbp)
	movl	-88(%rbp), %eax
	addl	$1, %eax
	cltd
	idivl	-100(%rbp)
	movl	%edx, -88(%rbp)
	movq	%rbx, %rcx
	shrq	$2, %rcx
	movq	-64(%rbp), %rax
	movl	-92(%rbp), %edx
	movslq	%edx, %rsi
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rcx, %rdx
	addq	%rsi, %rdx
	movl	(%rax,%rdx,4), %eax
	testl	%eax, %eax
	je	.L10
	cmpl	$0, -92(%rbp)
	jle	.L11
	movl	-92(%rbp), %eax
	subl	$1, %eax
	jmp	.L12
.L11:
	movl	-100(%rbp), %eax
	subl	$1, %eax
.L12:
	movl	%eax, -92(%rbp)
	movl	-88(%rbp), %eax
