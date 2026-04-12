.file	"optimized_inputC.s"
	.text
	.p2align 4
	.globl	runProgram
	.type	runProgram, @function
runProgram:
.LFB3:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	width(%rip), %eax
	leal	-1(%rax), %ebp
	testl	%edi, %edi
	js	.L3
	cmpl	%eax, %edi
	movl	%edi, %ebp
	movl	$0, %eax
	cmovge	%eax, %ebp
.L3:
	movl	height(%rip), %eax
	testl	%ebx, %ebx
	js	.L37
	cmpl	%eax, %ebx
	movl	$0, %eax
	cmovge	%eax, %ebx
.L5:
	movslq	%ebp, %r12
	movslq	%ebx, %r13
	movslq	%edx, %r8
	leaq	(%r12,%r12,4), %rax
	movslq	%ecx, %r14
	leaq	0(%r13,%rax,4), %rax
	salq	$4, %rax
	addq	%r8, %rax
	leaq	visited(%r14,%rax,4), %r15
	movsbl	(%r15), %eax
	testb	%al, %al
	jne	.L38
	leaq	0(%r13,%r13,2), %rax
	movb	$1, (%r15)
	movsbl	program(%r12,%rax,8), %r9d
	movl	%r9d, %eax
	subl	$48, %r9d
	cmpl	$9, %r9d
	jbe	.L39
	subl	$43, %eax
	cmpb	$81, %al
	ja	.L10
	movzbl	%al, %eax
	jmp	*.L12(,%rax,8)
	.section	.rodata
	.align 8
	.align 4
.L12:
	.quad	.L21
	.quad	.L10
	.quad	.L20
	.quad	.L19
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L18
	.quad	.L10
	.quad	.L17
	.quad	.L16
	.quad	.L28
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L15
	.quad	.L14
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L13
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L11
	.text
	.p2align 4,,10
	.p2align 3
.L39:
	movl	dxy+4(,%r14,8), %esi
	movl	dxy(,%r14,8), %edi
	movl	%r9d, %edx
	movq	%r8, (%rsp)
	addl	%ebx, %esi
	addl	%ebp, %edi
	call	runProgram
	movzbl	(%r15), %ecx
	movq	(%rsp), %r8
	addl	%eax, %ecx
.L9:
	leaq	(%r12,%r12,4), %rdx
	leaq	0(%r13,%rdx,4), %rdx
	salq	$4, %rdx
	addq	%r8, %rdx
	movb	%cl, visited(%r14,%rdx,4)
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	.cfi_restore_state
	movl	$1, %ecx
	xorl	%eax, %eax
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L37:
	leal	-1(%rax), %ebx
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L38:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	subl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L11:
	.cfi_restore_state
	movq	%r8, (%rsp)
	testl
