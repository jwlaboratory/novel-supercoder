```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\n"
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
	leaq	.LC0(%rip), %rbp
	movq	%rbp, %rdi
	subq	$208, %rsp
	.cfi_def_cfa_offset 224
	movq	%fs:40, %rax
	movq	%rax, 200(%rsp)
	xorl	%eax, %eax
	leaq	12(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movq	.LC1(%rip), %rax
	movslq	12(%rsp), %rsi
	movq	%rax, 16(%rsp)
	cmpl	$1, %esi
	jle	.L2
	cmpl	$3, %esi
	jle	.L7
	leal	-4(%rsi), %eax
	movl	$1, %edi
	movl	$1, %edx
	shrl	%eax
	leaq	16(%rsp), %r9
	leal	3(%rax), %r8d
	movl	$4, %eax
	addq	%r8, %r8
.L4:
	addl	%edi, %edx
	movl	%eax, %ecx
	addl	%edx, %edi
	movd	%edx, %xmm0
	movd	%edi, %xmm1
	punpckldq	%xmm1, %xmm0
	movq	%xmm0, -8(%r9,%rax,4)
	addq	$2, %rax
	cmpq	%r8, %rax
	jne	.L4
.L3:
	movslq	%ecx, %rax
	leaq	(%r9,%rax,4), %rax
	.p2align 4,,10
	.p2align 3
.L5:
	movl	-4(%rax), %edx
	addl	$1, %ecx
	addl	-8(%rax), %edx
	addq	$4, %rax
	movl	%edx, -4(%rax)
	cmpl	%ecx, %esi
	jge	.L5
.L2:
	movl	16(%rsp,%rsi,4), %edx
	xorl	%eax, %eax
	movq	%rbp, %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	200(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L12
	addq	$208, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	movl	$2, %ecx
	leaq	16(%rsp), %r9
	jmp	.L3
.L12:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	1
	.long	1
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