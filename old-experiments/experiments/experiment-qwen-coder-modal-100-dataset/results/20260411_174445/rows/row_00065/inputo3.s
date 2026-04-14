	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%x%x"
.LC1:
	.string	">"
.LC2:
	.string	"="
.LC3:
	.string	"<"
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
	leaq	12(%rsp), %rdx
	leaq	8(%rsp), %rsi
	call	__isoc99_scanf
	movl	12(%rsp), %eax
	cmpl	%eax, 8(%rsp)
	jg	.L7
	je	.L8
	movl	$.LC3, %edi
	call	puts
.L3:
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore_state
	movl	$.LC2, %edi
	call	puts
	jmp	.L3
.L7:
	movl	$.LC1, %edi
	call	puts
	jmp	.L3
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
