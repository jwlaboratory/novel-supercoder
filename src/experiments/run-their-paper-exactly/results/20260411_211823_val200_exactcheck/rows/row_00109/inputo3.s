.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s"
.LC1:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	leaq	-98304(%rsp), %r11
	.cfi_def_cfa 11, 98312
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$1720, %rsp
	.cfi_def_cfa_offset 100032
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 100008(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rsi
	call	__isoc99_scanf@PLT
	movzbl	(%rsp), %esi
	testb	%sil, %sil
	je	.L7
	movzbl	1(%rsp), %eax
	leaq	1(%rsp), %rcx
	xorl	%edx, %edx
	cmpb	%al, %sil
	je	.L3
	.p2align 4,,10
	.p2align 3
.L14:
	addl	$1, %edx
	addq	$1, %rcx
	testb	%al, %al
	je	.L2
	movl	%eax, %esi
.L15:
	movzbl	(%rcx), %eax
	cmpb	%al, %sil
	jne	.L14
.L3:
	addq	$1, %rcx
	movl	%eax, %esi
	jmp	.L15
.L7:
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L2:
	subl	$1, %edx
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	.LC1(%rip), %rsi
	call	__printf_chk@PLT
	movq	100008(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L16
	xorl	%eax, %eax
	addq	$100024, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L16:
	.cfi_restore_state
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