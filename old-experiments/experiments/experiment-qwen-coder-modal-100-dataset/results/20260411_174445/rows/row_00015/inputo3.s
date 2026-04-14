	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\n"
.LC1:
	.string	"%d"
.LC2:
	.string	"-1"
.LC3:
	.string	"%llu\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	$.LC0, %edi
	xorl	%eax, %eax
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	leaq	12(%rsp), %rsi
	call	__isoc99_scanf
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L2
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L4:
	leaq	dists(,%r13,4), %rbp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rbp, %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf
	movl	12(%rsp), %eax
	addq	$4, %rbp
	cmpl	%ebx, %eax
	jg	.L3
	addl	$1, %r12d
	addq	$300, %r13
	cmpl	%r12d, %eax
	jg	.L4
	testl	%eax, %eax
	jle	.L2
	xorl	%r9d, %r9d
	xorl	%r10d, %r10d
	xorl	%r13d, %r13d
	movslq	%eax, %r11
	movl	$1, %ebp
.L5:
	movl	$dists, %r12d
	xorl	%edi, %edi
.L12:
	movl	(%r12,%r9), %r8d
	movq	%r12, %rsi
	xorl	%edx, %edx
	xorl	%ebx, %ebx
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L6:
	jne	.L8
	cmpl	%edi, %r10d
	je	.L8
	cmpl	%edx, %edi
	je	.L8
	cmpl	%edx, %r10d
	cmovne	%ebp, %ebx
.L8:
	addq	$1, %rdx
	addq	$1200, %rsi
	cmpq	%rdx, %r11
	je	.L31
.L10:
	movl	(%rsi), %ecx
	addl	dists(%r9,%rdx,4), %ecx
	cmpl	%ecx, %r8d
	jle	.L6
	movl	$.LC2, %edi
	call	puts
.L7:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L31:
	.cfi_restore_state
	movslq	%r8d, %rdx
	addq	%r13, %rdx
	testl	%ebx, %ebx
	cmove	%rdx, %r13
	addl	$1, %edi
	addq	$4, %r12
	cmpl	%edi, %eax
	jne	.L12
	addl	$1, %r10d
	addq	$1200, %r9
	cmpl	%r10d, %eax
	jne	.L5
	jmp	.L13
.L2:
	xorl	%r13d, %r13d
.L13:
	movq	%r13, %rsi
	movl	$.LC3, %edi
	xorl	%eax, %eax
	shrq	%rsi
	call	printf
	jmp	.L7
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.globl	dists
	.bss
	.align 32
	.type	dists, @object
	.size	dists, 360000
dists:
	.zero	360000
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
