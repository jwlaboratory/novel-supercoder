	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%s"
.LC1:
	.string	"%ld\n"
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
	leaq	-397312(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$2752, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -400032(%rbp)
	leaq	-400016(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-400016(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -400024(%rbp)
	movzbl	-400016(%rbp), %eax
	movb	%al, -200016(%rbp)
	movb	$0, -200015(%rbp)
	movq	$1, -400040(%rbp)
	movq	$1, -400064(%rbp)
	jmp	.L2
.L11:
	movq	$1, -400048(%rbp)
	cmpq	$0, -400032(%rbp)
	jne	.L3
	movq	$0, -400056(%rbp)
	jmp	.L4
.L9:
	movq	-400064(%rbp), %rdx
	movq	-400056(%rbp), %rax
	addq	%rdx, %rax
	cmpq	%rax, -400024(%rbp)
	jle	.L15
	movq	-400056(%rbp), %rdx
	movq	-400064(%rbp), %rax
	addq	%rdx, %rax
	movzbl	-400016(%rbp,%rax), %edx
	leaq	-200016(%rbp), %rcx
	movq	-400056(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jne	.L7
	addq	$1, -400048(%rbp)
	addq	$1, -400032(%rbp)
	movq	-400056(%rbp), %rdx
	movq	-400064(%rbp), %rax
	addq	%rdx, %rax
	movzbl	-400016(%rbp,%rax), %eax
	leaq	-200016(%rbp), %rcx
	movq	-400056(%rbp), %rdx
	addq	%rcx, %rdx
	movb	%al, (%rdx)
	jmp	.L14
.L7:
	addq	$1, -400040(%rbp)
	movq	-400056(%rbp), %rdx
	movq	-400064(%rbp), %rax
	addq	%rdx, %rax
	movzbl	-400016(%rbp,%rax), %eax
	leaq	-200016(%rbp), %rcx
	movq	-400056(%rbp), %rdx
	addq	%rcx, %rdx
	movb	%al, (%rdx)
	jmp	.L10
.L14:
	addq	$1, -400056(%rbp)
.L4:
	cmpq	$255, -400056(%rbp)
	jle	.L9
	jmp	.L10
.L3:
	addq	$1, -400040(%rbp)
	leaq	-400016(%rbp), %rdx
	movq	-400064(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -200016(%rbp)
	movq	$0, -400032(%rbp)
	jmp	.L10
.L15:
	nop
.L10:
	leaq	-200016(%rbp), %rdx
	movq	-400048(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-400048(%rbp), %rax
	addq	%rax, -400064(%rbp)
.L2:
	movq	-400064(%rbp), %rax
	cmpq	-400024(%rbp), %rax
	jl	.L11
	movq	-400040(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
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
