	.file	"inputC.c"
	.text
	.p2align 4
	.globl	UF_find
	.type	UF_find, @function
UF_find:
.LFB4:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movslq	%edi, %rdx
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdx, %rax
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	(%rsi,%rdx,4), %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	(%rbx), %edx
	cmpl	%eax, %edx
	jne	.L8
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	.cfi_restore_state
	movslq	%edx, %rax
	leaq	(%rsi,%rax,4), %rbp
	movl	0(%rbp), %eax
	cmpl	%eax, %edx
	je	.L3
	movslq	%eax, %rdx
	leaq	(%rsi,%rdx,4), %r12
	movl	(%r12), %edx
	cmpl	%edx, %eax
	jne	.L9
	movl	%edx, 0(%rbp)
	movl	%edx, %eax
.L3:
	movl	%eax, (%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore_state
	movslq	%edx, %rax
	leaq	(%rsi,%rax,4), %r13
	movl	0(%r13), %edi
	cmpl	%edi, %edx
	je	.L5
	call	UF_find
	movl	%eax, 0(%r13)
	movl	%eax, %edi
.L5:
	movl	%edi, %edx
	movl	%edi, (%r12)
	movl	%edx, %eax
	movl	%edx, 0(%rbp)
	jmp	.L3
	.cfi_endproc
.LFE4:
	.size	UF_find, .-UF_find
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%d %d %d"
.LC3:
	.string	"%d %d"
.LC4:
	.string	"%d%c"
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
	movl	$800000, %edx
	xorl	%esi, %esi
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
	subq	$5600088, %rsp
	.cfi_def_cfa_offset 5600144
	leaq	4800080(%rsp), %rdi
	call	memset
	leaq	64(%rsp), %rdx
	leaq	68(%rsp), %rcx
	xorl	%eax, %eax
	leaq	60(%rsp), %rsi
	movl	$.LC1, %edi
	call	__isoc99_scanf
	movl	60(%rsp), %edx
	testl	%edx, %edx
	jle	.L23
	leal	-1(%rdx), %eax
	cmpl	$2, %eax
	jbe	.L135
	movl	%edx, %ecx
	movdqa	.LC0(%rip), %xmm0
	leaq	800080(%rsp), %rax
	movdqa	.LC2(%rip), %xmm2
	shrl	$2, %ecx
	salq	$4, %rcx
	movdqa	%xmm0, %xmm1
	addq	%rax, %rcx
	.p2align 4,,10
	.p2align 3
.L17:
	movdqa	%xmm1, %xmm3
	addq	$16, %rax
	paddd	%xmm2, %xmm1
	movaps	%xmm3, -16(%rax)
	cmpq	%rax, %rcx
	jne	.L17
	movl	%edx, %eax
	andl	$-4, %eax
	testb	$3, %dl
	je	.L105
	movslq	%eax, %rcx
	movl	%eax, 800080(%rsp,%rcx,4)
	leal	1(%rax), %ecx
	cmpl	%ecx, %edx
	jle	.L105
	movslq	%ecx, %rsi
	addl	$2, %eax
	movl	%ecx, 800080(%rsp,%rsi,4)
	cmpl	%edx, %eax
	jge	.L105
	movslq	%eax, %rcx
	movl	%eax, 800080(%rsp,%rcx,4)
.L105:
	movl	%edx, %ecx
	leaq	80(%rsp), %rax
	shrl	$2, %ecx
	salq	$4, %rcx
	addq	%rax, %rcx
	.p2align 4,,10
	.p2align 3
.L21:
	movdqa	%xmm0, %xmm1
	addq	$16, %rax
	paddd	%xmm2, %xmm0
	movaps	%xmm1, -16(%rax)
	cmpq	%rcx, %rax
	jne	.L21
	movl	%edx, %eax
	andl	$-4, %eax
	testb	$3, %dl
	je	.L22
	movslq	%eax, %rcx
	movl	%eax, 80(%rsp,%rcx,4)
	leal	1(%rax), %ecx
	cmpl	%ecx, %edx
	jle	.L22
.L20:
	movslq	%ecx, %rsi
	addl	$2, %eax
	movl	%ecx, 80(%rsp,%rsi,4)
	cmpl	%eax, %edx
	jle	.L22
.L107:
	movslq	%eax, %rcx
	movl	%eax, 80(%rsp,%rcx,4)
.L22:
	leaq	0(,%rdx,4), %rbx
	movl	$255, %esi
	leaq	2400080(%rsp), %rdi
	movq	%rbx, %rdx
	call	memset
	leaq	1600080(%rsp), %r9
	movq	%rbx, %rdx
	movl	$255, %esi
	movq	%r9, %rdi
	call	memset
	movq	%rbx, %rdx
	xorl	%esi, %esi
	leaq	4000080(%rsp), %rdi
	call	memset
	movq	%rbx, %rdx
	xorl	%esi, %esi
	leaq	3200080(%rsp), %rdi
	call	memset
.L23:
	movl	64(%rsp), %edi
	testl	%edi, %edi
	jle	.L13
	xorl	%ebp, %ebp
	leaq	80(%rsp), %rbx
	leaq	76(%rsp), %r13
	leaq	72(%rsp), %r12
	.p2align 4,,10
	.p2align 3
.L12:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movl	$.LC3, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	72(%rsp), %eax
	subl	$1, %eax
	movslq	%eax, %rdx
	leaq	(%rbx,%rdx,4), %r8
	movslq	(%r8), %rcx
	cmpl	%ecx, %eax
	je	.L26
	movslq	%ecx, %rax
	leaq	(%rbx,%rax,4), %r9
	movl	(%r9), %eax
	cmpl	%eax, %ecx
	je	.L27
	movslq	%eax, %rdx
	leaq	(%rbx,%rdx,4), %rcx
	movl	(%rcx), %edx
	cmpl	%edx, %eax
	je	.L28
	movslq	%edx, %rax
	leaq	(%rbx,%rax,4), %r10
	movl	(%r10), %eax
	cmpl	%eax, %edx
	jne	.L136
.L29:
	movl	%edx, (%rcx)
.L28:
	movl	%edx, (%r9)
	movl	%edx, %eax
.L27:
	movl	%eax, (%r8)
	movslq	%eax, %rcx
.L26:
	movl	76(%rsp), %eax
	leal	-1(%rax), %edx
	movslq	%edx, %rax
	leaq	(%rbx,%rax,4), %r8
	movslq	(%r8), %rax
	cmpl	%eax, %edx
	je	.L34
	movslq	%eax, %rdx
	leaq	(%rbx,%rdx,4), %r9
	movl	(%r9), %edx
	cmpl	%edx, %eax
	je	.L35
	movslq	%edx, %rax
	leaq	(%rbx,%rax,4), %r10
	movl	(%r10), %eax
	cmpl	%eax, %edx
	je	.L36
	movslq	%eax, %rdx
	leaq	(%rbx,%rdx,4), %r11
	movl	(%r11), %edx
	cmpl	%edx, %eax
	jne	.L137
.L37:
	movl	%eax, (%r10)
.L36:
	movl	%eax, (%r9)
	movl	%eax, %edx
.L35:
	movl	%edx, (%r8)
	movslq	%edx, %rax
.L34:
	cmpl	%ecx, %eax
	je	.L42
	jle	.L43
	movl	%ecx, 80(%rsp,%rax,4)
.L42:
	addl	$1, %ebp
	cmpl	%ebp, 64(%rsp)
	jg	.L12
.L13:
	movl	68(%rsp), %edx
	xorl	%ebx, %ebx
	leaq	76(%rsp), %r13
	leaq	72(%rsp), %r12
	testl	%edx, %edx
	jle	.L25
	.p2align 4,,10
	.p2align 3
.L24:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movl	$.LC3, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	72(%rsp), %eax
	subl	$1, %eax
	movslq	%eax, %rdx
	leaq	800080(%rsp,%rdx,4), %r8
	movslq	(%r8), %rcx
	cmpl	%ecx, %eax
	je	.L46
	movslq	%ecx, %rax
	leaq	800080(%rsp,%rax,4), %r9
	movl	(%r9), %eax
	cmpl	%eax, %ecx
	je	.L47
	movslq	%eax, %rdx
	leaq	800080(%rsp,%rdx,4), %rcx
	movl	(%rcx), %edx
	cmpl	%edx, %eax
	je	.L48
	movslq	%edx, %rax
	leaq	800080(%rsp,%rax,4), %r10
	movl	(%r10), %eax
	cmpl	%eax, %edx
	jne	.L138
.L49:
	movl	%edx, (%rcx)
.L48:
	movl	%edx, (%r9)
	movl	%edx, %eax
.L47:
	movl	%eax, (%r8)
	movslq	%eax, %rcx
.L46:
	movl	76(%rsp), %eax
	leal	-1(%rax), %edx
	movslq	%edx, %rax
	leaq	800080(%rsp,%rax,4), %r8
	movslq	(%r8), %rax
	cmpl	%eax, %edx
	je	.L54
	movslq	%eax, %rdx
	leaq	800080(%rsp,%rdx,4), %r9
	movl	(%r9), %edx
	cmpl	%edx, %eax
	je	.L55
	movslq	%edx, %rax
	leaq	800080(%rsp,%rax,4), %r10
	movl	(%r10), %eax
	cmpl	%eax, %edx
	je	.L56
	movslq	%eax, %rdx
	leaq	800080(%rsp,%rdx,4), %r11
	movl	(%r11), %edx
	cmpl	%edx, %eax
	jne	.L139
.L57:
	movl	%eax, (%r10)
.L56:
	movl	%eax, (%r9)
	movl	%eax, %edx
.L55:
	movl	%edx, (%r8)
	movslq	%edx, %rax
.L54:
	cmpl	%ecx, %eax
	je	.L62
	jle	.L63
	movl	%ecx, 800080(%rsp,%rax,4)
.L62:
	addl	$1, %ebx
	cmpl	%ebx, 68(%rsp)
	jg	.L24
.L25:
	movl	60(%rsp), %r8d
	testl	%r8d, %r8d
	jle	.L121
	movslq	%r8d, %rbp
	xorl	%ecx, %ecx
	leaq	80(%rsp), %rbx
	leaq	1600080(%rsp), %r9
	.p2align 4,,10
	.p2align 3
.L74:
	movl	(%rbx,%rcx,4), %edx
	movl	%ecx, %r10d
	movl	%ecx, %r11d
	cmpl	%ecx, %edx
	je	.L73
	movslq	%edx, %rax
	leaq	(%rbx,%rax,4), %r12
	movslq	(%r12), %rax
	cmpl	%eax, %edx
	je	.L66
	movslq	%eax, %rdx
	leaq	(%rbx,%rdx,4), %r13
	movl	0(%r13), %edx
	cmpl	%eax, %edx
	je	.L67
	movslq	%edx, %rax
	leaq	(%rbx,%rax,4), %r14
	movslq	(%r14), %rax
	cmpl	%eax, %edx
	jne	.L140
.L68:
	movl	%eax, 0(%r13)
.L67:
	movl	%eax, (%r12)
	movl	%eax, (%rbx,%rcx,4)
	cmpl	%r11d, %eax
	je	.L73
.L66:
	movl	1600080(%rsp,%rax,4), %edx
	movl	%r10d, 1600080(%rsp,%rax,4)
	movl	%edx, 2400080(%rsp,%rcx,4)
.L65:
	addq	$1, %rcx
	cmpq	%rcx, %rbp
	jne	.L74
	leaq	(%r9,%rbp,4), %r11
	xorl	%r10d, %r10d
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L75:
	addq	$4, %r9
	cmpq	%r11, %r9
	je	.L141
.L101:
	movslq	(%r9), %rbx
	testl	%ebx, %ebx
	js	.L75
	addl	$1, %r10d
	movslq	%ebx, %rax
	.p2align 4,,10
	.p2align 3
.L89:
	movslq	%eax, %rcx
	leaq	800080(%rsp,%rcx,4), %rbp
	movl	0(%rbp), %edx
	cmpl	%eax, %edx
	je	.L76
	movslq	%edx, %rax
	leaq	800080(%rsp,%rax,4), %r12
	movslq	(%r12), %rax
	cmpl	%eax, %edx
	je	.L77
	movslq	%eax, %rdx
	leaq	800080(%rsp,%rdx,4), %r13
	movl	0(%r13), %edx
	cmpl	%edx, %eax
	je	.L78
	movslq	%edx, %rax
	leaq	800080(%rsp,%rax,4), %r14
	movl	(%r14), %eax
	cmpl	%eax, %edx
	je	.L79
	movslq	%eax, %rdx
	leaq	800080(%rsp,%rdx,4), %r15
	movl	(%r15), %esi
	cmpl	%esi, %eax
	je	.L80
	movslq	%esi, %rax
	leaq	800080(%rsp,%rax,4), %rdx
	movl	(%rdx), %eax
	cmpl	%eax, %esi
	jne	.L142
.L81:
	movl	%eax, (%r15)
.L80:
	movl	%eax, (%r14)
.L79:
	movl	%eax, 0(%r13)
	movl	%eax, %edx
.L78:
	movl	%edx, (%r12)
	movslq	%edx, %rax
.L77:
	movl	%eax, 0(%rbp)
.L76:
	cmpl	%r10d, 3200080(%rsp,%rax,4)
	je	.L143
	movl	%r10d, 3200080(%rsp,%rax,4)
	movl	$1, 4000080(%rsp,%rax,4)
	movslq	2400080(%rsp,%rcx,4), %rax
	testl	%eax, %eax
	jns	.L89
	.p2align 4,,10
	.p2align 3
.L100:
	movslq	%ebx, %rcx
	leaq	800080(%rsp,%rcx,4), %rbp
	movl	0(%rbp), %eax
	cmpl	%ebx, %eax
	je	.L90
	movslq	%eax, %rdx
	leaq	800080(%rsp,%rdx,4), %r12
	movslq	(%r12), %rbx
	cmpl	%ebx, %eax
	je	.L91
	movslq	%ebx, %rax
	leaq	800080(%rsp,%rax,4), %r13
	movl	0(%r13), %eax
	cmpl	%eax, %ebx
	je	.L92
	movslq	%eax, %rdx
	leaq	800080(%rsp,%rdx,4), %rbx
	movl	(%rbx), %esi
	cmpl	%esi, %eax
	je	.L93
	movslq	%esi, %rax
	leaq	800080(%rsp,%rax,4), %r14
	movl	(%r14), %eax
	cmpl	%eax, %esi
	je	.L94
	movslq	%eax, %rdx
	leaq	800080(%rsp,%rdx,4), %r15
	movl	(%r15), %esi
	cmpl	%esi, %eax
	jne	.L144
.L95:
	movl	%esi, (%r14)
.L94:
	movl	%esi, (%rbx)
.L93:
	movl	%esi, 0(%r13)
	movl	%esi, %eax
.L92:
	movl	%eax, (%r12)
	movslq	%eax, %rbx
.L91:
	movl	%ebx, 0(%rbp)
.L90:
	movl	4000080(%rsp,%rbx,4), %eax
	movslq	2400080(%rsp,%rcx,4), %rbx
	movl	%eax, 4800080(%rsp,%rcx,4)
	testl	%ebx, %ebx
	jns	.L100
	addq	$4, %r9
	cmpq	%r11, %r9
	jne	.L101
.L141:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L104:
	subl	$1, %r8d
	movl	4800080(%rsp,%rbx,4), %esi
	movl	$10, %edx
	cmpl	%ebx, %r8d
	je	.L134
	movl	$32, %edx
.L134:
	movl	$.LC4, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	printf
	movl	60(%rsp), %r8d
	cmpl	%ebx, %r8d
	jg	.L104
.L121:
	addq	$5600088, %rsp
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
.L143:
	.cfi_restore_state
	addl	$1, 4000080(%rsp,%rax,4)
	movslq	2400080(%rsp,%rcx,4), %rax
	testl	%eax, %eax
	jns	.L89
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L73:
	movl	%r10d, (%r9,%rcx,4)
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L43:
	movl	%eax, 80(%rsp,%rcx,4)
	jmp	.L42
	.p2align 4,,10
	.p2align 3
.L63:
	movl	%eax, 800080(%rsp,%rcx,4)
	jmp	.L62
.L140:
	movslq	%eax, %rdx
	leaq	(%rbx,%rdx,4), %r15
	movl	(%r15), %esi
	cmpl	%esi, %eax
	je	.L69
	movslq	%esi, %rax
	leaq	(%rbx,%rax,4), %rdx
	movl	(%rdx), %eax
	cmpl	%eax, %esi
	jne	.L145
.L70:
	movl	%eax, (%r15)
	movl	%eax, %esi
.L69:
	movl	%esi, (%r14)
	movslq	%esi, %rax
	jmp	.L68
.L139:
	movslq	%edx, %rax
	leaq	800080(%rsp,%rax,4), %rbp
	movl	0(%rbp), %eax
	cmpl	%eax, %edx
	je	.L58
	movslq	%eax, %rdx
	leaq	800080(%rsp,%rdx,4), %r14
	movl	(%r14), %edx
	cmpl	%edx, %eax
	jne	.L146
.L59:
	movl	%edx, 0(%rbp)
	movl	%edx, %eax
.L58:
	movl	%eax, (%r11)
	jmp	.L57
.L138:
	movslq	%eax, %rdx
	leaq	800080(%rsp,%rdx,4), %r11
	movl	(%r11), %edx
	cmpl	%edx, %eax
	je	.L50
	movslq	%edx, %rax
	leaq	800080(%rsp,%rax,4), %rbp
	movl	0(%rbp), %eax
	cmpl	%eax, %edx
	jne	.L147
.L51:
	movl	%eax, (%r11)
	movl	%eax, %edx
.L50:
	movl	%edx, (%r10)
	jmp	.L49
.L137:
	movslq	%edx, %rax
	leaq	(%rbx,%rax,4), %r14
	movl	(%r14), %eax
	cmpl	%eax, %edx
	je	.L38
	movslq	%eax, %rdx
	leaq	(%rbx,%rdx,4), %r15
	movl	(%r15), %esi
	cmpl	%esi, %eax
	jne	.L148
.L39:
	movl	%esi, (%r14)
	movl	%esi, %eax
.L38:
	movl	%eax, (%r11)
	jmp	.L37
.L136:
	movslq	%eax, %rdx
	leaq	(%rbx,%rdx,4), %r11
	movl	(%r11), %edx
	cmpl	%edx, %eax
	je	.L30
	movslq	%edx, %rax
	leaq	(%rbx,%rax,4), %r14
	movl	(%r14), %eax
	cmpl	%eax, %edx
	jne	.L149
.L31:
	movl	%eax, (%r11)
	movl	%eax, %edx
.L30:
	movl	%edx, (%r10)
	jmp	.L29
.L142:
	movslq	%eax, %rsi
	leaq	800080(%rsp,%rsi,4), %rdi
	movl	(%rdi), %esi
	movq	%rdi, 8(%rsp)
	cmpl	%esi, %eax
	jne	.L150
.L82:
	movl	%esi, (%rdx)
	movl	%esi, %eax
	jmp	.L81
.L144:
	movslq	%esi, %rax
	leaq	800080(%rsp,%rax,4), %rdx
	movl	(%rdx), %eax
	cmpl	%eax, %esi
	jne	.L151
.L96:
	movl	%eax, (%r15)
	movl	%eax, %esi
	jmp	.L95
.L151:
	movslq	%eax, %rsi
	leaq	800080(%rsp,%rsi,4), %rdi
	movl	(%rdi), %esi
	movq	%rdi, 8(%rsp)
	cmpl	%esi, %eax
	je	.L97
	movslq	%esi, %rax
	leaq	800080(%rsp,%rax,4), %rax
	movq	%rax, 16(%rsp)
	movl	(%rax), %eax
	cmpl	%eax, %esi
	jne	.L152
.L98:
	movq	8(%rsp), %rdi
	movl	%eax, %esi
	movl	%eax, (%rdi)
.L97:
	movl	%esi, (%rdx)
	movl	%esi, %eax
	jmp	.L96
.L150:
	movslq	%esi, %rax
	leaq	800080(%rsp,%rax,4), %rax
	movq	%rax, 16(%rsp)
	movl	(%rax), %eax
	cmpl	%eax, %esi
	je	.L83
	movslq	%eax, %rsi
	leaq	800080(%rsp,%rsi,4), %rdi
	movl	(%rdi), %esi
	movq	%rdi, 24(%rsp)
	cmpl	%esi, %eax
	jne	.L153
.L84:
	movq	16(%rsp), %rax
	movl	%esi, (%rax)
	movl	%esi, %eax
.L83:
	movq	8(%rsp), %rdi
	movl	%eax, %esi
	movl	%eax, (%rdi)
	jmp	.L82
.L149:
	movslq	%eax, %rdx
	leaq	(%rbx,%rdx,4), %r15
	movl	(%r15), %esi
	cmpl	%esi, %eax
	je	.L32
	movslq	%esi, %rax
	leaq	(%rbx,%rax,4), %rdx
	movl	(%rdx), %edi
	movq	%rdx, 8(%rsp)
	cmpl	%edi, %esi
	jne	.L154
.L33:
	movl	%edi, (%r15)
	movl	%edi, %esi
.L32:
	movl	%esi, (%r14)
	movl	%esi, %eax
	jmp	.L31
.L148:
	movslq	%esi, %rax
	leaq	(%rbx,%rax,4), %rdx
	movl	(%rdx), %eax
	cmpl	%eax, %esi
	je	.L40
	movslq	%eax, %rsi
	leaq	(%rbx,%rsi,4), %rdi
	movq	%rdi, 8(%rsp)
	movl	(%rdi), %edi
	cmpl	%edi, %eax
	jne	.L155
.L41:
	movl	%edi, (%rdx)
	movl	%edi, %eax
.L40:
	movl	%eax, (%r15)
	movl	%eax, %esi
	jmp	.L39
.L147:
	movslq	%eax, %rdx
	leaq	800080(%rsp,%rdx,4), %r14
	movl	(%r14), %edx
	cmpl	%edx, %eax
	je	.L52
	movslq	%edx, %rax
	leaq	800080(%rsp,%rax,4), %r15
	movl	(%r15), %edi
	cmpl	%edi, %edx
	jne	.L156
.L53:
	movl	%edi, (%r14)
	movl	%edi, %edx
.L52:
	movl	%edx, 0(%rbp)
	movl	%edx, %eax
	jmp	.L51
.L146:
	movslq	%edx, %rax
	leaq	800080(%rsp,%rax,4), %r15
	movl	(%r15), %eax
	cmpl	%eax, %edx
	je	.L60
	movslq	%eax, %rdx
	leaq	800080(%rsp,%rdx,4), %rdx
	movl	(%rdx), %edi
	movq	%rdx, 8(%rsp)
	cmpl	%edi, %eax
	jne	.L157
.L61:
	movl	%edi, (%r15)
	movl	%edi, %eax
.L60:
	movl	%eax, (%r14)
	movl	%eax, %edx
	jmp	.L59
.L145:
	movslq	%eax, %rsi
	leaq	(%rbx,%rsi,4), %rdi
	movl	(%rdi), %esi
	movq	%rdi, 8(%rsp)
	cmpl	%esi, %eax
	je	.L71
	movslq	%esi, %rax
	leaq	(%rbx,%rax,4), %rax
	movl	(%rax), %edi
	movq	%rax, 16(%rsp)
	cmpl	%edi, %esi
	jne	.L158
.L72:
	movq	8(%rsp), %rax
	movl	%edi, %esi
	movl	%edi, (%rax)
.L71:
	movl	%esi, (%rdx)
	movl	%esi, %eax
	jmp	.L70
.L135:
	xorl	%esi, %esi
	movl	%esi, 800080(%rsp)
	cmpl	$1, %edx
	je	.L159
	movl	$1, 800084(%rsp)
	cmpl	$3, %edx
	jne	.L160
	movl	$2, 800088(%rsp)
	movl	$1, %eax
	salq	$32, %rax
	movq	%rax, 80(%rsp)
	movl	$2, %eax
	jmp	.L107
.L153:
	movslq	%esi, %rax
	leaq	800080(%rsp,%rax,4), %rax
	movl	(%rax), %edi
	movq	%rax, 32(%rsp)
	cmpl	%edi, %esi
	je	.L85
	leaq	800080(%rsp), %rsi
	movq	%rdx, 40(%rsp)
	call	UF_find
	movq	40(%rsp), %rdx
	movl	%eax, %edi
	movq	32(%rsp), %rax
	movl	%edi, (%rax)
.L85:
	movq	24(%rsp), %rax
	movl	%edi, %esi
	movl	%edi, (%rax)
	jmp	.L84
.L152:
	movslq	%eax, %rsi
	leaq	800080(%rsp,%rsi,4), %rdi
	movq	%rdi, 24(%rsp)
	movl	(%rdi), %edi
	cmpl	%edi, %eax
	je	.L99
	leaq	800080(%rsp), %rsi
	movq	%rdx, 32(%rsp)
	call	UF_find
	movq	32(%rsp), %rdx
	movl	%eax, %edi
	movq	24(%rsp), %rax
	movl	%edi, (%rax)
.L99:
	movq	16(%rsp), %rax
	movl	%edi, (%rax)
	movl	%edi, %eax
	jmp	.L98
.L160:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	movl	%ecx, 80(%rsp)
	movl	$1, %ecx
	jmp	.L20
.L154:
	movq	%rbx, %rsi
	call	UF_find
	movq	8(%rsp), %rdx
	movl	%eax, %edi
	movl	%eax, (%rdx)
	jmp	.L33
.L158:
	movq	%rbx, %rsi
	movq	%rdx, 24(%rsp)
	call	UF_find
	movq	24(%rsp), %rdx
	movl	%eax, %edi
	movq	16(%rsp), %rax
	movl	%edi, (%rax)
	jmp	.L72
.L157:
	leaq	800080(%rsp), %rsi
	call	UF_find
	movq	8(%rsp), %rdx
	movl	%eax, %edi
	movl	%eax, (%rdx)
	jmp	.L61
.L156:
	leaq	800080(%rsp), %rsi
	call	UF_find
	movl	%eax, (%r15)
	movl	%eax, %edi
	jmp	.L53
.L155:
	movq	%rbx, %rsi
	movq	%rdx, 16(%rsp)
	call	UF_find
	movq	16(%rsp), %rdx
	movl	%eax, %edi
	movq	8(%rsp), %rax
	movl	%edi, (%rax)
	jmp	.L41
.L159:
	xorl	%eax, %eax
	movl	%eax, 80(%rsp)
	jmp	.L22
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC2:
	.long	4
	.long	4
	.long	4
	.long	4
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
