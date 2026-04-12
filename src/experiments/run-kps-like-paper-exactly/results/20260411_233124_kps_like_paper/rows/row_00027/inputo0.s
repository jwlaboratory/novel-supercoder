	.file	"inputC.c"
	.text
	.globl	push
	.type	push, @function
push:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, (%rax)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	push, .-push
	.globl	pop
	.type	pop, @function
pop:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L3
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	-12(%rbp), %eax
	jmp	.L4
.L3:
	movl	$0, %eax
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	pop, .-pop
	.section	.rodata
.LC0:
	.string	" "
.LC1:
	.string	"+"
.LC2:
	.string	"-"
.LC3:
	.string	"*"
.LC4:
	.string	"/"
.LC5:
	.string	" ."
.LC6:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1040, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -1024(%rbp)
	movq	stdin(%rip), %rdx
	leaq	-1008(%rbp), %rax
	movl	$999, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	-1008(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	subq	$1, %rax
	movb	$0, -1008(%rbp,%rax)
	leaq	-1008(%rbp), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -1016(%rbp)
	jmp	.L6
.L12:
	movq	-1016(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L7
	leaq	-1024(%rbp), %rax
	movq	%rax, %rdi
	call	pop
	movl	%eax, -1028(%rbp)
	leaq	-1024(%rbp), %rax
	movq	%rax, %rdi
	call	pop
	movl	%eax, -1032(%rbp)
	movl	-1032(%rbp), %edx
	movl	-1028(%rbp), %eax
	addl	%eax, %edx
	leaq	-1024(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	push
	jmp	.L8
.L7:
	movq	-1016(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L9
	leaq	-1024(%rbp), %rax
	movq	%rax, %rdi
	call	pop
	movl	%eax, -1028(%rbp)
	leaq	-1024(%rbp), %rax
	movq	%rax, %rdi
	call	pop
	movl	%eax, -1032(%rbp)
	movl	-1032(%rbp), %eax
	subl	-1028(%rbp), %eax
	movl	%eax, %edx
	leaq	-1024(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	push
	jmp	.L8
.L9:
	movq	-1016(%rbp), %rax
	leaq	.LC3(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L10
	leaq	-1024(%rbp), %rax
	movq	%rax, %rdi
	call	pop
	movl	%eax, -1028(%rbp)
	leaq	-1024(%rbp), %rax
	movq	%rax, %rdi
	call	pop
	movl	%eax, -1032(%rbp)
	movl	-1032(%rbp), %eax
	imull	-1028(%rbp), %eax
	movl	%eax, %edx
	leaq	-1024(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	push
	jmp	.L8
.L10:
	movq	-1016(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L11
	leaq	-1024(%rbp), %rax
	movq	%rax, %rdi
	call	pop
	movl	%eax, -1028(%rbp)
	leaq	-1024(%rbp), %rax
	movq	%rax, %rdi
	call	pop
	movl	%eax, -1032(%rbp)
	movl	-1032(%rbp), %eax
	cltd
	idivl	-1028(%rbp)
	movl	%eax, %edx
	leaq	-1024(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	push
	jmp	.L8
.L11:
	movq	-1016(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %edx
	leaq	-1024(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	push
.L8:
	leaq	.LC5(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1016(%rbp)
.L6:
	cmpq	$0, -1016(%rbp)
	jne	.L12
	leaq	-1024(%rbp), %rax
	movq	%rax, %rdi
	call	pop
	movl	%eax, -1032(%rbp)
	movl	-1032(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
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
