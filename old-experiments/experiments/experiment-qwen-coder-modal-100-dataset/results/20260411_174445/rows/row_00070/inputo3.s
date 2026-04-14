	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.text
	.p2align 4
	.globl	get_int
	.type	get_int, @function
get_int:
.LFB8:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$.LC0, %edi
	xorl	%eax, %eax
	leaq	12(%rsp), %rsi
	call	__isoc99_scanf
	movl	12(%rsp), %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE8:
	.size	get_int, .-get_int
	.p2align 4
	.globl	fget_array
	.type	fget_array, @function
fget_array:
.LFB9:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L9
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movslq	%esi, %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	(%rdi,%rsi,4), %rbp
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%rbx, %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	__isoc99_scanf
	cmpq	%rbp, %rbx
	jne	.L6
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore 3
	.cfi_restore 6
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE9:
	.size	fget_array, .-fget_array
	.section	.rodata.str1.1
.LC1:
	.string	"%llu\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB10:
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
	subq	$800008, %rsp
	.cfi_def_cfa_offset 800048
	movq	%rsp, %rsi
	call	__isoc99_scanf
	movl	(%rsp), %ebx
	testl	%ebx, %ebx
	jle	.L24
	movslq	%ebx, %rax
	movq	%rsp, %r12
	movq	%rsp, %rbp
	leaq	(%rsp,%rax,4), %r13
	.p2align 4,,10
	.p2align 3
.L14:
	movq	%rbp, %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	addq	$4, %rbp
	call	__isoc99_scanf
	cmpq	%r13, %rbp
	jne	.L14
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L15:
	movslq	%esi, %rax
	movl	(%rsp,%rax,4), %ecx
	testl	%edx, %ecx
	jne	.L16
	addl	$1, %esi
	movslq	%esi, %rax
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L17:
	movl	(%rsp,%rax,4), %ecx
	addq	$1, %rax
	testl	%edx, %ecx
	jne	.L16
.L20:
	xorl	%ecx, %edx
	movl	%eax, %esi
	cmpl	%eax, %ebx
	jg	.L17
.L16:
	movl	%esi, %eax
	xorl	(%r12), %edx
	subl	%edi, %eax
	cltq
	addq	%rax, %r8
	leal	1(%rdi), %eax
	cmpl	%eax, %ebx
	je	.L13
	addq	$4, %r12
	cmpl	%esi, %ebx
	jle	.L31
	movl	%eax, %edi
	jmp	.L15
.L24:
	xorl	%r8d, %r8d
.L13:
	movq	%r8, %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	printf
	addq	$800008, %rsp
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
.L31:
	.cfi_restore_state
	movl	%esi, %edx
	addl	$2, %edi
	subl	%eax, %edx
	movslq	%edx, %rax
	addq	%rax, %r8
	cmpl	%edi, %ebx
	je	.L13
	movslq	%esi, %rax
	movslq	%edi, %rdx
	subq	%rdx, %rax
.L18:
	addl	$1, %edi
	addq	%rax, %r8
	subq	$1, %rax
	cmpl	%edi, %ebx
	jg	.L18
	jmp	.L13
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
