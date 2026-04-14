	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%s %d"
.LC2:
	.string	"S"
.LC3:
	.string	"H"
.LC4:
	.string	"C"
.LC5:
	.string	"D"
.LC6:
	.string	"S %d\n"
.LC7:
	.string	"H %d\n"
.LC8:
	.string	"C %d\n"
.LC9:
	.string	"D %d\n"
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
	subq	$384, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-380(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -372(%rbp)
	jmp	.L2
.L7:
	leaq	-376(%rbp), %rdx
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L3
	movl	-376(%rbp), %eax
	movl	-376(%rbp), %edx
	cltq
	movl	%edx, -368(%rbp,%rax,4)
.L3:
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L4
	movl	-376(%rbp), %eax
	movl	-376(%rbp), %edx
	cltq
	movl	%edx, -304(%rbp,%rax,4)
.L4:
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L5
	movl	-376(%rbp), %eax
	movl	-376(%rbp), %edx
	cltq
	movl	%edx, -240(%rbp,%rax,4)
.L5:
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L6
	movl	-376(%rbp), %eax
	movl	-376(%rbp), %edx
	cltq
	movl	%edx, -176(%rbp,%rax,4)
.L6:
	addl	$1, -372(%rbp)
.L2:
	movl	-380(%rbp), %eax
	cmpl	%eax, -372(%rbp)
	jl	.L7
	movl	$1, -372(%rbp)
	jmp	.L8
.L10:
	movl	-372(%rbp), %eax
	cltq
	movl	-368(%rbp,%rax,4), %eax
	cmpl	%eax, -372(%rbp)
	je	.L9
	movl	-372(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L9:
	addl	$1, -372(%rbp)
.L8:
	cmpl	$13, -372(%rbp)
	jle	.L10
	movl	$1, -372(%rbp)
	jmp	.L11
.L13:
	movl	-372(%rbp), %eax
	cltq
	movl	-304(%rbp,%rax,4), %eax
	cmpl	%eax, -372(%rbp)
	je	.L12
	movl	-372(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L12:
	addl	$1, -372(%rbp)
.L11:
	cmpl	$13, -372(%rbp)
	jle	.L13
	movl	$1, -372(%rbp)
	jmp	.L14
.L16:
	movl	-372(%rbp), %eax
	cltq
	movl	-240(%rbp,%rax,4), %eax
	cmpl	%eax, -372(%rbp)
	je	.L15
	movl	-372(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L15:
	addl	$1, -372(%rbp)
.L14:
	cmpl	$13, -372(%rbp)
	jle	.L16
	movl	$1, -372(%rbp)
	jmp	.L17
.L19:
	movl	-372(%rbp), %eax
	cltq
	movl	-176(%rbp,%rax,4), %eax
	cmpl	%eax, -372(%rbp)
	je	.L18
	movl	-372(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L18:
	addl	$1, -372(%rbp)
.L17:
	cmpl	$13, -372(%rbp)
	jle	.L19
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
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
