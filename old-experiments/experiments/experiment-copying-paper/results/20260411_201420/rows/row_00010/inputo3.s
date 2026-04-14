.file	"temp.c"
	.text
	.p2align 4
	.globl	compare_int
	.type	compare_int, @function
compare_int:
.LFB39:
	.cfi_startproc
	endbr64
	movl	(%rsi), %eax
	subl	(%rdi), %eax
	ret
	.cfi_endproc
.LFE39:
	.size	compare_int, .-compare_int
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%ld"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	.cfi_offset 14, -24
	leaq	.LC0(%rip), %r14
	pushq	%r13
	leaq	-48(%rbp), %rsi
	movq	%r14, %rdi
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	leaq	-44(%rbp), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movslq	-48(%rbp), %rax
	movq	%rsp, %rcx
	movq	%rax, %rsi
	leaq	15(,%rax,4), %rax
	movq	%rax, %rdx
	andq	$-4096, %rax
	subq	%rax, %rcx
	andq	$-16, %rdx
	cmpq	%rcx, %rsp
	je	.L5
.L25:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rcx, %rsp
	jne	.L25
.L5:
	andl	$4095, %edx
	subq	%rdx, %rsp
	testq	%rdx, %rdx
	jne	.L26
.L6:
	movq	%rsp, %r13
	testl	%esi, %esi
	jle	.L7
	movq	%r13, %r12
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%r12, %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf@PLT
	movslq	-48(%rbp), %rsi
	addq	$4, %r12
	cmpl	%ebx, %esi
	jg	.L8
.L7:
	cmpl	%esi, -44(%rbp)
	jl	.L9
	movl	$48, %edi
	call	putchar@PLT
.L10:
	movq	-40(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L27
	leaq	-32(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L9:
	.cfi_restore_state
	leaq	compare_int(%rip), %rcx
	movq	%r13, %rdi
	movl	$4, %edx
	call	qsort@PLT
	movl	-44(%rbp), %ecx
	movl	-48(%rbp), %edi
	cmpl	%edi, %ecx
	jge	.L17
	movl	%edi, %esi
	subl	%ecx, %esi
	leal	-1(%rsi), %eax
	cmpl	$2, %eax
	jbe	.L18
	movl	%esi, %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm4, %xmm4
	movslq	%ecx, %rax
	shrl	$2, %edx
	leaq	0(%r13,%rax,4), %rax
	salq	$4, %rdx
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L13:
	movdqu	(%rax), %xmm1
	movdqa	%xmm4, %xmm2
	addq	$16, %rax
	pcmpgtd	%xmm1, %xmm2
	movdqa	%xmm1, %xmm3
	punpckldq	%xmm2, %xmm3
	punpckhdq	%xmm2, %xmm1
	paddq	%xmm3, %xmm0
	paddq	%xmm1, %xmm0
	cmpq	%rdx, %rax
	jne	.L13
	movdqa	%xmm0, %xmm1
	movl	%esi, %eax
	psrldq	$8, %xmm1
	andl	$-4, %eax
	paddq	%xmm1, %xmm0
	addl	%eax, %ecx
	movq	%xmm0, %rdx
	cmpl	%eax, %esi
	je	.L11
.L12:
	movslq	%ecx, %rax
	leaq	0(%r13,%rax,4), %rax
	movslq	(%rax), %rsi
	addq	%rsi, %rdx
	leal	1(%rcx), %esi
	cmpl	%edi, %esi
	jge	.L11
	movslq	4(%rax), %rsi
	addl	$2, %ecx
	addq	%rsi, %rdx
	cmpl	%ecx, %edi
	jle	.L11
	movslq	8(%rax), %rax
	addq	%rax, %rdx
.L11:
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L10
.L26:
	orq	$0, -8(%rsp,%rdx)
	jmp	.L6
.L17:
	xorl	%edx, %edx
	jmp	.L11
.L18:
	xorl	%edx, %edx
	jmp	.L12
.L27:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE40:
	.size	main, .-main
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