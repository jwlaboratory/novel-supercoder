	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%d"
.LC2:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$643204, %edx
	xorl	%esi, %esi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	xorl	%r14d, %r14d
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
	subq	$5827624, %rsp
	.cfi_def_cfa_offset 5827680
	leaq	272(%rsp), %rdi
	leaq	272(%rsp), %r12
	call	memset
	movl	$5184128, %edx
	xorl	%esi, %esi
	leaq	643488(%rsp), %rdi
	call	memset
	pxor	%xmm4, %xmm4
	movl	$-1, %ecx
	xorl	%edx, %edx
	movdqa	.LC0(%rip), %xmm3
	movdqa	%xmm4, %xmm5
	leaq	-1328(%rsp), %rax
	pcmpgtd	%xmm3, %xmm5
.L3:
	movl	$1, (%r12)
	movl	$1, 1600(%rax)
	cmpl	$1, %edx
	jle	.L93
	leal	-2(%rdx), %esi
	cmpl	$2, %esi
	jbe	.L35
	movl	%ecx, %edi
	leaq	-4(%rax), %r8
	leaq	1604(%rax), %r13
	xorl	%esi, %esi
	shrl	$2, %edi
	salq	$4, %rdi
.L5:
	movdqu	(%rax,%rsi), %xmm7
	movdqu	(%r8,%rsi), %xmm2
	movdqa	%xmm4, %xmm0
	movdqa	%xmm5, %xmm6
	paddd	%xmm7, %xmm2
	movdqa	%xmm5, %xmm7
	pcmpgtd	%xmm2, %xmm0
	pmuludq	%xmm2, %xmm6
	movdqa	%xmm2, %xmm1
	pmuludq	%xmm3, %xmm1
	pmuludq	%xmm3, %xmm0
	paddq	%xmm6, %xmm0
	movdqa	%xmm4, %xmm6
	psllq	$32, %xmm0
	paddq	%xmm0, %xmm1
	movdqa	%xmm2, %xmm0
	psrlq	$32, %xmm0
	pcmpgtd	%xmm0, %xmm6
	pmuludq	%xmm0, %xmm7
	pmuludq	%xmm3, %xmm0
	pmuludq	%xmm3, %xmm6
	paddq	%xmm7, %xmm6
	psllq	$32, %xmm6
	paddq	%xmm6, %xmm0
	shufps	$221, %xmm0, %xmm1
	movdqa	%xmm2, %xmm0
	pshufd	$216, %xmm1, %xmm1
	psrad	$31, %xmm0
	psrad	$12, %xmm1
	psubd	%xmm0, %xmm1
	movdqa	%xmm1, %xmm0
	pslld	$2, %xmm0
	paddd	%xmm1, %xmm0
	pslld	$3, %xmm0
	psubd	%xmm1, %xmm0
	pslld	$3, %xmm0
	paddd	%xmm1, %xmm0
	pslld	$2, %xmm0
	psubd	%xmm1, %xmm0
	pslld	$3, %xmm0
	psubd	%xmm1, %xmm0
	psubd	%xmm0, %xmm2
	movups	%xmm2, 0(%r13,%rsi)
	addq	$16, %rsi
	cmpq	%rdi, %rsi
	jne	.L5
	movl	%ecx, %esi
	andl	$-4, %esi
	addl	$1, %esi
	testb	$3, %cl
	je	.L9
.L4:
	movslq	%esi, %r8
	leal	1(%rsi), %ebx
	leaq	(%r8,%r14), %rax
	leaq	-1336(%rsp,%rax,4), %rbp
	cmpl	%ecx, %ebx
	jge	.L36
	cmpl	%edx, %esi
	jge	.L36
	movslq	%ecx, %rax
	movslq	%ebx, %rbx
	imulq	$401, %rax, %r10
	leaq	(%r10,%r8), %rdi
	movl	272(%rsp,%rdi,4), %r11d
	movslq	%edx, %rdi
	imulq	$401, %rdi, %r9
	addq	%r9, %r8
	movq	%r8, (%rsp)
	movl	0(%rbp), %r8d
	addl	%r11d, %r8d
	movl	%r8d, %ebp
	movslq	%r8d, %r8
	imulq	$1757988013, %r8, %r8
	movl	%ebp, %r15d
	sarl	$31, %r15d
	sarq	$44, %r8
	subl	%r15d, %r8d
	imull	$10007, %r8d, %r8d
	subl	%r8d, %ebp
	movq	(%rsp), %r8
	movl	%ebp, 272(%rsp,%r8,4)
	leaq	(%r10,%rbx), %r8
	leaq	(%r9,%rbx), %rbp
	movl	272(%rsp,%r8,4), %r8d
	addl	%r8d, %r11d
	movslq	%r11d, %rbx
	movl	%r11d, %r15d
	imulq	$1757988013, %rbx, %rbx
	sarl	$31, %r15d
	sarq	$44, %rbx
	subl	%r15d, %ebx
	imull	$10007, %ebx, %ebx
	subl	%ebx, %r11d
	movl	%r11d, 272(%rsp,%rbp,4)
	leal	3(%rsi), %ebp
	leal	2(%rsi), %r11d
	cmpl	%ebp, %ecx
	jle	.L10
	movslq	%r11d, %rbx
	movslq	%ebp, %rbp
	leaq	(%r10,%rbx), %r11
	addq	%r9, %rbx
	movl	272(%rsp,%r11,4), %r11d
	movq	%rbx, (%rsp)
	leal	(%r8,%r11), %ebx
	movslq	%ebx, %r8
	movl	%ebx, %r15d
	imulq	$1757988013, %r8, %r8
	sarl	$31, %r15d
	sarq	$44, %r8
	subl	%r15d, %r8d
	imull	$10007, %r8d, %r8d
	subl	%r8d, %ebx
	movq	(%rsp), %r8
	movl	%ebx, 272(%rsp,%r8,4)
	leaq	(%r10,%rbp), %r8
	addq	%r9, %rbp
	movl	272(%rsp,%r8,4), %ebx
	addl	%ebx, %r11d
	movslq	%r11d, %r8
	movl	%r11d, %r15d
	imulq	$1757988013, %r8, %r8
	sarl	$31, %r15d
	sarq	$44, %r8
	subl	%r15d, %r8d
	imull	$10007, %r8d, %r8d
	subl	%r8d, %r11d
	movl	%r11d, 272(%rsp,%rbp,4)
	leal	5(%rsi), %ebp
	leal	4(%rsi), %r11d
	cmpl	%ebp, %ecx
	jle	.L10
	movslq	%r11d, %r8
	movslq	%ebp, %rbp
	leaq	(%r10,%r8), %r11
	addq	%r9, %r8
	addq	%rbp, %r10
	addq	%rbp, %r9
	movl	272(%rsp,%r11,4), %r11d
	movq	%r8, (%rsp)
	addl	%r11d, %ebx
	movslq	%ebx, %r8
	movl	%ebx, %r15d
	imulq	$1757988013, %r8, %r8
	sarl	$31, %r15d
	sarq	$44, %r8
	subl	%r15d, %r8d
	imull	$10007, %r8d, %r8d
	subl	%r8d, %ebx
	movq	(%rsp), %r8
	movl	%ebx, 272(%rsp,%r8,4)
	addl	272(%rsp,%r10,4), %r11d
	movslq	%r11d, %r8
	movl	%r11d, %r10d
	imulq	$1757988013, %r8, %r8
	sarl	$31, %r10d
	sarq	$44, %r8
	subl	%r10d, %r8d
	imull	$10007, %r8d, %r8d
	subl	%r8d, %r11d
	movl	%r11d, 272(%rsp,%r9,4)
	leal	6(%rsi), %r11d
.L10:
	imulq	$401, %rax, %rax
	leal	-1(%r11), %esi
	movslq	%r11d, %r9
	imulq	$401, %rdi, %rdi
	movslq	%esi, %rsi
	addq	%rax, %rsi
	leaq	(%rdi,%r9), %r8
	addq	%rax, %r9
	movl	272(%rsp,%r9,4), %r10d
	addl	272(%rsp,%rsi,4), %r10d
	movslq	%r10d, %rsi
	movl	%r10d, %ebx
	imulq	$1757988013, %rsi, %rsi
	sarl	$31, %ebx
	sarq	$44, %rsi
	subl	%ebx, %esi
	imull	$10007, %esi, %esi
	subl	%esi, %r10d
	movl	%r10d, 272(%rsp,%r8,4)
	leal	1(%r11), %r8d
	cmpl	%r8d, %edx
	jle	.L9
	movslq	%r8d, %r8
	movl	272(%rsp,%r9,4), %r9d
	leaq	(%rdi,%r8), %r10
	addq	%rax, %r8
	addl	272(%rsp,%r8,4), %r9d
	movslq	%r9d, %rsi
	movl	%r9d, %ebx
	imulq	$1757988013, %rsi, %rsi
	sarl	$31, %ebx
	sarq	$44, %rsi
	subl	%ebx, %esi
	imull	$10007, %esi, %esi
	subl	%esi, %r9d
	leal	2(%r11), %esi
	movl	%r9d, 272(%rsp,%r10,4)
	cmpl	%esi, %edx
	jle	.L9
	movslq	%esi, %rsi
	addq	%rsi, %rax
	addq	%rsi, %rdi
	movl	272(%rsp,%rax,4), %esi
	addl	272(%rsp,%r8,4), %esi
	movslq	%esi, %rax
	movl	%esi, %r8d
	imulq	$1757988013, %rax, %rax
	sarl	$31, %r8d
	sarq	$44, %rax
	subl	%r8d, %eax
	imull	$10007, %eax, %eax
	subl	%eax, %esi
	movl	%esi, 272(%rsp,%rdi,4)
.L9:
	addl	$1, %edx
	addq	$1608, %r12
	addl	$1, %ecx
	movq	%r13, %rax
	addq	$401, %r14
	cmpl	$401, %edx
	jne	.L3
	leaq	264(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movslq	264(%rsp), %rax
	movl	$1, 643488(%rsp)
	testl	%eax, %eax
	jle	.L11
	xorl	%r10d, %r10d
	xorl	%r15d, %r15d
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	movabsq	$7550501021876119059, %r13
	movq	%r10, %rbx
.L34:
	leaq	268(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	%ebp, %eax
	movl	268(%rsp), %ebp
	testl	%ebp, %ebp
	jle	.L12
	leal	-1(%rbp), %ecx
	movl	$1, %esi
	movl	$1, %edx
	movl	%ecx, 160(%rsp)
	leal	1(%rbp), %ecx
	movq	%rsi, 48(%rsp)
	testb	$1, %bpl
	je	.L13
	movl	$2, %edx
	movl	$1, %esi
	cmpq	%rcx, %rdx
	je	.L82
.L13:
	imulq	%rdx, %rsi
	leaq	1(%rdx), %rdi
	addq	$2, %rdx
	imulq	%rdi, %rsi
	cmpq	%rcx, %rdx
	jne	.L13
	movq	%rsi, 48(%rsp)
.L82:
	movl	%r15d, %edx
	addl	$1, %r12d
	addl	$1, %edx
	js	.L16
	cmpl	%ebp, %edx
	cmovg	%ebp, %edx
	movl	%edx, 164(%rsp)
	testl	%edx, %edx
	je	.L16
	movl	160(%rsp), %ecx
	addl	%eax, %eax
	movl	%r15d, %edx
	leal	2(%r15), %r8d
	leaq	272(%rsp), %rdi
	subl	%eax, %edx
	movl	$0, 108(%rsp)
	leaq	0(,%rbx,8), %rsi
	movq	%rcx, 176(%rsp)
	imulq	$1604, %rcx, %rcx
	movq	%rdi, 152(%rsp)
	addq	%rdi, %rcx
	movq	%rsi, %rdi
	movq	%rcx, 168(%rsp)
	leal	1(%rdx), %ecx
	movslq	%r12d, %rdx
	movl	%ecx, 192(%rsp)
	imulq	$401, %rdx, %rcx
	movq	%rcx, 56(%rsp)
	movl	%eax, %ecx
.L18:
	movq	%rdi, %rax
	movl	108(%rsp), %edx
	leaq	643488(%rsp), %rsi
	movl	$0, 104(%rsp)
	salq	$4, %rax
	movl	%r15d, 196(%rsp)
	movl	%ebp, %r14d
	leaq	(%rsi,%rax), %r11
	leaq	272(%rsp), %rax
	movl	192(%rsp), %esi
	movl	%r12d, 208(%rsp)
	movq	%rax, 128(%rsp)
	movl	%edx, %r10d
	movq	%rdi, 200(%rsp)
	subl	%edx, %esi
	movl	%ecx, %edx
	movl	%r8d, 212(%rsp)
	movq	%rbx, 216(%rsp)
.L33:
	movl	104(%rsp), %ebx
	movl	%edx, %eax
	movl	%esi, 148(%rsp)
	movq	%r11, %rbp
	movl	%r10d, 144(%rsp)
	subl	%ebx, %eax
	movl	$0, 124(%rsp)
	movl	%eax, 28(%rsp)
	leaq	272(%rsp), %rax
	movq	%rax, 96(%rsp)
	movl	%esi, 224(%rsp)
	movl	%edx, 228(%rsp)
	jmp	.L32
.L19:
	addl	$1, 124(%rsp)
	movl	124(%rsp), %eax
	movq	%r10, %rbp
	addl	$1, 144(%rsp)
	movl	232(%rsp), %r14d
	addq	$4, %rbp
	addl	$1, 148(%rsp)
	movl	236(%rsp), %r10d
	subl	$2, 28(%rsp)
	movq	240(%rsp), %r11
	addq	$1604, 96(%rsp)
	cmpl	$4, %eax
	je	.L30
.L32:
	movl	144(%rsp), %eax
	movslq	148(%rsp), %r15
	movl	$1, %edi
	movl	%r14d, 232(%rsp)
	movq	176(%rsp), %rbx
	movl	%edi, 136(%rsp)
	subl	$1, %eax
	movq	%r11, 240(%rsp)
	movl	%eax, 64(%rsp)
	movq	%r15, %rax
	subq	%rbx, %rax
	movl	%r10d, 236(%rsp)
	movq	%rbp, %r10
	imulq	$1604, %rax, %rax
	movq	%r15, 248(%rsp)
	movq	%rax, 184(%rsp)
	movq	168(%rsp), %rax
	movq	%rax, 40(%rsp)
	movl	160(%rsp), %eax
	movl	%eax, 92(%rsp)
	movslq	28(%rsp), %rax
	imulq	$1604, %rax, %rax
	addq	$5827616, %rax
	leaq	(%rsp,%rax), %r12
	movq	%r12, %r15
.L29:
	movl	(%r10), %eax
	testl	%eax, %eax
	je	.L19
	movq	40(%rsp), %rbx
	movq	184(%rsp), %rcx
	movq	%r15, %rbp
	movl	136(%rsp), %eax
	leaq	4(%rbx,%rcx), %r8
	movl	108(%rsp), %ebx
	leal	-1(%rax), %ecx
	movl	%eax, %r14d
	cmpl	%eax, %ebx
	cmovle	%ebx, %eax
	movq	%r10, %rbx
	imulq	$401, 248(%rsp), %rdi
	subl	%eax, %ecx
	movq	152(%rsp), %rax
	movl	%ecx, 140(%rsp)
	movq	%rax, 32(%rsp)
	movq	%rdi, %r12
	movl	124(%rsp), %edi
.L20:
	movl	104(%rsp), %eax
	leal	-1(%r14), %r9d
	cmpl	%eax, %r14d
	cmovle	%r14d, %eax
	testl	%eax, %eax
	js	.L25
	movl	%r9d, %r15d
	movq	%r8, 112(%rsp)
	movq	%r8, %rsi
	movl	%r14d, %ecx
	subl	%eax, %r15d
	movq	128(%rsp), %rax
	movl	%r14d, 88(%rsp)
	movl	%edi, %r10d
	movl	%r15d, 84(%rsp)
	movq	%rax, 16(%rsp)
	movl	%r9d, 120(%rsp)
	.p2align 4,,10
	.p2align 3
.L28:
	cmpl	%r10d, %ecx
	movl	%r10d, %eax
	leal	-1(%rcx), %edi
	cmovle	%ecx, %eax
	testl	%eax, %eax
	js	.L22
	movl	88(%rsp), %edx
	leal	-1(%rcx), %edi
	movslq	92(%rsp), %r11
	movq	%rsi, (%rsp)
	movl	%r10d, 68(%rsp)
	leal	7(%rdx), %r9d
	movl	%edi, %edx
	movq	%rsi, 72(%rsp)
	subl	%eax, %edx
	movq	96(%rsp), %rax
	movl	%edi, 80(%rsp)
	subl	%ecx, %r9d
	movl	%edx, 24(%rsp)
	movq	%rax, 8(%rsp)
.L26:
	movl	28(%rsp), %eax
	cmpl	%eax, %ecx
	movl	%eax, %r10d
	cmovle	%ecx, %r10d
	testl	%r10d, %r10d
	js	.L91
	movq	40(%rsp), %rsi
	movq	48(%rsp), %rdx
	leal	-7(%r9), %eax
	cltq
	movslq	-5827344(%rbp), %rdi
	movslq	(%rsi), %rsi
	imulq	%rdx, %rsi
	movq	32(%rsp), %rdx
	movslq	(%rdx), %rdx
	imulq	%rsi, %rdx
	movq	16(%rsp), %rsi
	movslq	(%rsi), %r8
	movq	8(%rsp), %rsi
	imulq	%rdx, %r8
	movslq	(%rsi), %rdx
	movl	64(%rsp), %esi
	addl	%ecx, %esi
	imulq	%rdx, %r8
	movq	56(%rsp), %rdx
	movslq	%esi, %rsi
	addq	%rdx, %rsi
	salq	$3, %rsi
	imulq	%r8, %rdi
	addq	%rsi, %rax
	leaq	(%r11,%rax,4), %r14
	movq	(%rsp), %rax
	movslq	(%rax), %rax
	imulq	%rax, %rdi
	movslq	(%rbx), %rax
	imulq	%rax, %rdi
	movslq	643488(%rsp,%r14,4), %rax
	addq	%rax, %rdi
	movq	%rdi, %rax
	imulq	%r13
	movq	%rdi, %rax
	sarq	$63, %rax
	sarq	$12, %rdx
	subq	%rax, %rdx
	imulq	$10007, %rdx, %rdx
	subq	%rdx, %rdi
	movl	%edi, 643488(%rsp,%r14,4)
	testl	%r10d, %r10d
	je	.L91
	leal	-6(%r9), %eax
	movslq	-5827340(%rbp), %rdi
	leal	-1(%rcx), %r14d
	cltq
	addq	%rsi, %rax
	imulq	%r8, %rdi
	leaq	(%r11,%rax,4), %r15
	movslq	%r14d, %rax
	addq	%r12, %rax
	movslq	272(%rsp,%rax,4), %rax
	imulq	%rax, %rdi
	movslq	(%rbx), %rax
	imulq	%rax, %rdi
	movslq	643488(%rsp,%r15,4), %rax
	addq	%rax, %rdi
	movq	%rdi, %rax
	imulq	%r13
	movq	%rdi, %rax
	sarq	$63, %rax
	sarq	$12, %rdx
	subq	%rax, %rdx
	imulq	$10007, %rdx, %rdx
	subq	%rdx, %rdi
	movl	%edi, 643488(%rsp,%r15,4)
	cmpl	$1, %r10d
	je	.L24
	leal	-5(%r9), %eax
	movslq	-5827336(%rbp), %rdi
	cltq
	addq	%rsi, %rax
	imulq	%r8, %rdi
	leaq	(%r11,%rax,4), %r15
	leal	-2(%rcx), %eax
	cltq
	addq	%r12, %rax
	movslq	272(%rsp,%rax,4), %rax
	imulq	%rax, %rdi
	movslq	(%rbx), %rax
	imulq	%rax, %rdi
	movslq	643488(%rsp,%r15,4), %rax
	addq	%rax, %rdi
	movq	%rdi, %rax
	imulq	%r13
	movq	%rdi, %rax
	sarq	$63, %rax
	sarq	$12, %rdx
	subq	%rax, %rdx
	imulq	$10007, %rdx, %rdx
	subq	%rdx, %rdi
	movl	%edi, 643488(%rsp,%r15,4)
	cmpl	$2, %r10d
	je	.L24
	leal	-4(%r9), %eax
	movslq	-5827332(%rbp), %rdi
	cltq
	addq	%rsi, %rax
	imulq	%r8, %rdi
	leaq	(%r11,%rax,4), %r15
	leal	-3(%rcx), %eax
	cltq
	addq	%r12, %rax
	movslq	272(%rsp,%rax,4), %rax
	imulq	%rax, %rdi
	movslq	(%rbx), %rax
	imulq	%rax, %rdi
	movslq	643488(%rsp,%r15,4), %rax
	addq	%rax, %rdi
	movq	%rdi, %rax
	imulq	%r13
	movq	%rdi, %rax
	sarq	$63, %rax
	sarq	$12, %rdx
	subq	%rax, %rdx
	imulq	$10007, %rdx, %rdx
	subq	%rdx, %rdi
	movl	%edi, 643488(%rsp,%r15,4)
	cmpl	$3, %r10d
	je	.L24
	leal	-3(%r9), %eax
	movslq	-5827328(%rbp), %rdi
	cltq
	addq	%rsi, %rax
	imulq	%r8, %rdi
	leaq	(%r11,%rax,4), %r15
	leal	-4(%rcx), %eax
	cltq
	addq	%r12, %rax
	movslq	272(%rsp,%rax,4), %rax
	imulq	%rax, %rdi
	movslq	(%rbx), %rax
	imulq	%rax, %rdi
	movslq	643488(%rsp,%r15,4), %rax
	addq	%rax, %rdi
	movq	%rdi, %rax
	imulq	%r13
	movq	%rdi, %rax
	sarq	$63, %rax
	sarq	$12, %rdx
	subq	%rax, %rdx
	imulq	$10007, %rdx, %rax
	subq	%rax, %rdi
	movl	%edi, 643488(%rsp,%r15,4)
	cmpl	$4, %r10d
	je	.L24
	leal	-2(%r9), %eax
	movslq	-5827324(%rbp), %rdi
	cltq
	addq	%rsi, %rax
	imulq	%r8, %rdi
	leaq	(%r11,%rax,4), %r15
	leal	-5(%rcx), %eax
	cltq
	addq	%r12, %rax
	movslq	272(%rsp,%rax,4), %rax
	imulq	%rax, %rdi
	movslq	(%rbx), %rax
	imulq	%rax, %rdi
	movslq	643488(%rsp,%r15,4), %rax
	addq	%rax, %rdi
	movq	%rdi, %rax
	imulq	%r13
	movq	%rdi, %rax
	sarq	$63, %rax
	sarq	$12, %rdx
	subq	%rax, %rdx
	imulq	$10007, %rdx, %rax
	subq	%rax, %rdi
	movl	%edi, 643488(%rsp,%r15,4)
	cmpl	$5, %r10d
	je	.L24
	leal	-1(%r9), %eax
	movslq	-5827320(%rbp), %rdi
	cltq
	addq	%rsi, %rax
	imulq	%r8, %rdi
	leaq	(%r11,%rax,4), %r15
	leal	-6(%rcx), %eax
	cltq
	addq	%r12, %rax
	movslq	272(%rsp,%rax,4), %rax
	imulq	%rax, %rdi
	movslq	(%rbx), %rax
	imulq	%rax, %rdi
	movslq	643488(%rsp,%r15,4), %rax
	addq	%rax, %rdi
	movq	%rdi, %rax
	imulq	%r13
	movq	%rdi, %rax
	sarq	$63, %rax
	sarq	$12, %rdx
	subq	%rax, %rdx
	imulq	$10007, %rdx, %rax
	subq	%rax, %rdi
	movl	%edi, 643488(%rsp,%r15,4)
	cmpl	$6, %r10d
	je	.L24
	movslq	%r9d, %rax
	leal	-7(%rcx), %edx
	addq	%rax, %rsi
	movslq	-5827316(%rbp), %rax
	movslq	%edx, %rdx
	addq	%r12, %rdx
	leaq	(%r11,%rsi,4), %rsi
	imulq	%r8, %rax
	movslq	272(%rsp,%rdx,4), %rdx
	imulq	%rdx, %rax
	movq	%rax, %rcx
	movslq	(%rbx), %rax
	imulq	%rax, %rcx
	movslq	643488(%rsp,%rsi,4), %rax
	addq	%rax, %rcx
	movq	%rcx, %rax
	movq	%rcx, %rdi
	imulq	%r13
	sarq	$63, %rdi
	sarq	$12, %rdx
	subq	%rdi, %rdx
	imulq	$10007, %rdx, %rax
	subq	%rax, %rcx
	movl	%ecx, 643488(%rsp,%rsi,4)
.L24:
	addq	$4, 8(%rsp)
	movl	%r14d, %ecx
	addl	$2, %r9d
	subq	$4, (%rsp)
	cmpl	%r14d, 24(%rsp)
	jne	.L26
	movl	68(%rsp), %r10d
	movq	72(%rsp), %rsi
	movl	80(%rsp), %edi
.L22:
	addq	$4, 16(%rsp)
	movl	%edi, %ecx
	subq	$4, %rsi
	cmpl	%edi, 84(%rsp)
	jne	.L28
	movq	112(%rsp), %r8
	movl	120(%rsp), %r9d
	movl	%r10d, %edi
.L25:
	movl	140(%rsp), %eax
	addq	$4, 32(%rsp)
	movl	%r9d, %r14d
	subq	$4, %r8
	cmpl	%eax, %r9d
	jne	.L20
	addl	$1, 136(%rsp)
	movq	%rbx, %r10
	movq	%rbp, %r15
	movl	136(%rsp), %eax
	movl	164(%rsp), %ebx
	cmpl	%ebx, %eax
	jg	.L19
	subl	$1, 92(%rsp)
	addq	$4, 40(%rsp)
	subl	$1, 64(%rsp)
	jmp	.L29
.L93:
	addl	$1, %edx
	addl	$1, %ecx
	addq	$1608, %r12
	addq	$401, %r14
	addq	$1604, %rax
	jmp	.L3
.L36:
	movl	%esi, %r11d
	movslq	%ecx, %rax
	movslq	%edx, %rdi
	jmp	.L10
.L35:
	movl	$1, %esi
	leaq	1604(%rax), %r13
	jmp	.L4
.L12:
	addl	$1, %r12d
.L16:
	movslq	264(%rsp), %rax
	addl	%ebp, %r15d
	addq	$401, %rbx
	cmpl	%r12d, %eax
	jg	.L34
.L11:
	imulq	$51328, %rax, %rax
	movl	$.LC2, %edi
	movl	643488(%rsp,%rax), %esi
	xorl	%eax, %eax
	call	printf
	addq	$5827624, %rsp
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
	.p2align 4,,10
	.p2align 3
.L91:
	.cfi_restore_state
	leal	-1(%rcx), %r14d
	jmp	.L24
.L30:
	addl	$1, 104(%rsp)
	movl	104(%rsp), %eax
	addl	$1, %r10d
	addq	$16, %r11
	movl	224(%rsp), %esi
	movl	228(%rsp), %edx
	addq	$1604, 128(%rsp)
	cmpl	$8, %eax
	jne	.L33
	addl	$1, 108(%rsp)
	movl	108(%rsp), %eax
	movl	%edx, %ecx
	movl	%r14d, %ebp
	movq	200(%rsp), %rdi
	movl	212(%rsp), %r8d
	movl	196(%rsp), %r15d
	movl	208(%rsp), %r12d
	addq	$1604, 152(%rsp)
	movq	216(%rsp), %rbx
	addq	$8, %rdi
	cmpl	%r8d, %eax
	jne	.L18
	jmp	.L16
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	1757988013
	.long	1757988013
	.long	1757988013
	.long	1757988013
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
