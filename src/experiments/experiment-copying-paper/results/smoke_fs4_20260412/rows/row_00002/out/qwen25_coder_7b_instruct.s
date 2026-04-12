.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s"
.LC1:
	.string	"%lu\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB35:
	.cfi_startproc
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movzbl	4(%rsp), %eax
	testb	%al, %al
	je	.L7
	leaq	5(%rsp), %rdx
	xorl	%ecx, %ecx
	xorl	%ebx, %ebx
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L3:
	testq	%rcx, %rcx
	je	.L4
	subq	$1, %rcx
	addl	$1, %ebx
.L4:
	movzbl	(%rdx), %eax
	addq	$1, %rdx
	testb	%al, %al
	je	.L2
.L5:
	cmpb	$83, %al
	jne	.L3
	movzbl	(%rdx), %eax
	addq	$1, %rdx
	addq	$1, %rcx
	testb	%al, %al
	jne	.L5
.L2:
	movq	%rbp, %rdi
	addl	%ebx, %ebx
	call	strlen@PLT
	movslq	%ebx, %rbx
	movl	$1, %edi
	leaq	.LC1(%rip), %rsi
	subq	%rbx, %rax
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L14
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 24
	ret
.L7:
	.cfi_restore_state
	xorl	%ebx, %ebx
	jmp	.L2
.L14:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE35:
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
