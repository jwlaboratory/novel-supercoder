.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	.cfi_def_cfa_offset 40
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rsi
	movq	%rbp, %rdi
	movl	$1, %esi
	movl	$0, %edi
	call	__isoc99_scanf@PLT
	movl	(%rsp), %eax
	testl	%eax, %eax
	jle	.L2
	movl	$1, %ebp
	xorl	%ebx, %ebx
	leaq	4(%rsp), %r14
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L3:
	xorl	%eax, %eax
	movq	%r14, %rsi
	movq	%rbp, %rdi
	movl	$1, %esi
	movl	$0, %edi
	call	__isoc99_scanf@PLT
	movl	4(%rsp), %eax
	addl	%eax, %r12d
	cmpl	%eax, %ebx
	cmovl	%eax, %ebx
	addl	$1, %ebp
	cmpl	%ebp, (%rsp)
	jge	.L3
	subl	%ebx, %r12d
	cmpl	%ebx, %r12d
	jle	.L2
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	jmp	.L4
.L2:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
.L4:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L9
	movq	%rbp, %rsp
	.cfi_def_cfa_register 7
	popq	%rbp
	.cfi_def_cfa_register 6
	ret
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
