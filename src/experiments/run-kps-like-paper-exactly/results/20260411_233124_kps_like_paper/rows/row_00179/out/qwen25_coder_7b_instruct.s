.file	"inputC.c"
	.text
	.globl	N
	.bss
	.align 4
	.type	N, @object
	.size	N, 4
N:
	.zero	4
	.globl	B
	.align 32
	.type	B, @object
	.size	B, 400
B:
	.zero	400
	.globl	i
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	j
	.align 4
	.type	j, @object
	.size	j, 4
j:
	.zero	4
	.globl	Ix
	.data
	.align 32
	.type	Ix, @object
	.size	Ix, 168
Ix:
	.long	0
	.long	-1
	.long	0
	.long	1
	.long	-2
	.long	-1
	.long	0
	.long	1
	.long	2
	.long	-1
	.long	0
	.long	1
	.long	0
	.long	-9
	.long	0
	.long	1
	.long	2
	.long	0
	.long	1
	.long	2
	.long	0
	.long	1
	.long	2
	.long	-9
	.zero	16
	.long	0
	.long	-1
	.long	0
	.long	1
	.long	0
	.long	-9
	.zero	32
	.globl	Iy
	.align 32
	.type	Iy, @object
	.size	Iy, 168
Iy:
	.long	0
	.long	1
	.long	1
	.long	1
	.long	2
	.long	2
	.long	2
	.long	2
	.long	2
	.long	3
	.long	3
	.long	3
	.long	4
	.long	-9
	.long	0
	.long	0
	.long	0
	.long	1
	.long	1
	.long	1
	.long	2
	.long	2
	.long	2
	.long	-9
	.zero	16
	.long	0
	.long	1
	.long	1
	.long	1
	.long	2
	.long	-9
	.zero	32
	.text
	.globl	ch
	.type	ch, @function
ch:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$0, -4(%rbp)
	js	.L2
	cmpl	$9, -4(%rbp)
	jg	.L2
	cmpl	$0, -8(%rbp)
	js	.L2
	cmpl	$9, -8(%rbp)
	jg	.L2
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	B(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	jle	.L2
	movl	$1, %eax
	jmp	.L4
.L2:
	movl	$0, %eax
.L4:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	ch, .-ch
	.section	.rodata
.LC0:
	.string	"%d "
.LC1:
	.string	""
	.align 8
.LC2:
	.string	"----------------------------------------"
	.text
	.globl	dbg
	.type	dbg, @function
dbg:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -8(%rbp)
	jmp	.L6
.L9:
	movl	$0, -4(%rbp)
	jmp	.L7
.L8:
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	B(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L7:
	cmpl	$9, -4(%rbp)
	jle	.L8
	addl	$1, -8(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L6:
	cmpl	$9, -8(%rbp)
	jle	.L9
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	dbg, .-dbg
	.section	.rodata
.LC3:
	.string	"%d %d %d\n"
	.text
	.globl	dfs
	.type	dfs, @function
dfs:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movl	N(%rip), %eax
	cmpl	%eax, -28(%rbp)
	jle	.L11
	movl	$0, %eax
	jmp	.L12
.L11:
	cmpl	$10, -20(%rbp)
	jne	.L13
	movl	N(%rip), %eax
	cmpl	%eax, -28(%rbp)
	sete	%al
	movzbl	%al, %eax
	jmp	.L12
.L13:
	movl	-24(%rbp), %eax
	movslq	%eax, %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	B(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	jne	.L14
	movl	-24(%rbp), %eax
	leal	1(%rax), %edx
	movslq	%edx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	sarl	$2, %eax
	movl	%edx, %esi
	sarl	$31, %esi
	subl	%esi, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	s
