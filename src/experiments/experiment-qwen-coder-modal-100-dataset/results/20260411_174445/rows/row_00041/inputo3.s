	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%d"
.LC2:
	.string	"%d%d"
.LC3:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	movabsq	$19421774852653134, %rax
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$20046, %edx
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$120, %rsp
	.cfi_def_cfa_offset 144
	movdqa	.LC0(%rip), %xmm0
	movq	%rax, 54(%rsp)
	leaq	84(%rsp), %rbx
	leaq	108(%rsp), %rbp
	movl	$21248, 62(%rsp)
	movw	%dx, 66(%rsp)
	movb	$0, 68(%rsp)
	movups	%xmm0, 20(%rsp)
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%rbx, %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	__isoc99_scanf
	cmpq	%rbx, %rbp
	jne	.L2
	leaq	4(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	__isoc99_scanf
	movl	4(%rsp), %eax
	testl	%eax, %eax
	jg	.L3
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L58:
	cmpb	$69, %al
	je	.L10
	cmpb	$78, %al
	jne	.L13
	movl	104(%rsp), %eax
	movd	100(%rsp), %xmm3
	movd	%ecx, %xmm0
	movl	%eax, 88(%rsp)
	movzbl	49(%rsp,%rsi), %eax
	punpckldq	%xmm3, %xmm0
	movl	$1, %esi
	movq	%xmm0, 100(%rsp)
	testb	%al, %al
	je	.L49
.L12:
	cmpb	$83, %al
	je	.L18
	jg	.L19
	cmpb	$69, %al
	je	.L20
	cmpb	$78, %al
	jne	.L22
	movl	104(%rsp), %eax
	movl	88(%rsp), %edi
	movd	%edx, %xmm0
	movl	%edx, 80(%rsp)
	movd	100(%rsp), %xmm6
	movl	%eax, 88(%rsp)
	punpckldq	%xmm6, %xmm0
	movq	%xmm0, 100(%rsp)
	.p2align 4,,10
	.p2align 3
.L17:
	movl	%edi, 84(%rsp)
.L7:
	movl	12(%rsp), %eax
	cmpl	%eax, 88(%rsp)
	je	.L38
	cmpl	%eax, 92(%rsp)
	je	.L39
	cmpl	100(%rsp), %eax
	je	.L40
	cmpl	%eax, 96(%rsp)
	setne	%al
	movzbl	%al, %eax
	addl	$3, %eax
.L25:
	addl	$1, %eax
	cltq
	movslq	16(%rsp,%rax,4), %rax
.L24:
	movl	80(%rsp,%rax,4), %esi
	movl	$.LC3, %edi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	printf
	cmpl	%ebx, 4(%rsp)
	jle	.L48
.L3:
	leaq	12(%rsp), %rdx
	leaq	8(%rsp), %rsi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	84(%rsp), %ecx
	movl	8(%rsp), %eax
	cmpl	%eax, %ecx
	je	.L7
	movl	88(%rsp), %edx
	cmpl	%edx, %eax
	je	.L28
	cmpl	92(%rsp), %eax
	je	.L29
	cmpl	96(%rsp), %eax
	je	.L30
	cmpl	100(%rsp), %eax
	setne	%al
	movzbl	%al, %eax
	addl	$5, %eax
.L5:
	cltq
	leaq	(%rax,%rax,2), %rsi
	movzbl	48(%rsp,%rsi), %eax
	testb	%al, %al
	je	.L7
	cmpb	$83, %al
	je	.L8
	jle	.L58
	cmpb	$87, %al
	jne	.L13
	movd	104(%rsp), %xmm0
	movd	%ecx, %xmm1
	movl	92(%rsp), %edx
	movl	96(%rsp), %eax
	punpckldq	%xmm1, %xmm0
.L55:
	movl	%eax, 104(%rsp)
	movzbl	49(%rsp,%rsi), %eax
	movl	$1, %esi
	movq	%xmm0, 92(%rsp)
	testb	%al, %al
	jne	.L12
.L49:
	movl	%ecx, 80(%rsp)
	movl	%edx, %edi
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L38:
	movl	$3, %eax
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L39:
	movl	$1, %eax
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L28:
	movl	$2, %eax
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L8:
	movd	104(%rsp), %xmm0
	movl	100(%rsp), %edi
	movd	%edx, %xmm2
	movl	%ecx, 88(%rsp)
	movzbl	49(%rsp,%rsi), %eax
	movl	$1, %esi
	punpckldq	%xmm2, %xmm0
	movl	%edi, %edx
	movq	%xmm0, 100(%rsp)
	testb	%al, %al
	jne	.L12
	movl	%ecx, 80(%rsp)
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L19:
	cmpb	$87, %al
	jne	.L22
	movl	96(%rsp), %eax
	movd	%edx, %xmm5
	movl	92(%rsp), %edi
	movl	%edx, 80(%rsp)
	movd	104(%rsp), %xmm0
	movl	%eax, 104(%rsp)
	punpckldq	%xmm5, %xmm0
	movq	%xmm0, 92(%rsp)
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L13:
	movzbl	49(%rsp,%rsi), %eax
	movl	%ecx, %edx
	xorl	%esi, %esi
	testb	%al, %al
	jne	.L12
	movl	%ecx, 80(%rsp)
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L10:
	movd	104(%rsp), %xmm4
	movd	%ecx, %xmm0
	movl	96(%rsp), %edx
	movl	92(%rsp), %eax
	punpckldq	%xmm4, %xmm0
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L40:
	movl	$2, %eax
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L48:
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L29:
	.cfi_restore_state
	movl	$3, %eax
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L30:
	movl	$4, %eax
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L18:
	movd	104(%rsp), %xmm0
	movd	88(%rsp), %xmm7
	movl	%edx, 80(%rsp)
	movl	100(%rsp), %edi
	movl	%edx, 88(%rsp)
	punpckldq	%xmm7, %xmm0
	movq	%xmm0, 100(%rsp)
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L22:
	movl	%edx, 80(%rsp)
	testb	%sil, %sil
	je	.L7
	movl	%edx, %edi
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L20:
	movl	92(%rsp), %eax
	movd	%edx, %xmm0
	movl	96(%rsp), %edi
	movl	%edx, 80(%rsp)
	movd	104(%rsp), %xmm5
	movl	%eax, 104(%rsp)
	punpckldq	%xmm5, %xmm0
	movq	%xmm0, 92(%rsp)
	jmp	.L17
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	3
	.long	5
	.long	4
	.long	2
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
