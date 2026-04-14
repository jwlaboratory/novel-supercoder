	.file	"inputC.c"
	.text
	.globl	b
	.bss
	.align 4
	.type	b, @object
	.size	b, 4
b:
	.zero	4
	.globl	r
	.align 4
	.type	r, @object
	.size	r, 4
r:
	.zero	4
	.globl	g
	.align 4
	.type	g, @object
	.size	g, 4
g:
	.zero	4
	.globl	c
	.align 4
	.type	c, @object
	.size	c, 4
c:
	.zero	4
	.globl	s
	.align 4
	.type	s, @object
	.size	s, 4
s:
	.zero	4
	.globl	t
	.align 4
	.type	t, @object
	.size	t, 4
t:
	.zero	4
	.section	.rodata
.LC0:
	.string	"%d\n"
.LC1:
	.string	"%d%d%d%d%d%d"
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
	jmp	.L2
.L3:
	movl	b(%rip), %eax
	imull	$95, %eax, %eax
	leal	100(%rax), %ecx
	movl	r(%rip), %edx
	movl	%edx, %eax
	sall	$6, %eax
	subl	%edx, %eax
	addl	%eax, %ecx
	movl	g(%rip), %edx
	movl	%edx, %eax
	sall	$3, %eax
	subl	%edx, %eax
	leal	(%rcx,%rax), %edx
	movl	c(%rip), %eax
	addl	%eax, %eax
	leal	(%rdx,%rax), %ecx
	movl	s(%rip), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	(%rcx,%rax), %edx
	movl	t(%rip), %eax
	movl	%eax, %esi
	leal	0(,%rax,4), %ecx
	movl	%esi, %eax
	subl	%ecx, %eax
	addl	%edx, %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L2:
	subq	$8, %rsp
	leaq	t(%rip), %rax
	pushq	%rax
	leaq	s(%rip), %r9
	leaq	c(%rip), %r8
	leaq	g(%rip), %rax
	movq	%rax, %rcx
	leaq	r(%rip), %rax
	movq	%rax, %rdx
	leaq	b(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	scanf@PLT
	addq	$16, %rsp
	movl	b(%rip), %edx
	movl	r(%rip), %eax
	orl	%eax, %edx
	movl	g(%rip), %eax
	orl	%eax, %edx
	movl	c(%rip), %eax
	orl	%eax, %edx
	movl	s(%rip), %eax
	orl	%eax, %edx
	movl	t(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	jne	.L3
	movl	$0, %edi
	call	exit@PLT
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
