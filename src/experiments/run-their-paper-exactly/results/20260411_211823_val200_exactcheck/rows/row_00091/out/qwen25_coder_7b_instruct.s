.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	""
.LC2:
	.string	"%d "
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
	.cfi_offset 15, -24
	leaq	.LC0(%rip), %r15
	pushq	%r14
	leaq	-60(%rbp), %rsi
	movq	%r15, %rdi
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movslq	-60(%rbp), %rax
	movq	%rsp, %rsi
	movq	%rax, %rcx
	leaq	15(,%rax,4), %rax
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
	movq	%rsp, %r14
	testl	%ecx, %ecx
	jle	.L7
	movq	%r14, %rbx
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%rbx, %rsi
	movq	%r15, %rdi
	xorl	%eax, %eax
	addl	$1, %r13d
	call	__isoc99_scanf@PLT
	movl	-60(%rbp), %eax
	xorl	(%rbx), %r12d
	addq	$4, %rbx
	cmpl	%r13d, %eax
	jg	.L6
	testl	%eax, %eax
	jle	.L7
	xorl	%ebx, %ebx
	leaq	.LC2(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L8:
	movl	(%r14,%rbx,4), %edx
	movq	%r13, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	xorl	%r12d, %edx
	call	__printf_chk@PLT
	cmpl	%ebx, -60(%rbp)
	jg	.L8
.L7:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
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
