	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%dx%d=%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$1, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.p2align 4,,10
	.p2align 3
.L2:
	movl	%r12d, %ebp
	movl	$1, %ebx
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%ebp, %ecx
	movl	%ebx, %edx
	movl	%r12d, %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	addl	$1, %ebx
	addl	%r12d, %ebp
	call	printf
	cmpl	$10, %ebx
	jne	.L3
	addl	$1, %r12d
	cmpl	$10, %r12d
	jne	.L2
	popq	%rbx
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
