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
	movq	%rcx, 64(%rax)
	movq	%rbx, 72(%rax)
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rbx
	movq	%rcx, 80(%rax)
	movq	%rbx, 88(%rax)
	movq	-32(%rbp), %rdx
	movq	%rdx, 96(%rax)
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	movq	-136(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	dequeue, .-dequeue
	.globl	min
	.type	min, @function
min:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	cmpl	%eax, %edx
	cmovle	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	min, .-min
	.section	.rodata
.LC0:
	.string	"%d %d"
.LC1:
	.string	"%s"
.LC2:
	.string	"%d"
.LC3:
	.string	"%s %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$320, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -204(%rbp)
	leaq	-208(%rbp), %rax
	movq	%rax, %rdx
	leaq	n(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$1, -200(%rbp)
	jmp	.L8
.L9:
	movl	-200(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	Q(%rip), %rdx
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-200(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	96(%rax), %rdx
	leaq	Q(%rip), %rax
	addq	%rdx, %rax
	addq	$4, %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -200(%rbp)
.L8:
	movl	n(%rip), %eax
	cmpl	%eax, -200(%rbp)
	jle	.L9
	movl	$1, head(%rip)
	movl	n(%rip), %eax
	addl	$1, %eax
	movl	%eax, tail(%rip)
	jmp	.L10
.L12:
	leaq	-320(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	dequeue
	movq	-320(%rbp), %rax
	movq	-312(%rbp), %rdx
	movq	%rax, -192(%rbp)
	movq	%rdx, -184(%rbp)
	movq	-304(%rbp), %rax
	movq	-296(%rbp), %rdx
	movq	%rax, -176(%rbp)
	movq	%rdx, -168(%rbp)
	movq	-288(%rbp), %rax
	movq	-280(%rbp), %rdx
	movq	%rax, -160(%rbp)
	movq	%rdx, -152(%rbp)
	movq	-272(%rbp), %rax
	movq	-264(%rbp), %rdx
	movq	%rax, -144(%rbp)
	movq	%rdx, -136(%rbp)
	movq	-256(%rbp), %rax
	movq	-248(%rbp), %rdx
	movq	%rax, -128(%rbp)
	movq	%rdx, -120(%rbp)
	movq	-240(%rbp), %rax
	movq	-232(%rbp), %rdx
	movq	%rax, -112(%rbp)
	movq	%rdx, -104(%rbp)
	movq	-224(%rbp), %rax
	movq	%rax, -96(%rbp)
	movl	-92(%rbp), %edx
	movl	-208(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	min
	movl	%eax, -196(%rbp)
	movl	-92(%rbp), %eax
	subl	-196(%rbp), %eax
	movl	%eax, -92(%rbp)
	movl	-196(%rbp), %eax
	addl	%eax, -204(%rbp)
	movl	-92(%rbp), %eax
	testl	%eax, %eax
	jle	.L11
	subq	$8, %rsp
	pushq	-96(%rbp)
	pushq	-104(%rbp)
	pushq	-112(%rbp)
	pushq	-120(%rbp)
	pushq	-128(%rbp)
	pushq	-136(%rbp)
	pushq	-144(%rbp)
	pushq	-152(%rbp)
	pushq	-160(%rbp)
	pushq	-168(%rbp)
	pushq	-176(%rbp)
	pushq	-184(%rbp)
	pushq	-192(%rbp)
	call	enqueue
	addq	$112, %rsp
	jmp	.L10
.L11:
	movl	-204(%rbp), %edx
	leaq	-192(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L10:
	movl	head(%rip), %edx
	movl	tail(%rip), %eax
	cmpl	%eax, %edx
	jne	.L12
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
