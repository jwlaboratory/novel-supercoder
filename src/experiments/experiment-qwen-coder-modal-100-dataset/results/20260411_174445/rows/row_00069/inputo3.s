	.file	"inputC.c"
	.text
	.p2align 4
	.globl	quicksort
	.type	quicksort, @function
quicksort:
.LFB3:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edi, %r9d
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
.L23:
	cmpl	%r12d, %r9d
	jge	.L25
.L2:
	movslq	%r9d, %rsi
	movl	%r12d, %ebx
	movl	%r9d, %eax
	leaq	0(%rbp,%rsi,4), %r10
	movl	(%r10), %edi
	cmpl	%r9d, %r12d
	jle	.L26
.L3:
	leaq	0(%rbp,%rsi,4), %rdx
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L8:
	addl	$1, %eax
	addq	$4, %rdx
	cmpl	%ebx, %eax
	jg	.L6
.L5:
	cmpl	%edi, (%rdx)
	jle	.L8
	cmpl	%ebx, %eax
	jg	.L6
	movslq	%ebx, %rdx
	leaq	0(%rbp,%rdx,4), %rdx
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L12:
	leaq	-4(%rsi), %rdx
	cmpl	%ebx, %eax
	jg	.L6
.L10:
	movl	(%rdx), %ecx
	movl	%ebx, %r8d
	movq	%rdx, %rsi
	subl	$1, %ebx
	cmpl	%edi, %ecx
	jg	.L12
	cmpl	%r8d, %eax
	jge	.L16
	movslq	%eax, %rsi
	leaq	0(%rbp,%rsi,4), %r11
	movl	(%r11), %ebx
	movl	%ecx, (%r11)
	movl	%ebx, (%rdx)
	movl	%r8d, %ebx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L6:
	movslq	%ebx, %rax
	leaq	0(%rbp,%rax,4), %rsi
	movl	(%rsi), %ecx
.L11:
	movl	(%r10), %eax
	movl	%ecx, (%r10)
	movl	%r9d, %edi
	movq	%rbp, %rdx
	movl	%eax, (%rsi)
	leal	-1(%rbx), %esi
	call	quicksort
	leal	1(%rbx), %r9d
	cmpl	%r12d, %r9d
	jl	.L2
.L25:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	.cfi_restore_state
	movl	%r8d, %ebx
	jmp	.L11
.L26:
	movslq	%r12d, %rax
	subl	$1, %r12d
	leaq	0(%rbp,%rax,4), %rax
	movl	(%rax), %edx
	movl	%edx, (%r10)
	movl	%edi, (%rax)
	jmp	.L23
	.cfi_endproc
.LFE3:
	.size	quicksort, .-quicksort
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
.LFB4:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	$500, %ecx
	xorl	%eax, %eax
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$4016, %rsp
	.cfi_def_cfa_offset 4064
	leaq	16(%rsp), %r13
	movq	%r13, %rdi
	rep stosq
	.p2align 4,,10
	.p2align 3
.L28:
	leaq	12(%rsp), %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	%eax, %r14d
	cmpl	$1, %eax
	jne	.L42
	movl	12(%rsp), %eax
	testl	%eax, %eax
	je	.L42
	jle	.L30
	movq	%r13, %rbp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L31:
	movq	%rbp, %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf
	movl	12(%rsp), %r12d
	addq	$4, %rbp
	cmpl	%ebx, %r12d
	jg	.L31
	leal	-1(%r12), %ebx
	movq	%r13, %rdx
	xorl	%edi, %edi
	movl	%ebx, %esi
	call	quicksort
	movl	20(%rsp), %esi
	subl	16(%rsp), %esi
	cmpl	$1, %ebx
	jle	.L32
	leal	-2(%r12), %ecx
	subl	$3, %r12d
	cmpl	$2, %r12d
	jbe	.L33
	movl	%ecx, %edx
	movd	%esi, %xmm4
	leaq	20(%rsp), %rax
	shrl	$2, %edx
	pshufd	$0, %xmm4, %xmm0
	salq	$4, %rdx
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L34:
	movdqu	4(%rax), %xmm2
	movdqu	(%rax), %xmm3
	addq	$16, %rax
	psubd	%xmm3, %xmm2
	movdqa	%xmm2, %xmm1
	pcmpgtd	%xmm0, %xmm1
	pand	%xmm1, %xmm0
	pandn	%xmm2, %xmm1
	por	%xmm1, %xmm0
	cmpq	%rax, %rdx
	jne	.L34
	movdqa	%xmm0, %xmm2
	psrldq	$8, %xmm2
	movdqa	%xmm2, %xmm1
	pcmpgtd	%xmm0, %xmm1
	pand	%xmm1, %xmm0
	pandn	%xmm2, %xmm1
	por	%xmm1, %xmm0
	movdqa	%xmm0, %xmm2
	psrldq	$4, %xmm2
	movdqa	%xmm2, %xmm1
	pcmpgtd	%xmm0, %xmm1
	pand	%xmm1, %xmm0
	pandn	%xmm2, %xmm1
	por	%xmm0, %xmm1
	movd	%xmm1, %esi
	testb	$3, %cl
	je	.L32
	movl	%ecx, %r14d
	andl	$-4, %r14d
	addl	$1, %r14d
.L33:
	movslq	%r14d, %rdx
	leal	1(%r14), %eax
	leaq	0(%r13,%rdx,4), %r10
	cmpl	%ecx, %eax
	jge	.L39
	cltq
	movl	16(%rsp,%rax,4), %edi
	leal	2(%r14), %eax
	movslq	%eax, %rdx
	movl	16(%rsp,%rdx,4), %r9d
	movl	%r9d, %r8d
	subl	%edi, %r8d
	cmpl	%esi, %r8d
	cmovg	%esi, %r8d
	subl	(%r10), %edi
	cmpl	%edi, %r8d
	cmovle	%r8d, %edi
	movl	%edi, %esi
	leal	3(%r14), %edi
	cmpl	%edi, %ecx
	jle	.L36
	movslq	%edi, %rdi
	leal	4(%r14), %eax
	movl	16(%rsp,%rdi,4), %r10d
	movslq	%eax, %rdx
	movl	16(%rsp,%rdx,4), %r8d
	movl	%r10d, %edi
	subl	%r9d, %edi
	movl	%r8d, %r9d
	subl	%r10d, %r9d
	cmpl	%r9d, %edi
	cmovg	%r9d, %edi
	cmpl	%edi, %esi
	cmovg	%edi, %esi
	leal	5(%r14), %edi
	cmpl	%edi, %ecx
	jle	.L36
	leal	6(%r14), %eax
	movslq	%edi, %rdi
	movslq	%eax, %rdx
	movl	16(%rsp,%rdi,4), %edi
	movl	16(%rsp,%rdx,4), %ecx
	subl	%edi, %ecx
	subl	%r8d, %edi
	cmpl	%edi, %ecx
	cmovg	%edi, %ecx
	cmpl	%ecx, %esi
	cmovg	%ecx, %esi
.L36:
	leal	1(%rax), %ecx
	movslq	%ecx, %rdi
	movl	16(%rsp,%rdi,4), %edi
	movl	%edi, %r11d
	subl	16(%rsp,%rdx,4), %r11d
	cmpl	%r11d, %esi
	cmovg	%r11d, %esi
	cmpl	%ecx, %ebx
	jle	.L32
	leal	2(%rax), %edx
	movslq	%edx, %rcx
	movl	16(%rsp,%rcx,4), %r8d
	movl	%r8d, %ecx
	subl	%edi, %ecx
	cmpl	%ecx, %esi
	cmovg	%ecx, %esi
	cmpl	%edx, %ebx
	jle	.L32
	addl	$3, %eax
	cltq
	movl	16(%rsp,%rax,4), %eax
	subl	%r8d, %eax
	cmpl	%eax, %esi
	cmovg	%eax, %esi
.L32:
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	printf
	movl	12(%rsp), %edx
	testl	%edx, %edx
	jle	.L28
	salq	$2, %rdx
	xorl	%esi, %esi
	movq	%r13, %rdi
	call	memset
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L42:
	addq	$4016, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L30:
	.cfi_restore_state
	leal	-1(%rax), %esi
	movq	%r13, %rdx
	xorl	%edi, %edi
	call	quicksort
	movl	20(%rsp), %esi
	subl	16(%rsp), %esi
	jmp	.L32
.L39:
	movl	%r14d, %eax
	jmp	.L36
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
