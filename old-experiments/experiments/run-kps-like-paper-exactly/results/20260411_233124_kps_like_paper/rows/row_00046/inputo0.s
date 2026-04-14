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
	cltd
	idivl	%ebx
	movl	%eax, %ebx
	movl	%ecx, %edi
	call	min
	movslq	%ebx, %rdx
	leaq	0(,%rdx,4), %rcx
	leaq	b(%rip), %rdx
	movl	%eax, (%rcx,%rdx)
	addl	$1, -12(%rbp)
.L11:
	movl	n(%rip), %ecx
	movl	B(%rip), %esi
	movl	-28(%rbp), %eax
	cltd
	idivl	%esi
	movl	%edx, %esi
	movl	-28(%rbp), %eax
	subl	%esi, %eax
	movl	%eax, %edx
	movl	B(%rip), %eax
	addl	%edx, %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	min
	cmpl	%eax, -12(%rbp)
	jl	.L12
	nop
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	update, .-update
	.section	.rodata
.LC2:
	.string	"%d\n"
	.text
	.globl	find
	.type	find, @function
find:
.LFB3:
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
	movl	$2147483647, -8(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.L14
.L16:
	movl	B(%rip), %ecx
	movl	-4(%rbp), %eax
	cltd
	idivl	%ecx
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L15
	movl	B(%rip), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	cmpl	%eax, -24(%rbp)
	jle	.L15
	movl	B(%rip), %ecx
	movl	-4(%rbp), %eax
	cltd
	idivl	%ecx
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	b(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-8(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	min
	movl	%eax, -8(%rbp)
	movl	B(%rip), %eax
	addl	%eax, -4(%rbp)
	jmp	.L14
.L15:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-8(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	min
	movl	%eax, -8(%rbp)
	addl	$1, -4(%rbp)
.L14:
	movl	-4(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jle	.L16
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	find, .-find
	.globl	put
	.type	put, @function
put:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L18
.L19:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	$2147483647, (%rax)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	b(%rip), %rax
	movl	$2147483647, (%rdx,%rax)
	addl	$1, -4(%rbp)
.L18:
	cmpl	$100000, -4(%rbp)
	jle	.L19
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	put, .-put
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
