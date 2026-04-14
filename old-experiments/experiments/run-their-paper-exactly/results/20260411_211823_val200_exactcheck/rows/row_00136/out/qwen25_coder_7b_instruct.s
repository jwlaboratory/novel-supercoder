.file	"temp.c"
	.text
	.p2align 4
	.globl	lis
	.type	lis, @function
lis:
.LFB40:
	.cfi_startproc
	endbr64
	movl	(%rsi), %eax
	movq	%rdx, %r8
	movl	%eax, (%rdx)
	testl	%edi, %edi
	jle	.L10
	leal	-1(%rdi), %edx
	movl	$1, %r10d
	leaq	4(%rsi,%rdx,4), %r11
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L12:
	movslq	%r10d, %rax
	addq	$4, %rsi
	addl	$1, %r10d
	movl	%edi, (%r8,%rax,4)
	cmpq	%rsi, %r11
	je	.L1
.L13:
	movslq	%r10d, %rax
	movl	-4(%r8,%rax,4), %eax
.L9:
	movl	(%rsi), %edi
	cmpl	%eax, %edi
	jg	.L12
	leal	-1(%r10), %ecx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L8:
	leal	(%rcx,%rdx), %eax
	sarl	%eax
	movslq	%eax, %r9
	cmpl	(%r8,%r9,4), %edi
	jg	.L5
	leal	-1(%rax), %ecx
	cmpl	%edx, %ecx
	jge	.L8
	movslq	%edx, %rdx
	movl	%edi, (%r8,%rdx,4)
.L14:
	addq	$4, %rsi
	cmpq	%rsi, %r11
	jne	.L13
.L1:
	movl	%r10d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	leal	1(%rax), %edx
	cmpl	%ecx, %edx
	jle	.L8
	movslq	%edx, %rdx
	movl	%edi, (%r8,%rdx,4)
	jmp	.L14
.L10:
	movl	$1, %r10d
	movl	%r10d, %eax
	ret
	.cfi_endproc
.LFE40:
	.size	lis, .-lis
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	.LC0(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r13, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movslq	4(%rsp), %rbp
	movq	%rbp, %r12
	salq	$2, %rbp
	movq	%rbp, %rdi
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, %r14
	call	malloc@PLT
	movq	%rax, %r15
	testl	%r12d, %r12d
	jle	.L16
	movq	%r14, %rbp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L17:
	movq	%rbp, %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf@PLT
	movl	4(%rsp), %r12d
	addq	$4, %rbp
	cmpl	%ebx, %r12d
	jg	.L17
.L16:
	movq	%r15, %rdx
	movq	%r14, %rsi
	movl	%r12d, %edi
	call	lis
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%r14, %rdi
	call	free@PLT
	movq	%r15, %rdi
	call	free@PLT
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L21
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
.L21:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
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
