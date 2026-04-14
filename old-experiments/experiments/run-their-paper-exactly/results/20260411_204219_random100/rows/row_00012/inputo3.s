.file	"temp.c"
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	.LC0(%rip), %rdi
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
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rsi
	call	__isoc99_scanf@PLT
	movq	(%rsp), %r12
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	leaq	(%r12,%r12), %rax
	cvtsi2sdq	%rax, %xmm0
	ucomisd	%xmm0, %xmm1
	ja	.L14
	sqrtsd	%xmm0, %xmm0
.L4:
	cvttsd2siq	%xmm0, %r13
	leaq	1(%r13), %rax
	movq	%rax, %rdx
	imulq	%r13, %rdx
	movq	%rdx, %rbp
	shrq	$63, %rbp
	addq	%rdx, %rbp
	sarq	%rbp
	cmpq	%rbp, %r12
	jg	.L6
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L17:
	addq	$1, %rax
.L6:
	addq	%rax, %rbp
	movq	%rax, %r13
	cmpq	%rbp, %r12
	jg	.L17
.L5:
	testq	%r13, %r13
	jle	.L7
	movl	$1, %ebx
	leaq	.LC2(%rip), %r14
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L18:
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$1, %rbx
	cmpq	%rbx, %r13
	jl	.L7
.L9:
	movq	(%rsp), %r12
.L10:
	movq	%rbp, %rax
	subq	%r12, %rax
	cmpq	%rbx, %rax
	jne	.L18
	addq	$1, %rbx
	cmpq	%r13, %rbx
	jle	.L9
.L7:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L19
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
.L14:
	.cfi_restore_state
	call	sqrt@PLT
	jmp	.L4
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