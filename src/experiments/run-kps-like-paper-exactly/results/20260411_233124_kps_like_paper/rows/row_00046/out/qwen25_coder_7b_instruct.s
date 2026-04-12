.file	"inputC.c"
	.text
	.globl	a
	.bss
	.align 32
	.type	a, @object
	.size	a, 400004
a:
	.zero	400004
	.globl	com
	.align 32
	.type	com, @object
	.size	com, 400004
com:
	.zero	400004
	.globl	x
	.align 32
	.type	x, @object
	.size	x, 400004
x:
	.zero	400004
	.globl	y
	.align 32
	.type	y, @object
	.size	y, 400004
y:
	.zero	400004
	.globl	b
	.align 32
	.type	b, @object
	.size	b, 400004
b:
	.zero	400004
	.globl	B
	.data
	.align 4
	.type	B, @object
	.size	B, 4
B:
	.long	2000
	.globl	n
	.bss
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.globl	q
	.align 4
	.type	q, @object
	.size	q, 4
q:
	.zero	4
	.section	.rodata
.LC0:
	.string	"%d %d"
.LC1:
	.string	"%d %d %d"
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
	subq	$16, %rsp
	leaq	a(%rip), %rax
	movq	%rax, %rdi
	call	put
	leaq	q(%rip), %rax
	movq	%rax, %rdx
	leaq	n(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -4(%rbp)
	jmp	.L2
.L5:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	y(%rip), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	x(%rip), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rsi
	leaq	com(%rip), %rax
	addq	%rsi, %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	com(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	jne	.L3
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	y(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	x(%rip), %rax
	movl	(%rcx,%rax), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	update
	jmp	.L4
.L3:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	com(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$1, %eax
	jne	.L4
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	y(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	x(%rip), %rax
	movl	(%rcx,%rax), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	find
.L4:
	addl	$1, -4(%rbp)
.L2:
	movl	q(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L5
	movl	$0, %eax
	leave
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
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jg	.L8
	movl	-4(%rbp), %eax
	jmp	.L9
.L8:
	movl	-8(%rbp), %eax
.L9:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	min, .-min
	.globl	update
	.type	update, @function
update:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movl	%edi, -28(%rbp)
	movl	%esi, -32(%rbp)
	movl	-28(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	a(%rip), %rdx
	movl	-32(%rbp), %eax
	movl	%eax, (%rcx,%rdx)
	movl	B(%rip), %ebx
	movl	-28(%rbp), %eax
	cltd
	idivl	%ebx
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	b(%rip), %rax
	movl	$2147483647, (%rdx,%rax)
	movl	B(%rip), %ecx
	movl	-28(%rbp), %eax
	cltd
	idivl	%ecx
	movl	-28(%rbp), %eax
	subl	%edx, %eax
	movl	%eax, -12(%rbp)
	jmp	.L11
.L12:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %esi
	movl	B(%rip), %edi
	movl	-28(%rbp), %eax
	cltd
	idivl	%edi
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	b(%rip), %rax
	movl	(%rdx,%rax), %ecx
	movl	B(%rip), %ebx
	movl	-28(%rbp), %eax
