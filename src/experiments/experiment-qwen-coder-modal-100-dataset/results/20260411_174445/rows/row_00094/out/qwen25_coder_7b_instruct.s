.file	"optimized_inputC.s"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d "
.LC2:
	.string	"YES"
.LC3:
	.string	"NO"
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
	movl	$.LC0, %edi
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	leaq	12(%rsp), %rsi
	leaq	52(%rsp), %rbp
	call	__isoc99_scanf
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L3
	.p2align 4,,10
	.p2align 3
.L2:
	leaq	16(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%rbx, %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	__isoc99_scanf
	cmpq	%rbx, %rbp
	jne	.L4
	movq	%rbp, %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	16(%rsp), %ecx
	movl	20(%rsp), %edx
	cmpl	%edx, %ecx
	jl	.L16
	testl	%edx, %edx
	jle	.L6
	movl	%edx, %eax
	movl	%ecx, %edx
.L5:
	movl	24(%rsp), %ecx
	cmpl	%ecx, %edx
	jl	.L7
	cmpl	%ecx, %eax
	jge	.L6
	movl	%ecx, %eax
	movl	%edx, %ecx
.L7:
	movl	28(%rsp), %edx
	cmpl	%edx, %ecx
	jl	.L8
	cmpl	%edx, %eax
	jge	.L6
	movl	%edx, %eax
	movl	%ecx, %edx
.L8:
	movl	32(%rsp), %ecx
	cmpl	%ecx, %edx
	jl	.L9
	cmpl	%ecx, %eax
	jge	.L6
	movl	%ecx, %eax
	movl	%edx, %ecx
.L9:
	movl	36(%rsp), %edx
	cmpl	%edx, %ecx
	jl	.L10
	cmpl	%edx, %eax
	jge	.L6
	movl	%edx, %eax
	movl	%ecx, %edx
.L10:
	movl	40(%rsp), %ecx
	cmpl	%ecx, %edx
	jl	.L11
	cmpl	%ecx, %eax
	jge	.L6
	movl	%ecx, %eax
	movl	%edx, %ecx
.L11:
	movl	44(%rsp), %esi
	cmpl	%esi, %ecx
	jl	.L12
	cmpl	%esi, %eax
	jge	.L6
	movl	%esi, %eax
	movl	%ecx, %esi
.L12:
	movl	48(%rsp), %edx
	cmpl	%edx, %esi
	jl	.L13
	cmpl	%edx, %eax
	jge	.L6
	movl	%edx, %eax
	movl	%esi, %edx
.L13:
	cmpl	%eax, %edx
	cmovg	%eax, %edx
	cmpl	52(%rsp), %edx
	jge	.L6
	movl	$.LC2, %edi
	call	puts
.L14:
	addl	$1, %r12d
	cmpl	%r12d, 12(%rsp)
	jg	.L2
.L3:
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L6:
	movl	$.LC3, %edi
	call	puts
	jmp	.L14
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
