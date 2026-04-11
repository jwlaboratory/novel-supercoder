	.file	"inputC.c"
	.text
	.p2align 4
	.globl	in
	.type	in, @function
in:
.LFB8:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L2:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L2
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE8:
	.size	in, .-in
	.p2align 4
	.globl	out
	.type	out, @function
out:
.LFB9:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L18
	movabsq	$7378697629483820647, %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%ecx, %ecx
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%rdi, %rax
	imulq	%rsi
	movq	%rdi, %rax
	sarq	$63, %rax
	sarq	$2, %rdx
	subq	%rax, %rdx
	leaq	(%rdx,%rdx,4), %rax
	addq	%rax, %rax
	subq	%rax, %rdi
	movq	%rcx, %rax
	addl	$48, %edi
	movb	%dil, (%rsp,%rcx)
	movq	%rdx, %rdi
	addq	$1, %rcx
	testq	%rdx, %rdx
	jne	.L8
	movslq	%eax, %rdx
	leaq	-1(%rsp,%rdx), %rbp
	leaq	(%rsp,%rdx), %rbx
	subq	%rax, %rbp
	.p2align 4,,10
	.p2align 3
.L10:
	movsbl	(%rbx), %edi
	xorl	%eax, %eax
	subq	$1, %rbx
	call	putchar_unlocked
	cmpq	%rbx, %rbp
	jne	.L10
	addq	$56, %rsp
	.cfi_def_cfa_offset 24
	movl	$10, %edi
	xorl	%eax, %eax
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	jmp	putchar_unlocked
	.p2align 4,,10
	.p2align 3
.L18:
	movl	$10, %edi
	xorl	%eax, %eax
	jmp	putchar_unlocked
	.cfi_endproc
.LFE9:
	.size	out, .-out
	.p2align 4
	.globl	outs
	.type	outs, @function
outs:
.LFB10:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movsbl	(%rdi), %edi
	testb	%dil, %dil
	je	.L22
	.p2align 4,,10
	.p2align 3
.L23:
	addq	$1, %rbx
	xorl	%eax, %eax
	call	putchar_unlocked
	movsbl	(%rbx), %edi
	testb	%dil, %dil
	jne	.L23
.L22:
	movl	$10, %edi
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	putchar_unlocked
	.cfi_endproc
.LFE10:
	.size	outs, .-outs
	.p2align 4
	.globl	bpm
	.type	bpm, @function
bpm:
.LFB12:
	.cfi_startproc
	movl	mark(%rip), %eax
	movslq	%edi, %r9
	movl	%eax, seen(,%r9,4)
	movl	hi(,%r9,4), %eax
	testl	%eax, %eax
	jle	.L87
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	imulq	$4020, %r9, %rax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r9, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%r9, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$344, %rsp
	.cfi_def_cfa_offset 400
	movq	%rax, 256(%rsp)
	xorl	%eax, %eax
	movq	%rax, 200(%rsp)
.L65:
	movq	256(%rsp), %rax
	movq	200(%rsp), %rsi
	movslq	to(%rax,%rsi,4), %rax
	movl	match(,%rax,4), %r13d
	movl	%eax, 236(%rsp)
	movq	%rax, 264(%rsp)
	testl	%r13d, %r13d
	js	.L76
	movslq	%r13d, %rsi
	movl	mark(%rip), %eax
	movq	%rsi, 216(%rsp)
	cmpl	%eax, seen(,%rsi,4)
	je	.L33
	movl	hi(,%rsi,4), %edx
	movl	%eax, seen(,%rsi,4)
	testl	%edx, %edx
	jle	.L33
	imulq	$4020, %rsi, %rax
	xorl	%ebx, %ebx
	movl	%r12d, 32(%rsp)
	movq	%rbx, %r12
	movq	%rax, 248(%rsp)
.L64:
	movq	248(%rsp), %rax
	movslq	to(%rax,%r12,4), %rax
	movslq	match(,%rax,4), %rsi
	movl	%eax, 240(%rsp)
	movq	%rax, 272(%rsp)
	movl	%esi, 244(%rsp)
	testl	%esi, %esi
	js	.L77
	movq	%rsi, 224(%rsp)
	movl	mark(%rip), %eax
	cmpl	%eax, seen(,%rsi,4)
	je	.L63
	movl	%eax, seen(,%rsi,4)
	movq	%rsi, %rax
	movl	hi(,%rsi,4), %esi
	testl	%esi, %esi
	jle	.L63
	imulq	$4020, %rax, %rax
	movq	%r12, 280(%rsp)
	xorl	%edi, %edi
	movq	%rbp, %rbx
	movq	%rax, 184(%rsp)
.L62:
	movq	184(%rsp), %rax
	movslq	to(%rax,%rdi,4), %rax
	movslq	match(,%rax,4), %rdx
	movl	%eax, 180(%rsp)
	movq	%rax, 192(%rsp)
	movl	%edx, 232(%rsp)
	testl	%edx, %edx
	js	.L78
	movq	%rdx, 168(%rsp)
	movl	mark(%rip), %eax
	cmpl	%eax, seen(,%rdx,4)
	je	.L61
	movl	hi(,%rdx,4), %ecx
	movl	%eax, seen(,%rdx,4)
	testl	%ecx, %ecx
	jle	.L61
	imulq	$4020, %rdx, %rax
	movq	%rdi, 288(%rsp)
	movq	%rbx, %r12
	movl	%r13d, %r14d
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L60:
	movq	152(%rsp), %rax
	movslq	to(%rax,%rbx,4), %rax
	movl	match(,%rax,4), %esi
	movl	%eax, 176(%rsp)
	movq	%rax, 160(%rsp)
	movl	%esi, 148(%rsp)
	testl	%esi, %esi
	js	.L79
	movslq	%esi, %rdx
	movl	mark(%rip), %eax
	movq	%rdx, 128(%rsp)
	cmpl	%eax, seen(,%rdx,4)
	je	.L59
	movl	%eax, seen(,%rdx,4)
	movq	%rdx, %rax
	movl	hi(,%rdx,4), %edx
	testl	%edx, %edx
	jle	.L59
	imulq	$4020, %rax, %rax
	xorl	%edi, %edi
	movl	%r14d, %ebp
	movq	%r12, %r13
	movq	%rbx, 208(%rsp)
	movq	%rax, 112(%rsp)
	.p2align 4,,10
	.p2align 3
.L58:
	movq	112(%rsp), %rax
	movslq	to(%rax,%rdi,4), %rax
	movl	match(,%rax,4), %ebx
	movl	%eax, 144(%rsp)
	movq	%rax, 120(%rsp)
	movl	%ebx, 108(%rsp)
	testl	%ebx, %ebx
	js	.L80
	movslq	%ebx, %rcx
	movl	mark(%rip), %eax
	movq	%rcx, 80(%rsp)
	cmpl	%eax, seen(,%rcx,4)
	je	.L57
	movl	%eax, seen(,%rcx,4)
	movq	%rcx, %rax
	movl	hi(,%rcx,4), %ecx
	testl	%ecx, %ecx
	jle	.L57
	imulq	$4020, %rax, %r14
	movq	%rdi, 136(%rsp)
	xorl	%eax, %eax
	movl	%ebp, %ebx
	movq	%r14, %rdi
	.p2align 4,,10
	.p2align 3
.L56:
	movslq	to(%rdi,%rax,4), %rbp
	movl	match(,%rbp,4), %r12d
	testl	%r12d, %r12d
	js	.L81
	movslq	%r12d, %r15
	movl	mark(%rip), %esi
	cmpl	%esi, seen(,%r15,4)
	je	.L55
	movl	%esi, seen(,%r15,4)
	movl	hi(,%r15,4), %esi
	testl	%esi, %esi
	jle	.L55
	imulq	$4020, %r15, %rcx
	movl	%ebp, 12(%rsp)
	xorl	%r14d, %r14d
	movq	%rax, 88(%rsp)
	movq	%r14, %rdx
	movl	%r12d, %r14d
	movq	%rbp, %r12
	movq	%rdi, 96(%rsp)
	movq	%rcx, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L54:
	movq	48(%rsp), %rax
	movslq	to(%rax,%rdx,4), %rax
	movl	match(,%rax,4), %r9d
	movl	%eax, 60(%rsp)
	movq	%rax, 64(%rsp)
	testl	%r9d, %r9d
	js	.L82
	movslq	%r9d, %r10
	movl	mark(%rip), %eax
	cmpl	%eax, seen(,%r10,4)
	je	.L53
	movl	hi(,%r10,4), %edi
	movl	%eax, seen(,%r10,4)
	testl	%edi, %edi
	jle	.L53
	imulq	$4020, %r10, %rax
	xorl	%ebp, %ebp
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L52:
	movq	16(%rsp), %rax
	movslq	to(%rax,%rbp,4), %r11
	movl	match(,%r11,4), %r8d
	movq	%r11, %rsi
	testl	%r8d, %r8d
	js	.L83
	movslq	%r8d, %rcx
	movl	mark(%rip), %eax
	cmpl	%eax, seen(,%rcx,4)
	je	.L51
	movl	%eax, seen(,%rcx,4)
	movl	hi(,%rcx,4), %eax
	testl	%eax, %eax
	jle	.L51
	imulq	$4020, %rcx, %rdi
	movl	%eax, 56(%rsp)
	movq	$0, 24(%rsp)
	movq	%rdi, 72(%rsp)
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L89:
	movslq	%eax, %rdi
	movl	%eax, 104(%rsp)
	movl	mark(%rip), %eax
	cmpl	%eax, seen(,%rdi,4)
	je	.L49
	movl	104(%rsp), %edi
	movq	%rcx, 328(%rsp)
	movq	%r11, 320(%rsp)
	movq	%r10, 312(%rsp)
	movl	%r8d, 300(%rsp)
	movl	%esi, 296(%rsp)
	movl	%r9d, 56(%rsp)
	movq	%rdx, 304(%rsp)
	call	bpm
	movl	56(%rsp), %r9d
	movl	296(%rsp), %esi
	testl	%eax, %eax
	movl	300(%rsp), %r8d
	movq	312(%rsp), %r10
	movq	320(%rsp), %r11
	movq	328(%rsp), %rcx
	jne	.L48
	movl	hi(,%rcx,4), %eax
	movq	304(%rsp), %rdx
	movl	%eax, 56(%rsp)
	.p2align 4,,10
	.p2align 3
.L49:
	addq	$1, 24(%rsp)
	movq	24(%rsp), %rax
	cmpl	%eax, 56(%rsp)
	jle	.L88
.L50:
	movq	72(%rsp), %rax
	movq	24(%rsp), %rdi
	movslq	to(%rax,%rdi,4), %rax
	movl	%eax, 36(%rsp)
	movq	%rax, 40(%rsp)
	movl	match(,%rax,4), %eax
	testl	%eax, %eax
	jns	.L89
.L48:
	movq	%r13, %rax
	movl	%r9d, %r13d
	movl	%esi, %edi
	movl	%r14d, %edx
	movq	%rax, %r9
	movq	40(%rsp), %rax
	movq	%r12, %rbp
	movl	12(%rsp), %r14d
	movl	32(%rsp), %r12d
	movl	%ebx, %esi
	movl	%edi, %ebx
	movl	%r8d, match(,%rax,4)
	movl	36(%rsp), %eax
	movl	%eax, match(,%rcx,4)
.L46:
	movl	%r13d, match(,%r11,4)
	movl	%ebx, match(,%r10,4)
.L44:
	movq	64(%rsp), %rax
	movl	%edx, match(,%rax,4)
	movl	60(%rsp), %eax
	movl	%eax, match(,%r15,4)
.L42:
	movl	108(%rsp), %eax
	movl	%eax, match(,%rbp,4)
	movq	80(%rsp), %rax
	movl	%r14d, match(,%rax,4)
.L40:
	movq	120(%rsp), %rax
	movl	148(%rsp), %edi
	movl	%edi, match(,%rax,4)
	movq	128(%rsp), %rax
	movl	144(%rsp), %edi
	movl	%edi, match(,%rax,4)
.L38:
	movq	160(%rsp), %rax
	movl	232(%rsp), %edi
	movl	%edi, match(,%rax,4)
	movq	168(%rsp), %rax
	movl	176(%rsp), %edi
	movl	%edi, match(,%rax,4)
.L36:
	movq	192(%rsp), %rax
	movl	244(%rsp), %edi
	movl	%edi, match(,%rax,4)
	movq	224(%rsp), %rax
	movl	180(%rsp), %edi
	movl	%edi, match(,%rax,4)
.L34:
	movq	272(%rsp), %rax
	movl	%esi, match(,%rax,4)
	movq	216(%rsp), %rax
	movl	240(%rsp), %esi
	movl	%esi, match(,%rax,4)
.L32:
	movq	264(%rsp), %rax
	movl	%r12d, match(,%rax,4)
	movl	236(%rsp), %eax
	movl	%eax, match(,%r9,4)
	movl	$1, %eax
.L29:
	addq	$344, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
.L88:
	.cfi_restore_state
	movl	hi(,%r10,4), %edi
.L51:
	addq	$1, %rbp
	cmpl	%ebp, %edi
	jg	.L52
	movl	hi(,%r15,4), %esi
.L53:
	addq	$1, %rdx
	cmpl	%edx, %esi
	jg	.L54
	movq	80(%rsp), %rsi
	movq	88(%rsp), %rax
	movq	96(%rsp), %rdi
	movl	hi(,%rsi,4), %ecx
.L55:
	addq	$1, %rax
	cmpl	%eax, %ecx
	jg	.L56
	movq	128(%rsp), %rax
	movq	136(%rsp), %rdi
	movl	%ebx, %ebp
	movl	hi(,%rax,4), %edx
.L57:
	addq	$1, %rdi
	cmpl	%edi, %edx
	jg	.L58
	movq	168(%rsp), %rax
	movq	208(%rsp), %rbx
	movl	%ebp, %r14d
	movq	%r13, %r12
	movl	hi(,%rax,4), %ecx
.L59:
	addq	$1, %rbx
	cmpl	%ebx, %ecx
	jg	.L60
	movq	224(%rsp), %rax
	movq	288(%rsp), %rdi
	movl	%r14d, %r13d
	movq	%r12, %rbx
	movl	hi(,%rax,4), %esi
.L61:
	addq	$1, %rdi
	cmpl	%edi, %esi
	jg	.L62
	movq	216(%rsp), %rax
	movq	280(%rsp), %r12
	movq	%rbx, %rbp
	movl	hi(,%rax,4), %edx
.L63:
	addq	$1, %r12
	cmpl	%r12d, %edx
	jg	.L64
	movl	32(%rsp), %r12d
.L33:
	addq	$1, 200(%rsp)
	movq	200(%rsp), %rax
	cmpl	%eax, hi(,%rbp,4)
	jg	.L65
	xorl	%eax, %eax
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L83:
	movq	%r13, %rax
	movl	%r14d, %edx
	movl	%ebx, %esi
	movq	%r12, %rbp
	movl	%r9d, %r13d
	movl	12(%rsp), %r14d
	movl	32(%rsp), %r12d
	movq	%rax, %r9
	movl	%r11d, %ebx
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L82:
	movl	%r14d, %edx
	movq	%r12, %rbp
	movl	12(%rsp), %r14d
	movl	32(%rsp), %r12d
	movl	%ebx, %esi
	movq	%r13, %r9
	jmp	.L44
.L81:
	movl	32(%rsp), %r12d
	movl	%ebx, %esi
	movl	%ebp, %r14d
	movq	%r13, %r9
	jmp	.L42
.L80:
	movl	32(%rsp), %r12d
	movl	%ebp, %esi
	movq	%r13, %r9
	jmp	.L40
.L79:
	movq	%r12, %r9
	movl	%r14d, %esi
	movl	32(%rsp), %r12d
	jmp	.L38
.L78:
	movl	32(%rsp), %r12d
	movl	%r13d, %esi
	movq	%rbx, %r9
	jmp	.L36
.L77:
	movl	32(%rsp), %r12d
	movl	%r13d, %esi
	movq	%rbp, %r9
	jmp	.L34
.L76:
	movq	%rbp, %r9
	jmp	.L32
.L87:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE12:
	.size	bpm, .-bpm
	.p2align 4
	.globl	bipartiteMatching
	.type	bipartiteMatching, @function
bipartiteMatching:
.LFB11:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$match, %edx
	movl	$502, %ecx
	movq	$-1, %rax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movslq	%edi, %r13
	movq	%rdx, %rdi
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	rep stosq
	movl	$-1, (%rdi)
	testl	%r13d, %r13d
	jle	.L98
	movl	$0, 12(%rsp)
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L95:
	addq	$1, %rbx
	addq	$4020, %r12
	cmpq	%r13, %rbx
	je	.L90
.L97:
	movl	match(,%rbx,4), %eax
	testl	%eax, %eax
	jns	.L95
	movl	mark(%rip), %eax
	movl	hi(,%rbx,4), %ecx
	addl	$1, %eax
	movl	%eax, mark(%rip)
	movl	%eax, seen(,%rbx,4)
	testl	%ecx, %ecx
	jle	.L95
	xorl	%ebp, %ebp
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L102:
	movslq	%edi, %rax
	movl	mark(%rip), %esi
	cmpl	%esi, seen(,%rax,4)
	je	.L94
	call	bpm
	testl	%eax, %eax
	jne	.L93
	movl	hi(,%rbx,4), %ecx
.L94:
	addq	$1, %rbp
	cmpl	%ebp, %ecx
	jle	.L95
.L96:
	movslq	to(%r12,%rbp,4), %r14
	movl	match(,%r14,4), %edi
	movq	%r14, %r15
	testl	%edi, %edi
	jns	.L102
.L93:
	movl	%ebx, match(,%r14,4)
	addq	$4020, %r12
	movl	%r15d, match(,%rbx,4)
	addq	$1, %rbx
	addl	$1, 12(%rsp)
	cmpq	%r13, %rbx
	jne	.L97
.L90:
	movl	12(%rsp), %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
.L98:
	.cfi_restore_state
	movl	$0, 12(%rsp)
	jmp	.L90
	.cfi_endproc
.LFE11:
	.size	bipartiteMatching, .-bipartiteMatching
	.p2align 4
	.globl	cmp
	.type	cmp, @function
cmp:
.LFB13:
	.cfi_startproc
	movl	(%rdi), %eax
	subl	(%rsi), %eax
	ret
	.cfi_endproc
.LFE13:
	.size	cmp, .-cmp
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"no"
.LC1:
	.string	"yes"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB14:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%eax, %eax
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
	call	in
	leal	-1(%rax), %ebx
	movl	%eax, 12(%rsp)
	movl	%ebx, 8(%rsp)
	testl	%ebx, %ebx
	jle	.L105
	movl	%ebx, %ebp
	leal	-2(%rax,%rax), %r13d
	leal	-2(%rax), %r12d
	.p2align 4,,10
	.p2align 3
.L106:
	movl	%r12d, %ebx
	xorl	%r14d, %r14d
	jmp	.L111
	.p2align 4,,10
	.p2align 3
.L128:
	movq	%rax, %r14
.L111:
	xorl	%eax, %eax
	call	getchar_unlocked
	testb	$1, %al
	je	.L107
	movl	hi(,%r14,4), %eax
	leal	1(%rax), %edx
	movl	%edx, hi(,%r14,4)
	movslq	%eax, %rdx
	movslq	%r14d, %rax
	imulq	$1005, %rax, %rax
	addq	%rdx, %rax
	movl	%ebp, to(,%rax,4)
.L107:
	xorl	%eax, %eax
	call	getchar_unlocked
	leaq	1(%r14), %rax
	cmpq	%r14, %rbx
	jne	.L128
	addl	$1, %ebp
	cmpl	%r13d, %ebp
	jne	.L106
	movl	8(%rsp), %r15d
	movl	%r15d, %esi
	movl	%r15d, %edi
	call	bipartiteMatching
	cmpl	%r15d, %eax
	jl	.L124
	movl	$.LC1, %edi
	xorl	%r13d, %r13d
	xorl	%ebp, %ebp
	movabsq	$7378697629483820647, %r14
	call	outs
	.p2align 4,,10
	.p2align 3
.L123:
	movslq	match(,%rbp,4), %rax
	movl	$-1, match(,%rax,4)
	movl	mark(%rip), %eax
	movl	$-1, match(,%rbp,4)
	addl	$1, %eax
	movl	%eax, mark(%rip)
	movl	%eax, seen(,%rbp,4)
	movl	hi(,%rbp,4), %eax
	testl	%eax, %eax
	jle	.L114
	xorl	%r12d, %r12d
	jmp	.L119
	.p2align 4,,10
	.p2align 3
.L115:
	movslq	%edi, %rax
	movq	%rcx, (%rsp)
	movl	mark(%rip), %esi
	cmpl	%esi, seen(,%rax,4)
	je	.L117
	call	bpm
	movq	(%rsp), %rcx
	testl	%eax, %eax
	jne	.L118
.L117:
	addq	$1, %r12
	cmpl	%r12d, hi(,%rbp,4)
	jle	.L140
.L119:
	movslq	to(%r13,%r12,4), %rcx
	movl	match(,%rcx,4), %edi
	movq	%rcx, %r15
	testl	%edi, %edi
	jns	.L115
.L118:
	movl	%ebp, match(,%rcx,4)
	movl	%r15d, match(,%rbp,4)
.L116:
	movl	8(%rsp), %eax
	movl	%r15d, %edx
	movl	$1, hi(,%rbp,4)
	movl	%r15d, to(%r13)
	subl	%eax, %edx
	addl	$1, %edx
	movslq	%edx, %rcx
	je	.L120
.L126:
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L121:
	movq	%rcx, %rax
	imulq	%r14
	movq	%rcx, %rax
	sarq	$63, %rax
	sarq	$2, %rdx
	subq	%rax, %rdx
	leaq	(%rdx,%rdx,4), %rax
	addq	%rax, %rax
	subq	%rax, %rcx
	movq	%rsi, %rax
	addl	$48, %ecx
	movb	%cl, 16(%rsp,%rsi)
	movq	%rdx, %rcx
	addq	$1, %rsi
	testq	%rdx, %rdx
	jne	.L121
	movslq	%eax, %rcx
	leaq	16(%rcx), %rsi
	leaq	15(%rsp,%rcx), %r12
	leaq	(%rsp,%rsi), %r15
	subq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L122:
	movsbl	(%r15), %edi
	xorl	%eax, %eax
	subq	$1, %r15
	call	putchar_unlocked
	cmpq	%r15, %r12
	jne	.L122
.L120:
	movl	$10, %edi
	xorl	%eax, %eax
	addq	$4020, %r13
	call	putchar_unlocked
	leaq	1(%rbp), %rax
	cmpq	%rbp, %rbx
	je	.L136
	movq	%rax, %rbp
	jmp	.L123
.L124:
	movl	$.LC0, %edi
	call	outs
.L136:
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
	.p2align 4,,10
	.p2align 3
.L140:
	.cfi_restore_state
	movl	match(,%rbp,4), %r15d
	jmp	.L116
.L114:
	movl	12(%rsp), %eax
	movl	$1, %ecx
	movl	$1, hi(,%rbp,4)
	movl	$-1, to(%r13)
	subl	%eax, %ecx
	movslq	%ecx, %rcx
	jmp	.L126
.L105:
	movl	8(%rsp), %ebx
	movl	%ebx, %esi
	movl	%ebx, %edi
	call	bipartiteMatching
	cmpl	%eax, %ebx
	jg	.L124
	movl	$.LC1, %edi
	call	outs
	jmp	.L136
	.cfi_endproc
.LFE14:
	.size	main, .-main
	.globl	mark
	.data
	.align 4
	.type	mark, @object
	.size	mark, 4
mark:
	.long	1
	.globl	match
	.bss
	.align 32
	.type	match, @object
	.size	match, 4020
match:
	.zero	4020
	.globl	seen
	.align 32
	.type	seen, @object
	.size	seen, 4020
seen:
	.zero	4020
	.globl	to
	.align 32
	.type	to, @object
	.size	to, 4040100
to:
	.zero	4040100
	.globl	hi
	.align 32
	.type	hi, @object
	.size	hi, 4020
hi:
	.zero	4020
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
