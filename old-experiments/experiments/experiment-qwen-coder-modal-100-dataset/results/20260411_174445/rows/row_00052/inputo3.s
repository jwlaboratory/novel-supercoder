	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d\n"
.LC2:
	.string	"%d%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	%edi, 12(%rsp)
	movl	%esi, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L2:
	leaq	8(%rsp), %rdx
	leaq	12(%rsp), %rsi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	scanf
	movl	12(%rsp), %ecx
	imull	%ecx, %eax
	testl	%eax, %eax
	je	.L15
	movl	$0, g(%rip)
	movl	8(%rsp), %r8d
	movl	$1, i(%rip)
	leal	(%rcx,%r8), %eax
	testl	%eax, %eax
	jle	.L10
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	cltq
	movl	$.LC0, %edi
	leaq	X(,%rax,4), %rsi
	xorl	%eax, %eax
	call	scanf
	movl	i(%rip), %edx
	movl	12(%rsp), %ecx
	movl	$1, p(%rip)
	movl	8(%rsp), %r8d
	leal	1(%rdx), %eax
	leal	(%rcx,%r8), %esi
	movl	%eax, i(%rip)
	cmpl	%esi, %edx
	jl	.L4
	movl	g(%rip), %esi
.L3:
	movl	$1, i(%rip)
	testl	%r8d, %r8d
	jle	.L5
	movslq	%ecx, %r9
	movl	p(%rip), %eax
	movslq	%r8d, %r10
	movl	$1, %edx
	salq	$2, %r9
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L11:
	movq	%rdi, %rdx
.L8:
	addl	X(%r9,%rdx,4), %eax
	cmpl	%ecx, %eax
	jge	.L6
	movslq	%eax, %rdi
	addl	X(,%rdi,4), %eax
.L6:
	xorl	%edi, %edi
	cmpl	%eax, %ecx
	setg	%dil
	orl	%esi, %edi
	leaq	1(%rdx), %rdi
	cmove	%edx, %esi
	cmpq	%rdx, %r10
	jne	.L11
	addl	$1, %r8d
	movl	%eax, p(%rip)
	movl	%esi, g(%rip)
	movl	%r8d, i(%rip)
.L5:
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L15:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	.cfi_restore_state
	xorl	%esi, %esi
	jmp	.L3
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	g
	.bss
	.align 4
	.type	g, @object
	.size	g, 4
g:
	.zero	4
	.globl	p
	.align 4
	.type	p, @object
	.size	p, 4
p:
	.zero	4
	.globl	i
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	X
	.align 32
	.type	X, @object
	.size	X, 8004
X:
	.zero	8004
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
