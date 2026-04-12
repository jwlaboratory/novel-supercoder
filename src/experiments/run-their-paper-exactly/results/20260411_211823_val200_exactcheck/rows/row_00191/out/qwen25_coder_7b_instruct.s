.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"Yes"
.LC2:
	.string	"No"
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
	leaq	-60(%rbp), %rsi
	pushq	%r13
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	leaq	.LC0(%rip), %r13
	pushq	%r12
	movq	%r13, %rdi
	pushq	%rbx
	subq	$40, %rsp
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
.L22:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rsi, %rsp
	jne	.L22
.L3:
	andl	$4095, %edx
	subq	%rdx, %rsp
	testq	%rdx, %rdx
	jne	.L23
.L4:
	movq	%rsp, %rbx
	testl	%ecx, %ecx
	jle	.L6
	movl	$0, -68(%rbp)
	xorl	%r14d, %r14d
	xorl	%r12d, %r12d
	xorl	%r15d, %r15d
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L25:
	addl	$1, %r12d
.L8:
	addl	$1, %r14d
	addq	$4, %rbx
	cmpl	%r14d, -60(%rbp)
	jle	.L24
.L10:
	movq	%rbx, %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	(%rbx), %eax
	testb	$3, %al
	je	.L25
	testb	$1, %al
	jne	.L9
	addl	$1, -68(%rbp)
	addl	$1, %r14d
	addq	$4, %rbx
	cmpl	%r14d, -60(%rbp)
	jg	.L10
.L24:
	movl	-68(%rbp), %r14d
	leal	1(%r12), %eax
	addl	%r15d, %r14d
	cmpl	%r14d, %eax
	jge	.L6
	cmpl	%r12d, %r15d
	jle	.L6
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
.L13:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L26
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
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore_state
	addl	$1, %r15d
	jmp	.L8
.L6:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	jmp	.L13
.L23:
	orq	$0, -8(%rsp,%rdx)
	jmp	.L4
.L26:
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
