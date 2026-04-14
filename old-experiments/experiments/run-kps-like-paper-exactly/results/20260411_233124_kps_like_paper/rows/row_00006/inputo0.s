	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d %d"
.LC2:
	.string	"0"
.LC3:
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
	subq	$1344, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	jmp	.L2
.L13:
	leaq	-1312(%rbp), %rdx
	movl	$0, %eax
	movl	$162, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	-1332(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -1320(%rbp)
	jmp	.L3
.L4:
	leaq	-1324(%rbp), %rdx
	leaq	-1328(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-1328(%rbp), %eax
	movl	-1324(%rbp), %edx
	movslq	%edx, %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movl	$-1, -1312(%rbp,%rax,4)
	addl	$1, -1320(%rbp)
.L3:
	movl	-1332(%rbp), %eax
	cmpl	%eax, -1320(%rbp)
	jl	.L4
	movl	-1236(%rbp), %eax
	cmpl	$-1, %eax
	jne	.L5
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L2
.L5:
	movl	$1, -1236(%rbp)
	movl	$1, -1320(%rbp)
	jmp	.L6
.L11:
	movl	$1, -1316(%rbp)
	jmp	.L7
.L10:
	movl	-1316(%rbp), %eax
	movslq	%eax, %rcx
	movl	-1320(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movl	-1312(%rbp,%rax,4), %eax
	cmpl	$-1, %eax
	jne	.L8
	movl	-1316(%rbp), %eax
	movslq	%eax, %rcx
	movl	-1320(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movl	$0, -1312(%rbp,%rax,4)
	jmp	.L9
.L8:
	movl	-1316(%rbp), %eax
	movslq	%eax, %rcx
	movl	-1320(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movl	-1312(%rbp,%rax,4), %ecx
	movl	-1320(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-1316(%rbp), %eax
	movslq	%eax, %rsi
	movslq	%edx, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rsi, %rax
	movl	-1312(%rbp,%rax,4), %esi
	movl	-1316(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rdi
	movl	-1320(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdi, %rax
	movl	-1312(%rbp,%rax,4), %eax
	addl	%esi, %eax
	addl	%eax, %ecx
	movl	-1316(%rbp), %eax
	movslq	%eax, %rsi
	movl	-1320(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rsi, %rax
	movl	%ecx, -1312(%rbp,%rax,4)
.L9:
	addl	$1, -1316(%rbp)
.L7:
	movl	-1336(%rbp), %eax
	cmpl	%eax, -1316(%rbp)
	jle	.L10
	addl	$1, -1320(%rbp)
.L6:
	movl	-1340(%rbp), %eax
	cmpl	%eax, -1320(%rbp)
	jle	.L11
	movl	-1340(%rbp), %eax
	movl	-1336(%rbp), %edx
	movslq	%edx, %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movl	-1312(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L2:
	leaq	-1336(%rbp), %rdx
	leaq	-1340(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$-1, %eax
	je	.L12
	movl	-1340(%rbp), %eax
	testl	%eax, %eax
	jne	.L13
	movl	-1336(%rbp), %eax
	testl	%eax, %eax
	jne	.L13
.L12:
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
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
