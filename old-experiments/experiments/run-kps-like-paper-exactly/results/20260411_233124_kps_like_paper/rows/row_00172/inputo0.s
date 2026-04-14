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
	movq	%rax, %rcx
	movl	$0, %ebx
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
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -96(%rbp)
.L8:
	movl	-100(%rbp), %eax
	cmpl	%eax, -96(%rbp)
	jle	.L9
	movl	$1, -96(%rbp)
	jmp	.L10
.L11:
	movq	%rbx, %rdx
	shrq	$2, %rdx
	movq	-48(%rbp), %rax
	leaq	1(%rdx), %rcx
	movl	-96(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rcx, %rdx
	movl	$0, (%rax,%rdx,4)
	addl	$1, -96(%rbp)
.L10:
	movl	-100(%rbp), %eax
	cmpl	%eax, -96(%rbp)
	jle	.L11
	movl	$2, -88(%rbp)
	jmp	.L12
.L17:
	movl	$1, -96(%rbp)
	jmp	.L13
.L16:
	movl	-96(%rbp), %edx
	movl	-88(%rbp), %eax
	addl	%edx, %eax
	subl	$1, %eax
	movl	%eax, -84(%rbp)
	movq	%rbx, %rcx
	shrq	$2, %rcx
	movq	-48(%rbp), %rax
	movl	-84(%rbp), %edx
	movslq	%edx, %rsi
	movl	-96(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rcx, %rdx
	addq	%rsi, %rdx
	movl	$2097152, (%rax,%rdx,4)
	movl	-96(%rbp), %eax
	movl	%eax, -92(%rbp)
	jmp	.L14
.L15:
	movq	%rbx, %rcx
	shrq	$2, %rcx
	movq	-48(%rbp), %rax
	movl	-92(%rbp), %edx
	movslq	%edx, %rsi
	movl	-96(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rcx, %rdx
	addq	%rsi, %rdx
	movl	(%rax,%rdx,4), %edi
	movq	%rbx, %rcx
	shrq	$2, %rcx
	movl	-92(%rbp), %eax
	leal	1(%rax), %esi
	movq	-48(%rbp), %rax
	movl	-84(%rbp), %edx
	movslq	%edx, %r8
	movslq	%esi, %rdx
	imulq	%rcx, %rdx
	addq	%r8, %rdx
	movl	(%rax,%rdx,4), %eax
	leal	(%rdi,%rax), %esi
	movl	-96(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-72(%rbp), %rax
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %ecx
	movq	-72(%rbp), %rax
	movl	-92(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	imull	%eax, %ecx
	movq	-72(%rbp), %rax
	movl	-84(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	imull	%ecx, %eax
	leal	(%rsi,%rax), %edx
	movq	%rbx, %rsi
	shrq	$2, %rsi
	movq	-48(%rbp), %rax
	movl	-84(%rbp), %ecx
	movslq	%ecx, %rdi
	movl	-96(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	%rsi, %rcx
	addq	%rdi, %rcx
	movl	(%rax,%rcx,4), %eax
	movq	%rbx, %r12
	shrq	$2, %r12
	movl	%edx, %esi
	movl	%eax, %edi
	call	min
	movq	-48(%rbp), %rdx
	movl	-84(%rbp), %ecx
	movslq	%ecx, %rsi
	movl	-96(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	%r12, %rcx
	addq	%rsi, %rcx
	movl	%eax, (%rdx,%rcx,4)
	addl	$1, -92(%rbp)
.L14:
	movl	-84(%rbp), %eax
	cmpl	-92(%rbp), %eax
	jg	.L15
	addl	$1, -96(%rbp)
.L13:
	movl	-100(%rbp), %eax
	subl	-88(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -96(%rbp)
	jle	.L16
	addl	$1, -88(%rbp)
.L12:
	movl	-100(%rbp), %eax
	cmpl	%eax, -88(%rbp)
	jle	.L17
	shrq	$2, %rbx
	movq	%rbx, %rcx
	movl	-100(%rbp), %edx
	movq	-48(%rbp), %rax
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	movl	(%rax,%rdx,4), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	%r14, %rsp
	movq	-40(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L19
	call	__stack_chk_fail@PLT
.L19:
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	min
	.type	min, @function
min:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	cmpl	%eax, %edx
	cmovle	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	min, .-min
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
