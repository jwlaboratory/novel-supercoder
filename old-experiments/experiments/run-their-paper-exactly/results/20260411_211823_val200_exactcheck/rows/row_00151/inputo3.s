.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC0(%rip), %rdi
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movslq	4(%rsp), %rbx
	movq	%rbx, %rax
	imulq	$1374389535, %rbx, %rbx
	cltd
	sarq	$37, %rbx
	subl	%edx, %ebx
	movl	%ebx, 4(%rsp)
	cmpl	$99, %eax
	jle	.L2
	leal	-1(%rbx), %edx
	movl	$51, %esi
	leaq	6+ans(%rip), %rdi
	addq	$1, %rdx
	call	memset@PLT
.L2:
	addl	$6, %ebx
	leaq	ans(%rip), %rdi
	movslq	%ebx, %rbx
	movb	$0, (%rdi,%rbx)
	call	puts@PLT
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L6
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.globl	ans
	.data
	.align 32
	.type	ans, @object
	.size	ans, 104
ans:
	.string	"ai1333"
	.zero	97
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