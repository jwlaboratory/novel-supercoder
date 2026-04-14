```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d"
.LC1:
	.string	"%d"
.LC2:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	.LC0(%rip), %rdi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	leaq	8(%rsp), %rdx
	leaq	4(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movl	8(%rsp), %ecx
	pxor	%xmm0, %xmm0
	movq	$0, 48(%rsp)
	movaps	%xmm0, 16(%rsp)
	movaps	%xmm0, 32(%rsp)
	testl	%ecx, %ecx
	jle	.L2
	xorl	%ebx, %ebx
	leaq	12(%rsp), %r13
	leaq	.LC1(%rip), %rbp
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%r13, %rsi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf@PLT
	movslq	12(%rsp), %rax
	addl	$1, 16(%rsp,%rax,4)
	cmpl	%ebx, 8(%rsp)
	jg	.L3
.L2:
	movl	4(%rsp), %r8d
	movl	$3435973837, %edi
	cmpl	$999999, %r8d
	jle	.L4
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L6:
	addl	$1, %r8d
	cmpl	$999999, %r8d
	jg	.L5
.L4:
	movl	%r8d, %esi
	testl	%r8d, %r8d
	jle	.L8
	.p2align 4,,10
	.p2align 3
.L7:
	movl	%esi, %eax
	movl	%esi, %edx
	imulq	%rdi, %rax
	shrq	$35, %rax
	leal	(%rax,%rax,4), %ecx
	addl	%ecx, %ecx
	subl	%ecx, %edx
	movslq	%edx, %rdx
	movl	16(%rsp,%rdx,4), %edx
	testl	%edx, %edx
	jne	.L6
	cmpl	$9, %esi
	jle	.L8
	movl	%eax, %esi
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L8:
	movl	%r8d, %r12d
	addl	$10000000, %r8d
	addl	$1, %r8d
	cmpl	$999999, %r8d
	jle	.L4
.L5:
	xorl	%eax, %eax
	movl	%r12d, %edx
	movl	$1, %edi
	leaq	.LC2(%rip), %rsi
	call	__printf_chk@PLT
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L17
	addq	$72, %rsp
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
.L17:
	.cfi_restore_state
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
```