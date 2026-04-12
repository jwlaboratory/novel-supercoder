.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%s"
.LC1:
	.string	"%d\n"
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
	subq	$528, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L2:
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$-1, %eax
	je	.L8
	movzbl	-112(%rbp), %eax
	cmpb	$43, %al
	je	.L3
	movzbl	-112(%rbp), %eax
	cmpb	$45, %al
	je	.L4
	movzbl	-112(%rbp), %eax
	cmpb	$42, %al
	je	.L5
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -516(%rbp)
	movl	-520(%rbp), %eax
	cltq
	movl	-516(%rbp), %edx
	movl	%edx, -512(%rbp,%rax,4)
	addl	$1, -520(%rbp)
	jmp	.L2
.L3:
	movl	-520(%rbp), %eax
	subl	$2, %eax
	cltq
	movl	-512(%rbp,%rax,4), %ecx
	movl	-520(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	-512(%rbp,%rax,4), %edx
	movl	-520(%rbp), %eax
	subl	$2, %eax
	addl	%ecx, %edx
	movl	%edx, -512(%rbp,%rax,4)
	subl	$1, -520(%rbp)
	jmp	.L2
.L4:
	movl	-520(%rbp), %eax
	subl	$2, %eax
	cltq
	movl	-512(%rbp,%rax,4), %edx
	movl	-520(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	-512(%rbp,%rax,4), %ecx
	movl	-520(%rbp), %eax
	subl	$2, %eax
	subl	%ecx, %edx
	movl	%edx, -512(%rbp,%rax,4)
	subl	$1, -520(%rbp)
	jmp	.L2
.L5:
	movl	-520(%rbp), %eax
	subl	$2, %eax
	cltq
	movl	-512(%rbp,%rax,4), %edx
	movl	-520(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	-512(%rbp,%rax,4), %eax
	movl	-520(%rbp), %ecx
	subl	$2, %ecx
	imull	%eax, %edx
	movl	%edx, -512(%rbp,%rax,4)
	subl	$1, -520(%rbp)
	jmp	.L2
.L8:
	movl	-520(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	-512(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
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
