	.file	"inputC.c"
	.text
	.p2align 4
	.globl	drop
	.type	drop, @function
drop:
.LFB3:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	w(%rip), %rbx
	testq	%rbx, %rbx
	je	.L1
	movq	h(%rip), %r11
	movl	$t-3010, %r9d
	xorl	%r8d, %r8d
	leaq	-1(%r11), %r10
	imulq	$3010, %r11, %r11
.L9:
	testq	%r10, %r10
	js	.L27
	.p2align 4,,10
	.p2align 3
.L3:
	leaq	(%r11,%r9), %rdx
	movq	%r10, %rsi
	movq	%r10, %rax
	.p2align 4,,10
	.p2align 3
.L6:
	movzbl	(%rdx), %ecx
	testb	%cl, %cl
	je	.L5
	imulq	$3010, %rsi, %rdi
	subq	$1, %rsi
	movb	%cl, t(%r8,%rdi)
.L5:
	subq	$1, %rax
	subq	$3010, %rdx
	cmpq	$-1, %rax
	jne	.L6
	testq	%rsi, %rsi
	js	.L30
	imulq	$3010, %rsi, %rsi
	addq	%r8, %rsi
	leaq	t(%rsi), %rax
	movq	%rax, %rdx
	subq	%r9, %rdx
	andl	$2, %edx
	je	.L11
	subq	$3010, %rax
	movb	$0, t(%rsi)
	cmpq	%r9, %rax
	je	.L30
	.p2align 4,,10
	.p2align 3
.L11:
	movb	$0, (%rax)
	subq	$6020, %rax
	movb	$0, 3010(%rax)
	cmpq	%r9, %rax
	jne	.L11
.L30:
	addq	$1, %r8
	addq	$1, %r9
	cmpq	%rbx, %r8
	jne	.L3
.L1:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L27:
	.cfi_restore_state
	addq	$1, %r8
	addq	$1, %r9
	cmpq	%rbx, %r8
	jne	.L9
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3:
	.size	drop, .-drop
	.p2align 4
	.globl	rensa
	.type	rensa, @function
rensa:
.LFB4:
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
	movq	h(%rip), %r13
	testq	%r13, %r13
	je	.L33
	movq	w(%rip), %r12
	movq	k(%rip), %r8
	xorl	%r14d, %r14d
	xorl	%ecx, %ecx
	movq	%r13, 24(%rsp)
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L35:
	xorl	%edx, %edx
	testq	%r12, %r12
	je	.L41
	imulq	$3010, %rcx, %r15
	addq	$t, %r15
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L36:
	addq	$1, %rdx
	movq	%rdx, %rbp
.L39:
	cmpq	%r12, %rbp
	jnb	.L41
.L44:
	movsbl	(%r15,%rdx), %eax
	testb	%al, %al
	je	.L36
	movq	%rdx, %rbx
	movq	%rdx, %rbp
	xorl	%edi, %edi
	xorl	%esi, %esi
	cmpq	%r12, %rdx
	jb	.L37
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L42:
	addq	$1, %rbx
	movq	%rbx, %rbp
	cmpq	%r12, %rbx
	jnb	.L56
.L37:
	movq	%rbx, %rbp
	cmpb	t(%r14,%rbx), %al
	je	.L42
	movq	%rbx, %rsi
	subq	%rdx, %rsi
	movq	%rsi, %rdi
.L38:
	cmpq	%r8, %rdi
	jnb	.L40
.L46:
	movq	%rbx, %rdx
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L56:
	movq	%rbx, %rsi
	subq	%rdx, %rsi
	cmpq	%r8, %rsi
	jnb	.L40
.L41:
	movq	24(%rsp), %rax
	addq	$1, %rcx
	addq	$3010, %r14
	cmpq	%rax, %rcx
	jne	.L35
.L33:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r13, %rax
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
.L40:
	.cfi_restore_state
	subl	$48, %eax
	cltq
	imulq	%rsi, %rax
	addq	%rax, %r13
	cmpq	%rdx, %rbx
	jle	.L46
	movq	%rbx, %rax
	leaq	t(%rdx,%r14), %rdi
	xorl	%esi, %esi
	movq	%rcx, 16(%rsp)
	subq	%rdx, %rax
	movq	%r8, 8(%rsp)
	movq	%rax, %rdx
	call	memset
	movq	16(%rsp), %rcx
	movq	8(%rsp), %r8
	jmp	.L46
	.cfi_endproc
.LFE4:
	.size	rensa, .-rensa
	.p2align 4
	.globl	f
	.type	f, @function
f:
.LFB5:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	h(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	w(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	testq	%r12, %r12
	je	.L58
	testq	%rbp, %rbp
	je	.L58
	imulq	$3010, %r12, %r12
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L60:
	leaq	t(%rbx), %rdi
	leaq	s(%rbx), %rsi
	movq	%rbp, %rdx
	addq	$3010, %rbx
	call	memcpy
	cmpq	%r12, %rbx
	jne	.L60
.L58:
	imulq	$3010, %r13, %r13
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
	movb	$0, t(%r14,%r13)
	.p2align 4,,10
	.p2align 3
.L72:
	testq	%rbp, %rbp
	je	.L66
	movq	h(%rip), %rcx
	movl	$t-3010, %r10d
	xorl	%r9d, %r9d
	leaq	-1(%rcx), %r11
	imulq	$3010, %rcx, %rcx
.L65:
	testq	%r11, %r11
	js	.L96
	.p2align 4,,10
	.p2align 3
.L64:
	leaq	(%r10,%rcx), %rdx
	movq	%r11, %rdi
	movq	%r11, %rax
	.p2align 4,,10
	.p2align 3
.L68:
	movzbl	(%rdx), %esi
	testb	%sil, %sil
	je	.L67
	imulq	$3010, %rdi, %r8
	subq	$1, %rdi
	movb	%sil, t(%r9,%r8)
.L67:
	subq	$1, %rax
	subq	$3010, %rdx
	cmpq	$-1, %rax
	jne	.L68
	testq	%rdi, %rdi
	js	.L93
	imulq	$3010, %rdi, %rdi
	addq	%r9, %rdi
	leaq	t(%rdi), %rax
	movq	%rax, %rdx
	subq	%r10, %rdx
	andl	$2, %edx
	je	.L71
	subq	$3010, %rax
	movb	$0, t(%rdi)
	cmpq	%rax, %r10
	je	.L93
	.p2align 4,,10
	.p2align 3
.L71:
	movb	$0, (%rax)
	subq	$6020, %rax
	movb	$0, 3010(%rax)
	cmpq	%rax, %r10
	jne	.L71
.L93:
	addq	$1, %r9
	addq	$1, %r10
	cmpq	%rbp, %r9
	jne	.L64
.L66:
	xorl	%eax, %eax
	call	rensa
	movl	%r12d, %ecx
	salq	%cl, %rax
	testq	%rax, %rax
	je	.L97
	movq	w(%rip), %rbp
	addq	%rax, %rbx
	addq	$1, %r12
	jmp	.L72
.L96:
	addq	$1, %r9
	addq	$1, %r10
	cmpq	%rbp, %r9
	jne	.L65
	jmp	.L66
.L97:
	movq	%rbx, %rax
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
	.cfi_endproc
.LFE5:
	.size	f, .-f
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"0"
.LC1:
	.string	"%lld\n"
	.text
	.p2align 4
	.globl	solve
	.type	solve, @function
solve:
.LFB6:
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	cmpq	$3, k(%rip)
	ja	.L99
	movq	h(%rip), %rsi
	testq	%rsi, %rsi
	je	.L100
	movq	w(%rip), %r15
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
.L101:
	testq	%r15, %r15
	je	.L120
	imulq	$3010, %r12, %rax
	xorl	%r13d, %r13d
	movq	%rax, 8(%rsp)
.L115:
	testq	%rsi, %rsi
	je	.L118
	imulq	$3010, %rsi, %rbx
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L103:
	leaq	t(%r14), %rdi
	leaq	s(%r14), %rsi
	movq	%r15, %rdx
	addq	$3010, %r14
	call	memcpy
	cmpq	%r14, %rbx
	jne	.L103
.L118:
	movq	8(%rsp), %rax
	xorl	%ebx, %ebx
	xorl	%r14d, %r14d
	movb	$0, t(%rax,%r13)
	.p2align 4,,10
	.p2align 3
.L117:
	testq	%r15, %r15
	je	.L109
	movq	h(%rip), %rax
	xorl	%esi, %esi
	leaq	-1(%rax), %r8
	imulq	$3010, %rax, %rax
	addq	$t, %rax
.L108:
	testq	%r8, %r8
	js	.L142
	leaq	-3010(%rax), %r9
	.p2align 4,,10
	.p2align 3
.L107:
	leaq	(%r9,%rsi), %rdi
	movq	%r8, %rax
	movq	%r8, %rdx
	.p2align 4,,10
	.p2align 3
.L111:
	movzbl	(%rdi), %r10d
	testb	%r10b, %r10b
	je	.L110
	imulq	$3010, %rax, %r11
	subq	$1, %rax
	movb	%r10b, t(%rsi,%r11)
.L110:
	subq	$1, %rdx
	subq	$3010, %rdi
	cmpq	$-1, %rdx
	jne	.L111
	testq	%rax, %rax
	js	.L145
	imulq	$3010, %rax, %rax
	leaq	t-3010(%rsi), %rdi
	addq	%rsi, %rax
	leaq	t(%rax), %rdx
	movq	%rdx, %r10
	subq	%rdi, %r10
	andl	$2, %r10d
	je	.L114
	subq	$3010, %rdx
	movb	$0, t(%rax)
	cmpq	%rdi, %rdx
	je	.L145
.L114:
	movb	$0, (%rdx)
	subq	$6020, %rdx
	movb	$0, 3010(%rdx)
	cmpq	%rdi, %rdx
	jne	.L114
.L145:
	addq	$1, %rsi
	cmpq	%r15, %rsi
	jne	.L107
.L109:
	xorl	%eax, %eax
	call	rensa
	movl	%r14d, %ecx
	salq	%cl, %rax
	testq	%rax, %rax
	je	.L148
	movq	w(%rip), %r15
	addq	%rax, %rbx
	addq	$1, %r14
	jmp	.L117
.L142:
	addq	$1, %rsi
	cmpq	%r15, %rsi
	jne	.L108
	jmp	.L109
.L148:
	cmpq	%rbx, %rbp
	movq	w(%rip), %r15
	movq	h(%rip), %rsi
	cmovb	%rbx, %rbp
	addq	$1, %r13
	cmpq	%r15, %r13
	jb	.L115
	addq	$1, %r12
	cmpq	%rsi, %r12
	jb	.L101
.L120:
	movq	%rbp, %rsi
.L100:
	movl	$.LC1, %edi
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
.L99:
	.cfi_restore_state
	movl	$.LC0, %edi
	call	puts
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movl	$1, %eax
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
.LFE6:
	.size	solve, .-solve
	.section	.rodata.str1.1
.LC2:
	.string	"%llu%llu"
.LC3:
	.string	"%llu"
.LC4:
	.string	"%s"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$w, %edx
	movl	$h, %esi
	movl	$.LC2, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	xorl	%eax, %eax
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	__isoc99_scanf
	xorl	%eax, %eax
	movl	$k, %esi
	movl	$.LC3, %edi
	call	__isoc99_scanf
	cmpq	$0, h(%rip)
	je	.L150
	movl	$s, %ebp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L151:
	movq	%rbp, %rsi
	xorl	%eax, %eax
	movl	$.LC4, %edi
	addq	$1, %rbx
	call	__isoc99_scanf
	addq	$3010, %rbp
	cmpq	h(%rip), %rbx
	jb	.L151
.L150:
	xorl	%eax, %eax
	call	solve
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.globl	t
	.bss
	.align 32
	.type	t, @object
	.size	t, 9060100
t:
	.zero	9060100
	.globl	s
	.align 32
	.type	s, @object
	.size	s, 9060100
s:
	.zero	9060100
	.globl	k
	.align 8
	.type	k, @object
	.size	k, 8
k:
	.zero	8
	.globl	w
	.align 8
	.type	w, @object
	.size	w, 8
w:
	.zero	8
	.globl	h
	.align 8
	.type	h, @object
	.size	h, 8
h:
	.zero	8
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
