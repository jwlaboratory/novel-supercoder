```assembly
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	-397312(%rsp), %r11
	.cfi_def_cfa 11, 397360
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$2720, %rsp
	.cfi_def_cfa_offset 400080
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 400024(%rsp)
	xorl	%eax, %eax
	leaq	12(%rsp), %rdx
	leaq	8(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movl	8(%rsp), %eax
	testl	%eax, %eax
	jle	.L6
	leaq	16(%rsp), %r13
	xorl	%ebx, %ebx
	leaq	.LC1(%rip), %r14
	movq	%r13, %rbp
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rbp, %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf@PLT
	movl	8(%rsp), %eax
	addq	$4, %rbp
	cmpl	%ebx, %eax
	jg	.L3
	testl	%eax, %eax
	jle	.L6
	leal	-1(%rax), %edx
	leaq	4(%r13), %rax
	xorl	%edi, %edi
	movl	$1000000001, %ecx
	leaq	(%rax,%rdx,4), %rsi
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L14:
	jle	.L4
	subl	%ecx, %edx
	cmpl	%edi, %edx
	jg	.L9
	sete	%dl
	movzbl	%dl, %edx
	addl	%edx, %r12d
.L4:
	movq	%rax, %r13
	cmpq	%rsi, %rax
	je	.L6
.L15:
	addq	$4, %rax
.L5:
	movl	0(%r13), %edx
	cmpl	%ecx, %edx
	jge	.L14
	movl	%edx, %ecx
	movq	%rax, %r13
	cmpq	%rsi, %rax
	jne	.L15
.L6:
	xorl	%eax, %eax
	movl	%r12d, %edx
	movl	$1, %edi
	leaq	.LC2(%rip), %rsi
	call	__printf_chk@PLT
	movq	400024(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L16
	addq	$400032, %rsp
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
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore_state
	movl	%edx, %edi
	movl	$1, %r12d
	jmp	.L4
.L16:
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
```