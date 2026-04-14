```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%d%d"
.LC3:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	.LC1(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rsi
	leaq	4(%rsp), %rdx
	call	__isoc99_scanf@PLT
	movl	4(%rsp), %esi
	movl	%esi, %ecx
	subl	(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L8
	leal	-1(%rcx), %eax
	movl	%ecx, %edx
	cmpl	$9, %eax
	jbe	.L9
	movdqa	.LC0(%rip), %xmm1
	movdqa	.LC2(%rip), %xmm3
	shrl	$2, %edx
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L4:
	movdqa	%xmm1, %xmm2
	addl	$1, %eax
	paddd	%xmm3, %xmm1
	paddd	%xmm2, %xmm0
	cmpl	%eax, %edx
	jne	.L4
	movdqa	%xmm0, %xmm1
	movl	%ecx, %eax
	psrldq	$8, %xmm1
	andl	$-4, %eax
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %edx
	addl	%ecx, %edx
	testb	$3, %cl
	je	.L2
.L3:
	leal	1(%rax), %edi
	addl	%eax, %edx
	cmpl	%edi, %ecx
	jle	.L2
	addl	%edi, %edx
	leal	2(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L2
	addl	%edi, %edx
	leal	3(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L2
	addl	%edi, %edx
	leal	4(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L2
	addl	%edi, %edx
	leal	5(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L2
	addl	%edi, %edx
	leal	6(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L2
	addl	%edi, %edx
	leal	7(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L2
	addl	%edi, %edx
	leal	8(%rax), %edi
	cmpl	%edi, %ecx
	jle	.L2
	addl	$9, %eax
	addl	%edi, %edx
	cmpl	%eax, %ecx
	jle	.L2
	addl	%eax, %edx
.L2:
	subl	%esi, %edx
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L13
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore_state
	movl	%ecx, %edx
	jmp	.L2
.L9:
	xorl	%eax, %eax
	jmp	.L3
.L13:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC2:
	.long	4
	.long	4
	.long	4
	.long	4
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