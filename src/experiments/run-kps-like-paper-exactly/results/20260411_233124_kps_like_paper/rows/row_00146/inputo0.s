	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d\n"
.LC1:
	.string	"\n%c %d"
.LC2:
	.string	"S %d\n"
.LC3:
	.string	"H %d\n"
.LC4:
	.string	"C %d\n"
.LC5:
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
	subq	$240, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-224(%rbp), %rdx
	movl	$0, %eax
	movl	$26, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	-236(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -228(%rbp)
	jmp	.L2
.L9:
	leaq	-232(%rbp), %rdx
	leaq	-237(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movzbl	-237(%rbp), %eax
	movsbl	%al, %eax
	cmpl	$83, %eax
	je	.L3
	cmpl	$83, %eax
	jg	.L22
	cmpl	$72, %eax
	je	.L5
	cmpl	$72, %eax
	jg	.L22
	cmpl	$67, %eax
	je	.L6
	cmpl	$68, %eax
	je	.L7
	jmp	.L22
.L3:
	movl	-232(%rbp), %eax
	subl	$1, %eax
	cltq
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$224, %rax
	movl	$1, (%rax)
	jmp	.L8
.L5:
	movl	-232(%rbp), %eax
	subl	$1, %eax
	cltq
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$220, %rax
	movl	$1, (%rax)
	jmp	.L8
.L6:
	movl	-232(%rbp), %eax
	subl	$1, %eax
	cltq
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$216, %rax
	movl	$1, (%rax)
	jmp	.L8
.L7:
	movl	-232(%rbp), %eax
	subl	$1, %eax
	cltq
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$212, %rax
	movl	$1, (%rax)
	jmp	.L8
.L22:
	nop
.L8:
	addl	$1, -228(%rbp)
.L2:
	movl	-236(%rbp), %eax
	cmpl	%eax, -228(%rbp)
	jl	.L9
	movl	$0, -228(%rbp)
	jmp	.L10
.L19:
	movl	$0, -236(%rbp)
	jmp	.L11
.L18:
	movl	-236(%rbp), %eax
	movl	-228(%rbp), %edx
	movslq	%edx, %rdx
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	-224(%rbp,%rax,4), %eax
	testl	%eax, %eax
	jne	.L12
	cmpl	$3, -228(%rbp)
	je	.L13
	cmpl	$3, -228(%rbp)
	jg	.L23
	cmpl	$2, -228(%rbp)
	je	.L15
	cmpl	$2, -228(%rbp)
	jg	.L23
	cmpl	$0, -228(%rbp)
	je	.L16
	cmpl	$1, -228(%rbp)
	je	.L17
	jmp	.L23
.L16:
	movl	-236(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L12
.L17:
	movl	-236(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L12
.L15:
	movl	-236(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L12
.L13:
	movl	-236(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L12
.L23:
	nop
.L12:
	movl	-236(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -236(%rbp)
.L11:
	movl	-236(%rbp), %eax
	cmpl	$12, %eax
	jle	.L18
	addl	$1, -228(%rbp)
.L10:
	cmpl	$3, -228(%rbp)
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
