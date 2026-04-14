```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d %d %d"
.LC1:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %rcx
	leaq	12(%rsp), %rdx
	leaq	8(%rsp), %rsi
	leaq	20(%rsp), %r8
	call	__isoc99_scanf@PLT
	movl	8(%rsp), %ecx
	movl	16(%rsp), %eax
	movl	$1, %edi
	movl	12(%rsp), %edx
	leaq	.LC1(%rip), %rsi
	cmpl	%eax, %ecx
	cmovl	%eax, %ecx
	movl	20(%rsp), %eax
	cmpl	%edx, %eax
	movl	%ecx, 8(%rsp)
	cmovg	%edx, %eax
	movl	%eax, %edx
	movl	%eax, 12(%rsp)
	subl	%ecx, %edx
	cmpl	%eax, %ecx
	movl	$0, %eax
	cmovge	%eax, %edx
	call	__printf_chk@PLT
	movq	stdout(%rip), %rdi
	call	fflush@PLT
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7
	xorl	%eax, %eax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7:
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
```