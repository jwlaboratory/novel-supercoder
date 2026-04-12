.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s"
.LC1:
	.string	"%d"
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
	leaq	14(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movzbl	14(%rsp), %ecx
	testb	%cl, %cl
	je	.L14
	subl	$65, %ecx
	cmpb	$19, %cl
	ja	.L15
	movl	$524357, %edx
	shrq	%cl, %rdx
	andl	$1, %edx
.L3:
	movzbl	15(%rsp), %ecx
	testb	%cl, %cl
	je	.L2
	subl	$65, %ecx
	cmpb	$19, %cl
	ja	.L16
	movl	$524357, %eax
	shrq	%cl, %rax
	movq	%rax, %rcx
	xorl	%eax, %eax
	andb	$1, %cl
	je	.L5
	leal	1(%rdx), %eax
.L5:
	movzbl	16(%rsp), %ecx
	cmpl	%eax, %edx
	cmovl	%eax, %edx
	testb	%cl, %cl
	je	.L2
	subl	$65, %ecx
	cmpb	$19, %cl
	ja	.L18
	movl	$524357, %esi
	shrq	%cl, %rsi
	movq	%rsi, %rcx
	xorl	%esi, %esi
	andb	$1, %cl
	jne	.L66
.L6:
	movzbl	17(%rsp), %ecx
	cmpl	%esi, %edx
	cmovl	%esi, %edx
	testb	%cl, %cl
	je	.L2
	subl	$65, %ecx
	cmpb	$19, %cl
	ja	.L20
	movl	$524357, %eax
	shrq	%cl, %rax
	movq	%rax, %rcx
	xorl	%eax, %eax
	andb	$1, %cl
	jne	.L67
.L7:
	movzbl	18(%rsp), %ecx
	cmpl	%eax, %edx
	cmovl	%eax, %edx
	testb	%cl, %cl
	je	.L2
	subl	$65, %ecx
	cmpb	$19, %cl
	ja	.L22
	movl	$524357, %esi
	shrq	%cl, %rsi
	movq	%rsi, %rcx
	xorl	%esi, %esi
	andb	$1, %cl
	je	.L8
	leal	1(%rax), %esi
.L8:
	movzbl	19(%rsp), %ecx
	cmpl	%esi, %edx
	cmovl	%esi, %edx
	testb	%cl, %cl
	je	.L2
	subl	$65, %ecx
	cmpb	$19, %cl
	ja	.L24
	movl	$524357, %eax
	shrq	%cl, %rax
	movq	%rax, %rcx
	xorl	%eax, %eax
	andb	$1, %cl
	je	.L9
	leal	1(%rsi), %eax
.L9:
	movzbl	20(%rsp), %ecx
	cmpl	%eax, %edx
	cmovl	%eax, %edx
	testb	%cl, %cl
	je	.L2
	subl	$65, %ecx
	cmpb	$19, %cl
	ja	.L26
	movl	$524357, %esi
	shrq	%cl, %rsi
	movq	%rsi, %rcx
	xorl	%esi, %esi
	andb	$1, %cl
	je	.L10
	leal	1(%rax), %esi
.L10:
	movzbl	21(%rsp), %ecx
	cmpl	%esi, %edx
	cmovl	%esi, %edx
	testb	%cl, %cl
	je	.L2
	subl	$65, %ecx
	cmpb	$19, %cl
	ja	.L28
	movl	$524357, %eax
	shrq	%cl, %rax
	movq	%rax, %rcx
	xorl	%eax, %eax
	andb	$1, %cl
	je	.L11
	leal	1(%rsi), %eax
.L11:
	movzbl	22(%rsp), %ecx
	cmpl	%eax, %edx
	cmovl	%eax, %edx
	testb	%cl, %cl
	je	.L2
	subl	$65, %ecx
	cmpb	$19, %cl
	ja	.L30
	movl	$524357, %esi
	shrq	%cl, %rsi
	movq	%rsi, %rcx
	xorl	%esi, %esi
	andb	$1, %cl
	je	.L12
	leal	1(%rax), %esi
.L12:
	cmpl	%esi, %edx
	cmovl	%esi, %edx
.L2:
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L68
	xorl	%eax, %eax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L66:
	.cfi_restore_state
	leal	1(%rax), %esi
	jmp	.L6
.L67:
	leal	1(%rsi), %eax
	jmp	.L7
.L22:
	xorl	%esi, %esi
	jmp	.L8
.L15:
	xorl	%edx, %edx
	jmp	.L3
.L16:
	xorl	%eax, %eax
	jmp	.L5
.L18:
	xorl	%esi, %esi
	jmp	.L6
.L20:
	xorl	%eax, %eax
	jmp	.L7
.L14:
	xorl	%edx, %edx
	jmp	.L2
.L24:
	xorl	%eax, %eax
	jmp	.L9
.L26:
	xorl	%esi, %esi
	jmp	.L10
.L28:
	xorl	%eax, %eax
	jmp	.L11
.L30:
	xorl	%ecx, %ecx
	jmp	.L12
.L68:
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
