.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d"
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	.cfi_def_cfa_offset 40
	movl	$4, %edi
	leaq	.LC0(%rip), %rsi
	movq	%rsp, %rdx
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	(%rsp), %eax
	cmpl	$1, %eax
	je	.L11
	cmpl	$2, %eax
	je	.L12
	cmpl	$3, %eax
	je	.L13
	cmpl	$4, %eax
	jne	.L3
	imull	$2000, 4(%rsp), %eax
	jmp	.L3
.L11:
	imull	$6000, 4(%rsp), %eax
	jmp	.L3
.L12:
	imull	$4000, 4(%rsp), %eax
	jmp	.L3
.L13:
	imull	$3000, 4(%rsp), %eax
.L3:
	movq	%rax, 8(%rsp)
	movq	%rsp, %rdx
	movq	%rbp, %rsi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	subl	$1, %edi
	jne	.L6
	movq	8(%rsp), %rax
	addq	$24, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_register 6
	ret
.L6:
	movq	%rbp, %rdx
	movq	%rbp, %rsi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	(%rsp), %eax
	cmpl	$1, %eax
	je	.L11
	cmpl	$2, %eax
	je	.L12
	cmpl	$3, %eax
	je	.L13
	cmpl	$4, %eax
	jne	.L3
	imull	$2000, 4(%rsp), %eax
	jmp	.L3
.L11:
	imull	$6000, 4(%rsp), %eax
	jmp	.L3
.L12:
	imull	$4000, 4(%rsp), %eax
	jmp	.L3
.L13:
	imull	$3000, 4(%rsp), %eax
	jmp	.L3
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
