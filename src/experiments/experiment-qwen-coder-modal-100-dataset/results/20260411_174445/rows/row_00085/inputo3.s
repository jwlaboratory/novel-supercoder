	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s"
.LC1:
	.string	"Yes"
.LC2:
	.string	"No"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$.LC0, %edi
	xorl	%eax, %eax
	leaq	12(%rsp), %rsi
	call	__isoc99_scanf
	movzwl	12(%rsp), %eax
	rolw	$8, %ax
	movl	%eax, %edx
	movzbl	12(%rsp), %eax
	cmpb	13(%rsp), %al
	jle	.L7
	movw	%dx, 12(%rsp)
	movzbl	12(%rsp), %eax
.L7:
	movzbl	14(%rsp), %edx
	cmpb	%dl, %al
	jg	.L3
.L6:
	movzwl	13(%rsp), %eax
	movzbl	14(%rsp), %ecx
	rolw	$8, %ax
	cmpb	%cl, 13(%rsp)
	jle	.L5
	movw	%ax, 13(%rsp)
.L5:
	cmpb	$97, 12(%rsp)
	movzbl	14(%rsp), %eax
	jne	.L9
	cmpb	$98, 13(%rsp)
	je	.L13
.L9:
	movl	$.LC2, %edi
	call	puts
.L10:
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	movb	%dl, 12(%rsp)
	movb	%al, 14(%rsp)
	jmp	.L6
.L13:
	cmpb	$99, %al
	jne	.L9
	movl	$.LC1, %edi
	call	puts
	jmp	.L10
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
