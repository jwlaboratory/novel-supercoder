```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d"
.LC1:
	.string	"%*d"
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rdx
	movq	%rsp, %rsi
	call	__isoc99_scanf@PLT
	movl	(%rsp), %eax
	testl	%eax, %eax
	jle	.L2
	xorl	%ebx, %ebx
	leaq	.LC1(%rip), %rbp
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rbp, %rdi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf@PLT
	movl	(%rsp), %eax
	cmpl	%ebx, %eax
	jg	.L3
.L2:
	movl	4(%rsp), %ecx
	subl	$2, %eax
	movl	$1, %edi
	leaq	.LC2(%rip), %rsi
	cltd
	subl	$1, %ecx
	idivl	%ecx
	leal	1(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L8
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L8:
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