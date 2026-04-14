	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d %d"
.LC1:
	.string	"%d"
.LC2:
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
	subq	$1072, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L22:
	leaq	-1064(%rbp), %rdx
	leaq	-1068(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-1068(%rbp), %eax
	testl	%eax, %eax
	jne	.L2
	movl	-1064(%rbp), %eax
	testl	%eax, %eax
	je	.L26
.L2:
	leaq	-1040(%rbp), %rax
	movl	$1024, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-1052(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -1048(%rbp)
	jmp	.L4
.L5:
	leaq	-1056(%rbp), %rdx
	leaq	-1060(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-1056(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-1060(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rcx
	movslq	%edx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	$-1, -1040(%rbp,%rax,4)
	addl	$1, -1048(%rbp)
.L4:
	movl	-1052(%rbp), %eax
	cmpl	%eax, -1048(%rbp)
	jl	.L5
	movl	$0, -1048(%rbp)
	jmp	.L6
.L9:
	movl	-1048(%rbp), %eax
	cltq
	movl	-1040(%rbp,%rax,4), %eax
	cmpl	$-1, %eax
	je	.L27
	movl	-1048(%rbp), %eax
	cltq
	movl	$1, -1040(%rbp,%rax,4)
	addl	$1, -1048(%rbp)
.L6:
	movl	-1068(%rbp), %eax
	cmpl	%eax, -1048(%rbp)
	jl	.L9
	jmp	.L8
.L27:
	nop
.L8:
	movl	$0, -1048(%rbp)
	jmp	.L10
.L13:
	movl	-1048(%rbp), %eax
	cltq
	salq	$6, %rax
	addq	%rbp, %rax
	subq	$1040, %rax
	movl	(%rax), %eax
	cmpl	$-1, %eax
	je	.L28
	movl	-1048(%rbp), %eax
	cltq
	salq	$6, %rax
	addq	%rbp, %rax
	subq	$1040, %rax
	movl	$1, (%rax)
	addl	$1, -1048(%rbp)
.L10:
	movl	-1064(%rbp), %eax
	cmpl	%eax, -1048(%rbp)
	jl	.L13
	jmp	.L12
.L28:
	nop
.L12:
	movl	$1, -1048(%rbp)
	jmp	.L14
.L21:
	movl	$1, -1044(%rbp)
	jmp	.L15
.L20:
	movl	-1044(%rbp), %eax
	movslq	%eax, %rdx
	movl	-1048(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	-1040(%rbp,%rax,4), %eax
	cmpl	$-1, %eax
	je	.L16
	movl	-1048(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-1044(%rbp), %eax
	movslq	%eax, %rcx
	movslq	%edx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	-1040(%rbp,%rax,4), %eax
	cmpl	$-1, %eax
	jne	.L17
	movl	-1044(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rdx
	movl	-1048(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	-1040(%rbp,%rax,4), %eax
	cmpl	$-1, %eax
	jne	.L18
	movl	-1044(%rbp), %eax
	movslq	%eax, %rdx
	movl	-1048(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	$0, -1040(%rbp,%rax,4)
	jmp	.L16
.L18:
	movl	-1044(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rdx
	movl	-1048(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	-1040(%rbp,%rax,4), %eax
	movl	-1044(%rbp), %edx
	movslq	%edx, %rcx
	movl	-1048(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rcx, %rdx
	movl	%eax, -1040(%rbp,%rdx,4)
	jmp	.L16
.L17:
	movl	-1044(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rdx
	movl	-1048(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	-1040(%rbp,%rax,4), %eax
	cmpl	$-1, %eax
	jne	.L19
	movl	-1048(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-1044(%rbp), %eax
	movslq	%eax, %rcx
	movslq	%edx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	-1040(%rbp,%rax,4), %eax
	movl	-1044(%rbp), %edx
	movslq	%edx, %rcx
	movl	-1048(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rcx, %rdx
	movl	%eax, -1040(%rbp,%rdx,4)
	jmp	.L16
.L19:
	movl	-1048(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-1044(%rbp), %eax
	movslq	%eax, %rcx
	movslq	%edx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	-1040(%rbp,%rax,4), %edx
	movl	-1044(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rcx
	movl	-1048(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movl	-1040(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movl	-1044(%rbp), %eax
	movslq	%eax, %rcx
	movl	-1048(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movl	%edx, -1040(%rbp,%rax,4)
.L16:
	addl	$1, -1044(%rbp)
.L15:
	movl	-1068(%rbp), %eax
	cmpl	%eax, -1044(%rbp)
	jl	.L20
	addl	$1, -1048(%rbp)
.L14:
	movl	-1064(%rbp), %eax
	cmpl	%eax, -1048(%rbp)
	jl	.L21
	movl	-1064(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-1068(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rcx
	movslq	%edx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	-1040(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L22
.L26:
	nop
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
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
