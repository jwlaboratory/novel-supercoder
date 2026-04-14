```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%d %d"
.LC5:
	.string	"Yes"
.LC6:
	.string	"No"
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
	movl	(%rsp), %esi
	cmpl	$2, %esi
	je	.L37
	movl	4(%rsp), %ecx
	movd	%esi, %xmm7
	xorl	%edi, %edi
	movdqa	.LC2(%rip), %xmm0
	pshufd	$0, %xmm7, %xmm4
	movdqa	.LC3(%rip), %xmm2
	movd	%ecx, %xmm7
	movdqa	%xmm4, %xmm5
	pshufd	$0, %xmm7, %xmm3
	pcmpeqd	%xmm0, %xmm5
	pcmpeqd	%xmm3, %xmm0
	pand	%xmm2, %xmm5
	pand	%xmm2, %xmm0
	movdqa	%xmm0, %xmm6
	psrldq	$8, %xmm6
	movdqa	%xmm6, %xmm1
	pcmpgtd	%xmm0, %xmm1
	pand	%xmm1, %xmm6
	pandn	%xmm0, %xmm1
	por	%xmm6, %xmm1
	movdqa	%xmm1, %xmm6
	psrldq	$4, %xmm6
	movdqa	%xmm6, %xmm0
	pcmpgtd	%xmm1, %xmm0
	pand	%xmm0, %xmm6
	pandn	%xmm1, %xmm0
	por	%xmm6, %xmm0
	movd	%xmm0, %eax
	movdqa	%xmm5, %xmm0
	psrldq	$8, %xmm0
	movdqa	%xmm0, %xmm1
	pcmpgtd	%xmm5, %xmm1
	pand	%xmm1, %xmm0
	pandn	%xmm5, %xmm1
	por	%xmm0, %xmm1
	movdqa	%xmm1, %xmm5
	psrldq	$4, %xmm5
	movdqa	%xmm5, %xmm0
	pcmpgtd	%xmm1, %xmm0
	pand	%xmm0, %xmm5
	pandn	%xmm1, %xmm0
	por	%xmm5, %xmm0
	movd	%xmm0, %edx
	cmpl	$8, %esi
	je	.L4
.L3:
	cmpl	$8, %ecx
	je	.L17
.L5:
	cmpl	$10, %esi
	jne	.L18
	cmpl	$10, %ecx
	je	.L38
.L10:
	movl	$1, %edx
	cmpl	$12, %ecx
	jne	.L13
.L8:
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L4:
	movl	$1, %edx
	cmpl	$8, %ecx
	je	.L17
.L18:
	cmpl	$10, %ecx
	je	.L39
	cmpl	$12, %esi
	je	.L10
	cmpl	$12, %ecx
	movl	$1, %ecx
	cmove	%ecx, %eax
.L13:
	testl	%eax, %edx
	jne	.L8
	movdqa	.LC4(%rip), %xmm0
	pcmpeqd	%xmm0, %xmm4
	pcmpeqd	%xmm3, %xmm0
	pand	%xmm2, %xmm0
	pand	%xmm2, %xmm4
	movdqa	%xmm0, %xmm2
	psrldq	$8, %xmm2
	movdqa	%xmm2, %xmm1
	pcmpgtd	%xmm0, %xmm1
	pand	%xmm1, %xmm2
	pandn	%xmm0, %xmm1
	por	%xmm2, %xmm1
	movdqa	%xmm1, %xmm2
	psrldq	$4, %xmm2
	movdqa	%xmm2, %xmm0
	pcmpgtd	%xmm1, %xmm0
	pand	%xmm0, %xmm2
	pandn	%xmm1, %xmm0
	por	%xmm2, %xmm0
	movd	%xmm0, %edx
	movdqa	%xmm4, %xmm0
	psrldq	$8, %xmm0
	movdqa	%xmm0, %xmm1
	pcmpgtd	%xmm4, %xmm1
	pand	%xmm1, %xmm0
	pandn	%xmm4, %xmm1
	por	%xmm0, %xmm1
	movdqa	%xmm1, %xmm2
	psrldq	$4, %xmm2
	movdqa	%xmm2, %xmm0
	pcmpgtd	%xmm1, %xmm0
	pand	%xmm0, %xmm2
	pandn	%xmm1, %xmm0
	por	%xmm2, %xmm0
	movd	%xmm0, %eax
	andl	%edx, %eax
	orl	%edi, %eax
	testb	$1, %al
	jne	.L8
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
.L16:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L40
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L17:
	.cfi_restore_state
	movl	$8, %ecx
	movl	$1, %eax
	jmp	.L5
.L39:
	cmpl	$12, %esi
	je	.L8
.L9:
	movl	$1, %eax
	jmp	.L13
.L37:
	movl	4(%rsp), %ecx
	movdqa	.LC3(%rip), %xmm2
	xorl	%edi, %edi
	cmpl	$2, 4(%rsp)
	movd	%ecx, %xmm3
	sete	%dil
	xorl	%edx, %edx
	pshufd	$0, %xmm3, %xmm3
	movdqa	%xmm3, %xmm0
	pcmpeqd	.LC2(%rip), %xmm0
	pand	%xmm2, %xmm0
	movdqa	%xmm0, %xmm4
	psrldq	$8, %xmm4
	movdqa	%xmm4, %xmm1
	pcmpgtd	%xmm0, %xmm1
	pand	%xmm1, %xmm4
	pandn	%xmm0, %xmm1
	por	%xmm4, %xmm1
	movdqa	%xmm1, %xmm4
	psrldq	$4, %xmm4
	movdqa	%xmm4, %xmm0
	pcmpgtd	%xmm1, %xmm0
	pand	%xmm0, %xmm4
	pandn	%xmm1, %xmm0
	por	%xmm4, %xmm0
	movdqa	.LC0(%rip), %xmm4
	movd	%xmm0, %eax
	jmp	.L3
.L38:
	movl	$1, %edx
	jmp	.L9
.L40:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	2
	.long	2
	.long	2
	.long	2
	.align 16
.LC2:
	.long	1
	.long	3
	.long	5
	.long	7
	.align 16
.LC3:
	.long	1
	.long	1
	.long	1
	.long	1
	.align 16
.LC4:
	.long	4
	.long	6
	.long	9
	.long	11
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