```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s"
.LC1:
	.string	"No"
.LC2:
	.string	"Yes"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movzbl	4(%rsp), %eax
	movzbl	5(%rsp), %edx
	movzbl	6(%rsp), %ecx
	cmpb	%dl, %al
	je	.L19
	cmpb	%cl, %al
	je	.L4
.L6:
	cmpb	%al, 7(%rsp)
	jne	.L8
	cmpb	%cl, %dl
	je	.L7
.L8:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
.L5:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L20
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L21:
	.cfi_restore_state
	cmpb	%sil, %al
	je	.L8
.L4:
	cmpb	7(%rsp), %dl
	jne	.L6
.L7:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	jmp	.L5
.L19:
	movzbl	7(%rsp), %esi
	cmpb	%cl, %al
	je	.L21
	cmpb	%sil, %cl
	jne	.L8
	jmp	.L7
.L20:
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