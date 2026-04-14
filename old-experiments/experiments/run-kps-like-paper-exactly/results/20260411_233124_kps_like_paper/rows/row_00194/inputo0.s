	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d%d"
.LC3:
	.string	"%.8lf"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
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
	subq	$72, %rsp
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
	leaq	-104(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
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
	leaq	0(,%rax,8), %rdx
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
	movl	$0, -100(%rbp)
	jmp	.L5
.L6:
	movl	-100(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	leaq	4(%rax), %rdx
	movl	-100(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-64(%rbp), %rax
	addq	%rcx, %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -100(%rbp)
.L5:
	movl	-104(%rbp), %eax
	cmpl	%eax, -100(%rbp)
	jl	.L6
	movl	$1, -96(%rbp)
	movl	$1, -92(%rbp)
	jmp	.L7
.L8:
	movl	-96(%rbp), %eax
	imull	-92(%rbp), %eax
	movl	%eax, -96(%rbp)
	addl	$1, -92(%rbp)
.L7:
	movl	-104(%rbp), %eax
	cmpl	%eax, -92(%rbp)
	jl	.L8
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -80(%rbp)
	movl	$0, -88(%rbp)
	jmp	.L9
.L12:
	movl	$0, -84(%rbp)
	jmp	.L10
.L11:
	movq	-64(%rbp), %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,8), %ecx
	movq	-64(%rbp), %rax
	movl	-84(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,8), %eax
	movl	%ecx, %esi
	subl	%eax, %esi
	movq	-64(%rbp), %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,8), %ecx
	movq	-64(%rbp), %rax
	movl	-84(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,8), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%esi, %edi
	imull	%eax, %edi
	movq	-64(%rbp), %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	movl	4(%rax,%rdx,8), %ecx
	movq	-64(%rbp), %rax
	movl	-84(%rbp), %edx
	movslq	%edx, %rdx
	movl	4(%rax,%rdx,8), %eax
	movl	%ecx, %esi
	subl	%eax, %esi
	movq	-64(%rbp), %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	movl	4(%rax,%rdx,8), %ecx
	movq	-64(%rbp), %rax
	movl	-84(%rbp), %edx
	movslq	%edx, %rdx
	movl	4(%rax,%rdx,8), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	imull	%esi, %eax
	addl	%edi, %eax
	pxor	%xmm2, %xmm2
	cvtsi2sdl	%eax, %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-96(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	-80(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -80(%rbp)
	addl	$1, -84(%rbp)
.L10:
	movl	-104(%rbp), %eax
	cmpl	%eax, -84(%rbp)
	jl	.L11
	addl	$1, -88(%rbp)
.L9:
	movl	-104(%rbp), %eax
	cmpl	%eax, -88(%rbp)
	jl	.L12
	movl	-104(%rbp), %eax
	imull	-96(%rbp), %eax
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	movsd	-80(%rbp), %xmm0
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	%rbx, %rsp
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
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
.LFE6:
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
