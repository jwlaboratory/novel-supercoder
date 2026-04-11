	.file	"inputC.c"
	.text
	.p2align 4
	.globl	insert
	.type	insert, @function
insert:
.LFB8:
	.cfi_startproc
	movslq	%esi, %rax
	salq	$32, %rdi
	movl	%edx, %r8d
	movq	hashend(%rip), %rcx
	leaq	(%rdi,%rax), %rsi
	movabsq	$-6357652102577862929, %rax
	imulq	%rsi
	movq	%rsi, %rax
	sarq	$63, %rax
	addq	%rsi, %rdx
	sarq	$19, %rdx
	subq	%rax, %rdx
	movq	%rsi, %rax
	imulq	$800011, %rdx, %rdx
	subq	%rdx, %rax
	salq	$4, %rax
	addq	$hash, %rax
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L5:
	cmpq	%rsi, %rdx
	je	.L3
	addq	$16, %rax
	movl	$hash, %edx
	cmpq	%rax, %rcx
	cmove	%rdx, %rax
.L4:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	jne	.L5
	movq	%rsi, (%rax)
.L3:
	addl	8(%rax), %r8d
	cmpl	ans(%rip), %r8d
	movl	%r8d, 8(%rax)
	jle	.L1
	movl	%r8d, ans(%rip)
.L1:
	ret
	.cfi_endproc
.LFE8:
	.size	insert, .-insert
	.p2align 4
	.globl	getint
	.type	getint, @function
getint:
.LFB9:
	.cfi_startproc
	movq	p(%rip), %rax
	movzbl	(%rax), %ecx
	cmpb	$45, %cl
	je	.L10
	addq	$1, %rax
	xorl	%edx, %edx
	cmpb	$47, %cl
	jle	.L9
	.p2align 4,,10
	.p2align 3
.L15:
	movq	%rax, p(%rip)
	leal	(%rdx,%rdx,4), %ecx
	movzbl	-1(%rax), %edx
	addq	$1, %rax
	andl	$15, %edx
	cmpb	$47, -1(%rax)
	leal	(%rdx,%rcx,2), %edx
	jg	.L15
.L9:
	movl	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	leaq	1(%rax), %rdx
	movq	%rdx, p(%rip)
	cmpb	$47, 1(%rax)
	jle	.L16
	leaq	2(%rax), %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L14:
	movq	%rdx, p(%rip)
	leal	(%rax,%rax,4), %ecx
	movzbl	-1(%rdx), %eax
	addq	$1, %rdx
	andl	$15, %eax
	cmpb	$47, -1(%rdx)
	leal	(%rax,%rcx,2), %eax
	jg	.L14
	negl	%eax
	movl	%eax, %edx
	movl	%edx, %eax
	ret
.L16:
	xorl	%edx, %edx
	jmp	.L9
	.cfi_endproc
.LFE9:
	.size	getint, .-getint
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d / 1\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$10, %esi
	movl	$buf, %edi
	movq	stdin(%rip), %rdx
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	$buf, p(%rip)
	call	fgets
	call	getint
	movl	$0, ans(%rip)
	testl	%eax, %eax
	jle	.L59
	movabsq	$-6357652102577862929, %rbp
	movl	%eax, %ebx
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L58:
	movq	stdin(%rip), %rdx
	movl	$35, %esi
	movl	$buf, %edi
	movq	$buf, p(%rip)
	call	fgets
	movq	p(%rip), %rdx
	movzbl	(%rdx), %eax
	cmpb	$45, %al
	je	.L22
	xorl	%r10d, %r10d
	cmpb	$47, %al
	jle	.L80
	.p2align 4,,10
	.p2align 3
.L23:
	addq	$1, %rdx
	leal	(%r10,%r10,4), %ecx
	movq	%rdx, p(%rip)
	movzbl	-1(%rdx), %eax
	andl	$15, %eax
	cmpb	$47, (%rdx)
	leal	(%rax,%rcx,2), %r10d
	jg	.L23
	leal	1000000001(%r10), %r9d
	addl	$1000000000, %r10d
	salq	$32, %r9
	salq	$32, %r10
.L24:
	leaq	1(%rdx), %rax
	movq	%rax, p(%rip)
	movzbl	1(%rdx), %ecx
	cmpb	$45, %cl
	je	.L27
	xorl	%r11d, %r11d
	cmpb	$47, %cl
	jle	.L81
	.p2align 4,,10
	.p2align 3
.L28:
	addq	$1, %rax
	leal	(%r11,%r11,4), %ecx
	movq	%rax, p(%rip)
	movzbl	-1(%rax), %edx
	andl	$15, %edx
	cmpb	$47, (%rax)
	leal	(%rdx,%rcx,2), %r11d
	jg	.L28
	leal	1000000001(%r11), %r8d
	addl	$1000000000, %r11d
	movslq	%r8d, %r8
	movslq	%r11d, %r11
.L29:
	leaq	1(%rax), %rdx
	movq	%rdx, p(%rip)
	movzbl	1(%rax), %edx
	cmpb	$45, %dl
	je	.L32
	addq	$2, %rax
	xorl	%esi, %esi
	cmpb	$47, %dl
	jle	.L34
	.p2align 4,,10
	.p2align 3
.L37:
	movq	%rax, p(%rip)
	movzbl	-1(%rax), %edx
	addq	$1, %rax
	leal	(%rsi,%rsi,4), %ecx
	andl	$15, %edx
	cmpb	$47, -1(%rax)
	leal	(%rdx,%rcx,2), %esi
	jg	.L37
.L34:
	leaq	(%r10,%r11), %rdi
	movq	hashend(%rip), %rcx
	movq	%rdi, %rax
	imulq	%rbp
	movq	%rdi, %rax
	sarq	$63, %rax
	addq	%rdi, %rdx
	sarq	$19, %rdx
	subq	%rax, %rdx
	movq	%rdi, %rax
	imulq	$800011, %rdx, %rdx
	subq	%rdx, %rax
	salq	$4, %rax
	addq	$hash, %rax
	jmp	.L40
	.p2align 4,,10
	.p2align 3
.L41:
	cmpq	%rdx, %rdi
	je	.L39
	addq	$16, %rax
	movl	$hash, %edx
	cmpq	%rcx, %rax
	cmove	%rdx, %rax
.L40:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	jne	.L41
	movq	%rdi, (%rax)
.L39:
	movl	8(%rax), %edx
	movl	ans(%rip), %edi
	addl	%esi, %edx
	movl	%edx, 8(%rax)
	cmpl	%edi, %edx
	jle	.L42
	movl	%edx, ans(%rip)
	movl	%edx, %edi
.L42:
	addq	%r9, %r11
	movq	%r11, %rax
	imulq	%rbp
	movq	%r11, %rax
	sarq	$63, %rax
	addq	%r11, %rdx
	sarq	$19, %rdx
	subq	%rax, %rdx
	movq	%r11, %rax
	imulq	$800011, %rdx, %rdx
	subq	%rdx, %rax
	salq	$4, %rax
	addq	$hash, %rax
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L46:
	cmpq	%rdx, %r11
	je	.L44
	addq	$16, %rax
	movl	$hash, %edx
	cmpq	%rcx, %rax
	cmove	%rdx, %rax
.L45:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	jne	.L46
	movq	%r11, (%rax)
.L44:
	movl	8(%rax), %edx
	addl	%esi, %edx
	movl	%edx, 8(%rax)
	cmpl	%edi, %edx
	jle	.L47
	movl	%edx, ans(%rip)
	movl	%edx, %edi
.L47:
	addq	%r8, %r10
	movq	%r10, %rax
	imulq	%rbp
	movq	%r10, %rax
	sarq	$63, %rax
	addq	%r10, %rdx
	sarq	$19, %rdx
	subq	%rax, %rdx
	movq	%r10, %rax
	imulq	$800011, %rdx, %rdx
	subq	%rdx, %rax
	salq	$4, %rax
	addq	$hash, %rax
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L51:
	cmpq	%rdx, %r10
	je	.L49
	addq	$16, %rax
	movl	$hash, %edx
	cmpq	%rcx, %rax
	cmove	%rdx, %rax
.L50:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	jne	.L51
	movq	%r10, (%rax)
.L49:
	movl	8(%rax), %edx
	addl	%esi, %edx
	movl	%edx, 8(%rax)
	cmpl	%edi, %edx
	jle	.L52
	movl	%edx, ans(%rip)
	movl	%edx, %edi
.L52:
	addq	%r9, %r8
	movq	%r8, %rax
	imulq	%rbp
	movq	%r8, %rax
	sarq	$63, %rax
	addq	%r8, %rdx
	sarq	$19, %rdx
	subq	%rax, %rdx
	movq	%r8, %rax
	imulq	$800011, %rdx, %rdx
	subq	%rdx, %rax
	salq	$4, %rax
	addq	$hash, %rax
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L56:
	cmpq	%rdx, %r8
	je	.L54
	addq	$16, %rax
	movl	$hash, %edx
	cmpq	%rcx, %rax
	cmove	%rdx, %rax
.L55:
	movq	(%rax), %rdx
	testq	%rdx, %rdx
	jne	.L56
	movq	%r8, (%rax)
.L54:
	addl	8(%rax), %esi
	movl	%esi, 8(%rax)
	cmpl	%edi, %esi
	jle	.L57
	movl	%esi, ans(%rip)
	movl	%esi, %edi
.L57:
	addl	$1, %r12d
	cmpl	%r12d, %ebx
	jne	.L58
.L21:
	movl	%edi, %esi
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	printf
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L32:
	.cfi_restore_state
	leaq	2(%rax), %rdx
	xorl	%esi, %esi
	movq	%rdx, p(%rip)
	cmpb	$47, 2(%rax)
	jle	.L35
	.p2align 4,,10
	.p2align 3
.L36:
	addq	$1, %rdx
	leal	(%rsi,%rsi,4), %ecx
	movq	%rdx, p(%rip)
	movzbl	-1(%rdx), %eax
	andl	$15, %eax
	cmpb	$47, (%rdx)
	leal	(%rax,%rcx,2), %esi
	jg	.L36
.L35:
	negl	%esi
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L27:
	leaq	2(%rdx), %rax
	movq	%rax, p(%rip)
	cmpb	$47, 2(%rdx)
	movl	$0, %edx
	jle	.L30
	.p2align 4,,10
	.p2align 3
.L31:
	addq	$1, %rax
	leal	(%rdx,%rdx,4), %ecx
	movq	%rax, p(%rip)
	movzbl	-1(%rax), %edx
	andl	$15, %edx
	cmpb	$47, (%rax)
	leal	(%rdx,%rcx,2), %edx
	jg	.L31
.L30:
	movl	$1000000001, %r8d
	movl	$1000000000, %r11d
	subl	%edx, %r8d
	subl	%edx, %r11d
	movslq	%r8d, %r8
	movslq	%r11d, %r11
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L22:
	leaq	1(%rdx), %rax
	movq	%rax, p(%rip)
	cmpb	$47, 1(%rdx)
	jle	.L61
	leaq	2(%rdx), %rax
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L26:
	movq	%rax, p(%rip)
	leal	(%rcx,%rcx,4), %esi
	movzbl	-1(%rax), %ecx
	movq	%rax, %rdx
	addq	$1, %rax
	andl	$15, %ecx
	cmpb	$47, -1(%rax)
	leal	(%rcx,%rsi,2), %ecx
	jg	.L26
.L25:
	movl	$1000000001, %r9d
	movl	$1000000000, %r10d
	subl	%ecx, %r9d
	subl	%ecx, %r10d
	salq	$32, %r9
	salq	$32, %r10
	jmp	.L24
.L81:
	movl	$1000000000, %r11d
	movl	$1000000001, %r8d
	jmp	.L29
.L80:
	movabsq	$4294967296000000000, %r10
	movabsq	$4294967300294967296, %r9
	jmp	.L24
.L61:
	movq	%rax, %rdx
	xorl	%ecx, %ecx
	jmp	.L25
.L59:
	xorl	%edi, %edi
	jmp	.L21
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.globl	p
	.bss
	.align 8
	.type	p, @object
	.size	p, 8
p:
	.zero	8
	.globl	buf
	.align 32
	.type	buf, @object
	.size	buf, 35
buf:
	.zero	35
	.globl	ans
	.align 4
	.type	ans, @object
	.size	ans, 4
ans:
	.zero	4
	.globl	hashend
	.data
	.align 8
	.type	hashend, @object
	.size	hashend, 8
hashend:
	.quad	hash+12800176
	.globl	hash
	.bss
	.align 32
	.type	hash, @object
	.size	hash, 12800224
hash:
	.zero	12800224
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
