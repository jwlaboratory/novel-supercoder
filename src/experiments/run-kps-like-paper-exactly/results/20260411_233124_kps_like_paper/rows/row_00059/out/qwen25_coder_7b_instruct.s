.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%s"
.LC1:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$100128, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	leaq	-100064(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-100064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -100084(%rbp)
	movl	-100084(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -100080(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %r14
	movl	$0, %r15d
	movslq	%eax, %rdx
	movq	%rdx, %r12
	movl	$0, %r13d
	movl	$0, -100100(%rbp)
	movl	$0, -100096(%rbp)
	movl	$0, -100092(%rbp)
	jmp	.L5
.L8:
	movl	-100092(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L6
	movl	-100092(%rbp), %eax
	cltq
	movzbl	-100064(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L7
	addl	$1, -100100(%rbp)
	jmp	.L7
.L6:
	movl	-100092(%rbp), %eax
	cltq
	movzbl	-100064(%rbp,%rax), %eax
	cmpb	$49, %al
	jne	.L7
	addl	$1, -100096(%rbp)
.L7:
	addl	$1, -100092(%rbp)
.L5:
	movl	-100092(%rbp), %eax
	cmpl	-100084(%rbp), %eax
	jl	.L8
	movl	$0, -100092(%rbp)
	jmp	.L9
.L12:
	movl	-100092(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L10
	movl	-100092(%rbp), %eax
	cltq
	movzbl	-100064(%rbp,%rax), %eax
	cmpb	$49, %al
	jne	.L11
	addl	$1, -100096(%rbp)
	jmp	.L11
.L10:
	movl	-100092(%rbp), %eax
	cltq
	movzbl	-100064(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L11
	addl	$1, -100096(%rbp)
.L11:
	addl	$1, -100092(%rbp)
.L9:
	movl	-100092(%rbp), %eax
	cmpl	-100084(%rbp), %eax
	jl	.L12
	movl	$0, -100088(%rbp)
	movl	-100100(%rbp), %eax
	cmpl	-100096(%rbp), %eax
	jg	.L13
	movl	-100100(%rbp), %eax
	movl	%eax, -100088(%rbp)
	jmp	.L14
.L13:
	movl	-100096(%rbp), %eax
	movl	%eax, -100088(%rbp)
.L14:
	movl	-100088(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	%rbx, %rsp
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0"
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
