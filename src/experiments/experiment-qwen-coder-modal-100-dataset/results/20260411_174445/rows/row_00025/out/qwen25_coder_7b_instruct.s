.file	"optimized_inputC.s"
	.text
	.p2align 4
	.globl	cmp2
	.type	cmp2, @function
cmp2:
.LFB29:
	movslq	(%rdi), %rax
	movq	.LC0(%rip), %xmm4
	movsd	.LC1(%rip), %xmm3
	salq	$4, %rax
	movsd	tbl(%rax), %xmm1
	leaq	tbl(%rax), %rcx
	movslq	(%rsi), %rax
	salq	$4, %rax
	movapd	%xmm1, %xmm0
	movsd	tbl(%rax), %xmm2
	subsd	%xmm2, %xmm0
	andpd	%xmm4, %xmm0
	comisd	%xmm0, %xmm3
	jbe	.L9
	movsd	8(%rcx), %xmm1
	movsd	tbl+8(%rax), %xmm2
	xorl	%eax, %eax
	movapd	%xmm1, %xmm0
	subsd	%xmm2, %xmm0
	andpd	%xmm4, %xmm0
	comisd	%xmm0, %xmm3
	ja	.L1
.L9:
	comisd	%xmm1, %xmm2
	sbbl	%eax, %eax
	andl	$2, %eax
	subl	$1, %eax
.L1:
	ret
	.p2align 4
	.globl	uniq.part.0
	.type	uniq.part.0, @function
uniq.part.0:
.LFB36:
	movq	%rdi, %r9
	movl	%esi, %edi
	cmpl	$1, %esi
	jle	.L26
	movq	.LC0(%rip), %xmm2
	movsd	.LC1(%rip), %xmm1
	movl	$1, %edx
	xorl	%r10d, %r10d
.L24:
	movslq	%r10d, %r8
	movslq	%edx, %rax
	salq	$4, %r8
	salq	$4, %rax
	leaq	(%r9,%r8), %rsi
	addq	%r9, %rax
	movsd	(%rsi), %xmm3
	jmp	.L20
.L27:
	movsd	8(%rsi), %xmm0
	subsd	8(%rax), %xmm0
	andpd	%xmm2, %xmm0
	comisd	%xmm0, %xmm1
	jbe	.L15
	addq	$16, %rax
	cmpl	%edx, %edi
	je	.L14
.L20:
	movapd	%xmm3, %xmm0
	subsd	(%rax), %xmm0
	movl	%edx, %ecx
	addl	$1, %edx
	andpd	%xmm2, %xmm0
	comisd	%xmm0, %xmm1
	ja	.L27
.L15:
	cmpl	%ecx, %edi
	jle	.L18
	addl	$1, %r10d
	cmpl	%r10d, %ecx
	je	.L18
	movslq	%ecx, %rax
	salq	$4, %rax
	movdqu	(%r9,%rax), %xmm4
	movups	%xmm4, 16(%r9,%r8)
.L18:
	leal	1(%rcx), %edx
	cmpl	%edx, %edi
	jg	.L24
.L14:
	leal	1(%r10), %eax
	ret
.L26:
	movl	$1, %eax
	ret
	.p2align 4
	.globl	cmp
	.type	cmp, @function
cmp:
.LFB28:
	movsd	(%rdi), %xmm1
	movsd	(%rsi), %xmm2
	movq	.LC0(%rip), %xmm4
	movsd	.LC1(%rip), %xmm3
	movapd	%xmm1, %xmm0
	subsd	%xmm2, %xmm0
	andpd	%xmm4, %xmm0
	comisd	%xmm0, %xmm3
	jbe	.L36
	movsd	8(%rdi), %xmm1
	movsd	8(%rsi), %xmm2
	xorl	%eax, %eax
	movapd	%xmm1, %xmm0
	subsd	%xmm2, %xmm0
	andpd	%xmm4, %xmm0
	comisd	%xmm0, %xmm3
	ja	.L28
.L36:
	comisd	%xmm1, %xmm2
	sbbl	%eax, %eax
	andl	$2, %eax
	subl	$1, %eax
.L28:
	ret
	.p2align 4
	.globl	lookup
	.type	lookup, @function
lookup:
.LFB8:
	cvttsd2sil	%xmm0, %edx
	movq	.LC0(%rip), %xmm4
	movsd	.LC1(%rip), %xmm3
	cvttsd2sil	%xmm1, %ecx
	movl	%edx, %eax
	negl	%eax
	cmovs	%edx, %eax
	movl	%ecx, %edx
	sall	$10, %eax
	negl	%edx
	cmovs	%ecx, %edx
	leal	1(%rax,%rdx), %edx
	movslq	%edx, %rax
	movl	%edx, %ecx
	imulq	$175916583, %rax, %rax
	sarl	$31, %ecx
	sarq	$44, %rax
	subl	%ecx, %eax
	movq	hashend(%rip), %rcx
	imull	$100003, %eax, %eax
	subl	%eax, %edx
	movslq	%edx, %rdx
	leaq	(%rdx,%rdx,2), %rax
	leaq	hash(,%rax,8), %rdx
	jmp	.L43
.L44:
	movapd	%xmm0, %xmm2
	subsd	8(%rdx), %xmm2
	andpd	%xmm4, %xmm2
	comisd	%xmm2, %xmm3
	jbe	.L39
	movapd	%xmm1, %xmm2
	subsd	16(%rdx), %xmm2
	andpd	%xmm4, %xmm2
	comisd	%xmm2, %xmm3
	ja	.L48
.L39:
	addq	$24, %rdx
	movl	$hash, %eax
	cmpq	%rdx, %rcx
	cmove	%rax, %rdx
.L43:
	movl	(%rdx), %eax
	testl	%eax, %eax
	jne	.L44
	movl	$-1, %eax
	ret
.L48:
	subl	$1, %eax
	ret
	.p2align 4
	.globl	insert
	.type	insert, @function
insert:
.LFB9:
	cvttsd2sil	%xmm0, %edx
	movq	.LC0(%rip), %xmm4
	movl	%edi, %esi
	movsd	.LC1(%rip), %xmm3
	cvttsd2sil	%xmm1, %ecx
	movl	%edx, %eax
	negl	%eax
	cmovs	%edx, %eax
	movl	%ecx, %edx
	sall	$10, %eax
	negl	%edx
	cmovs	%ecx, %edx
	leal	1(%rax,%rdx), %edx
	movslq	%edx, %rax
	movl	%edx, %ecx
	imulq	$175916583, %rax, %rax
	sarl	$31, %ecx
	sarq	$44, %rax
	subl	%ecx, %eax
	imull	$100003, %eax, %eax
	subl	%eax, %edx
	movslq	%edx, %rdx
	leaq	(%rdx,%rdx,2), %rax
	movq	hashend(%rip), %rdx
	leaq	hash(,%rax,8), %rax
	jmp	.L54
.L55:
	movapd	%xmm0, %xmm2
	subsd	8(%rax), %xmm2
	and
