	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d %d"
.LC1:
	.string	"-1"
.LC2:
	.string	"%d"
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	leaq	-104(%rbp), %rdx
	leaq	-108(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-104(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -88(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -128(%rbp)
	movq	$0, -120(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -144(%rbp)
	movq	$0, -136(%rbp)
	cltq
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
	movq	%rax, -80(%rbp)
	movl	-104(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -72(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %r14
	movl	$0, %r15d
	movslq	%eax, %rdx
	movq	%rdx, %r12
	movl	$0, %r13d
	cltq
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
	movq	%rax, -64(%rbp)
	movl	$0, -100(%rbp)
	jmp	.L8
.L9:
	movq	-80(%rbp), %rax
	movl	-100(%rbp), %edx
	movslq	%edx, %rdx
	movl	$0, (%rax,%rdx,4)
	movq	-64(%rbp), %rax
	movl	-100(%rbp), %edx
	movslq	%edx, %rdx
	movl	$0, (%rax,%rdx,4)
	movl	-100(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rax, %rdx
	movl	-100(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-80(%rbp), %rax
	addq	%rcx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -100(%rbp)
.L8:
	movl	-104(%rbp), %eax
	cmpl	%eax, -100(%rbp)
	jl	.L9
	movl	$0, -100(%rbp)
	jmp	.L10
.L15:
	movl	-100(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -96(%rbp)
	jmp	.L11
.L14:
	movq	-80(%rbp), %rax
	movl	-100(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %ecx
	movq	-80(%rbp), %rax
	movl	-96(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	%eax, %ecx
	jne	.L12
	movq	-64(%rbp), %rax
	movl	-100(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %ecx
	movq	-64(%rbp), %rax
	movl	-96(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	%eax, %ecx
	je	.L12
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	jmp	.L13
.L12:
	addl	$1, -96(%rbp)
.L11:
	movl	-104(%rbp), %eax
	cmpl	%eax, -96(%rbp)
	jl	.L14
	addl	$1, -100(%rbp)
.L10:
	movl	-104(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -100(%rbp)
	jl	.L15
	movl	$1, -100(%rbp)
	jmp	.L16
.L24:
	movl	$0, -92(%rbp)
	movl	$0, -96(%rbp)
	jmp	.L17
.L21:
	movq	-80(%rbp), %rax
	movl	-96(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	$1, %eax
	jne	.L18
	movq	-64(%rbp), %rax
	movl	-96(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	testl	%eax, %eax
	jne	.L18
	movl	-108(%rbp), %eax
	cmpl	$1, %eax
	jle	.L18
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	jmp	.L13
.L18:
	movq	-80(%rbp), %rax
	movl	-96(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	%eax, -100(%rbp)
	jne	.L19
	movq	-64(%rbp), %rax
	movl	-96(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, -92(%rbp)
	jmp	.L20
.L19:
	addl	$1, -96(%rbp)
.L17:
	movl	-104(%rbp), %eax
	cmpl	%eax, -96(%rbp)
	jl	.L21
.L20:
	cmpl	$0, -92(%rbp)
	jne	.L22
	cmpl	$1, -100(%rbp)
	jne	.L22
	movl	-108(%rbp), %eax
	cmpl	$1, %eax
	jle	.L22
	movl	$49, %edi
	call	putchar@PLT
	jmp	.L23
.L22:
	cmpl	$0, -92(%rbp)
	jne	.L23
	movl	$48, %edi
	call	putchar@PLT
.L23:
	addl	$1, -100(%rbp)
.L16:
	movl	-108(%rbp), %eax
	cmpl	%eax, -100(%rbp)
	jle	.L24
	movq	%rbx, %rsp
	movl	$0, %eax
	jmp	.L25
.L13:
	movq	%rbx, %rsp
.L25:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L26
	call	__stack_chk_fail@PLT
.L26:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
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
