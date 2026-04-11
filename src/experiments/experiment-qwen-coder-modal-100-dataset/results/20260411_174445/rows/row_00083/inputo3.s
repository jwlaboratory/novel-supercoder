	.file	"inputC.c"
	.text
	.p2align 4
	.globl	MAX
	.type	MAX, @function
MAX:
.LFB3:
	.cfi_startproc
	cmpl	%esi, %edi
	movl	%esi, %eax
	cmovge	%edi, %eax
	ret
	.cfi_endproc
.LFE3:
	.size	MAX, .-MAX
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d %d %d"
.LC2:
	.string	"-1"
.LC3:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%eax, %eax
	movl	$505, %ecx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$5720, %rsp
	.cfi_def_cfa_offset 5776
	leaq	1664(%rsp), %rdi
	leaq	48(%rsp), %rsi
	rep stosq
	movl	$.LC0, %edi
	movl	$1, 1664(%rsp)
	call	__isoc99_scanf
	movl	48(%rsp), %eax
	leal	-1(%rax), %edx
	movl	%edx, 48(%rsp)
	testl	%eax, %eax
	je	.L4
	leaq	52(%rsp), %rax
	movl	$1, %r15d
	movq	%rax, 40(%rsp)
.L17:
	movq	40(%rsp), %rsi
	leaq	60(%rsp), %rcx
	leaq	56(%rsp), %rdx
	xorl	%eax, %eax
	movl	$.LC1, %edi
	call	__isoc99_scanf
	movl	56(%rsp), %r9d
	movslq	52(%rsp), %rax
	leaq	1664(%rsp), %rdi
	movl	60(%rsp), %ecx
	movl	%r9d, %esi
	leal	1(%rax), %r8d
	leaq	4(,%rax,4), %r11
	movq	%rax, %r10
	subl	%eax, %esi
	addq	%r11, %rdi
	movl	%r8d, %r13d
	movl	%esi, %r12d
	leal	-1(%rsi), %r14d
	addq	%rax, %r12
	leaq	1664(%rsp), %rax
	salq	$2, %r12
	subq	%rax, %r12
	movl	%esi, %eax
	shrl	$2, %eax
	addq	$4, %r12
	salq	$4, %rax
	movq	%rax, 16(%rsp)
	movl	%esi, %eax
	andl	$3, %esi
	andl	$-4, %eax
	movl	%esi, 24(%rsp)
	leal	-1(%r9), %esi
	addl	%r8d, %eax
	movl	%esi, %ebx
	leal	1(%rax), %edx
	movl	%eax, 28(%rsp)
	addl	$2, %eax
	subl	%r10d, %ebx
	movl	%eax, 36(%rsp)
	leaq	1664(%rsp), %rax
	subq	%rax, %r11
	movl	%edx, 32(%rsp)
	xorl	%edx, %edx
	movq	%r11, (%rsp)
	movq	%rbx, 8(%rsp)
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%rsi, %rdx
	addq	$4, %rax
	addl	$1, %r8d
	addq	$4, %rdi
	cmpq	$400, %rsi
	je	.L15
	movl	(%rax), %r15d
.L16:
	leaq	1(%rdx), %rsi
	testl	%r15d, %r15d
	je	.L5
	cmpl	%r9d, %r10d
	jg	.L5
	leal	(%r10,%rdx), %r11d
	leal	(%rcx,%r15), %ebx
	movslq	%r11d, %r11
	movl	1664(%rsp,%r11,4), %ebp
	cmpl	%ebp, %ebx
	cmovl	%ebp, %ebx
	movl	%ebx, 1664(%rsp,%r11,4)
	cmpl	%r9d, %r13d
	jg	.L5
	cmpl	$2, %r14d
	jbe	.L11
	leaq	0(,%rsi,4), %r11
	leaq	(%r12,%rax), %rbp
	leaq	-4(%r11), %rbx
	cmpq	%rbx, %rbp
	jle	.L28
	movq	(%rsp), %rbx
	addq	%rax, %rbx
	cmpq	%rbx, %r11
	jle	.L28
.L11:
	movq	8(%rsp), %rbx
	movslq	%r8d, %r11
	leaq	1664(%rsp,%r11,4), %rdx
	addq	%rbx, %r11
	leaq	1668(%rsp,%r11,4), %rbp
	.p2align 4,,10
	.p2align 3
.L9:
	movl	(%rax), %r11d
	movl	(%rdx), %ebx
	addl	%ecx, %r11d
	cmpl	%ebx, %r11d
	cmovl	%ebx, %r11d
	addq	$4, %rdx
	movl	%r11d, -4(%rdx)
	cmpq	%rbp, %rdx
	jne	.L9
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L28:
	movl	(%rax), %r15d
	movq	16(%rsp), %rbx
	movq	%rdi, %r11
	addl	%ecx, %r15d
	addq	%rdi, %rbx
	movd	%r15d, %xmm2
	pshufd	$0, %xmm2, %xmm2
	.p2align 4,,10
	.p2align 3
.L13:
	movdqu	(%r11), %xmm1
	addq	$16, %r11
	movdqa	%xmm1, %xmm0
	pcmpgtd	%xmm2, %xmm0
	pand	%xmm0, %xmm1
	pandn	%xmm2, %xmm0
	por	%xmm1, %xmm0
	movups	%xmm0, -16(%r11)
	cmpq	%rbx, %r11
	jne	.L13
	movl	24(%rsp), %r11d
	testl	%r11d, %r11d
	je	.L5
	movl	28(%rsp), %ebx
	movl	(%rax), %ebp
	movl	%edx, %r11d
	addl	%edx, %ebx
	addl	%ecx, %ebp
	movslq	%ebx, %rbx
	movl	1664(%rsp,%rbx,4), %r15d
	cmpl	%r15d, %ebp
	cmovl	%r15d, %ebp
	movl	%ebp, 1664(%rsp,%rbx,4)
	movl	32(%rsp), %ebx
	cmpl	%ebx, %r9d
	jl	.L5
	addl	%ebx, %edx
	movl	(%rax), %ebx
	movslq	%edx, %rdx
	movl	1664(%rsp,%rdx,4), %ebp
	addl	%ecx, %ebx
	cmpl	%ebp, %ebx
	cmovl	%ebp, %ebx
	movl	%ebx, 1664(%rsp,%rdx,4)
	movl	36(%rsp), %edx
	cmpl	%edx, %r9d
	jl	.L5
	addl	%edx, %r11d
	movl	(%rax), %edx
	movslq	%r11d, %r11
	movl	1664(%rsp,%r11,4), %ebx
	addl	%ecx, %edx
	cmpl	%ebx, %edx
	cmovl	%ebx, %edx
	movl	%edx, 1664(%rsp,%r11,4)
	jmp	.L5
.L15:
	movl	48(%rsp), %eax
	leal	-1(%rax), %edx
	movl	%edx, 48(%rsp)
	testl	%eax, %eax
	je	.L4
	movl	1664(%rsp), %r15d
	jmp	.L17
.L4:
	leaq	48(%rsp), %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	48(%rsp), %eax
	testl	%eax, %eax
	jle	.L18
	leaq	52(%rsp), %rax
	xorl	%ebx, %ebx
	movq	%rax, 40(%rsp)
.L23:
	movq	40(%rsp), %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movslq	52(%rsp), %rax
	movl	1664(%rsp,%rax,4), %eax
	leal	-1(%rax), %edx
	movl	%edx, 64(%rsp,%rbx,4)
	testl	%eax, %eax
	je	.L19
	movl	48(%rsp), %eax
	addq	$1, %rbx
	movl	64(%rsp), %edx
	cmpl	%ebx, %eax
	jg	.L23
	testl	%edx, %edx
	js	.L22
	xorl	%ebx, %ebx
	testl	%eax, %eax
	jle	.L52
.L24:
	movl	64(%rsp,%rbx,4), %esi
	movl	$.LC3, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	printf
	cmpl	%ebx, 48(%rsp)
	jg	.L24
.L52:
	addq	$5720, %rsp
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
.L19:
	.cfi_restore_state
	movl	$-1, 64(%rsp)
	addq	$1, %rbx
	cmpl	%ebx, 48(%rsp)
	jg	.L23
.L22:
	movl	$.LC2, %edi
	call	puts
	jmp	.L52
.L18:
	cmpl	$0, 64(%rsp)
	jns	.L52
	jmp	.L22
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
