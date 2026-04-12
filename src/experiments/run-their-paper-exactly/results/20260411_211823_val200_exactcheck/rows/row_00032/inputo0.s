```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s"
.LC1:
	.string	"%d"
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
	movzbl	1(%rsp), %eax
	testb	%al, %al
	je	.L5
	movzbl	(%rsp), %esi
	leaq	2(%rsp), %rdx
	xorl	%r8d, %r8d
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L6:
	movl	%ecx, %eax
.L3:
	xorl	%ecx, %ecx
	cmpb	%sil, %al
	movl	%eax, %esi
	setne	%cl
	addq	$1, %rdx
	addl	%ecx, %r8d
	movzbl	-1(%rdx), %ecx
	testb	%cl, %cl
	jne	.L6
.L2:
	xorl	%eax, %eax
	movl	%r8d, %edx
	movl	$1, %edi
	leaq	.LC1(%rip), %rsi
	call	__printf_chk@PLT
	movq	100008(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L9
	xorl	%eax, %eax
	addq	$100024, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	xorl	%r8d, %r8d
	jmp	.L2
.L9:
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
```