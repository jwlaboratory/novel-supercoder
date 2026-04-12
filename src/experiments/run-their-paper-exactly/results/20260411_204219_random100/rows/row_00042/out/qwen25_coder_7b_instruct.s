.file	"optimized_temp.s"
	.text
	.p2align 4
	.globl	cmp
	.type	cmp, @function
cmp:
.LFB39:
	.cfi_startproc
	endbr64
	movl	(%rdi), %eax
	subl	(%rsi), %eax
	ret
	.cfi_endproc
.LFE39:
	.size	cmp, .-cmp
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	T(%rip), %rdx
	leaq	N(%rip), %rsi
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	.LC0(%rip), %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	D(%rip), %rbx
	call	__isoc99_scanf@PLT
	movl	N(%rip), %edx
	movl	$0, i(%rip)
	testl	%edx, %edx
	jle	.L4
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rbp
.L5:
	cltq
	movq	%rbp, %rdi
	leaq	(%rbx,%rax,4), %rsi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	i(%rip), %eax
	movl	N(%rip), %edx
	addl	$1, %eax
	movl	%eax, i(%rip)
	cmpl	%edx, %eax
	jl	.L5
.L4:
	movslq	%edx, %rsi
	movq	%rbx, %rdi
	leaq	cmp(%rip), %rcx
	movl	$4, %edx
	call	qsort@PLT
	movl	N(%rip), %edi
	movl	$0, t(%rip)
	movl	$0, i(%rip)
	testl	%edi, %edi
	jle	.L7
	movl	T(%rip), %r12d
	xorl	%r11d, %r11d
	xorl	%r9d, %r9d
	xorl	%esi, %esi
	movq	R(%rip), %rdx
	movslq	M(%rip), %r10
	leaq	D(%rip), %rbp
.L8:
	movl	0(%rbp), %r8d
	movslq	%esi, %rcx
	addl	%r12d, %r8d
	cmpq	%r8d, (%rbx,%rcx,4)
	jge	.L10
.L9:
	incq	%rcx
	cmpl	%edi, %ecx
	jl	.L9
.L10:
	movl	%ecx, %esi
	cmpl	%r8d, (%rbx,%rcx,4)
	jge	.L11
.L11:
	movl	%esi, %eax
	subl	%r11d, %eax
	cltq
	imulq	%rdx, %rax
	cqto
	idivq	%r10
	leal	1(%r11), %eax
	cmpl	%eax, %edi
	je	.L12
	addq	$4, %rbp
	cmpl	%esi, %edi
	jle	.L29
	movl	%eax, %r11d
	jmp	.L8
.L29:
	movl	%esi, %ecx
	addl	$2, %r11d
	subl	%eax, %ecx
	movslq	%ecx, %rax
	imulq	%rdx, %rax
	cqto
	idivq	%r10
	cmpl	%r11d, %edi
	je	.L12
	movslq	%esi, %rcx
	movslq	%r11d, %rax
	subq	%rax, %rcx
	leal	(%r11,%rcx), %r8d
.L13:
	movq	%rdx, %rax
	imulq	%rcx, %rax
	subq	$1, %rcx
	cqto
	idivq	%r10
	movl	%r8d, %eax
	subl	%ecx, %eax
	cmpl	%edi, %eax
	jl	.L13
.L12:
	movq	%rdx, R(%rip)
	movl	%edi, i(%rip)
	testb	%r9b, %r9b
	je	.L7
	movl	%esi, t(%rip)
.L7:
	movq	R(%rip), %rdx
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	popq	%rbx
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
	.size	main, .-main
	.globl	M
	.data
	.align 4
	.type	M, @object
	.size	M, 4
M:
	.long	1000000007
	.globl	R
	.align 8
	.type	R, @object
	.size	R, 8
R:
	.quad	1
	.globl	t
	.bss
	.align 4
	.type	t, @object
	.size	t, 4
t:
	.zero	4
	.globl	j
	.align 4
	.type	j, @object
	.size	j, 4
j:
	.zero	4
	.globl	i
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	D
	.align 32
	.type	D, @object
	.size	D, 400000
D:
	.zero	400000
	.globl	T
	.align 4
	.type	T, @object
	.size	T, 4
T:
	.zero	4
	.globl	N
	.align 4
	.type	N, @object
	.size	N, 4
N:
	.zero	4
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
