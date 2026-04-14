.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s"
.LC1:
	.string	"%d %d\n"
.LC2:
	.string	"-1"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
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
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	-98304(%rsp), %r11
	.cfi_def_cfa 11, 98360
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$1736, %rsp
	.cfi_def_cfa_offset 100096
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 100024(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rbx
	movq	%rbx, %rsi
	call	__isoc99_scanf@PLT
	movzbl	(%rsp), %edi
	testb	%dil, %dil
	je	.L2
	leaq	1(%rsp), %rsi
	xorl	%eax, %eax
	movq	%rsi, %rdx
.L3:
	addq	$1, %rdx
	movl	%eax, %ecx
	leal	1(%rax), %eax
	cmpb	$0, -1(%rdx)
	jne	.L3
	testl	%ecx, %ecx
	je	.L4
	cltq
	leal	-1(%rcx), %r8d
	movq	%rbx, %rdx
	addq	%rbx, %rax
	addq	%r8, %rsi
	jmp	.L6
.L25:
	addq	$1, %rdx
	subq	$1, %rax
	cmpq	%rsi, %rdx
	je	.L4
.L6:
	movzbl	-2(%rax), %r9d
	cmpb	%r9b, (%rdx)
	je	.L25
.L5:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
.L8:
	movq	100024(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L26
	addq	$100040, %rsp
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
.L4:
	cmpb	$48, %dil
	je	.L5
	movslq	%ecx, %r14
	cmpb	$49, (%rsp,%r14)
	je	.L5
	testl	%ecx, %ecx
	jle	.L8
	xorl	%ebp, %ebp
	movl	$1, %r12d
	leaq	.LC1(%rip), %r15
.L10:
	leal	2(%rbp), %r13d
	movl	%r12d, %edx
	xorl	%eax, %eax
	movq	%r15, %rsi
	movl	%r13d, %ecx
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpb	$49, (%rbx,%rbp)
	cmove	%r13d, %r12d
	addq	$1, %rbp
	cmpq	%rbp, %r14
	jne	.L10
	jmp	.L8
.L2:
	cmpb	$49, -1(%rsp)
	je	.L5
	jmp	.L8
.L26:
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
