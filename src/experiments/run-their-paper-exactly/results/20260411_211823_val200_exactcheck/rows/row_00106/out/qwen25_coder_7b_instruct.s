.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%[^\n]"
.LC1:
	.string	"YES"
.LC2:
	.string	"NO"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4104
	movq	%fs:40, %rax
	movq	%rax, 10008(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rsi
	call	__isoc99_scanf@PLT
	movzbl	(%rsp), %eax
	testb	%al, %al
	je	.L2
	leaq	1(%rsp), %rdx
.L3:
	addq	$1, %rdx
	testb	%al, %al
	je	.L2
	cmpb	$32, (%rdx)
	jne	.L3
	cmpb	(%rdx), -2(%rdx)
	je	.L3
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	jmp	.L6
.L2:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
.L6:
	movq	10008(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L15
	xorl	%eax, %eax
	addq	$10024, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L15:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
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
