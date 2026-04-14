.file	"inputC.c"
	.text
	.globl	Q
	.bss
	.align 32
	.type	Q, @object
	.size	Q, 10400520
Q:
	.zero	10400520
	.globl	head
	.align 4
	.type	head, @object
	.size	head, 4
head:
	.zero	4
	.globl	tail
	.align 4
	.type	tail, @object
	.size	tail, 4
tail:
	.zero	4
	.globl	n
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.text
	.globl	enqueue
	.type	enqueue, @function
enqueue:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movl	tail(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	Q(%rip), %rax
	movq	16(%rbp), %rcx
	movq	24(%rbp), %rbx
	movq	%rcx, (%rdx,%rax)
	movq	%rbx, 8(%rdx,%rax)
	movq	32(%rbp), %rcx
	movq	40(%rbp), %rbx
	movq	%rcx, 16(%rdx,%rax)
	movq	%rbx, 24(%rdx,%rax)
	movq	48(%rbp), %rcx
	movq	56(%rbp), %rbx
	movq	%rcx, 32(%rdx,%rax)
	movq	%rbx, 40(%rdx,%rax)
	movq	64(%rbp), %rcx
	movq	72(%rbp), %rbx
	movq	%rcx, 48(%rdx,%rax)
	movq	%rbx, 56(%rdx,%rax)
	movq	80(%rbp), %rcx
	movq	88(%rbp), %rbx
	movq	%rcx, 64(%rdx,%rax)
	movq	%rbx, 72(%rdx,%rax)
	movq	96(%rbp), %rcx
	movq	104(%rbp), %rbx
	movq	%rcx, 80(%rdx,%rax)
	movq	%rbx, 88(%rdx,%rax)
	movq	112(%rbp), %rcx
	movq	%rcx, 96(%rdx,%rax)
	movl	tail(%rip), %eax
	leal	1(%rax), %edx
	movslq	%edx, %rax
	imulq	$-1480358259, %rax, %rax
	shrq	$32, %rax
	addl	%edx, %eax
	sarl	$16, %eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	imull	$100005, %eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	movl	%eax, tail(%rip)
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	enqueue, .-enqueue
	.globl	dequeue
	.type	dequeue, @function
dequeue:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$136, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -136(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	head(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	Q(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movq	8(%rdx,%rax), %rbx
	movq	%rcx, -128(%rbp)
	movq	%rbx, -120(%rbp)
	movq	16(%rdx,%rax), %rcx
	movq	24(%rdx,%rax), %rbx
	movq	%rcx, -112(%rbp)
	movq	%rbx, -104(%rbp)
	movq	32(%rdx,%rax), %rcx
	movq	40(%rdx,%rax), %rbx
	movq	%rcx, -96(%rbp)
	movq	%rbx, -88(%rbp)
	movq	48(%rdx,%rax), %rcx
	movq	56(%rdx,%rax), %rbx
	movq	%rcx, -80(%rbp)
	movq	%rbx, -72(%rbp)
	movq	64(%rdx,%rax), %rcx
	movq	72(%rdx,%rax), %rbx
	movq	%rcx, -64(%rbp)
	movq	%rbx, -56(%rbp)
	movq	80(%rdx,%rax), %rcx
	movq	88(%rdx,%rax), %rbx
	movq	%rcx, -48(%rbp)
	movq	%rbx, -40(%rbp)
	movq	96(%rdx,%rax), %rax
	movq	%rax, -32(%rbp)
	movl	head(%rip), %eax
	leal	1(%rax), %edx
	movslq	%edx, %rax
	imulq	$-1480358259, %rax, %rax
	shrq	$32, %rax
	addl	%edx, %eax
	sarl	$16, %eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	imull	$100005, %eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	movl	%eax, head(%rip)
	movq	-136(%rbp), %rax
	movq	-128(%rbp), %rcx
	movq	-120(%rbp), %rbx
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	movq	-112(%rbp), %rcx
	movq	-104(%rbp), %rbx
	movq	%rcx, 16(%rax)
	movq	%rbx, 24(%rax)
	movq	-96(%rbp), %rcx
	movq	-88(%rbp), %rbx
	movq	%rcx, 32(%rax)
	movq	%rbx, 40(%rax)
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rbx
	movq	%rcx, 48(%rax)
	movq	%rbx, 56(%rax)
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rbx
	movq	%rcx,
