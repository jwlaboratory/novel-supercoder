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
	sall	$2, %eax
	addl	%ecx, %eax
	addl	%eax, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rdx
	imulq	$1717986919, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$2, %edx
	sarl	$31, %eax
	subl	%eax, %edx
	movl	-20(%rbp), %eax
	leal	(%rdx,%rax), %edi
	movl	-28(%rbp), %eax
	movl	%eax, %edx
	movl	%ecx, %esi
	call	dfs
	jmp	.L12
.L14:
	movl	$0, -8(%rbp)
	jmp	.L15
.L29:
	movl	$0, -4(%rbp)
	jmp	.L16
.L19:
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	Iy(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-20(%rbp), %eax
	addl	%eax, %edx
	movl	-4(%rbp), %eax
	movslq	%eax, %rsi
	movl	-8(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rcx, %rax
	salq	$3, %rax
	subq	%rcx, %rax
	addq	%rax, %rax
	addq	%rsi, %rax
	leaq	0(,%rax,4), %rcx
	leaq	Ix(%rip), %rax
	movl	(%rcx,%rax), %ecx
	movl	-24(%rbp), %eax
	addl	%ecx, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	ch
	testl	%eax, %eax
	je	.L30
	addl	$1, -4(%rbp)
.L16:
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	Ix(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$-9, %eax
	jne	.L19
	jmp	.L18
.L30:
	nop
.L18:
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	Ix(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$-9, %eax
	jne	.L31
	movl	$0, -4(%rbp)
	jmp	.L22
.L23:
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	Iy(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-20(%rbp), %eax
	addl	%eax, %edx
	movl	-4(%rbp), %eax
	movslq	%eax, %rsi
	movl	-8(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rcx, %rax
	salq	$3, %rax
	subq	%rcx, %rax
	addq	%rax, %rax
	addq	%rsi, %rax
	leaq	0(,%rax,4), %rcx
	leaq	Ix(%rip), %rax
	movl	(%rcx,%rax), %ecx
	movl	-24(%rbp), %eax
	addl	%eax, %ecx
	movslq	%ecx, %rdi
	movslq	%edx, %rsi
	movq	%rsi, %rax
	salq	$2, %rax
	addq	%rsi, %rax
	addq	%rax, %rax
	addq	%rdi, %rax
	leaq	0(,%rax,4), %rsi
	leaq	B(%rip), %rax
	movl	(%rsi,%rax), %eax
	leal	-1(%rax), %esi
	movslq	%ecx, %rcx
	movslq	%edx, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	B(%rip), %rax
	movl	%esi, (%rdx,%rax)
	addl	$1, -4(%rbp)
.L22:
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	Ix(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$-9, %eax
	jne	.L23
	movl	-28(%rbp), %eax
	leal	1(%rax), %edx
	movl	-24(%rbp), %ecx
	movl	-20(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	dfs
	testl	%eax, %eax
	je	.L24
	movl	$3, %eax
	subl	-8(%rbp), %eax
	cmpl	$0, -8(%rbp)
	jne	.L25
	movl	$2, %ecx
	jmp	.L26
.L25:
	movl	$1, %ecx
.L26:
	movl	-20(%rbp), %edx
	addl	%ecx, %edx
	cmpl	$1, -8(%rbp)
	sete	%cl
	movzbl	%cl, %esi
	movl	-24(%rbp), %ecx
	addl	%ecx, %esi
	movl	%eax, %ecx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L12
.L24:
	movl	$0, -4(%rbp)
	jmp	.L27
.L28:
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	Iy(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-20(%rbp), %eax
	addl	%eax, %edx
	movl	-4(%rbp), %eax
	movslq	%eax, %rsi
	movl	-8(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rcx, %rax
	salq	$3, %rax
	subq	%rcx, %rax
	addq	%rax, %rax
	addq	%rsi, %rax
	leaq	0(,%rax,4), %rcx
	leaq	Ix(%rip), %rax
	movl	(%rcx,%rax), %ecx
	movl	-24(%rbp), %eax
	addl	%eax, %ecx
	movslq	%ecx, %rdi
	movslq	%edx, %rsi
	movq	%rsi, %rax
	salq	$2, %rax
	addq	%rsi, %rax
	addq	%rax, %rax
	addq	%rdi, %rax
	leaq	0(,%rax,4), %rsi
	leaq	B(%rip), %rax
	movl	(%rsi,%rax), %eax
	leal	1(%rax), %esi
	movslq	%ecx, %rcx
	movslq	%edx, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	B(%rip), %rax
	movl	%esi, (%rdx,%rax)
	addl	$1, -4(%rbp)
.L27:
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	Ix(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$-9, %eax
	jne	.L28
	jmp	.L21
.L31:
	nop
.L21:
	addl	$1, -8(%rbp)
.L15:
	cmpl	$2, -8(%rbp)
	jle	.L29
	movl	$0, %eax
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	dfs, .-dfs
	.section	.rodata
.LC4:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	N(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, i(%rip)
	jmp	.L33
.L36:
	movl	$0, j(%rip)
	jmp	.L34
.L35:
	movl	i(%rip), %eax
	movl	j(%rip), %edx
	movslq	%edx, %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	B(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	j(%rip), %eax
	addl	$1, %eax
	movl	%eax, j(%rip)
.L34:
	movl	j(%rip), %eax
	cmpl	$9, %eax
	jle	.L35
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
.L33:
	movl	i(%rip), %eax
	cmpl	$9, %eax
	jle	.L36
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	dfs
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
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
