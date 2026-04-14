	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%s %d"
.LC2:
	.string	"YES"
.LC3:
	.string	"NO"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$1840, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -10024(%rbp)
	leaq	-10032(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -10020(%rbp)
	jmp	.L2
.L7:
	leaq	-10028(%rbp), %rdx
	leaq	-10016(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movzbl	-10015(%rbp), %eax
	testb	%al, %al
	jne	.L3
	movzbl	-10016(%rbp), %eax
	cmpb	$40, %al
	jne	.L4
	movl	-10028(%rbp), %eax
	addl	%eax, -10024(%rbp)
	jmp	.L3
.L4:
	movzbl	-10016(%rbp), %eax
	cmpb	$41, %al
	jne	.L3
	movl	-10028(%rbp), %eax
	subl	%eax, -10024(%rbp)
.L3:
	cmpl	$0, -10024(%rbp)
	js	.L12
	addl	$1, -10020(%rbp)
.L2:
	movl	-10032(%rbp), %eax
	cmpl	%eax, -10020(%rbp)
	jl	.L7
	jmp	.L6
.L12:
	nop
.L6:
	cmpl	$0, -10024(%rbp)
	jne	.L8
	leaq	.LC2(%rip), %rax
	jmp	.L9
.L8:
	leaq	.LC3(%rip), %rax
.L9:
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
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
