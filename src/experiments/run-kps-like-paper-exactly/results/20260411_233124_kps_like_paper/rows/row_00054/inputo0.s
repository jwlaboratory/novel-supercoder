	.file	"inputC.c"
	.text
	.globl	T
	.bss
	.align 32
	.type	T, @object
	.size	T, 120000
T:
	.zero	120000
	.globl	n
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.section	.rodata
.LC0:
	.string	" %d"
	.text
	.globl	preParse
	.type	preParse, @function
preParse:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	je	.L4
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	4+T(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %edi
	call	preParse
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	8+T(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %edi
	call	preParse
	jmp	.L1
.L4:
	nop
.L1:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	preParse, .-preParse
	.globl	inParse
	.type	inParse, @function
inParse:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	je	.L8
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	4+T(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %edi
	call	inParse
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	8+T(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %edi
	call	inParse
	jmp	.L5
.L8:
	nop
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	inParse, .-inParse
	.globl	postParse
	.type	postParse, @function
postParse:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	je	.L12
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	4+T(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %edi
	call	postParse
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	8+T(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %edi
	call	postParse
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L9
.L12:
	nop
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	postParse, .-postParse
	.section	.rodata
.LC1:
	.string	"%d"
.LC2:
	.string	"%d %d %d"
.LC3:
	.string	"Preorder"
.LC4:
	.string	"Inorder"
.LC5:
	.string	"Postorder"
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
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	n(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -16(%rbp)
	jmp	.L14
.L15:
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	T(%rip), %rax
	movl	$-1, (%rdx,%rax)
	addl	$1, -16(%rbp)
.L14:
	movl	n(%rip), %eax
	cmpl	%eax, -16(%rbp)
	jl	.L15
	movl	$0, -16(%rbp)
	jmp	.L16
.L19:
	leaq	-20(%rbp), %rcx
	leaq	-24(%rbp), %rdx
	leaq	-28(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-28(%rbp), %eax
	movl	-24(%rbp), %edx
	movslq	%eax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	salq	$2, %rax
	movq	%rax, %rcx
	leaq	4+T(%rip), %rax
	movl	%edx, (%rcx,%rax)
	movl	-28(%rbp), %eax
	movl	-20(%rbp), %edx
	movslq	%eax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	salq	$2, %rax
	movq	%rax, %rcx
	leaq	8+T(%rip), %rax
	movl	%edx, (%rcx,%rax)
	movl	-24(%rbp), %eax
	cmpl	$-1, %eax
	je	.L17
	movl	-24(%rbp), %eax
	movl	-28(%rbp), %edx
	movslq	%eax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	salq	$2, %rax
	movq	%rax, %rcx
	leaq	T(%rip), %rax
	movl	%edx, (%rcx,%rax)
.L17:
	movl	-20(%rbp), %eax
	cmpl	$-1, %eax
	je	.L18
	movl	-20(%rbp), %eax
	movl	-28(%rbp), %edx
	movslq	%eax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	salq	$2, %rax
	movq	%rax, %rcx
	leaq	T(%rip), %rax
	movl	%edx, (%rcx,%rax)
.L18:
	addl	$1, -16(%rbp)
.L16:
	movl	n(%rip), %eax
	cmpl	%eax, -16(%rbp)
	jl	.L19
	movl	$0, -16(%rbp)
	jmp	.L20
.L22:
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	leaq	T(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$-1, %eax
	jne	.L21
	movl	-16(%rbp), %eax
	movl	%eax, -12(%rbp)
.L21:
	addl	$1, -16(%rbp)
.L20:
	movl	n(%rip), %eax
	cmpl	%eax, -16(%rbp)
	jl	.L22
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	preParse
	movl	$10, %edi
	call	putchar@PLT
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	inParse
	movl	$10, %edi
	call	putchar@PLT
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	postParse
	movl	$10, %edi
	call	putchar@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
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
