	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d\n"
.LC2:
	.string	"0"
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
	leaq	-77824(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$2240, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-80052(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -80044(%rbp)
	jmp	.L2
.L3:
	leaq	-80032(%rbp), %rdx
	movl	-80044(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -80044(%rbp)
.L2:
	movl	-80052(%rbp), %eax
	cmpl	%eax, -80044(%rbp)
	jl	.L3
	movl	$0, -80044(%rbp)
	jmp	.L4
.L8:
	movl	-80044(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -80040(%rbp)
	jmp	.L5
.L7:
	movl	-80044(%rbp), %eax
	cltq
	movl	-80032(%rbp,%rax,4), %edx
	movl	-80040(%rbp), %eax
	cltq
	movl	-80032(%rbp,%rax,4), %eax
	cmpl	%eax, %edx
	jne	.L6
	movl	-80040(%rbp), %eax
	cltq
	movl	$-1, -80032(%rbp,%rax,4)
.L6:
	addl	$1, -80040(%rbp)
.L5:
	movl	-80052(%rbp), %eax
	cmpl	%eax, -80040(%rbp)
	jl	.L7
	addl	$1, -80044(%rbp)
.L4:
	movl	-80052(%rbp), %eax
	cmpl	%eax, -80044(%rbp)
	jl	.L8
	leaq	-80048(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -80044(%rbp)
	jmp	.L9
.L10:
	leaq	-40016(%rbp), %rdx
	movl	-80044(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -80044(%rbp)
.L9:
	movl	-80048(%rbp), %eax
	cmpl	%eax, -80044(%rbp)
	jl	.L10
	movl	$0, -80044(%rbp)
	jmp	.L11
.L15:
	movl	-80044(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -80040(%rbp)
	jmp	.L12
.L14:
	movl	-80044(%rbp), %eax
	cltq
	movl	-40016(%rbp,%rax,4), %edx
	movl	-80040(%rbp), %eax
	cltq
	movl	-40016(%rbp,%rax,4), %eax
	cmpl	%eax, %edx
	jne	.L13
	movl	-80040(%rbp), %eax
	cltq
	movl	$-1, -40016(%rbp,%rax,4)
.L13:
	addl	$1, -80040(%rbp)
.L12:
	movl	-80048(%rbp), %eax
	cmpl	%eax, -80040(%rbp)
	jl	.L14
	addl	$1, -80044(%rbp)
.L11:
	movl	-80048(%rbp), %eax
	cmpl	%eax, -80044(%rbp)
	jl	.L15
	movl	$0, -80036(%rbp)
	movl	$0, -80044(%rbp)
	jmp	.L16
.L22:
	movl	-80044(%rbp), %eax
	cltq
	movl	-80032(%rbp,%rax,4), %eax
	cmpl	$-1, %eax
	je	.L27
	movl	$0, -80040(%rbp)
	jmp	.L19
.L21:
	movl	-80044(%rbp), %eax
	cltq
	movl	-80032(%rbp,%rax,4), %edx
	movl	-80040(%rbp), %eax
	cltq
	movl	-40016(%rbp,%rax,4), %eax
	cmpl	%eax, %edx
	jne	.L20
	addl	$1, -80036(%rbp)
	jmp	.L18
.L20:
	addl	$1, -80040(%rbp)
.L19:
	movl	-80048(%rbp), %eax
	cmpl	%eax, -80040(%rbp)
	jl	.L21
	jmp	.L18
.L27:
	nop
.L18:
	addl	$1, -80044(%rbp)
.L16:
	movl	-80052(%rbp), %eax
	cmpl	%eax, -80044(%rbp)
	jl	.L22
	cmpl	$0, -80036(%rbp)
	je	.L23
	movl	-80036(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L24
.L23:
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L24:
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L26
	call	__stack_chk_fail@PLT
.L26:
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
