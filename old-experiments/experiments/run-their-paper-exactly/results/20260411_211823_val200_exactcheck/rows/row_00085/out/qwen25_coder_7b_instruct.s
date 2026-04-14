.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%ld"
.LC1:
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
	pushq	%r15
	pushq	%r14
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	leaq	.LC0(%rip), %r14
	leaq	-64(%rbp), %rsi
	pushq	%r13
	movq	%r14, %rdi
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movq	-64(%rbp), %rcx
	movq	%rsp, %rsi
	leaq	15(,%rcx,8), %rax
	movq	%rax, %rdx
	andq	$-4096, %rax
	subq	%rax, %rsi
	andq	$-16, %rdx
	cmpq	%rsi, %rsp
	je	.L3
.L19:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rsi, %rsp
	jne	.L19
.L3:
	andl	$4095, %edx
	subq	%rdx, %rsp
	testq	%rdx, %rdx
	jne	.L20
.L4:
	leaq	7(%rsp), %rbx
	movq	%rbx, %r13
	andq	$-8, %rbx
	shrq	$3, %r13
	testq	%rcx, %rcx
	jle	.L5
	movq	%rbx, %r15
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%r15, %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	addq	$1, %r12
	call	__isoc99_scanf@PLT
	movq	-64(%rbp), %rax
	addq	$8, %r15
	cmpq	%r12, %rax
	jg	.L6
	movq	0(,%r13,8), %rdx
	movq	%rdx, %r8
	movq	%rdx, %rcx
	shrq	$63, %rcx
	shrq	$63, %r8
	addq	%rdx, %r8
	addq	%rcx, %rdx
	andl	$1, %edx
	sarq	%r8
	subq	%rcx, %rdx
	movq	%rdx, 0(,%r13,8)
	cmpq	$1, %rax
	jle	.L7
	movl	$1, %ecx
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%rdx, %rsi
	shrq	$63, %rsi
	addq	%rdx, %rsi
	sarq	%rsi
	addq	%rsi, %r8
	movq	%rdx, %rsi
	shrq	$63, %rsi
	addq	%rsi, %rdx
	andl	$1, %edx
	subq	%rsi, %rdx
	movq	%rdx, (%rbx,%rcx,8)
	addq	$1, %rcx
	cmpq	%rcx, %rax
	je	.L7
.L9:
	cmpq	$1, -8(%rbx,%rcx,8)
	movq	(%rbx,%rcx,8), %rdx
	jne	.L8
	testq	%rdx, %rdx
	jle	.L8
	addq	$1, %r8
	subq	$1, %rdx
	jmp	.L8
.L5:
	movq	0(,%r13,8), %rax
	movl	$2, %ecx
	cqto
	idivq	%rcx
	movq	%rdx, 0(,%r13,8)
	movq	%rax, %r8
	.p2align 4,,10
	.p2align 3
.L7:
	xorl	%eax, %eax
	movq	%r8, %rdx
	movl	$1, %edi
	leaq	.LC1(%rip), %rsi
	call	__printf_chk@PLT
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L21
	leaq	-40(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L20:
	.cfi_restore_state
	orq	$0, -8(%rsp,%rdx)
	jmp	.L4
.L21:
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
