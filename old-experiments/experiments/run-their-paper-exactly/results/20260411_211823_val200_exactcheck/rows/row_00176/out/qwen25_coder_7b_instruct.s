.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d"
.LC1:
	.string	"%d"
.LC2:
	.string	"%d\n"
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
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	-397312(%rsp), %r11
	.cfi_def_cfa 11, 397352
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$2728, %rsp
	.cfi_def_cfa_offset 400080
	movl	$400000, %edx
	xorl	%esi, %esi
	xorl	%ebx, %ebx
	leaq	.LC1(%rip), %r13
	movq	%fs:40, %rax
	movq	%rax, 400024(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %r12
	movq	%r12, %rdi
	movq	%r12, %rbp
	call	memset@PLT
	leaq	12(%rsp), %rdx
	leaq	8(%rsp), %rsi
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	call	__isoc99_scanf@PLT
	movl	8(%rsp), %eax
	testl	%eax, %eax
	jle	.L5
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%rbp, %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf@PLT
	movl	8(%rsp), %edx
	addq	$4, %rbp
	cmpl	%ebx, %edx
	jg	.L4
	movl	16(%rsp), %ecx
	testl	%edx, %edx
	jle	.L5
	cmpl	$1, %edx
	je	.L3
	leal	-2(%rdx), %eax
	leaq	20(%rsp), %rsi
	xorl	%edi, %edi
	movl	$1, %edx
	leaq	8(%r12,%rax,4), %r8
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L20:
	sete	%al
	addq	$4, %rsi
	movzbl	%al, %eax
	addl	%eax, %edx
	cmpq	%rsi, %r8
	je	.L3
.L8:
	movl	(%rsi), %eax
	cmpl	%eax, %ecx
	cmovg	%eax, %ecx
	subl	%ecx, %eax
	cmpl	%eax, %edi
	jge	.L20
	addq	$4, %rsi
	movl	%eax, %edi
	movl	$1, %edx
	cmpq	%rsi, %r8
	jne	.L8
	.p2align 4,,10
	.p2align 3
.L3:
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	400024(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L21
	addq	$400040, %rsp
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
.L5:
	.cfi_restore_state
	xorl	%edx, %edx
	jmp	.L3
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
