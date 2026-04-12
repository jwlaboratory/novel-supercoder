.file	"inputC.c"
	.text
	.globl	make_union_find
	.type	make_union_find, @function
make_union_find:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-24(%rbp), %rax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	$0, -16(%rbp)
	jmp	.L2
.L3:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	salq	$3, %rax
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-16(%rbp), %rax
	salq	$3, %rax
	addq	%rdx, %rax
	movq	$1, (%rax)
	addq	$1, -16(%rbp)
.L2:
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jl	.L3
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	make_union_find, .-make_union_find
	.globl	root_uf
	.type	root_uf, @function
root_uf:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	cmpq	%rax, -40(%rbp)
	jne	.L6
	movq	-40(%rbp), %rax
	jmp	.L7
.L6:
	movq	-40(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	-40(%rbp), %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-24(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	root_uf
	movq	%rax, (%rbx)
	movq	-40(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
.L7:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	root_uf, .-root_uf
	.globl	combine_uf
	.type	combine_uf, @function
combine_uf:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-56(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	root_uf
	movq	%rax, -32(%rbp)
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	root_uf
	movq	%rax, -24(%rbp)
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-56(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	cmpq	-24(%rbp), %rax
	je	.L12
	movq	-32(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jge	.L11
	movq	-32(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movq	-32(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rsi
	movq	-8(%rbp), %rax
	addq	%rsi, %rax
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movq	-32(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movq	$0, (%
