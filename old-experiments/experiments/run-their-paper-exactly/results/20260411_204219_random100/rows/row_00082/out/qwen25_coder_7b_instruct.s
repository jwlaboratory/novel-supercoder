.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%200000s"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	-196608(%rsp), %r11
	.cfi_def_cfa 11, 196624
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$3408, %rsp
	.cfi_def_cfa_offset 200032
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 200008(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rbp
	movq	%rbp, %rsi
	call	__isoc99_scanf@PLT
	movzbl	(%rsp), %edx
	testb	%dl, %dl
	je	.L2
	movq	%rbp, %rax
.L5:
	cmpb	$63, %dl
	je	.L15
	movzbl	1(%rax), %edx
	addq	$1, %rax
	testb	%dl, %dl
	jne	.L5
.L2:
	movq	%rbp, %rdi
	call	puts@PLT
	movq	200008(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L16
	addq	$200016, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L15:
	.cfi_restore_state
	movb	$68, (%rax)
	movzbl	1(%rax), %edx
	addq	$1, %rax
	testb	%dl, %dl
	jne	.L5
	jmp	.L2
.L16:
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
