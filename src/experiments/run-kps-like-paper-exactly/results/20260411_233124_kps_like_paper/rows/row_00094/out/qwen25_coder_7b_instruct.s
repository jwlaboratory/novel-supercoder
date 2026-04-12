.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d %c %d"
.LC1:
	.string	"?"
.LC2:
	.string	"+"
.LC3:
	.string	"-"
.LC4:
	.string	"/"
.LC5:
	.string	"*"
.LC6:
	.string	"%d\n"
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
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L8:
	leaq	-10024(%rbp), %rcx
	leaq	-10016(%rbp), %rdx
	leaq	-10028(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-10016(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L12
	leaq	-10016(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L4
	movl	-10028(%rbp), %edx
	movl	-10024(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -10020(%rbp)
	jmp	.L13
.L4:
	leaq	-10016(%rbp), %rax
	leaq	.LC3(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L5
	movl	-10028(%rbp), %eax
	movl	-10024(%rbp), %edx
	subl	%edx, %eax
	movl	%eax, -10020(%rbp)
	jmp	.L13
.L5:
	leaq	-10016(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L6
	movl	-10028(%rbp), %eax
	movl	-10024(%rbp), %ecx
	cltd
	idivl	%ecx
	movl	%eax, -10020(%rbp)
	jmp	.L13
.L6:
	leaq	-10016(%rbp), %rax
	leaq	.LC5(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L7
	movl	-10028(%rbp), %edx
	movl	-10024(%rbp), %eax
	imull	%edx, %eax
	movl	%eax, -10020(%rbp)
.L7:
.L13:
	movl	-10020(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L8
.L12:
	nop
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
