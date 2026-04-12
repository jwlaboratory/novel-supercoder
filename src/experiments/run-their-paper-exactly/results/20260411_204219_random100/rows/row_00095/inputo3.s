.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d"
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rdx
	movq	%rsp, %rsi
	call	__isoc99_scanf@PLT
	movl	(%rsp), %eax
	cmpl	$2, %eax
	je	.L2
	movl	4(%rsp), %edx
	cmpl	$2, %edx
	je	.L2
	cmpl	$12, %eax
	ja	.L5
	movl	$5546, %esi
	movl	%eax, %ecx
	movq	%rsi, %rdi
	shrq	%cl, %rdi
	movq	%rdi, %rcx
	andb	$1, %cl
	je	.L6
	cmpl	$12, %edx
	ja	.L6
	movl	%edx, %ecx
	shrq	%cl, %rsi
	andb	$1, %sil
	je	.L6
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	jmp	.L4
.L6:
	cmpl	$11, %eax
	ja	.L5
	movl	$2640, %esi
	movl	%eax, %ecx
	movq	%rsi, %rdi
	shrq	%cl, %rdi
	movq	%rdi, %rax
	testb	$1, %al
	jne	.L25
.L5:
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L4:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L26
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L25:
	.cfi_restore_state
	cmpl	$11, %edx
	ja	.L5
	movl	%edx, %ecx
	shrq	%cl, %rsi
	andb	$1, %sil
	je	.L5
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L4
.L2:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	jmp	.L4
.L26:
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