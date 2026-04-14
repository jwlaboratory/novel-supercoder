	.file	"inputC.c"
	.text
	.p2align 4
	.globl	cmp
	.type	cmp, @function
cmp:
.LFB9:
	.cfi_startproc
	movsbl	24(%rsi), %eax
	movsbl	24(%rdi), %edx
	cmpb	%dl, %al
	je	.L2
	subl	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	movsd	8(%rdi), %xmm0
	subsd	8(%rsi), %xmm0
	xorl	%eax, %eax
	movsd	.LC1(%rip), %xmm2
	movapd	%xmm0, %xmm1
	andpd	.LC0(%rip), %xmm1
	comisd	%xmm1, %xmm2
	jnb	.L1
	pxor	%xmm1, %xmm1
	comisd	%xmm0, %xmm1
	sbbl	%eax, %eax
	andl	$2, %eax
	subl	$1, %eax
.L1:
	ret
	.cfi_endproc
.LFE9:
	.size	cmp, .-cmp
	.p2align 4
	.globl	equ2
	.type	equ2, @function
equ2:
.LFB8:
	.cfi_startproc
	movapd	%xmm0, %xmm4
	movsd	.LC3(%rip), %xmm0
	movapd	%xmm1, %xmm3
	mulsd	%xmm1, %xmm3
	mulsd	%xmm4, %xmm0
	mulsd	%xmm2, %xmm0
	subsd	%xmm0, %xmm3
	comisd	.LC1(%rip), %xmm3
	ja	.L10
	pxor	%xmm0, %xmm0
	comisd	%xmm0, %xmm3
	jb	.L14
.L10:
	sqrtsd	%xmm3, %xmm3
	addsd	%xmm4, %xmm4
	movapd	%xmm3, %xmm0
	subsd	%xmm1, %xmm0
	divsd	%xmm4, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	pxor	%xmm0, %xmm0
	ret
	.cfi_endproc
.LFE8:
	.size	equ2, .-equ2
	.p2align 4
	.globl	hit
	.type	hit, @function
hit:
.LFB10:
	.cfi_startproc
	movslq	%edi, %rdi
	movapd	%xmm0, %xmm3
	pxor	%xmm4, %xmm4
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	salq	$5, %rdi
	movsd	%xmm1, 24(%rsp)
	movsd	ufo(%rdi), %xmm0
	cvtsi2sdl	ufo+16(%rdi), %xmm4
	movsd	ufo+8(%rdi), %xmm2
	subsd	%xmm3, %xmm0
	movsd	%xmm2, 16(%rsp)
	movsd	%xmm4, 8(%rsp)
	call	cos
	movsd	16(%rsp), %xmm2
	movsd	.LC4(%rip), %xmm3
	movsd	8(%rsp), %xmm4
	movsd	24(%rsp), %xmm1
	mulsd	%xmm2, %xmm3
	mulsd	%xmm4, %xmm4
	mulsd	%xmm2, %xmm2
	mulsd	%xmm0, %xmm3
	subsd	%xmm4, %xmm2
	mulsd	.LC3(%rip), %xmm2
	movsd	.LC1(%rip), %xmm4
	movapd	%xmm3, %xmm0
	mulsd	%xmm3, %xmm0
	subsd	%xmm2, %xmm0
	comisd	%xmm4, %xmm0
	ja	.L16
	pxor	%xmm2, %xmm2
	comisd	%xmm2, %xmm0
	jb	.L24
.L16:
	sqrtsd	%xmm0, %xmm0
	subsd	%xmm3, %xmm0
	mulsd	.LC5(%rip), %xmm0
.L17:
	movapd	%xmm0, %xmm2
	xorl	%eax, %eax
	subsd	%xmm1, %xmm2
	andpd	.LC0(%rip), %xmm2
	comisd	%xmm4, %xmm2
	jbe	.L15
	xorl	%eax, %eax
	comisd	%xmm1, %xmm0
	setnb	%al
.L15:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L24:
	.cfi_restore_state
	pxor	%xmm0, %xmm0
	jmp	.L17
	.cfi_endproc
.LFE10:
	.size	hit, .-hit
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"%d%d%d%d"
.LC7:
	.string	"%d\n"
.LC8:
	.string	"%d%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	.p2align 4,,10
	.p2align 3
.L28:
	xorl	%eax, %eax
	movl	$n, %edx
	leaq	60(%rsp), %rsi
	movl	$.LC8, %edi
	call	__isoc99_scanf
	testl	%eax, %eax
	je	.L60
	movl	60(%rsp), %eax
	testl	%eax, %eax
	je	.L60
	pxor	%xmm7, %xmm7
	cvtsi2sdl	%eax, %xmm7
	movl	n(%rip), %eax
	movl	%eax, m(%rip)
	movsd	%xmm7, 24(%rsp)
	testl	%eax, %eax
	jle	.L62
	movl	$0, 44(%rsp)
	movl	$ufo+20, %ebx
	xorl	%r13d, %r13d
	xorl	%r15d, %r15d
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L82:
	addl	$1, 44(%rsp)
	pxor	%xmm0, %xmm0
	subl	$1, m(%rip)
	movb	$0, 4(%rbx)
	movq	$0x000000000, -20(%rbx)
.L31:
	sqrtsd	%xmm0, %xmm0
.L34:
	pxor	%xmm1, %xmm1
	movl	n(%rip), %r14d
	addl	$1, %r13d
	addq	$32, %rbx
	cvtsi2sdl	-32(%rbx), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -44(%rbx)
	cmpl	%r13d, %r14d
	jle	.L81
.L35:
	xorl	%eax, %eax
	leaq	-4(%rbx), %rcx
	movq	%rbx, %r8
	movl	$.LC6, %edi
	leaq	56(%rsp), %rdx
	leaq	52(%rsp), %rsi
	call	__isoc99_scanf
	movl	52(%rsp), %r12d
	movl	56(%rsp), %r14d
	movb	$1, 4(%rbx)
	movl	%r12d, %eax
	orl	%r14d, %eax
	je	.L82
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%r14d, %xmm0
	cvtsi2sdl	%r12d, %xmm1
	imull	%r14d, %r14d
	imull	%r12d, %r12d
	call	atan2
	movq	%r15, %xmm5
	addl	%r14d, %r12d
	movsd	%xmm0, -20(%rbx)
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%r12d, %xmm0
	ucomisd	%xmm0, %xmm5
	jbe	.L31
	call	sqrt
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L81:
	movl	m(%rip), %eax
	testl	%eax, %eax
	jle	.L29
	.p2align 4,,10
	.p2align 3
.L59:
	movslq	%r14d, %rsi
	movl	$cmp, %ecx
	movl	$32, %edx
	movl	$ufo, %edi
	call	qsort
	movl	n(%rip), %r14d
	movl	m(%rip), %ecx
	testl	%r14d, %r14d
	jle	.L37
	movl	m(%rip), %esi
	movl	$ufo+24, %edx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	movl	%esi, %r15d
.L44:
	cmpb	$0, (%rdx)
	je	.L38
	movsd	-16(%rdx), %xmm1
	movsd	24(%rsp), %xmm6
	movsd	.LC1(%rip), %xmm7
	movapd	%xmm1, %xmm0
	subsd	%xmm6, %xmm0
	andpd	.LC0(%rip), %xmm0
	comisd	%xmm0, %xmm7
	jnb	.L39
	comisd	%xmm1, %xmm6
	jnb	.L39
	testb	%cl, %cl
	cltq
	cmove	%esi, %r15d
	salq	$5, %rax
	movsd	ufo(%rax), %xmm5
	movb	$0, ufo+24(%rax)
	subl	$1, %r15d
	movl	%r15d, m(%rip)
	movsd	%xmm5, 32(%rsp)
.L43:
	movslq	%r14d, %rdx
	movl	$ufo, %ebx
	movb	$0, 43(%rsp)
	movl	%r15d, %r12d
	salq	$5, %rdx
	movq	%rdx, %r13
	leaq	(%rdx,%rbx), %rbp
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L46:
	addq	$32, %rbx
	cmpq	%rbp, %rbx
	je	.L83
.L52:
	cmpb	$0, 24(%rbx)
	je	.L46
	pxor	%xmm3, %xmm3
	movsd	(%rbx), %xmm0
	subsd	32(%rsp), %xmm0
	cvtsi2sdl	16(%rbx), %xmm3
	movsd	8(%rbx), %xmm1
	movsd	%xmm1, 16(%rsp)
	movsd	%xmm3, 8(%rsp)
	call	cos
	movsd	16(%rsp), %xmm1
	movsd	.LC4(%rip), %xmm2
	movsd	8(%rsp), %xmm3
	mulsd	%xmm1, %xmm2
	mulsd	%xmm3, %xmm3
	mulsd	%xmm1, %xmm1
	mulsd	%xmm0, %xmm2
	subsd	%xmm3, %xmm1
	mulsd	.LC3(%rip), %xmm1
	movapd	%xmm2, %xmm0
	mulsd	%xmm2, %xmm0
	subsd	%xmm1, %xmm0
	comisd	.LC1(%rip), %xmm0
	ja	.L47
	pxor	%xmm7, %xmm7
	comisd	%xmm7, %xmm0
	jb	.L79
.L47:
	sqrtsd	%xmm0, %xmm0
	subsd	%xmm2, %xmm0
	mulsd	.LC5(%rip), %xmm0
.L48:
	movsd	24(%rsp), %xmm4
	movapd	%xmm0, %xmm1
	subsd	%xmm4, %xmm1
	andpd	.LC0(%rip), %xmm1
	comisd	.LC1(%rip), %xmm1
	jbe	.L46
	comisd	%xmm4, %xmm0
	jb	.L46
	movb	$0, 24(%rbx)
	addq	$32, %rbx
	subl	$1, %r12d
	movb	$1, 43(%rsp)
	cmpq	%rbp, %rbx
	jne	.L52
	.p2align 4,,10
	.p2align 3
.L83:
	cmpb	$0, 43(%rsp)
	je	.L65
	movl	%r12d, m(%rip)
.L53:
	movl	%r12d, %ecx
	xorl	%eax, %eax
	pxor	%xmm2, %xmm2
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L57:
	cmpb	$0, ufo+24(%rax)
	je	.L56
	pxor	%xmm1, %xmm1
	movsd	ufo+8(%rax), %xmm0
	cvtsi2sdl	ufo+20(%rax), %xmm1
	subsd	%xmm1, %xmm0
	comisd	%xmm0, %xmm2
	movsd	%xmm0, ufo+8(%rax)
	jb	.L56
	addl	$1, 44(%rsp)
	subl	$1, %ecx
	movl	$1, %esi
	movb	$0, ufo+24(%rax)
.L56:
	addq	$32, %rax
	cmpq	%r13, %rax
	jne	.L57
	testb	%sil, %sil
	je	.L66
	movl	%ecx, m(%rip)
.L37:
	testl	%ecx, %ecx
	jg	.L59
.L29:
	movl	44(%rsp), %esi
	movl	$.LC7, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L39:
	addl	$1, 44(%rsp)
	subl	$1, %r15d
	movl	$1, %ecx
	movb	$0, (%rdx)
.L38:
	addl	$1, %eax
	addq	$32, %rdx
	cmpl	%r14d, %eax
	jne	.L44
	testb	%cl, %cl
	je	.L63
	movl	%r15d, m(%rip)
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L79:
	pxor	%xmm0, %xmm0
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L65:
	movl	%r15d, %r12d
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L66:
	movl	%r12d, %ecx
	testl	%ecx, %ecx
	jg	.L59
	jmp	.L29
.L63:
	movl	%esi, %r15d
	jmp	.L43
.L60:
	addq	$72, %rsp
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
.L62:
	.cfi_restore_state
	movl	$0, 44(%rsp)
	movl	44(%rsp), %esi
	movl	$.LC7, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L28
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.globl	m
	.bss
	.align 4
	.type	m, @object
	.size	m, 4
m:
	.zero	4
	.globl	n
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.globl	ufo
	.align 32
	.type	ufo, @object
	.size	ufo, 3296
ufo:
	.zero	3296
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	-1698910392
	.long	1048238066
	.align 8
.LC3:
	.long	0
	.long	1074790400
	.align 8
.LC4:
	.long	0
	.long	-1073741824
	.align 8
.LC5:
	.long	0
	.long	1071644672
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
