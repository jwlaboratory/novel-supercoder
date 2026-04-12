.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%d%d"
.LC4:
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
	leaq	4(%rsp), %rdx
	movq	%rsp, %rsi
	call	__isoc99_scanf@PLT
	movl	(%rsp), %edi
	testl	%edi, %edi
	js	.L15
	movl	4(%rsp), %r9d
	leal	1(%rdi), %edx
	cmpl	$2, %edi
	jle	.L16
	movd	%r9d, %xmm7
	movl	%edx, %esi
	pxor	%xmm1, %xmm1
	xorl	%ecx, %ecx
	pshufd	$0, %xmm7, %xmm11
	movd	%edi, %xmm7
	shrl	$2, %esi
	movdqa	%xmm1, %xmm4
	movdqa	.LC0(%rip), %xmm9
	pshufd	$0, %xmm7, %xmm8
	movdqa	.LC2(%rip), %xmm10
	movdqa	.LC3(%rip), %xmm7
	.p2align 4,,10
	.p2align 3
.L5:
	movdqa	%xmm9, %xmm0
	movdqa	%xmm11, %xmm6
	pxor	%xmm3, %xmm3
	xorl	%eax, %eax
	paddd	%xmm10, %xmm9
	psubd	%xmm0, %xmm6
	.p2align 4,,10
	.p2align 3
.L4:
	movdqa	%xmm3, %xmm0
	movdqa	%xmm6, %xmm5
	movdqa	%xmm4, %xmm2
	addl	$1, %eax
	psubd	%xmm0, %xmm5
	paddd	%xmm7, %xmm3
	movdqa	%xmm5, %xmm0
	pcmpgtd	%xmm5, %xmm2
	pcmpgtd	%xmm8, %xmm0
	pcmpeqd	%xmm4, %xmm2
	pcmpeqd	%xmm4, %xmm0
	pand	%xmm2, %xmm0
	psubd	%xmm0, %xmm1
	cmpl	%edx, %eax
	jne	.L4
	addl	$1, %ecx
	cmpl	%esi, %ecx
	jne	.L5
	movdqa	%xmm1, %xmm0
	movl	%eax, %ecx
	psrldq	$8, %xmm0
	andl	$-4, %ecx
	paddd	%xmm0, %xmm1
	movdqa	%xmm1, %xmm0
	psrldq	$4, %xmm0
	paddd	%xmm0, %xmm1
	movd	%xmm1, %edx
	testb	$3, %al
	je	.L2
.L3:
	movl	%r9d, %r8d
	subl	%ecx, %r8d
	movl	%r8d, %esi
	subl	%edi, %esi
	subl	$1, %esi
	.p2align 4,,10
	.p2align 3
.L9:
	movl	%r8d, %eax
	.p2align 4,,10
	.p2align 3
.L8:
	cmpl	%edi, %eax
	jg	.L11
	movl	%eax, %ecx
	notl	%ecx
	shrl	$31, %ecx
	cmpb	$1, %cl
	sbbl	$-1, %edx
.L11:
	subl	$1, %eax
	cmpl	%esi, %eax
	jne	.L8
	subl	$1, %r8d
	movl	%r9d, %eax
	subl	$1, %esi
	subl	%r8d, %eax
	cmpl	%eax, %edi
	jge	.L9
.L2:
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L27
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore_state
	xorl	%edx, %edx
	jmp	.L2
.L16:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	jmp	.L3
.L27:
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
	.align 16
.LC3:
	.long	1
	.long	1
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