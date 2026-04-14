.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%ld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	n(%rip), %rsi
	xorl	%eax, %eax
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	.LC0(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%r13, %rdi
	leaq	c(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	call	scanf@PLT
	movl	i(%rip), %edx
	movl	n(%rip), %eax
	leal	1(%rdx), %r14d
	movl	%r14d, i(%rip)
	cmpl	%eax, %edx
	jge	.L3
	testl	%eax, %eax
	jle	.L22
.L11:
	movl	$1, %ebp
	.p2align 4,,10
	.p2align 3
.L20:
	movslq	%r14d, %rbx
.L7:
	imulq	$404, %rbx, %rbx
	movq	%r13, %rdi
	xorl	%eax, %eax
	leaq	(%rbx,%rbp,4), %rsi
	addq	%r12, %rsi
	call	scanf@PLT
	movl	i(%rip), %r14d
	cmpl	%ebp, %r14d
	jle	.L4
	movslq	%ebp, %rax
	movslq	%r14d, %rbx
	pxor	%xmm0, %xmm0
	addq	$1, %rbp
	leaq	(%rax,%rax,4), %rdx
	leaq	(%rbx,%rbx,4), %rcx
	pxor	%xmm1, %xmm1
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%rcx,%rcx,4), %rcx
	leaq	(%rax,%rdx,4), %rdx
	leaq	(%rbx,%rcx,4), %rcx
	addq	%rbx, %rdx
	addq	%rcx, %rax
	cvtsi2sdl	(%r12,%rdx,4), %xmm1
	cvtsi2sdl	(%r12,%rax,4), %xmm0
	call	fmin@PLT
	leal	-1(%rbp), %edx
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdq	s(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	movq	%rax, s(%rip)
	movl	n(%rip), %eax
	cmpl	%edx, %eax
	jg	.L7
.L6:
	leal	1(%r14), %edx
	movl	%edx, i(%rip)
	cmpl	%eax, %r14d
	jge	.L3
	movl	%edx, %r14d
	testl	%eax, %eax
	jg	.L11
.L22:
	leal	1(%r14), %edx
	movl	%edx, i(%rip)
	cmpl	%r14d, %eax
	jle	.L3
	.p2align 4,,10
	.p2align 3
.L8:
	movl	%edx, %ecx
	addl	$1, %edx
	cmpl	%eax, %ecx
	jl	.L8
	movl	%edx, i(%rip)
.L3:
	movq	s(%rip), %rsi
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rdi
	call	printf@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	sete	%al
	popq	%r14
	.cfi_def_cfa_offset 8
	movzbl	%al, %eax
	movl	%eax, n(%rip)
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	.cfi_restore_state
	addq	$1, %rbp
	movl	n(%rip), %eax
	leal	-1(%rbp), %edx
	cmpl	%edx, %eax
	jg	.L20
	jmp	.L6
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	i
	.bss
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	n
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.globl	c
	.align 32
	.type	c, @object
	.size	c, 40804
c:
	.zero	40804
	.globl	s
	.align 8
	.type	s, @object
	.size	s, 8
s:
	.zero	8
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
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
