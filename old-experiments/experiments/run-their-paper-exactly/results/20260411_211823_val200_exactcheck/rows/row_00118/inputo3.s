.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d\n"
.LC2:
	.string	"%d%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	.LC0(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	leaq	48(%rsp), %rax
	leaq	52(%rsp), %r13
	movq	%rax, 24(%rsp)
	leaq	44(%rsp), %rax
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L2:
	movq	24(%rsp), %rdx
	movq	16(%rsp), %rsi
	leaq	.LC2(%rip), %rdi
	xorl	%eax, %eax
	call	scanf@PLT
	movl	44(%rsp), %eax
	testl	%eax, %eax
	je	.L8
	movl	$0, %r15d
	movl	$0, %r14d
	movl	$1001, %ebx
	jle	.L9
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%r13, %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	scanf@PLT
	movl	48(%rsp), %ecx
	movl	52(%rsp), %esi
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L28:
	subl	$1, %ecx
.L26:
	movl	%ecx, %eax
	cltd
	idivl	%esi
	testl	%edx, %edx
	jne	.L28
	cmpl	%ecx, %ebx
	jg	.L12
	jne	.L5
	cmpl	%ebp, %esi
	jle	.L29
	.p2align 4,,10
	.p2align 3
.L5:
	movl	44(%rsp), %esi
	addl	$1, %r15d
	cmpl	%r15d, %esi
	jg	.L6
	cmpl	$1, %r14d
	jle	.L9
.L7:
	leaq	.LC1(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L2
.L29:
	je	.L30
.L12:
	movl	%r15d, 12(%rsp)
	movl	%esi, %ebp
	movl	%ecx, %ebx
	movl	$1, %r14d
	jmp	.L5
.L30:
	movl	%r15d, 12(%rsp)
	addl	$1, %r14d
	movl	%ecx, %ebx
	jmp	.L5
.L9:
	movl	12(%rsp), %eax
	leal	1(%rax), %esi
	jmp	.L7
.L8:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L31
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L31:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE0:
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