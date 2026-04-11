	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%d"
.LC4:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	$.LC1, %edi
	xorl	%eax, %eax
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	$a, %ebx
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	leaq	12(%rsp), %rsi
	call	__isoc99_scanf
.L2:
	movq	%rbx, %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	__isoc99_scanf
	cmpq	$a+16, %rbx
	jne	.L2
	movl	$b, %ebx
.L3:
	movq	%rbx, %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	__isoc99_scanf
	cmpq	$b+16, %rbx
	jne	.L3
	movdqa	.LC2(%rip), %xmm0
	movl	$dp+4, %edx
	movl	$dp, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	movups	%xmm0, (%rdx)
	addq	$48, %rdx
	movups	%xmm0, -32(%rdx)
	movups	%xmm0, -16(%rdx)
	cmpq	$dp+3988, %rdx
	jne	.L4
	movslq	b(%rip), %rsi
	movslq	b+4(%rip), %rdi
	movl	$100000000, dp+3996(%rip)
	movl	b+8(%rip), %ecx
	movslq	b+12(%rip), %rbx
	leal	3(%rsi), %ebp
	leal	3(%rdi), %r13d
	movq	.LC3(%rip), %rdx
	movl	a(%rip), %r8d
	cmpl	$6, %ebp
	leal	3(%rcx), %r12d
	movl	a+4(%rip), %r9d
	movl	a+8(%rip), %r10d
	seta	%bpl
	cmpl	$6, %r13d
	movq	%rdx, dp+3988(%rip)
	leal	3(%rbx), %edx
	seta	%r14b
	movl	a+12(%rip), %r11d
	andl	%r14d, %ebp
	cmpl	$6, %r12d
	seta	%r14b
	andl	%r14d, %ebp
	leal	-1(%rbx), %r14d
	cmpl	$2, %r14d
	seta	%r14b
	subl	%esi, %r13d
	andl	%r14d, %ebp
	cmpl	$6, %r13d
	seta	%r13b
	andl	%r13d, %ebp
	movl	%r12d, %r13d
	subl	%esi, %r13d
	cmpl	$6, %r13d
	seta	%r13b
	andl	%r13d, %ebp
	movl	%edx, %r13d
	subl	%esi, %r13d
	cmpl	$6, %r13d
	seta	%r13b
	subl	%edi, %r12d
	andl	%r13d, %ebp
	cmpl	$6, %r12d
	seta	%r12b
	andl	%r12d, %ebp
	movl	%edx, %r12d
	subl	%edi, %r12d
	cmpl	$6, %r12d
	seta	%r12b
	testb	%r12b, %bpl
	je	.L5
	subl	%ecx, %edx
	cmpl	$6, %edx
	jbe	.L5
	movd	%r8d, %xmm4
	movslq	%ecx, %rdx
	xorl	%eax, %eax
	pshufd	$0, %xmm4, %xmm1
	movd	%r9d, %xmm4
	leaq	dp(,%rsi,4), %r8
	pshufd	$0, %xmm4, %xmm2
	movd	%r10d, %xmm4
	leaq	dp(,%rdx,4), %rcx
	pshufd	$0, %xmm4, %xmm3
	movd	%r11d, %xmm4
	leaq	dp(,%rdi,4), %rsi
	pshufd	$0, %xmm4, %xmm4
	leaq	dp(,%rbx,4), %rdx
	.p2align 4,,10
	.p2align 3
.L6:
	movdqa	dp(%rax), %xmm6
	movdqu	(%r8,%rax), %xmm7
	paddd	%xmm1, %xmm6
	movdqa	%xmm7, %xmm5
	movdqa	%xmm6, %xmm0
	pcmpgtd	%xmm7, %xmm0
	pand	%xmm0, %xmm5
	pandn	%xmm6, %xmm0
	por	%xmm5, %xmm0
	movups	%xmm0, (%r8,%rax)
	movdqa	dp(%rax), %xmm6
	movdqu	(%rsi,%rax), %xmm7
	paddd	%xmm2, %xmm6
	movdqa	%xmm7, %xmm5
	movdqa	%xmm6, %xmm0
	pcmpgtd	%xmm7, %xmm0
	pand	%xmm0, %xmm5
	pandn	%xmm6, %xmm0
	por	%xmm5, %xmm0
	movups	%xmm0, (%rsi,%rax)
	movdqa	dp(%rax), %xmm6
	movdqu	(%rcx,%rax), %xmm7
	paddd	%xmm3, %xmm6
	movdqa	%xmm7, %xmm5
	movdqa	%xmm6, %xmm0
	pcmpgtd	%xmm7, %xmm0
	pand	%xmm0, %xmm5
	pandn	%xmm6, %xmm0
	por	%xmm5, %xmm0
	movups	%xmm0, (%rcx,%rax)
	movdqa	dp(%rax), %xmm6
	movdqu	(%rdx,%rax), %xmm7
	paddd	%xmm4, %xmm6
	movdqa	%xmm7, %xmm5
	movdqa	%xmm6, %xmm0
	pcmpgtd	%xmm7, %xmm0
	pand	%xmm0, %xmm5
	pandn	%xmm6, %xmm0
	por	%xmm5, %xmm0
	movups	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpq	$3600, %rax
	jne	.L6
.L7:
	movl	12(%rsp), %ecx
	cmpl	$999, %ecx
	jg	.L14
	movl	$999, %eax
	movl	$1000, %edi
	subl	%ecx, %eax
	subl	%ecx, %edi
	cmpl	$2, %eax
	jbe	.L15
	movl	%edi, %edx
	movslq	%ecx, %rax
	movdqa	.LC0(%rip), %xmm0
	shrl	$2, %edx
	leaq	dp(,%rax,4), %rax
	salq	$4, %rdx
	addq	%rax, %rdx
.L11:
	movdqu	(%rax), %xmm1
	movdqu	(%rax), %xmm3
	addq	$16, %rax
	pcmpgtd	%xmm0, %xmm1
	pand	%xmm1, %xmm0
	pandn	%xmm3, %xmm1
	por	%xmm1, %xmm0
	cmpq	%rax, %rdx
	jne	.L11
	movdqa	%xmm0, %xmm2
	movl	%edi, %eax
	psrldq	$8, %xmm2
	andl	$-4, %eax
	movdqa	%xmm2, %xmm1
	addl	%eax, %ecx
	andl	$3, %edi
	pcmpgtd	%xmm0, %xmm1
	pand	%xmm1, %xmm0
	pandn	%xmm2, %xmm1
	por	%xmm0, %xmm1
	movdqa	%xmm1, %xmm2
	psrldq	$4, %xmm2
	movdqa	%xmm2, %xmm0
	pcmpgtd	%xmm1, %xmm0
	pand	%xmm0, %xmm1
	pandn	%xmm2, %xmm0
	por	%xmm1, %xmm0
	movd	%xmm0, %esi
	je	.L9
.L10:
	movslq	%ecx, %rax
	movl	dp(,%rax,4), %eax
	cmpl	%eax, %esi
	cmovg	%eax, %esi
	leal	1(%rcx), %eax
	cmpl	$999, %ecx
	je	.L9
	cltq
	movl	dp(,%rax,4), %eax
	cmpl	%eax, %esi
	cmovg	%eax, %esi
	leal	2(%rcx), %eax
	cmpl	$998, %ecx
	je	.L9
	cltq
	movl	dp(,%rax,4), %eax
	cmpl	%eax, %esi
	cmovg	%eax, %esi
.L9:
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	movl	$dp+3600, %ebp
	movslq	%ecx, %rdx
	.p2align 4,,10
	.p2align 3
.L8:
	movl	(%rax), %ecx
	movl	(%rax,%rsi,4), %r12d
	addl	%r8d, %ecx
	cmpl	%r12d, %ecx
	cmovg	%r12d, %ecx
	movl	%ecx, (%rax,%rsi,4)
	movl	(%rax), %ecx
	movl	(%rax,%rdi,4), %r12d
	addl	%r9d, %ecx
	cmpl	%r12d, %ecx
	cmovg	%r12d, %ecx
	movl	%ecx, (%rax,%rdi,4)
	movl	(%rax), %ecx
	movl	(%rax,%rdx,4), %r12d
	addl	%r10d, %ecx
	cmpl	%r12d, %ecx
	cmovg	%r12d, %ecx
	movl	%ecx, (%rax,%rdx,4)
	movl	(%rax), %ecx
	movl	(%rax,%rbx,4), %r12d
	addl	%r11d, %ecx
	cmpl	%r12d, %ecx
	cmovg	%r12d, %ecx
	movl	%ecx, (%rax,%rbx,4)
	addq	$4, %rax
	cmpq	%rax, %rbp
	jne	.L8
	jmp	.L7
.L14:
	movl	$1000000, %esi
	jmp	.L9
.L15:
	movl	$1000000, %esi
	jmp	.L10
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.globl	b
	.bss
	.align 16
	.type	b, @object
	.size	b, 16
b:
	.zero	16
	.globl	a
	.align 16
	.type	a, @object
	.size	a, 16
a:
	.zero	16
	.globl	dp
	.align 32
	.type	dp, @object
	.size	dp, 4000
dp:
	.zero	4000
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	1000000
	.long	1000000
	.long	1000000
	.long	1000000
	.align 16
.LC2:
	.long	100000000
	.long	100000000
	.long	100000000
	.long	100000000
	.set	.LC3,.LC2
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
