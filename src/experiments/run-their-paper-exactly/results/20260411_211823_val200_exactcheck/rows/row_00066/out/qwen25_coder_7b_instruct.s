.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d"
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
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	leaq	.LC0(%rip), %r12
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
	leaq	4(%rsp), %r14
	movq	%rsp, %r13
.L9:
	movq	%r14, %rdx
	xorl	%eax, %eax
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	__isoc99_scanf@PLT
	movl	(%rsp), %edx
	movl	4(%rsp), %eax
	movl	%edx, %ecx
	addl	%eax, %ecx
	je	.L2
	movl	$1, %ebp
	testl	%edx, %edx
	jle	.L4
.L3:
	movl	$1, %ebx
	testl	%eax, %eax
	jle	.L7
.L8:
	leal	0(%rbp,%rbx), %eax
	testb	$1, %al
	jne	.L5
	movl	$35, %edi
	addl	$1, %ebx
	call	putchar@PLT
	cmpl	%ebx, 4(%rsp)
	jge	.L8
.L7:
	movl	$10, %edi
	addl	$1, %ebp
	call	putchar@PLT
	cmpl	%ebp, (%rsp)
	jl	.L4
	movl	4(%rsp), %eax
	jmp	.L3
.L5:
	movl	$46, %edi
	addl	$1, %ebx
	call	putchar@PLT
	cmpl	%ebx, 4(%rsp)
	jge	.L8
	jmp	.L7
.L4:
	movl	$10, %edi
	call	putchar@PLT
	jmp	.L9
.L2:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L17
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
.L17:
	.cfi_restore_state
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
