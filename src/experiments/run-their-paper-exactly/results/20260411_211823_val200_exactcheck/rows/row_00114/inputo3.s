.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%c"
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
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	.LC0(%rip), %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	7(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movsbl	7(%rsp), %edi
	cmpb	$10, %dil
	je	.L3
	cmpb	$32, %dil
	je	.L11
	leal	-65(%rdi), %eax
	cmpb	$25, %al
	jbe	.L12
	leal	-97(%rdi), %eax
	cmpb	$25, %al
	ja	.L7
	subl	$32, %edi
	movzbl	%dil, %edi
	call	putchar@PLT
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L7:
	call	putchar@PLT
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L12:
	addl	$32, %edi
	movzbl	%dil, %edi
	call	putchar@PLT
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L11:
	movl	$32, %edi
	call	putchar@PLT
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$10, %edi
	call	putchar@PLT
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L13
	addq	$24, %rsp
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