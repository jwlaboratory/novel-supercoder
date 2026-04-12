.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lld"
.LC1:
	.string	"%lld "
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB51:
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
.L18:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rsi, %rsp
	jne	.L18
.L3:
	andl	$4095, %edx
	subq	%rdx, %rsp
	testq	%rdx, %rdx
	jne	.L19
.L4:
	movq	%rsp, %r12
	testq	%rcx, %rcx
	jle	.L7
	movq	%r12, %rbx
	xorl	%r15d, %r15d
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%rbx, %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	addq	$1, %r13
	call	__isoc99_scanf@PLT
	movq	(%rbx), %rax
	addq	$8, %rbx
	addq	%rax, %rax
	subq	%r15, %rax
	movq	%rax, %r15
	movq	-64(%rbp), %rax
	cmpq	%r13, %rax
	jg	.L6
	movq	%r15, %r13
	shrq	$63, %r13
	addq	%r15, %r13
	sarq	%r13
	testq	%rax, %rax
	jle	.L7
	xorl	%ebx, %ebx
	leaq	.LC1(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%r13, %rdx
	movq	%r14, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	(%r12,%rbx,8), %rax
	addq	$1, %rbx
	addq	%rax, %rax
	subq	%r13, %rax
	movq	%rax, %r13
	cmpq	%rbx, -64(%rbp)
	jg	.L8
.L7:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L20
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
.L19:
	.cfi_restore_state
	orq	$0, -8(%rsp,%rdx)
	jmp	.L4
.L20:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
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
