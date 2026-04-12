.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d %d %d"
.LC1:
	.string	"No"
.LC2:
	.string	"Yes"
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
	movl	12(%rsp), %ecx
	movl	16(%rsp), %eax
	xorl	%esi, %esi
	movl	8(%rsp), %edx
	movl	20(%rsp), %r8d
	subl	%ecx, %eax
.L4:
	testl	%eax, %eax
	jle	.L14
	subl	%r8d, %edx
	testl	%edx, %edx
	jle	.L14
	jmp	.L4
.L14:
	movl	%eax, 16(%rsp)
	testb	%sil, %sil
	je	.L6
	movl	%edx, 8(%rsp)
.L6:
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L5
.L5:
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L16
	xorl	%eax, %eax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
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
