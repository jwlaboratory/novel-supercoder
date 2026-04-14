	.file	"inputC.c"
	.text
	.p2align 4
	.globl	bfs
	.type	bfs, @function
bfs:
.LFB8:
	.cfi_startproc
	movl	H(%rip), %r8d
	movl	$0, end(%rip)
	movl	$0, top(%rip)
	testl	%r8d, %r8d
	jle	.L58
	movslq	%edi, %rdx
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%r10d, %r10d
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	imulq	$484, %rdx, %r11
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movslq	W(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%ebx, %ebx
	movq	%rbp, %r9
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%ecx, %ecx
	testl	%r9d, %r9d
	jg	.L8
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L5:
	movl	visited(%rbx,%rcx,4), %esi
	cmpl	$808464431, %esi
	jg	.L6
	movd	T(,%rdx,4), %xmm0
	movslq	%eax, %r10
	movd	%esi, %xmm3
	addl	$1, %eax
	leaq	(%r10,%r10,2), %r10
	punpckldq	%xmm3, %xmm0
	movb	%r12b, q(,%r10,4)
	movb	%cl, q+1(,%r10,4)
	movq	%xmm0, q+4(,%r10,4)
	movl	$1, %r10d
.L6:
	addq	$1, %rcx
	cmpq	%rbp, %rcx
	je	.L11
.L8:
	cmpb	$35, map(%r11,%rcx)
	jne	.L5
	movl	$808464432, visited(%rbx,%rcx,4)
	addq	$1, %rcx
	cmpq	%rbp, %rcx
	jne	.L8
.L11:
	addl	$1, %r12d
	addq	$88, %rbx
	addq	$22, %r11
	cmpl	%r8d, %r12d
	jne	.L4
	testb	%r10b, %r10b
	je	.L45
	leal	1(%rdi), %esi
	movl	%eax, end(%rip)
	movslq	%esi, %rsi
	movl	T(,%rsi,4), %ebx
	movl	%ebx, -12(%rsp)
	testl	%eax, %eax
	je	.L45
	movl	GR(%rip), %ebx
	imulq	$484, %rdx, %rdx
	xorl	%ecx, %ecx
	movb	$0, -1(%rsp)
	movb	$0, -3(%rsp)
	movl	ans(%rip), %r14d
	movq	.LC0(%rip), %xmm2
	movl	%ebx, -64(%rsp)
	movl	GC(%rip), %ebx
	movq	%rdx, -32(%rsp)
	imulq	$484, %rsi, %rdx
	movl	%ebx, -8(%rsp)
	movl	mv(%rip), %ebx
	movq	%rdx, -24(%rsp)
	movl	%ebx, -60(%rsp)
	movl	mv+4(%rip), %ebx
	movl	%ebx, -56(%rsp)
	movl	mv+8(%rip), %ebx
	movl	%ebx, -52(%rsp)
	movl	mv+12(%rip), %ebx
	movl	%ebx, -48(%rsp)
	movl	mv+16(%rip), %ebx
	movl	%ebx, -44(%rsp)
	movl	mv+20(%rip), %ebx
	movl	%ebx, -40(%rsp)
	movl	mv+24(%rip), %ebx
	movl	%ebx, -36(%rsp)
	movl	mv+28(%rip), %ebx
	movl	%ebx, -16(%rsp)
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L14:
	movl	-60(%rsp), %edi
	movl	-56(%rsp), %r15d
	addl	%edx, %edi
	leal	(%rsi,%r15), %r10d
	movl	%edi, %r15d
	orl	%r10d, %r15d
	js	.L34
	cmpl	%r8d, %edi
	jge	.L34
	cmpl	%r9d, %r10d
	jge	.L34
	movslq	%edi, %rbp
	movq	-32(%rsp), %r15
	movslq	%r10d, %r13
	leaq	0(%rbp,%rbp,4), %r12
	leaq	0(%rbp,%r12,2), %rbp
	addq	%rbp, %rbp
	leaq	map(%rbp,%r15), %r12
	movq	-24(%rsp), %r15
	cmpb	$46, (%r12,%r13)
	sete	%r12b
	leaq	map(%rbp,%r15), %r15
	cmpl	%r11d, -12(%rsp)
	movzbl	(%r15,%r13), %r15d
	setg	-2(%rsp)
	andb	-2(%rsp), %r12b
	jne	.L18
	cmpb	$46, %r15b
	je	.L62
	.p2align 4,,10
	.p2align 3
.L34:
	movl	-52(%rsp), %edi
	movl	-48(%rsp), %r15d
	addl	%edx, %edi
	leal	(%rsi,%r15), %r10d
	movl	%edi, %r15d
	orl	%r10d, %r15d
	js	.L33
	cmpl	%r8d, %edi
	jge	.L33
	cmpl	%r9d, %r10d
	jge	.L33
	movslq	%edi, %rbp
	movq	-32(%rsp), %r15
	movslq	%r10d, %r13
	leaq	0(%rbp,%rbp,4), %r12
	leaq	0(%rbp,%r12,2), %rbp
	addq	%rbp, %rbp
	leaq	map(%rbp,%r15), %r12
	movq	-24(%rsp), %r15
	cmpb	$46, (%r12,%r13)
	sete	%r12b
	leaq	map(%rbp,%r15), %r15
	cmpl	%r11d, -12(%rsp)
	movzbl	(%r15,%r13), %r15d
	setg	-2(%rsp)
	andb	-2(%rsp), %r12b
	jne	.L21
	cmpb	$46, %r15b
	je	.L63
	.p2align 4,,10
	.p2align 3
.L33:
	movl	-44(%rsp), %edi
	movl	-40(%rsp), %r15d
	addl	%edx, %edi
	leal	(%rsi,%r15), %r10d
	movl	%edi, %r15d
	orl	%r10d, %r15d
	js	.L32
	cmpl	%r8d, %edi
	jge	.L32
	cmpl	%r9d, %r10d
	jge	.L32
	movslq	%edi, %rbp
	movq	-32(%rsp), %r15
	movslq	%r10d, %r13
	leaq	0(%rbp,%rbp,4), %r12
	leaq	0(%rbp,%r12,2), %rbp
	addq	%rbp, %rbp
	leaq	map(%rbp,%r15), %r12
	movq	-24(%rsp), %r15
	cmpb	$46, (%r12,%r13)
	sete	%r12b
	leaq	map(%rbp,%r15), %r15
	cmpl	%r11d, -12(%rsp)
	movzbl	(%r15,%r13), %r15d
	setg	-2(%rsp)
	andb	-2(%rsp), %r12b
	jne	.L24
	cmpb	$46, %r15b
	je	.L64
	.p2align 4,,10
	.p2align 3
.L32:
	movl	-36(%rsp), %edi
	addl	%edi, %edx
	movl	-16(%rsp), %edi
	addl	%edi, %esi
	movl	%edx, %edi
	orl	%esi, %edi
	js	.L15
	cmpl	%r8d, %edx
	jge	.L15
	cmpl	%r9d, %esi
	jge	.L15
	movslq	%edx, %rdi
	movq	-32(%rsp), %r15
	movslq	%esi, %rbp
	leaq	(%rdi,%rdi,4), %r10
	leaq	(%rdi,%r10,2), %rdi
	addq	%rdi, %rdi
	leaq	map(%rdi,%r15), %r10
	movq	-24(%rsp), %r15
	cmpb	$46, (%r10,%rbp)
	sete	%r10b
	cmpl	%r11d, -12(%rsp)
	leaq	map(%rdi,%r15), %r12
	setg	%r11b
	movzbl	(%r12,%rbp), %r12d
	andb	%r11b, %r10b
	jne	.L28
	cmpb	$46, %r12b
	je	.L65
	.p2align 4,,10
	.p2align 3
.L15:
	cmpl	%ecx, %eax
	je	.L66
.L30:
	movslq	%ecx, %rdx
	addl	$1, %ecx
	leaq	(%rdx,%rdx,2), %rdi
	movsbl	q(,%rdi,4), %edx
	movsbl	q+1(,%rdi,4), %esi
	movq	q+4(,%rdi,4), %xmm1
	xorl	%edi, %edi
	cmpl	$10000000, %ecx
	cmove	%edi, %ecx
	movdqa	%xmm1, %xmm0
	paddd	%xmm2, %xmm0
	pshufd	$0xe5, %xmm0, %xmm4
	movd	%xmm0, %r11d
	movd	%xmm4, %ebx
	cmpl	%edx, -64(%rsp)
	jne	.L14
	cmpl	%esi, -8(%rsp)
	jne	.L14
	movl	%r14d, %edi
	pshufd	$0xe5, %xmm1, %xmm5
	movd	%xmm5, %edx
	movzbl	-3(%rsp), %ebx
	shrl	$31, %edi
	cmpl	%r14d, %edx
	setl	%sil
	orb	%dil, %sil
	cmovne	%esi, %ebx
	cmovne	%edx, %r14d
	movb	%bl, -3(%rsp)
	cmpl	%ecx, %eax
	jne	.L30
.L66:
	cmpb	$0, -1(%rsp)
	movl	%eax, top(%rip)
	je	.L31
	movl	%eax, end(%rip)
.L31:
	cmpb	$0, -3(%rsp)
	je	.L45
	movl	%r14d, ans(%rip)
.L45:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movl	$-1, %eax
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
.L65:
	.cfi_restore_state
	addq	%rdi, %rbp
	cmpl	%ebx, visited(,%rbp,4)
	jle	.L15
	movl	%ebx, visited(,%rbp,4)
	jmp	.L15
.L64:
	addq	%r13, %rbp
	cmpl	%ebx, visited(,%rbp,4)
	jle	.L32
	movl	%ebx, visited(,%rbp,4)
	jmp	.L32
.L63:
	addq	%r13, %rbp
	cmpl	%ebx, visited(,%rbp,4)
	jle	.L33
	movl	%ebx, visited(,%rbp,4)
	jmp	.L33
.L62:
	addq	%r13, %rbp
	cmpl	%ebx, visited(,%rbp,4)
	jle	.L34
	movl	%ebx, visited(,%rbp,4)
	jmp	.L34
.L21:
	addq	%r13, %rbp
	cmpl	%ebx, visited(,%rbp,4)
	jle	.L33
	movl	%ebx, visited(,%rbp,4)
	movslq	%eax, %rbp
	addl	$1, %eax
	leaq	0(%rbp,%rbp,2), %rbp
	movb	%r12b, -1(%rsp)
	movb	%dil, q(,%rbp,4)
	movb	%r10b, q+1(,%rbp,4)
	movq	%xmm0, q+4(,%rbp,4)
	cmpl	$10000000, %eax
	jne	.L33
	xorl	%eax, %eax
	jmp	.L33
.L28:
	addq	%rbp, %rdi
	cmpl	%ebx, visited(,%rdi,4)
	jle	.L15
	movl	%ebx, visited(,%rdi,4)
	movslq	%eax, %rdi
	addl	$1, %eax
	leaq	(%rdi,%rdi,2), %rdi
	movb	%r10b, -1(%rsp)
	movb	%dl, q(,%rdi,4)
	movb	%sil, q+1(,%rdi,4)
	movq	%xmm0, q+4(,%rdi,4)
	cmpl	$10000000, %eax
	jne	.L15
	xorl	%eax, %eax
	jmp	.L15
.L24:
	addq	%r13, %rbp
	cmpl	%ebx, visited(,%rbp,4)
	jle	.L32
	movl	%ebx, visited(,%rbp,4)
	movslq	%eax, %rbp
	addl	$1, %eax
	leaq	0(%rbp,%rbp,2), %rbp
	movb	%r12b, -1(%rsp)
	movb	%dil, q(,%rbp,4)
	movb	%r10b, q+1(,%rbp,4)
	movq	%xmm0, q+4(,%rbp,4)
	cmpl	$10000000, %eax
	jne	.L32
	xorl	%eax, %eax
	jmp	.L32
.L18:
	addq	%r13, %rbp
	cmpl	%ebx, visited(,%rbp,4)
	jle	.L34
	movl	%ebx, visited(,%rbp,4)
	movslq	%eax, %rbp
	addl	$1, %eax
	leaq	0(%rbp,%rbp,2), %rbp
	movb	%r12b, -1(%rsp)
	movb	%dil, q(,%rbp,4)
	movb	%r10b, q+1(,%rbp,4)
	movq	%xmm0, q+4(,%rbp,4)
	cmpl	$10000000, %eax
	jne	.L34
	xorl	%eax, %eax
	jmp	.L34
.L58:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE8:
	.size	bfs, .-bfs
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%d%d"
.LC2:
	.string	"%d"
.LC3:
	.string	"%s"
.LC4:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$visited, %edx
	movl	$242, %ecx
	movabsq	$3472328296227680304, %rax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %rdi
	movl	$H, %esi
	movl	$W, %edx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	$map, %r15d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	rep stosq
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	H(%rip), %ecx
	testl	%ecx, %ecx
	jle	.L78
	.p2align 4,,10
	.p2align 3
.L77:
	movq	%r15, %rsi
	movl	$.LC3, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	W(%rip), %esi
	testl	%esi, %esi
	jle	.L72
	movq	%r15, %rdx
	xorl	%edi, %edi
	xorl	%r8d, %r8d
	xorl	%eax, %eax
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L73:
	cmpb	$71, %cl
	jne	.L74
	movb	$46, (%rdx)
	movl	%eax, %ebx
	movl	%r12d, %ebp
	movl	$1, %r8d
.L74:
	addl	$1, %eax
	addq	$1, %rdx
	cmpl	%esi, %eax
	je	.L169
.L71:
	movzbl	(%rdx), %ecx
	cmpb	$83, %cl
	jne	.L73
	movl	%eax, %r14d
	addl	$1, %eax
	movb	$46, (%rdx)
	movl	%r12d, %r13d
	movl	$1, %edi
	addq	$1, %rdx
	cmpl	%esi, %eax
	jne	.L71
.L169:
	testb	%dil, %dil
	je	.L75
	movl	%r14d, SC(%rip)
	movl	%r13d, SR(%rip)
.L75:
	testb	%r8b, %r8b
	je	.L72
	movl	%ebx, GC(%rip)
	movl	%ebp, GR(%rip)
.L72:
	addl	$1, %r12d
	addq	$22, %r15
	cmpl	%r12d, H(%rip)
	jg	.L77
.L78:
	movl	$N, %esi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	movl	$484, %r14d
	call	__isoc99_scanf
	movl	N(%rip), %edx
	movl	$1, %r12d
	movq	$T+4, 8(%rsp)
	movl	$1, %ebp
	leal	1(%rdx), %eax
	cltq
	movl	$808464432, T(,%rax,4)
	testl	%edx, %edx
	jle	.L79
	.p2align 4,,10
	.p2align 3
.L89:
	movq	8(%rsp), %rsi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	H(%rip), %edx
	testl	%edx, %edx
	jle	.L86
	movq	%r14, %r15
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L82:
	addl	$1, %r13d
	addq	$22, %r15
	cmpl	%r13d, H(%rip)
	jle	.L170
.L80:
	xorl	%eax, %eax
	leaq	map(%r15), %rsi
	movl	$.LC3, %edi
	call	__isoc99_scanf
	testl	%ebx, %ebx
	jne	.L82
.L95:
	movslq	W(%rip), %rdx
	testl	%edx, %edx
	jle	.L83
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L85:
	cmpb	$46, map(%r15,%rax)
	cmove	%ebp, %ebx
	addq	$1, %rax
	cmpq	%rax, %rdx
	jne	.L85
	jmp	.L82
	.p2align 4,,10
	.p2align 3
.L170:
	testl	%ebx, %ebx
	je	.L86
	addq	$4, 8(%rsp)
	addl	$1, %r12d
	addq	$484, %r14
	cmpl	%r12d, N(%rip)
	jge	.L89
.L81:
	movl	N(%rip), %eax
	testl	%eax, %eax
	jle	.L79
	movslq	GR(%rip), %rsi
	movslq	%eax, %rdx
	movslq	GC(%rip), %rcx
	imulq	$484, %rdx, %rdx
	leaq	(%rsi,%rsi,4), %rdi
	leaq	(%rsi,%rdi,2), %rdi
	addq	%rdi, %rdi
	leaq	map(%rdx,%rdi), %rdx
	cmpb	$46, (%rdx,%rcx)
	je	.L79
	movl	%eax, %edx
	subl	$1, %edx
	je	.L90
	movslq	%edx, %r8
	imulq	$484, %r8, %r8
	leaq	map(%rdi,%r8), %r8
	cmpb	$46, (%r8,%rcx)
	je	.L90
	movl	%eax, %edx
	subl	$2, %edx
	je	.L90
	movslq	%edx, %r8
	imulq	$484, %r8, %r8
	leaq	map(%rdi,%r8), %r8
	cmpb	$46, (%r8,%rcx)
	je	.L90
	movl	%eax, %edx
	subl	$3, %edx
	je	.L90
	movslq	%edx, %r8
	imulq	$484, %r8, %r8
	leaq	map(%rdi,%r8), %rdi
	cmpb	$46, (%rdi,%rcx)
	je	.L90
	movl	%eax, %edx
	subl	$4, %edx
	je	.L90
	movslq	%edx, %rdi
	imulq	$22, %rsi, %r8
	imulq	$484, %rdi, %rdi
	leaq	map(%rdi,%r8), %rdi
	cmpb	$46, (%rdi,%rcx)
	je	.L90
	movl	%eax, %edx
	subl	$5, %edx
	je	.L90
	movslq	%edx, %r8
	imulq	$22, %rsi, %rdi
	imulq	$484, %r8, %r8
	leaq	map(%r8,%rdi), %r8
	cmpb	$46, (%r8,%rcx)
	je	.L90
	movl	%eax, %edx
	subl	$6, %edx
	je	.L90
	movslq	%edx, %r8
	imulq	$484, %r8, %r8
	leaq	map(%rdi,%r8), %r8
	cmpb	$46, (%r8,%rcx)
	je	.L90
	movl	%eax, %edx
	subl	$7, %edx
	je	.L90
	movslq	%edx, %r8
	imulq	$484, %r8, %r8
	leaq	map(%rdi,%r8), %r8
	cmpb	$46, (%r8,%rcx)
	je	.L90
	movl	%eax, %edx
	subl	$8, %edx
	je	.L90
	movslq	%edx, %r8
	imulq	$484, %r8, %r8
	leaq	map(%rdi,%r8), %r8
	cmpb	$46, (%r8,%rcx)
	je	.L90
	movl	%eax, %edx
	subl	$9, %edx
	je	.L90
	movslq	%edx, %r8
	imulq	$484, %r8, %r8
	leaq	map(%rdi,%r8), %rdi
	cmpb	$46, (%rdi,%rcx)
	je	.L90
	movl	%eax, %edx
	subl	$10, %edx
	je	.L90
	movslq	%edx, %r8
	imulq	$22, %rsi, %rdi
	imulq	$484, %r8, %r8
	leaq	map(%r8,%rdi), %r8
	cmpb	$46, (%r8,%rcx)
	je	.L90
	movl	%eax, %edx
	subl	$11, %edx
	je	.L90
	movslq	%edx, %r8
	imulq	$484, %r8, %r8
	leaq	map(%rdi,%r8), %r8
	cmpb	$46, (%r8,%rcx)
	je	.L90
	movl	%eax, %edx
	subl	$12, %edx
	je	.L90
	movslq	%edx, %r8
	imulq	$484, %r8, %r8
	leaq	map(%rdi,%r8), %r8
	cmpb	$46, (%r8,%rcx)
	je	.L90
	movl	%eax, %edx
	subl	$13, %edx
	je	.L90
	movslq	%edx, %r8
	imulq	$484, %r8, %r8
	leaq	map(%rdi,%r8), %r8
	cmpb	$46, (%r8,%rcx)
	je	.L90
	movl	%eax, %edx
	subl	$14, %edx
	je	.L90
	movslq	%edx, %r8
	imulq	$484, %r8, %r8
	leaq	map(%rdi,%r8), %rdi
	cmpb	$46, (%rdi,%rcx)
	je	.L90
	movl	%eax, %edx
	subl	$15, %edx
	je	.L90
	movslq	%edx, %rdi
	imulq	$22, %rsi, %rsi
	imulq	$484, %rdi, %rdi
	leaq	map(%rdi,%rsi), %rdi
	cmpb	$46, (%rdi,%rcx)
	je	.L90
	movl	%eax, %edx
	subl	$16, %edx
	je	.L90
	movslq	%edx, %rdi
	imulq	$484, %rdi, %rdi
	leaq	map(%rsi,%rdi), %rsi
	cmpb	$46, (%rsi,%rcx)
	je	.L90
	leal	-17(%rax), %edx
.L90:
	movl	%edx, N(%rip)
.L79:
	movslq	SR(%rip), %rax
	movslq	SC(%rip), %rdx
	xorl	%ebx, %ebx
	movl	$-1, ans(%rip)
	leaq	(%rax,%rax,4), %rcx
	leaq	(%rax,%rcx,2), %rax
	leaq	(%rdx,%rax,2), %rax
	movl	$0, visited(,%rax,4)
	movl	N(%rip), %eax
	testl	%eax, %eax
	js	.L94
	.p2align 4,,10
	.p2align 3
.L93:
	movl	%ebx, %edi
	addl	$1, %ebx
	call	bfs
	cmpl	%ebx, N(%rip)
	jge	.L93
.L94:
	movl	ans(%rip), %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	addq	$24, %rsp
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
.L83:
	.cfi_restore_state
	addl	$1, %r13d
	addq	$22, %r15
	cmpl	%r13d, H(%rip)
	jle	.L86
	leaq	map(%r15), %rsi
	movl	$.LC3, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	jmp	.L95
.L86:
	subl	$1, %r12d
	movl	%r12d, N(%rip)
	jmp	.L81
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.globl	end
	.bss
	.align 4
	.type	end, @object
	.size	end, 4
end:
	.zero	4
	.globl	top
	.align 4
	.type	top, @object
	.size	top, 4
top:
	.zero	4
	.globl	q
	.align 32
	.type	q, @object
	.size	q, 120000024
q:
	.zero	120000024
	.globl	ans
	.align 4
	.type	ans, @object
	.size	ans, 4
ans:
	.zero	4
	.globl	visited
	.align 32
	.type	visited, @object
	.size	visited, 1936
visited:
	.zero	1936
	.globl	GC
	.align 4
	.type	GC, @object
	.size	GC, 4
GC:
	.zero	4
	.globl	GR
	.align 4
	.type	GR, @object
	.size	GR, 4
GR:
	.zero	4
	.globl	SC
	.align 4
	.type	SC, @object
	.size	SC, 4
SC:
	.zero	4
	.globl	SR
	.align 4
	.type	SR, @object
	.size	SR, 4
SR:
	.zero	4
	.globl	mv
	.data
	.align 32
	.type	mv, @object
	.size	mv, 32
mv:
	.long	-1
	.long	0
	.long	1
	.long	0
	.long	0
	.long	-1
	.long	0
	.long	1
	.globl	T
	.bss
	.align 32
	.type	T, @object
	.size	T, 68
T:
	.zero	68
	.globl	map
	.align 32
	.type	map, @object
	.size	map, 8228
map:
	.zero	8228
	.globl	N
	.align 4
	.type	N, @object
	.size	N, 4
N:
	.zero	4
	.globl	W
	.align 4
	.type	W, @object
	.size	W, 4
W:
	.zero	4
	.globl	H
	.align 4
	.type	H, @object
	.size	H, 4
H:
	.zero	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	1
	.long	1
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
