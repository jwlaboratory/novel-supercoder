.file	"temp.c"
	.text
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4
	.globl	solve
	.type	solve, @function
solve:
.LFB25:
	.cfi_startproc
	endbr64
	movl	n(%rip), %r9d
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	S(%rip), %esi
	leaq	a(%rip), %r10
	leal	1(%r9), %r8d
.L2:
	cmpl	%ecx, %r9d
	jle	.L6
.L17:
	cmpl	%eax, %esi
	jle	.L16
	movslq	%ecx, %rdi
	addl	$1, %ecx
	addl	(%r10,%rdi,4), %eax
	cmpl	%ecx, %r9d
	jg	.L17
.L6:
	cmpl	%eax, %esi
	jg	.L4
	movl	%ecx, %edi
	leal	1(%rdx), %r10d
	subl	%edx, %edi
	movslq	%edx, %rdx
	cmpl	%edi, %r8d
	cmovg	%edi, %r8d
	leaq	a(%rip), %rdi
	subl	(%rdi,%rdx,4), %eax
	cmpl	%eax, %esi
	jle	.L12
.L4:
	xorl	%eax, %eax
	cmpl	%r8d, %r9d
	cmovl	%eax, %r8d
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	movl	%ecx, %edi
	subl	%edx, %edi
	cmpl	%edi, %r8d
	cmovg	%edi, %r8d
	movslq	%edx, %rdi
	addl	$1, %edx
	subl	(%r10,%rdi,4), %eax
	jmp	.L2
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	solve.cold, @function
solve.cold:
.LFSB25:
.L12:
	subl	%r10d, %ecx
	movslq	%r10d, %r10
	leaq	(%rdi,%r10,4), %rdx
.L5:
	cmpl	%ecx, %r8d
	cmovg	%ecx, %r8d
	subl	(%rdx), %eax
	subl	$1, %ecx
	addq	$4, %rdx
	cmpl	%eax, %esi
	jle	.L5
	jmp	.L4
	.cfi_endproc
.LFE25:
	.text
	.size	solve, .-solve
	.section	.text.unlikely
	.size	solve.cold, .-solve.cold
.LCOLDE0:
	.text
.LHOTE0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%d %d"
.LC2:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB26:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	S(%rip), %rdx
	leaq	n(%rip), %rsi
	xorl	%eax, %eax
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	.LC1(%rip), %rdi
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	call	__isoc99_scanf@PLT
	movq	stdin(%rip), %rdi
	call	getc@PLT
	movl	n(%rip), %edx
	testl	%edx, %edx
	jle	.L19
	movl	%eax, %ebx
	xorl	%r12d, %r12d
	leaq	a(%rip), %r13
	call	__ctype_b_loc@PLT
	movq	%rax, %rbp
	.p2align 4,,10
	.p2align 3
.L20:
	cmpl	$32, %ebx
	jne	.L30
	.p2align 4,,10
	.p2align 3
.L28:
	movq	stdin(%rip), %rdi
	call	getc@PLT
	movl	%eax, %ebx
	cmpl	$32, %eax
	je	.L28
.L30:
	cmpl	$10, %ebx
	je	.L28
	movq	0(%rbp), %rdx
	movslq	%ebx, %rax
	xorl	%r14d, %r14d
	testb	$8, 1(%rdx,%rax,2)
	je	.L22
	.p2align 4,,10
	.p2align 3
.L23:
	movq	stdin(%rip), %rdi
	leal	(%r14,%r14,4), %eax
	leal	-48(%rbx,%rax,2), %r14d
	call	getc@PLT
	movslq	%eax, %rdx
	movq	0(%rbp), %rax
	movq	%rdx, %rbx
	testb	$8, 1(%rax,%rdx,2)
	jne	.L23
.L22:
	movl	%r14d, 0(%r13,%r12,4)
	addq	$1, %r12
	cmpl	%r12d, n(%rip)
	jg	.L20
.L19:
	xorl	%eax, %eax
	call	solve
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	popq	%rbx
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.globl	n
	.bss
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.globl	S
	.align 4
	.type	S, @object
	.size	S, 4
S:
	.zero	4
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 400000
a:
	.zero	400000
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
