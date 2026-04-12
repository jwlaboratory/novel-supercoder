	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%s"
.LC1:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	leaq	-98304(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$1736, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	$0, -100032(%rbp)
	movq	$0, -100024(%rbp)
	leaq	-100016(%rbp), %rax
	movl	$99985, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-100032(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -100040(%rbp)
	movl	$0, -100036(%rbp)
	jmp	.L2
.L5:
	movl	-100036(%rbp), %eax
	cltq
	movzbl	-100032(%rbp,%rax), %edx
	movl	-100036(%rbp), %eax
	addl	$1, %eax
	cltq
	movzbl	-100032(%rbp,%rax), %eax
	cmpb	%al, %dl
	jne	.L3
	addl	$1, -100040(%rbp)
	movl	-100036(%rbp), %eax
	addl	$1, %eax
	cltq
	movzbl	-100032(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L4
	movl	-100036(%rbp), %eax
	addl	$1, %eax
	cltq
	movb	$49, -100032(%rbp,%rax)
	jmp	.L3
.L4:
	movl	-100036(%rbp), %eax
	addl	$1, %eax
	cltq
	movb	$48, -100032(%rbp,%rax)
.L3:
	addl	$1, -100036(%rbp)
.L2:
	movl	-100036(%rbp), %eax
	movslq	%eax, %rbx
	leaq	-100032(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	subq	$1, %rax
	cmpq	%rax, %rbx
	jb	.L5
	movl	-100040(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0"
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
