	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d"
.LC1:
	.string	"%d"
.LC2:
	.string	" %d"
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.p2align 4,,10
	.p2align 3
.L2:
	xorl	%eax, %eax
	leaq	20(%rsp), %rsi
	movl	$.LC1, %edi
	call	__isoc99_scanf
	testl	%eax, %eax
	je	.L91
	movl	20(%rsp), %eax
	testl	%eax, %eax
	jle	.L91
	movl	$40, %ecx
	movl	$h, %edi
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	rep stosq
	movl	$0, (%rdi)
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L8:
	leaq	(%rdi,%rdi,2), %rbx
	leaq	0(,%r8,8), %rbp
	salq	$4, %rbx
	subq	%r8, %rbp
	addq	%rdi, %rbx
	movzbl	dice+3(%rbp,%rbx), %eax
	cmpb	$6, %al
	je	.L134
.L10:
	leaq	0(,%r8,8), %rbx
	subq	%r8, %rbx
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	addq	%r8, %rdi
	leaq	dice(%rbx,%rdi), %rdi
	movzbl	4(%rdi), %r14d
	cmpb	$6, %r14b
	je	.L135
	movzbl	5(%rdi), %edi
	cmpb	$6, %dil
	je	.L13
	cmpb	$5, %r9b
	je	.L14
	cmpb	$5, %al
	je	.L19
	cmpb	$5, %r14b
	jne	.L16
.L26:
	movl	mv+32(%rip), %r12d
	movl	mv+36(%rip), %ebx
	addl	%ecx, %r12d
	addl	%esi, %ebx
	movslq	%r12d, %r8
	movslq	%ebx, %rbp
	leaq	(%r8,%r8,8), %r8
	addq	%rbp, %r8
	movl	h(,%r8,4), %r8d
	cmpl	%r8d, %edx
	jg	.L21
	cmpb	$5, %dil
	je	.L31
	cmpb	$4, %r9b
	je	.L22
	cmpb	$4, %al
	je	.L23
	.p2align 4,,10
	.p2align 3
.L34:
	cmpb	$4, %dil
	je	.L40
.L132:
	movl	12(%rsp), %eax
	testb	%r15b, %r15b
	jne	.L136
.L42:
	addl	$1, %edx
.L4:
	leaq	(%rcx,%rcx,8), %rcx
	addl	$1, %r13d
	movb	%al, map(%rsi,%rcx)
	addq	%rsi, %rcx
	movl	%edx, h(,%rcx,4)
	cmpl	%r13d, 20(%rsp)
	jle	.L137
.L43:
	leaq	28(%rsp), %rdx
	leaq	24(%rsp), %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	h+160(%rip), %edx
	movl	24(%rsp), %eax
	testl	%edx, %edx
	je	.L138
	movl	%eax, 12(%rsp)
	movl	28(%rsp), %r11d
	movl	%eax, %r10d
	xorl	%r15d, %r15d
	movl	$4, %esi
	movl	$4, %ecx
.L5:
	movslq	%r10d, %rdi
	movslq	%r11d, %r8
	leaq	(%rdi,%rdi,2), %r9
	leaq	0(,%r8,8), %rbx
	salq	$4, %r9
	subq	%r8, %rbx
	addq	%rdi, %r9
	movzbl	dice+2(%rbx,%r9), %r9d
	cmpb	$6, %r9b
	jne	.L8
	movl	mv+16(%rip), %ebp
	movl	mv+20(%rip), %r12d
	addl	%ecx, %ebp
	addl	%esi, %r12d
	movslq	%ebp, %rbx
	movslq	%r12d, %r14
	leaq	(%rbx,%rbx,8), %rbx
	addq	%r14, %rbx
	movl	h(,%rbx,4), %ebx
	cmpl	%edx, %ebx
	jge	.L8
	movl	%ebx, %edx
	movslq	%r12d, %rsi
	movslq	%ebp, %rcx
.L9:
	movl	$7, %edi
	subl	%r11d, %edi
	movl	%r10d, %r11d
	movl	%edi, %r10d
.L6:
	movl	$1, %r15d
	testl	%edx, %edx
	jne	.L5
	movl	%r10d, 24(%rsp)
	movl	%r10d, %eax
	movl	$1, %edx
	movl	%r11d, 28(%rsp)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L134:
	movl	mv+24(%rip), %ebp
	movl	mv+28(%rip), %r12d
	addl	%ecx, %ebp
	addl	%esi, %r12d
	movslq	%ebp, %rbx
	movslq	%r12d, %r14
	leaq	(%rbx,%rbx,8), %rbx
	addq	%r14, %rbx
	movl	h(,%rbx,4), %ebx
	cmpl	%edx, %ebx
	jge	.L10
	movl	%ebx, %edx
	movslq	%r12d, %rsi
	movslq	%ebp, %rcx
	movl	$1, %r10d
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L135:
	movl	mv+32(%rip), %ebx
	movl	mv+36(%rip), %ebp
	addl	%ecx, %ebx
	addl	%esi, %ebp
	movslq	%ebx, %r8
	movslq	%ebp, %r12
	leaq	(%r8,%r8,8), %r8
	addq	%r12, %r8
	movl	h(,%r8,4), %r8d
	cmpl	%edx, %r8d
	jl	.L12
	movzbl	5(%rdi), %edi
	cmpb	$6, %dil
	je	.L13
	cmpb	$5, %r9b
	je	.L14
	cmpb	$5, %al
	je	.L139
.L16:
	cmpb	$5, %dil
	jne	.L20
.L31:
	movl	mv+40(%rip), %r8d
	movl	mv+44(%rip), %ebx
	addl	%ecx, %r8d
	addl	%esi, %ebx
	movslq	%r8d, %rdi
	movslq	%ebx, %rbp
	leaq	(%rdi,%rdi,8), %rdi
	addq	%rbp, %rdi
	movl	h(,%rdi,4), %edi
	cmpl	%edi, %edx
	jg	.L67
	cmpb	$4, %r9b
	je	.L68
.L57:
	cmpb	$4, %al
	je	.L69
	cmpb	$4, %r14b
	jne	.L132
	movl	mv+32(%rip), %r9d
	movl	mv+36(%rip), %ebx
	addl	%ecx, %r9d
	addl	%esi, %ebx
	movslq	%r9d, %rdi
	movslq	%ebx, %r8
	leaq	(%rdi,%rdi,8), %rdi
	addq	%r8, %rdi
	movl	h(,%rdi,4), %r8d
	cmpl	%edx, %r8d
	jge	.L132
.L39:
	movsbl	%al, %r10d
	movl	%r8d, %edx
	movslq	%ebx, %rsi
	movslq	%r9d, %rcx
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L14:
	movl	mv+16(%rip), %ebx
	movl	mv+20(%rip), %ebp
	addl	%ecx, %ebx
	addl	%esi, %ebp
	movslq	%ebx, %r8
	movslq	%ebp, %r12
	leaq	(%r8,%r8,8), %r8
	addq	%r12, %r8
	movl	h(,%r8,4), %r8d
	cmpl	%r8d, %edx
	jg	.L66
	cmpb	$5, %al
	je	.L19
	cmpb	$5, %r14b
	je	.L26
	cmpb	$5, %dil
	je	.L140
.L28:
	cmpb	$4, %al
	je	.L35
.L33:
	cmpb	$4, %r14b
	jne	.L34
	movl	mv+32(%rip), %r9d
	movl	mv+36(%rip), %ebx
	addl	%ecx, %r9d
	addl	%esi, %ebx
	movslq	%r9d, %r8
	movslq	%ebx, %rbp
	leaq	(%r8,%r8,8), %r8
	addq	%rbp, %r8
	movl	h(,%r8,4), %r8d
	cmpl	%r8d, %edx
	jg	.L39
	cmpb	$4, %dil
	jne	.L132
.L40:
	movl	mv+40(%rip), %r8d
	movl	mv+44(%rip), %r9d
	addl	%ecx, %r8d
	addl	%esi, %r9d
	movslq	%r8d, %rdi
	movslq	%r9d, %rbx
	leaq	(%rdi,%rdi,8), %rdi
	addq	%rbx, %rdi
	movl	h(,%rdi,4), %edi
	cmpl	%edi, %edx
	jle	.L132
	movl	%edi, %edx
	movslq	%r9d, %rsi
	movslq	%r8d, %rcx
.L18:
	movl	$7, %edi
	subl	%r10d, %edi
	movl	%r11d, %r10d
	movl	%edi, %r11d
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L13:
	movl	mv+40(%rip), %r8d
	movl	mv+44(%rip), %ebx
	addl	%ecx, %r8d
	addl	%esi, %ebx
	movslq	%r8d, %rdi
	movslq	%ebx, %rbp
	leaq	(%rdi,%rdi,8), %rdi
	addq	%rbp, %rdi
	movl	h(,%rdi,4), %edi
	cmpl	%edx, %edi
	jl	.L67
	movl	$6, %edi
	cmpb	$5, %r9b
	je	.L14
	cmpb	$5, %al
	je	.L19
	cmpb	$5, %r14b
	je	.L141
.L20:
	cmpb	$4, %r9b
	jne	.L28
.L22:
	movl	mv+16(%rip), %r9d
	movl	mv+20(%rip), %ebx
	addl	%ecx, %r9d
	addl	%esi, %ebx
	movslq	%r9d, %r8
	movslq	%ebx, %rbp
	leaq	(%r8,%r8,8), %r8
	addq	%rbp, %r8
	movl	h(,%r8,4), %r8d
	cmpl	%r8d, %edx
	jle	.L28
	movl	%r8d, %edx
	movslq	%ebx, %rsi
	movslq	%r9d, %rcx
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L19:
	movl	mv+24(%rip), %r12d
	movl	mv+28(%rip), %ebx
	addl	%ecx, %r12d
	addl	%esi, %ebx
	movslq	%r12d, %r8
	movslq	%ebx, %rbp
	leaq	(%r8,%r8,8), %r8
	addq	%rbp, %r8
	movl	h(,%r8,4), %r8d
	cmpl	%r8d, %edx
	jg	.L30
	cmpb	$5, %r14b
	je	.L26
	cmpb	$5, %dil
	je	.L31
	cmpb	$4, %r9b
	jne	.L33
.L32:
	movl	mv+16(%rip), %ebx
	movl	mv+20(%rip), %r9d
	addl	%ecx, %ebx
	addl	%esi, %r9d
	movslq	%ebx, %r8
	movslq	%r9d, %rbp
	leaq	(%r8,%r8,8), %r8
	addq	%rbp, %r8
	movl	h(,%r8,4), %r8d
	cmpl	%edx, %r8d
	jge	.L33
	movl	%r8d, %edx
	movslq	%r9d, %rsi
	movslq	%ebx, %rcx
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L69:
	movl	$5, %edi
.L35:
	movl	mv+24(%rip), %r9d
	movl	mv+28(%rip), %ebx
	addl	%ecx, %r9d
	addl	%esi, %ebx
	movslq	%r9d, %r8
	movslq	%ebx, %rbp
	leaq	(%r8,%r8,8), %r8
	addq	%rbp, %r8
	movl	h(,%r8,4), %r8d
	cmpl	%r8d, %edx
	jle	.L33
.L38:
	movl	%r8d, %edx
	movslq	%ebx, %rsi
	movslq	%r9d, %rcx
	movl	$3, %r10d
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L136:
	movl	%r10d, 24(%rsp)
	movl	%r10d, %eax
	movl	%r11d, 28(%rsp)
	jmp	.L42
.L137:
	pxor	%xmm0, %xmm0
	movl	$h, %eax
	movl	$map, %edx
	movl	$h+288, %esi
	movaps	%xmm0, ans(%rip)
	movups	%xmm0, ans+12(%rip)
	.p2align 4,,10
	.p2align 3
.L52:
	movl	(%rax), %ebp
	testl	%ebp, %ebp
	jle	.L44
	movsbq	(%rdx), %rcx
	addl	$1, ans(,%rcx,4)
.L44:
	movl	4(%rax), %ebx
	testl	%ebx, %ebx
	jle	.L45
	movsbq	1(%rdx), %rcx
	addl	$1, ans(,%rcx,4)
.L45:
	movl	8(%rax), %r11d
	testl	%r11d, %r11d
	jle	.L46
	movsbq	2(%rdx), %rcx
	addl	$1, ans(,%rcx,4)
.L46:
	movl	12(%rax), %r10d
	testl	%r10d, %r10d
	jle	.L47
	movsbq	3(%rdx), %rcx
	addl	$1, ans(,%rcx,4)
.L47:
	movl	16(%rax), %r9d
	testl	%r9d, %r9d
	jle	.L48
	movsbq	4(%rdx), %rcx
	addl	$1, ans(,%rcx,4)
.L48:
	movl	20(%rax), %r8d
	testl	%r8d, %r8d
	jle	.L49
	movsbq	5(%rdx), %rcx
	addl	$1, ans(,%rcx,4)
.L49:
	movl	24(%rax), %edi
	testl	%edi, %edi
	jle	.L50
	movsbq	6(%rdx), %rcx
	addl	$1, ans(,%rcx,4)
.L50:
	movl	28(%rax), %ecx
	testl	%ecx, %ecx
	jle	.L51
	movsbq	7(%rdx), %rcx
	addl	$1, ans(,%rcx,4)
.L51:
	addq	$36, %rax
	addq	$9, %rdx
	cmpq	%rax, %rsi
	jne	.L52
	movl	ans+4(%rip), %esi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	movl	$2, %ebx
	call	printf
	.p2align 4,,10
	.p2align 3
.L53:
	movl	ans(,%rbx,4), %esi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	printf
	cmpq	$7, %rbx
	jne	.L53
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	putc
	jmp	.L2
.L68:
	movl	$5, %edi
	jmp	.L22
.L138:
	movl	$1, %edx
	movl	$4, %esi
	movl	$4, %ecx
	jmp	.L4
.L139:
	movl	mv+24(%rip), %r12d
	movl	mv+28(%rip), %ebx
	addl	%ecx, %r12d
	addl	%esi, %ebx
	movslq	%r12d, %r8
	movslq	%ebx, %rbp
	leaq	(%r8,%r8,8), %r8
	addq	%rbp, %r8
	movl	h(,%r8,4), %r8d
	cmpl	%edx, %r8d
	jl	.L30
	cmpb	$5, %dil
	je	.L31
	cmpb	$4, %r9b
	jne	.L34
	jmp	.L32
.L141:
	movl	mv+32(%rip), %r12d
	movl	mv+36(%rip), %ebx
	addl	%ecx, %r12d
	addl	%esi, %ebx
	movslq	%r12d, %r8
	movslq	%ebx, %rbp
	leaq	(%r8,%r8,8), %r8
	addq	%rbp, %r8
	movl	h(,%r8,4), %r8d
	cmpl	%edx, %r8d
	jl	.L21
	cmpb	$4, %r9b
	je	.L22
	cmpb	$4, %al
	jne	.L132
.L23:
	movl	mv+24(%rip), %r9d
	movl	mv+28(%rip), %ebx
	addl	%ecx, %r9d
	addl	%esi, %ebx
	movslq	%r9d, %r8
	movslq	%ebx, %rbp
	leaq	(%r8,%r8,8), %r8
	addq	%rbp, %r8
	movl	h(,%r8,4), %r8d
	cmpl	%r8d, %edx
	jle	.L34
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L140:
	movl	mv+40(%rip), %r9d
	movl	mv+44(%rip), %r8d
	addl	%ecx, %r9d
	addl	%esi, %r8d
	movslq	%r9d, %rdi
	movslq	%r8d, %rbx
	leaq	(%rdi,%rdi,8), %rdi
	addq	%rbx, %rdi
	movl	h(,%rdi,4), %edi
	cmpl	%edx, %edi
	jge	.L57
	movl	%edi, %edx
	movslq	%r8d, %rsi
	movslq	%r9d, %rcx
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L67:
	movl	%edi, %edx
	movslq	%ebx, %rsi
	movslq	%r8d, %rcx
	jmp	.L18
.L12:
	movsbl	%al, %r10d
	movl	%r8d, %edx
	movslq	%ebp, %rsi
	movslq	%ebx, %rcx
	jmp	.L6
.L66:
	movl	%r8d, %edx
	movslq	%ebp, %rsi
	movslq	%ebx, %rcx
	jmp	.L9
.L30:
	movl	%r8d, %edx
	movslq	%ebx, %rsi
	movslq	%r12d, %rcx
	movl	$2, %r10d
	jmp	.L6
.L21:
	movsbl	%al, %r10d
	movl	%r8d, %edx
	movslq	%ebx, %rsi
	movslq	%r12d, %rcx
	jmp	.L6
.L91:
	addq	$40, %rsp
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
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.globl	ans
	.bss
	.align 16
	.type	ans, @object
	.size	ans, 28
ans:
	.zero	28
	.globl	mv
	.data
	.align 32
	.type	mv, @object
	.size	mv, 56
mv:
	.long	0
	.zero	4
	.long	0
	.zero	4
	.long	1
	.long	0
	.long	0
	.long	1
	.long	0
	.long	-1
	.long	-1
	.long	0
	.long	0
	.zero	4
	.globl	dice
	.align 32
	.type	dice, @object
	.size	dice, 343
dice:
	.string	""
	.string	""
	.zero	5
	.string	""
	.string	""
	.zero	5
	.string	""
	.string	""
	.zero	5
	.string	""
	.string	""
	.zero	5
	.string	""
	.string	""
	.zero	5
	.string	""
	.string	""
	.zero	5
	.string	""
	.string	""
	.zero	5
	.string	""
	.string	""
	.zero	5
	.string	""
	.string	""
	.zero	5
	.string	""
	.ascii	"\001\002\003\004\005\006"
	.string	""
	.ascii	"\001\003\005\002\004\006"
	.string	""
	.ascii	"\001\004\002\005\003\006"
	.string	""
	.ascii	"\001\005\004\003\002\006"
	.string	""
	.string	""
	.zero	5
	.string	""
	.string	""
	.zero	5
	.string	""
	.ascii	"\002\001\004\003\006\005"
	.string	""
	.string	""
	.zero	5
	.string	""
	.ascii	"\002\003\001\006\004\005"
	.string	""
	.ascii	"\002\004\006\001\003\005"
	.string	""
	.string	""
	.zero	5
	.string	""
	.ascii	"\002\006\003\004\001\005"
	.string	""
	.string	""
	.zero	5
	.string	""
	.ascii	"\003\001\002\005\006\004"
	.string	""
	.ascii	"\003\002\006\001\005\004"
	.string	""
	.string	""
	.zero	5
	.string	""
	.string	""
	.zero	5
	.string	""
	.ascii	"\003\005\001\006\002\004"
	.string	""
	.ascii	"\003\006\005\002\001\004"
	.string	""
	.string	""
	.zero	5
	.string	""
	.ascii	"\004\001\005\002\006\003"
	.string	""
	.ascii	"\004\002\001\006\005\003"
	.string	""
	.string	""
	.zero	5
	.string	""
	.string	""
	.zero	5
	.string	""
	.ascii	"\004\005\006\001\002\003"
	.string	""
	.ascii	"\004\006\002\005\001\003"
	.string	""
	.string	""
	.zero	5
	.string	""
	.ascii	"\005\001\003\004\006\002"
	.string	""
	.string	""
	.zero	5
	.string	""
	.ascii	"\005\003\006\001\004\002"
	.string	""
	.ascii	"\005\004\001\006\003\002"
	.string	""
	.string	""
	.zero	5
	.string	""
	.ascii	"\005\006\004\003\001\002"
	.string	""
	.string	""
	.zero	5
	.string	""
	.string	""
	.zero	5
	.string	""
	.ascii	"\006\002\004\003\005\001"
	.string	""
	.ascii	"\006\003\002\005\004\001"
	.string	""
	.ascii	"\006\004\005\002\003\001"
	.string	""
	.ascii	"\006\005\003\004\002\001"
	.string	""
	.string	""
	.zero	5
	.globl	h
	.bss
	.align 32
	.type	h, @object
	.size	h, 324
h:
	.zero	324
	.globl	map
	.align 32
	.type	map, @object
	.size	map, 81
map:
	.zero	81
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
