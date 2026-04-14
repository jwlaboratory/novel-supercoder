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
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	.LC0(%rip), %rdi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rsi
	movq	$0, (%rsp)
	call	__isoc99_scanf@PLT
	movq	(%rsp), %rcx
	movl	$1, %edx
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L4:
	cmpq	%rax, %rcx
	jle	.L3
.L2:
	movq	%rdx, %rbp
	addq	$1, %rdx
	movq	%rbp, %rax
	imulq	%rdx, %rax
	sarq	%rax
	cmpq	%rbp, %rcx
	jg	.L4
.L3:
	subq	%rcx, %rax
	movl	$1, %r12d
	leaq	.LC1(%rip), %r13
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L8:
	cmpq	%r12, %rbx
	je	.L5
	movq	%r12, %rdx
	movq	%r13, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$1, %r12
	cmpq	%r12, %rbp
	jge	.L8
.L7:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L12
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	.cfi_restore_state
	leaq	1(%rbx), %r12
	cmpq	%r12, %rbp
	jge	.L8
	jmp	.L7
.L12:
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