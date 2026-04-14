.file	"optimized_temp.s"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%ld"
.LC2:
	.string	"%ld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rsi
	call	__isoc99_scanf@PLT
	movq	(%rsp), %rdi
	movq	%rdi, %rsi
	movq	%rdi, %rdx
	addq	%rdi, %rdx
	movq	%rdx, %rcx
	salq	$63, %rcx
	addq	%rdx, %rcx
	sarq	%rcx
	movq	%rcx, %rdx
	movq	%rdx, %rax
	sqrtsd	%xmm0, %xmm0
	cvttsd2siq	%xmm0, %r12
	leaq	1(%r12), %rax
	movq	%rax, %rdx
	imulq	%r12, %rdx
	movq	%rdx, %rbp
	shrq	$63, %rbp
	addq	%rdx, %rbp
	sarq	%rbp
	cmpq	%rbp, %rdi
	jg	.L6
	jmp	.L5
.L17:
	addq	$1, %rax
.L6:
	addq	%rax, %rbp
	movq	%rax, %r12
	cmpq	%rbp, %rdi
	jg	.L17
.L5:
	testq	%r12, %r12
	jle	.L7
	movl	$1, %ebx
	leaq	.LC2(%rip), %r14
	jmp	.L10
.L18:
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$1, %rbx
	cmpq	%rbx, %r12
	jl	.L7
.L9:
	movq	(%rsp), %rdi
.L10:
	movq	%rbp, %rax
	subq	%rdi, %rax
	cmpq	%rbx, %rax
	jne	.L18
	addq	$1, %rbx
	cmpq	%r12, %rbx
	jle	.L9
.L7:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L19
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L19:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
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
