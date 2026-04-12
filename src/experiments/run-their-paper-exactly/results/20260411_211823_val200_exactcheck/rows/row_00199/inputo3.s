.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d "
.LC2:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	.LC0(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rbp, %rdi
	subq	$440, %rsp
	.cfi_def_cfa_offset 480
	movq	%fs:40, %rax
	movq	%rax, 424(%rsp)
	xorl	%eax, %eax
	leaq	8(%rsp), %rsi
	call	__isoc99_scanf@PLT
	leaq	12(%rsp), %rsi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	8(%rsp), %eax
	testl	%eax, %eax
	jle	.L7
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
	leaq	16(%rsp), %r13
	leaq	.LC1(%rip), %rbp
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L11:
	leal	(%r12,%rcx,2), %r12d
	addq	$1, %rbx
	cmpl	%ebx, 8(%rsp)
	jle	.L2
.L5:
	leaq	0(%r13,%rbx,4), %rsi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	12(%rsp), %edx
	movl	0(%r13,%rbx,4), %ecx
	movl	%edx, %eax
	shrl	$31, %eax
	addl	%edx, %eax
	sarl	%eax
	cmpl	%eax, %ecx
	jle	.L11
	subl	%ecx, %edx
	addq	$1, %rbx
	leal	(%r12,%rdx,2), %r12d
	cmpl	%ebx, 8(%rsp)
	jg	.L5
.L2:
	xorl	%eax, %eax
	movl	%r12d, %edx
	movl	$1, %edi
	leaq	.LC2(%rip), %rsi
	call	__printf_chk@PLT
	movq	424(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L12
	addq	$440, %rsp
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
.L7:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L2
.L12:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
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