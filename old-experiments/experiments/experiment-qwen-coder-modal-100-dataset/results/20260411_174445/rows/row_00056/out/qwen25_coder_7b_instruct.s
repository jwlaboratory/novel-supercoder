.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d %d"
.LC1:
	.string	"F"
.LC2:
	.string	"A"
.LC3:
	.string	"B"
.LC4:
	.string	"C"
.LC5:
	.string	"D"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$0, 12(%rsp)
.L2:
	leaq	12(%rsp), %rcx
	leaq	8(%rsp), %rdx
	movl	$.LC0, %edi
	xorl	%eax, %eax
	leaq	4(%rsp), %rsi
	call	__isoc99_scanf
	movl	4(%rsp), %eax
	cmpl	$-1, %eax
	je	.L14
	movl	8(%rsp), %edx
	cmpl	$-1, %edx
	je	.L5
	addl	%edx, %eax
	cmpl	$79, %eax
	jg	.L15
	leal	-65(%rax), %edx
	cmpl	$14, %edx
	jbe	.L16
	leal	-50(%rax), %edx
	cmpl	$14, %edx
	jbe	.L11
	subl	$30, %eax
	cmpl	$19, %eax
	ja	.L5
	cmpl	$49, 12(%rsp)
	jg	.L11
	movl	$.LC5, %edi
	call	puts
	jmp	.L2
.L14:
	movl	8(%rsp), %eax
	andl	12(%rsp), %eax
	cmpl	$-1, %eax
	je	.L17
.L5:
	movl	$.LC1, %edi
	call	puts
	jmp	.L2
.L17:
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L15:
	movl	$.LC2, %edi
	call	puts
	jmp	.L2
.L11:
	movl	$.LC4, %edi
	call	puts
	jmp	.L2
.L16:
	movl	$.LC3, %edi
	call	puts
	jmp	.L2
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
