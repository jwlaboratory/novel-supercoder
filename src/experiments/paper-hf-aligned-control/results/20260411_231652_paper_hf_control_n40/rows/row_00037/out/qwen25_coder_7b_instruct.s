.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d"
.LC1:
	.string	"Yes"
.LC2:
	.string	"No"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rdx
	leaq	4(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movl	(%rsp), %ecx
	testl	%ecx, %ecx
	jne	.L2
	movl	4(%rsp), %eax
	movl	$500, %ecx
	cltd
	idivl	%ecx
	testl	%edx, %edx
	jne	.L3
	jmp	.L5
.L2:
	leal	-1(%rcx), %eax
	cmpl	$999, %eax
	ja	.L4
	movl	4(%rsp), %eax
	movl	$500, %esi
	cltd
	idivl	%esi
	cmpl	%edx, %ecx
	jge	.L5
.L3:
.L4:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L9
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L5:
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L4
.L9:
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
