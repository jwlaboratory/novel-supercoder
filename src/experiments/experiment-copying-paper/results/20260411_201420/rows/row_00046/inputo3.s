.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d %d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pxor	%xmm0, %xmm0
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	.LC0(%rip), %rbx
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	movl	%edi, 12(%rsp)
	movq	%rbx, %rdi
	leaq	8(%rsp), %rbp
	movl	%esi, 8(%rsp)
	leaq	12(%rsp), %rsi
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movaps	%xmm0, 16(%rsp)
	movaps	%xmm0, 32(%rsp)
	call	scanf@PLT
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L7
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	scanf@PLT
	movslq	8(%rsp), %rax
	movq	%rax, %rdx
	imulq	$1374389535, %rax, %rax
	movl	%edx, %ecx
	sarl	$31, %ecx
	sarq	$39, %rax
	subl	%ecx, %eax
	movl	%eax, 8(%rsp)
	cmpl	$3199, %edx
	jg	.L5
	cltq
	addl	$1, %r12d
	movl	$1, 16(%rsp,%rax,4)
	cmpl	12(%rsp), %r12d
	jl	.L2
.L7:
	movdqa	16(%rsp), %xmm0
	paddd	32(%rsp), %xmm0
	movl	$1, %eax
	leaq	.LC1(%rip), %rdi
	movl	M(%rip), %edx
	movdqa	%xmm0, %xmm1
	psrldq	$8, %xmm1
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %esi
	addl	%esi, %edx
	addl	m(%rip), %esi
	cmove	%eax, %esi
	xorl	%eax, %eax
	movl	%edx, M(%rip)
	movl	%esi, m(%rip)
	call	printf@PLT
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L15
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	.cfi_restore_state
	addl	$1, M(%rip)
	addl	$1, %r12d
	cmpl	%r12d, 12(%rsp)
	jg	.L2
	jmp	.L7
.L15:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	m
	.bss
	.align 4
	.type	m, @object
	.size	m, 4
m:
	.zero	4
	.globl	M
	.align 4
	.type	M, @object
	.size	M, 4
M:
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