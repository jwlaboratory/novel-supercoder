.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%lld"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	-798720(%rsp), %r11
	.cfi_def_cfa 11, 798760
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$1320, %rsp
	.cfi_def_cfa_offset 800080
	leaq	.LC0(%rip), %r13
	movq	%r13, %rdi
	movq	%fs:40, %rax
	movq	%rax, 800024(%rsp)
	xorl	%eax, %eax
	leaq	12(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movl	12(%rsp), %eax
	movabsq	$9999999999999999, %r8
	testl	%eax, %eax
	jle	.L2
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	leaq	16(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L3:
	leaq	(%rbx,%rbp,4), %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movslq	(%rbx,%rbp,4), %rax
	movl	12(%rsp), %edx
	addq	$1, %rbp
	addq	%rax, %r12
	cmpl	%ebp, %edx
	jg	.L3
	cmpl	$1, %edx
	jle	.L7
	subl	$2, %edx
	movq	%rbx, %rax
	xorl	%ecx, %ecx
	movabsq	$9999999999999999, %r8
	leaq	20(%rsp,%rdx,4), %r9
	.p2align 4,,10
	.p2align 3
.L4:
	movslq	(%rax), %rdx
	movq	%r12, %rsi
	addq	%rdx, %rcx
	leaq	(%rcx,%rcx), %rdi
	movq	%rdi, %rdx
	subq	%rdi, %rsi
	subq	%r12, %rdx
	cmpq	%rsi, %rdx
	cmovl	%rsi, %rdx
	cmpq	%rdx, %r8
	cmovg	%rdx, %r8
	addq	$4, %rax
	cmpq	%rax, %r9
	jne	.L4
.L2:
	xorl	%eax, %eax
	movq	%r8, %rdx
	movl	$1, %edi
	leaq	.LC1(%rip), %rsi
	call	__printf_chk@PLT
	movq	800024(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L12
	addq	$800040, %rsp
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
.L7:
	.cfi_restore_state
	movabsq	$9999999999999999, %r8
	jmp	.L2
.L12:
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