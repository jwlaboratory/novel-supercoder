```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d%d%d"
.LC1:
	.string	" %s"
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	.LC0(%rip), %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %rdx
	leaq	20(%rsp), %rcx
	leaq	12(%rsp), %rsi
	leaq	24(%rsp), %r8
	call	__isoc99_scanf@PLT
	movl	24(%rsp), %eax
	leal	-1(%rax), %edx
	movl	%edx, 24(%rsp)
	testl	%eax, %eax
	je	.L2
	leaq	30(%rsp), %rbp
	leaq	.LC1(%rip), %rbx
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L3:
	cmpb	$116, %al
	je	.L5
	cmpb	$107, %al
	jne	.L13
	xorl	%edx, %edx
.L4:
	movl	24(%rsp), %eax
	movl	%edx, 12(%rsp)
	leal	-1(%rax), %ecx
	movl	%ecx, 24(%rsp)
	testl	%eax, %eax
	je	.L7
.L6:
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movzbl	30(%rsp), %eax
	cmpb	$110, %al
	jne	.L3
	movl	16(%rsp), %edx
	movl	$0, %eax
	addl	12(%rsp), %edx
	cmovs	%eax, %edx
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L5:
	movl	20(%rsp), %edx
	movl	$0, %eax
	addl	12(%rsp), %edx
	cmovs	%eax, %edx
	jmp	.L4
.L2:
	movl	12(%rsp), %edx
	.p2align 4,,10
	.p2align 3
.L7:
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L14
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L13:
	.cfi_restore_state
	movl	12(%rsp), %edx
	xorl	%eax, %eax
	testl	%edx, %edx
	cmovs	%eax, %edx
	jmp	.L4
.L14:
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