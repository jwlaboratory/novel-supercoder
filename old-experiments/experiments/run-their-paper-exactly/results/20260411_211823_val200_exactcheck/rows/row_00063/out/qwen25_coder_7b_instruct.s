.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d %d\n"
.LC2:
	.string	"%d %d %d\n"
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 40
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rsi
	movl	$0, 4(%rsp)
	call	__isoc99_scanf@PLT
	movl	4(%rsp), %ebx
	xorl	%ecx, %ecx
	cmpl	$1, %ebx
	jle	.L2
	movl	$1, %r14d
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L10:
	movl	%r13d, %r14d
.L4:
	movl	%ebx, %eax
	leal	1(%r14), %r13d
	andl	$1, %eax
	cmpl	$1, %eax
	sbbl	$-1, %ecx
	sarl	%ebx
	addl	$2, %ecx
	cmpl	$1, %ebx
	jne	.L10
	movl	%r13d, %edx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC2(%rip), %r12
	movl	4(%rsp), %ebp
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L7:
	movl	%ebp, %eax
	shrl	$31, %eax
	addl	%ebp, %eax
	sarl	%eax
	movl	%eax, %ebp
	cmpl	%r15d, %r14d
	je	.L6
.L8:
	leal	1(%rbp), %eax
	movl	%ebx, %r15d
	addl	$1, %ebx
	movq	%r12, %rsi
	movl	%eax, %r8d
	movl	%ebx, %ecx
	movl	%r15d, %edx
	movl	$1, %edi
	shrl	$31, %r8d
	addl	%eax, %r8d
	xorl	%eax, %eax
	sarl	%r8d
	call	__printf_chk@PLT
	movl	%r15d, %edx
	xorl	%r8d, %r8d
	movl	%ebx, %ecx
	movq	%r12, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	%ebp, %edx
	shrl	$31, %edx
	leal	0(%rbp,%rdx), %eax
	andl	$1, %eax
	subl	%edx, %eax
	cmpl	$1, %eax
	jne	.L7
	movl	%ebp, %r8d
	movl	%r13d, %ecx
	movl	%r15d, %edx
	movq	%r12, %rsi
	sarl	%r8d
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	%ebp, %eax
	shrl	$31, %eax
	addl	%ebp, %eax
	sarl	%eax
	movl	%eax, %ebp
	cmpl	%r15d, %r14d
	jne	.L8
	.p2align 4,,10
	.p2align 3
.L6:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L17
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_register 6
	ret
.L2:
	.cfi_restore_state
	movl	$1, %edx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L6
.L17:
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
