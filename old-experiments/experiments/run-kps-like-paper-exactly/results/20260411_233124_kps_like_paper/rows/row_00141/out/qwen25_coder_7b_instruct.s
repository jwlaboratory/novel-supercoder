.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d%d"
.LC1:
	.string	"NO"
.LC2:
	.string	"YES"
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
	movq	$0, (%rsp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-400016(%rbp), %rax
	movl	$400004, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-400032(%rbp), %rdx
	leaq	-400036(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -400020(%rbp)
.L2:
	leaq	-400024(%rbp), %rdx
	leaq	-400028(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-400028(%rbp), %eax
	movslq	%eax, %rdx
	movl	-400016(%rbp,%rdx,4), %edx
	addl	$1, %edx
	movl	%edx, -400016(%rbp,%rax,4)
	movl	-400024(%rbp), %eax
	movslq	%eax, %rdx
	movl	-400016(%rbp,%rdx,4), %edx
	addl	$1, %edx
	movl	%edx, -400016(%rbp,%rax,4)
	addl	$1, -400020(%rbp)
	cmpl	%eax, -400020(%rbp)
	jl	.L2
	movl	$1, -400020(%rbp)
.L4:
	movl	-400032(%rbp), %eax
	cmpl	%eax, -400020(%rbp)
	jle	.L7
	movl	-400020(%rbp), %eax
	cltq
	movl	-400016(%rbp,%rax,4), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L5
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L8
.L5:
	addl	$1, -400020(%rbp)
.L7:
	cmpl	%eax, -400020(%rbp)
	jl	.L7
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
.L8:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
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
