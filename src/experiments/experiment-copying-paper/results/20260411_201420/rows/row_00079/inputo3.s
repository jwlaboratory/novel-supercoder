.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	.cfi_offset 14, -24
	leaq	.LC0(%rip), %r14
	pushq	%r13
	leaq	-44(%rbp), %rsi
	movq	%r14, %rdi
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movslq	-44(%rbp), %rax
	movq	%rsp, %rsi
	movq	%rax, %rcx
	leaq	15(,%rax,4), %rax
	movq	%rax, %rdx
	andq	$-4096, %rax
	subq	%rax, %rsi
	andq	$-16, %rdx
	cmpq	%rsi, %rsp
	je	.L3
.L18:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rsi, %rsp
	jne	.L18
.L3:
	andl	$4095, %edx
	subq	%rdx, %rsp
	testq	%rdx, %rdx
	jne	.L19
.L4:
	movq	%rsp, %r13
	testl	%ecx, %ecx
	jle	.L5
	movq	%r13, %r12
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%r12, %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf@PLT
	movl	-44(%rbp), %eax
	addq	$4, %r12
	cmpl	%ebx, %eax
	jg	.L6
	testl	%eax, %eax
	jle	.L5
	leal	1(%rax), %esi
	movl	$1, %ecx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L8:
	movl	-4(%r13,%rcx,4), %eax
	subl	$1, %eax
	cltq
	cmpl	%ecx, 0(%r13,%rax,4)
	jne	.L7
	addl	$1, %edx
.L7:
	addq	$1, %rcx
	cmpq	%rcx, %rsi
	jne	.L8
.L9:
	sarl	%edx
	xorl	%eax, %eax
	movq	%r14, %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	-40(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L20
	leaq	-32(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L19:
	.cfi_restore_state
	orq	$0, -8(%rsp,%rdx)
	jmp	.L4
.L5:
	xorl	%edx, %edx
	jmp	.L9
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