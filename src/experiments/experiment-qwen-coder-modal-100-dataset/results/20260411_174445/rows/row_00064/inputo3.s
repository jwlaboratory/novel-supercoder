	.file	"inputC.c"
	.text
	.p2align 4
	.globl	cmp
	.type	cmp, @function
cmp:
.LFB14:
	.cfi_startproc
	movl	(%rdi), %eax
	subl	(%rsi), %eax
	ret
	.cfi_endproc
.LFE14:
	.size	cmp, .-cmp
	.p2align 4
	.globl	min_heapify
	.type	min_heapify, @function
min_heapify:
.LFB8:
	.cfi_startproc
	movl	qsize(%rip), %esi
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L11:
	movslq	%edx, %rcx
	movl	que(,%rcx,8), %r8d
	movslq	%edi, %rcx
	cmpl	que(,%rcx,8), %r8d
	jge	.L4
	cmpl	%eax, %esi
	jg	.L8
	movl	%edx, %eax
.L9:
	cmpl	%edi, %eax
	je	.L3
	movslq	%eax, %rdx
	movq	que(,%rcx,8), %rdi
	movq	que(,%rdx,8), %r8
	movq	%r8, que(,%rcx,8)
	movq	%rdi, que(,%rdx,8)
	movl	%eax, %edi
.L10:
	leal	(%rdi,%rdi), %edx
	leal	1(%rdx), %eax
	cmpl	%edx, %esi
	jg	.L11
.L4:
	cmpl	%eax, %esi
	jg	.L6
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	movslq	%edi, %rcx
	movslq	%eax, %rdx
	movl	que(,%rcx,8), %r10d
	cmpl	%r10d, que(,%rdx,8)
	jl	.L9
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	movslq	%eax, %r9
	cmpl	que(,%r9,8), %r8d
	cmovle	%edx, %eax
	jmp	.L9
.L3:
	ret
	.cfi_endproc
.LFE8:
	.size	min_heapify, .-min_heapify
	.p2align 4
	.globl	deq
	.type	deq, @function
deq:
.LFB9:
	.cfi_startproc
	movl	qsize(%rip), %eax
	xorl	%esi, %esi
	leal	-1(%rax), %edi
	movslq	%edi, %rax
	movl	%edi, qsize(%rip)
	movq	que(,%rax,8), %rax
	movq	%rax, que(%rip)
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L20:
	movslq	%edx, %rcx
	movl	que(,%rcx,8), %r8d
	movslq	%esi, %rcx
	cmpl	que(,%rcx,8), %r8d
	jge	.L13
	cmpl	%eax, %edi
	jle	.L19
	movslq	%eax, %r9
	cmpl	que(,%r9,8), %r8d
	cmovle	%edx, %eax
.L17:
	cmpl	%eax, %esi
	je	.L12
	movslq	%eax, %rdx
	movq	que(,%rcx,8), %rsi
	movq	que(,%rdx,8), %r8
	movq	%r8, que(,%rcx,8)
	movq	%rsi, que(,%rdx,8)
	movl	%eax, %esi
.L18:
	leal	(%rsi,%rsi), %edx
	leal	1(%rdx), %eax
	cmpl	%edx, %edi
	jg	.L20
.L13:
	cmpl	%eax, %edi
	jg	.L15
	ret
	.p2align 4,,10
	.p2align 3
.L15:
	movslq	%esi, %rcx
	movslq	%eax, %rdx
	movl	que(,%rcx,8), %r10d
	cmpl	%r10d, que(,%rdx,8)
	jl	.L17
.L12:
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	movl	%edx, %eax
	jmp	.L17
	.cfi_endproc
.LFE9:
	.size	deq, .-deq
	.p2align 4
	.globl	enq
	.type	enq, @function
enq:
.LFB10:
	.cfi_startproc
	movslq	qsize(%rip), %rax
	leal	1(%rax), %edx
	movl	%edx, qsize(%rip)
	movslq	%eax, %rdx
	movl	%edi, que+4(,%rdx,8)
	movl	%esi, que(,%rdx,8)
	testl	%eax, %eax
	jg	.L22
	ret
	.p2align 4,,10
	.p2align 3
.L24:
	movd	que+4(,%rax,8), %xmm1
	movq	que(,%rdx,8), %rdi
	movd	%esi, %xmm0
	punpckldq	%xmm1, %xmm0
	movq	%rdi, que(,%rax,8)
	movq	%xmm0, que(,%rdx,8)
	testl	%ecx, %ecx
	je	.L21
	movl	que(,%rdx,8), %esi
	movslq	%ecx, %rax
.L22:
	movl	%eax, %ecx
	sarl	%ecx
	movslq	%ecx, %rdx
	cmpl	%esi, que(,%rdx,8)
	jg	.L24
.L21:
	ret
	.cfi_endproc
.LFE10:
	.size	enq, .-enq
	.p2align 4
	.globl	add_edge
	.type	add_edge, @function
add_edge:
.LFB11:
	.cfi_startproc
	movl	$hi, %r10d
	movslq	%edi, %r8
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movslq	%esi, %r9
	movzwl	(%r10,%r8,2), %eax
	movl	%edx, %r11d
	movl	%ecx, %edx
	movzwl	%si, %esi
	movzwl	%di, %edi
	leal	1(%rax), %ecx
	movw	%cx, (%r10,%r8,2)
	movswq	(%r10,%r9,2), %rcx
	imulq	$36060, %r8, %r8
	leal	1(%rcx), %ebx
	movw	%bx, (%r10,%r9,2)
	movswq	%ax, %r10
	sall	$16, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	leaq	(%r10,%r10,2), %r10
	orl	%edi, %eax
	leaq	(%r8,%r10,4), %r10
	movl	%ecx, %r8d
	sall	$16, %r8d
	movl	%edx, edge+8(%r10)
	negl	%edx
	orl	%r8d, %esi
	movl	%r11d, edge+4(%r10)
	movl	%esi, edge(%r10)
	leaq	(%rcx,%rcx,2), %rsi
	imulq	$36060, %r9, %rcx
	leaq	(%rcx,%rsi,4), %rcx
	movl	$0, edge+4(%rcx)
	movl	%edx, edge+8(%rcx)
	movl	%eax, edge(%rcx)
	ret
	.cfi_endproc
.LFE11:
	.size	add_edge, .-add_edge
	.p2align 4
	.globl	minCost
	.type	minCost, @function
minCost:
.LFB12:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L62
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movslq	%esi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%esi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx
	xorl	%edi, %edi
	movslq	%ebx, %r8
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movl	V(%rip), %r13d
	movl	%edi, 36(%rsp)
	leal	0(,%r13,4), %eax
	movl	%r13d, %ebp
	movq	%r8, 16(%rsp)
	cltq
	shrl	$2, %ebp
	movq	%rax, 24(%rsp)
	leal	-1(%r13), %eax
	salq	$4, %rbp
	movl	%eax, 40(%rsp)
	movl	%r13d, %eax
	andl	$-4, %eax
	movl	%eax, 44(%rsp)
	.p2align 4,,10
	.p2align 3
.L61:
	movq	24(%rsp), %rdx
	movl	$min_cost, %edi
	movl	$269488144, %esi
	call	memset
	movq	16(%rsp), %rax
	movl	%ebx, que+4(%rip)
	xorl	%edi, %edi
	movl	$1, qsize(%rip)
	movl	$0, que(%rip)
	movl	$0, min_cost(,%rax,4)
	movl	$1, %eax
.L34:
	movslq	%eax, %rdx
	leaq	que(,%rdx,8), %rcx
.L41:
	testl	%eax, %eax
	je	.L96
	movq	-8(%rcx), %rdx
	movl	que(%rip), %esi
	subl	$1, %eax
	xorl	%r8d, %r8d
	movl	que+4(%rip), %r10d
	movq	%rcx, 8(%rsp)
	movq	%rdx, que(%rip)
	movl	%r10d, %r11d
	jmp	.L40
	.p2align 4,,10
	.p2align 3
.L97:
	movslq	%edi, %r9
	movl	que(,%r9,8), %r10d
	movslq	%r8d, %r9
	cmpl	que(,%r9,8), %r10d
	jge	.L35
	cmpl	%edx, %eax
	jle	.L63
	movslq	%edx, %rcx
	cmpl	que(,%rcx,8), %r10d
	cmovle	%edi, %edx
.L39:
	cmpl	%edx, %r8d
	je	.L87
	movslq	%edx, %rdi
	movq	que(,%r9,8), %r8
	movq	que(,%rdi,8), %r10
	movq	%r10, que(,%r9,8)
	movq	%r8, que(,%rdi,8)
	movl	%edx, %r8d
.L40:
	leal	(%r8,%r8), %edi
	leal	1(%rdi), %edx
	cmpl	%edi, %eax
	jg	.L97
.L35:
	cmpl	%edx, %eax
	jle	.L87
	movslq	%r8d, %r9
	movslq	%edx, %rdi
	movl	que(,%r9,8), %r10d
	cmpl	%r10d, que(,%rdi,8)
	jl	.L39
	.p2align 4,,10
	.p2align 3
.L87:
	movslq	%r11d, %r8
	movq	8(%rsp), %rcx
	movl	%r11d, %r10d
	movl	$1, %edi
	movl	min_cost(,%r8,4), %edx
	subq	$8, %rcx
	cmpl	%esi, %edx
	jl	.L41
	movswl	hi(%r8,%r8), %r9d
	testw	%r9w, %r9w
	jle	.L42
	imulq	$36060, %r8, %rsi
	movl	%ebx, 8(%rsp)
	movl	potential(,%r8,4), %r11d
	xorl	%edi, %edi
	movl	%r10d, %ebx
	addq	$edge, %rsi
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L43:
	addl	$1, %edi
	addq	$12, %rsi
	cmpl	%edi, %r9d
	je	.L90
.L98:
	movl	min_cost(,%r8,4), %edx
.L47:
	movl	4(%rsi), %ecx
	testl	%ecx, %ecx
	jle	.L43
	movswq	(%rsi), %rcx
	addl	8(%rsi), %edx
	addl	%r11d, %edx
	movq	%rcx, %r10
	subl	potential(,%rcx,4), %edx
	cmpl	%edx, min_cost(,%rcx,4)
	jle	.L43
	movl	%edx, min_cost(,%rcx,4)
	movw	%bx, prevv(%rcx,%rcx)
	movw	%di, preve(%rcx,%rcx)
	leal	1(%rax), %ecx
	movl	%ecx, 32(%rsp)
	movslq	%eax, %rcx
	movl	%r10d, que+4(,%rcx,8)
	movl	%edx, que(,%rcx,8)
	testl	%eax, %eax
	jg	.L44
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L46:
	cltq
	movd	%edx, %xmm0
	movq	que(,%rcx,8), %rdx
	movd	que+4(,%rax,8), %xmm2
	movq	%rdx, que(,%rax,8)
	punpckldq	%xmm2, %xmm0
	movq	%xmm0, que(,%rcx,8)
	testl	%r10d, %r10d
	je	.L45
	movl	que(,%rcx,8), %edx
	movl	%r10d, %eax
.L44:
	movl	%eax, %r10d
	sarl	%r10d
	movslq	%r10d, %rcx
	cmpl	%edx, que(,%rcx,8)
	jg	.L46
.L45:
	addl	$1, %edi
	movl	32(%rsp), %eax
	addq	$12, %rsi
	cmpl	%edi, %r9d
	jne	.L98
	.p2align 4,,10
	.p2align 3
.L90:
	movl	8(%rsp), %ebx
.L42:
	movl	$1, %edi
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L63:
	movl	%edi, %edx
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L96:
	testb	%dil, %dil
	je	.L49
	movl	$0, qsize(%rip)
.L49:
	cmpl	$269488144, min_cost(,%r15,4)
	je	.L64
	testl	%r13d, %r13d
	jle	.L56
	cmpl	$2, 40(%rsp)
	jbe	.L66
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L54:
	movdqa	min_cost(%rax), %xmm0
	paddd	potential(%rax), %xmm0
	addq	$16, %rax
	movaps	%xmm0, potential-16(%rax)
	cmpq	%rbp, %rax
	jne	.L54
	movl	44(%rsp), %eax
	movl	%eax, %edx
	cmpl	%r13d, %eax
	je	.L56
.L53:
	movl	%r13d, %ecx
	subl	%edx, %ecx
	cmpl	$1, %ecx
	je	.L58
	movq	potential(,%rdx,4), %xmm0
	movq	min_cost(,%rdx,4), %xmm1
	paddd	%xmm1, %xmm0
	movq	%xmm0, potential(,%rdx,4)
	testb	$1, %cl
	je	.L56
	andl	$-2, %ecx
	addl	%ecx, %eax
.L58:
	cltq
	movl	min_cost(,%rax,4), %edx
	addl	%edx, potential(,%rax,4)
.L56:
	cmpl	%r14d, %ebx
	je	.L99
	movl	%r12d, %edx
	movslq	%r14d, %rax
	.p2align 4,,10
	.p2align 3
.L51:
	movswl	prevv(%rax,%rax), %ecx
	movswq	preve(%rax,%rax), %rsi
	movslq	%ecx, %rax
	leaq	(%rsi,%rsi,2), %rdi
	imulq	$36060, %rax, %rsi
	movl	edge+4(%rsi,%rdi,4), %esi
	cmpl	%esi, %edx
	cmovg	%esi, %edx
	cmpl	%ebx, %ecx
	jne	.L51
	movl	potential(,%r15,4), %eax
	subl	%edx, %r12d
	movslq	%r14d, %rcx
	imull	%edx, %eax
	addl	%eax, 36(%rsp)
	.p2align 4,,10
	.p2align 3
.L60:
	movq	%rcx, %rax
	movswq	prevv(%rcx,%rcx), %rcx
	movswq	preve(%rax,%rax), %rsi
	imulq	$36060, %rax, %rax
	leaq	(%rsi,%rsi,2), %r8
	imulq	$36060, %rcx, %rsi
	leaq	edge(%rsi,%r8,4), %rsi
	subl	%edx, 4(%rsi)
	movswq	2(%rsi), %rsi
	leaq	(%rsi,%rsi,2), %rsi
	addl	%edx, edge+4(%rax,%rsi,4)
	cmpl	%ebx, %ecx
	jne	.L60
	testl	%r12d, %r12d
	jg	.L61
	movl	36(%rsp), %edi
	jmp	.L32
.L99:
	movq	16(%rsp), %r8
	movl	36(%rsp), %edi
	imull	potential(,%r8,4), %r12d
	addl	%r12d, %edi
.L32:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%edi, %eax
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
.L66:
	.cfi_restore_state
	xorl	%edx, %edx
	jmp	.L53
.L64:
	movl	$-1, %edi
	jmp	.L32
.L62:
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
	.size	minCost, .-minCost
	.p2align 4
	.globl	in
	.type	in, @function
in:
.LFB13:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L101:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L101
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE13:
	.size	in, .-in
	.p2align 4
	.globl	uniq
	.type	uniq, @function
uniq:
.LFB15:
	.cfi_startproc
	movl	$1, %eax
	xorl	%r9d, %r9d
	cmpl	$1, %esi
	jle	.L117
	.p2align 4,,10
	.p2align 3
.L114:
	movslq	%r9d, %rdx
	movl	(%rdi,%rdx,4), %r8d
	leaq	0(,%rdx,4), %r10
	movslq	%eax, %rdx
	leaq	(%rdi,%rdx,4), %rdx
	jmp	.L111
	.p2align 4,,10
	.p2align 3
.L108:
	addq	$4, %rdx
	cmpl	%eax, %esi
	je	.L107
.L111:
	movl	%eax, %ecx
	leal	1(%rax), %eax
	cmpl	%r8d, (%rdx)
	je	.L108
	cmpl	%ecx, %esi
	jle	.L109
	addl	$1, %r9d
	cmpl	%r9d, %ecx
	je	.L109
	movslq	%ecx, %rax
	movl	(%rdi,%rax,4), %eax
	movl	%eax, 4(%rdi,%r10)
.L109:
	leal	1(%rcx), %eax
	cmpl	%eax, %esi
	jg	.L114
.L107:
	leal	1(%r9), %eax
	ret
.L117:
	ret
	.cfi_endproc
.LFE15:
	.size	uniq, .-uniq
	.p2align 4
	.globl	bsch
	.type	bsch, @function
bsch:
.LFB16:
	.cfi_startproc
	movl	sz(%rip), %edx
	xorl	%ecx, %ecx
	jmp	.L120
	.p2align 4,,10
	.p2align 3
.L121:
	leal	(%rdx,%rcx), %eax
	sarl	%eax
	movslq	%eax, %rsi
	cmpl	%edi, block(,%rsi,4)
	jl	.L123
	movl	%eax, %edx
.L120:
	cmpl	%ecx, %edx
	jg	.L121
	movl	%ecx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L123:
	leal	1(%rax), %ecx
	jmp	.L120
	.cfi_endproc
.LFE16:
	.size	bsch, .-bsch
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB17:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	xorl	%eax, %eax
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	call	in
	movl	$0, sz(%rip)
	movl	%eax, %ebx
	testl	%eax, %eax
	jle	.L125
	movslq	%eax, %rbp
	xorl	%r12d, %r12d
	leaq	0(,%rbp,4), %r13
	.p2align 4,,10
	.p2align 3
.L128:
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L126:
	andl	$15, %eax
	leal	(%r14,%r14,4), %edx
	leal	(%rax,%rdx,2), %r14d
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L126
	movslq	sz(%rip), %rax
	movl	%r14d, a(%r12)
	movl	%r14d, block(,%rax,4)
	leal	1(%rax), %edx
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	movl	%edx, sz(%rip)
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L127:
	andl	$15, %eax
	leal	(%r14,%r14,4), %edx
	leal	(%rax,%rdx,2), %r14d
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L127
	movslq	sz(%rip), %rax
	movl	%r14d, b(%r12)
	addq	$4, %r12
	leal	1(%rax), %edx
	movl	%r14d, block(,%rax,4)
	movl	%edx, sz(%rip)
	cmpq	%r12, %r13
	jne	.L128
	movslq	%edx, %rsi
	movl	$cmp, %ecx
	movl	$4, %edx
	xorl	%r12d, %r12d
	movl	$block, %edi
	call	qsort
	movl	sz(%rip), %r8d
	leal	2(%rbx,%r8), %eax
	movl	%eax, V(%rip)
	.p2align 4,,10
	.p2align 3
.L136:
	movl	a(,%r12,4), %esi
	movl	%r12d, %r13d
	movl	%r8d, %edx
	xorl	%edi, %edi
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L131:
	leal	(%rdx,%rdi), %eax
	sarl	%eax
	movslq	%eax, %rcx
	cmpl	block(,%rcx,4), %esi
	jg	.L154
	movl	%eax, %edx
.L130:
	cmpl	%edi, %edx
	jg	.L131
	movl	b(,%r12,4), %ecx
	leal	2(%r13,%r8), %esi
	addl	$2, %edi
	movl	$1, %edx
	negl	%ecx
	call	add_edge
	movl	sz(%rip), %r8d
	movl	b(,%r12,4), %esi
	xorl	%edi, %edi
	movl	%r8d, %edx
	jmp	.L133
	.p2align 4,,10
	.p2align 3
.L134:
	leal	(%rdx,%rdi), %eax
	sarl	%eax
	movslq	%eax, %rcx
	cmpl	block(,%rcx,4), %esi
	jg	.L155
	movl	%eax, %edx
.L133:
	cmpl	%edi, %edx
	jg	.L134
	movl	a(,%r12,4), %ecx
	leal	2(%r8,%r13), %esi
	addl	$2, %edi
	addq	$1, %r12
	movl	$1, %edx
	negl	%ecx
	call	add_edge
	cmpq	%r12, %rbp
	je	.L135
	movl	sz(%rip), %r8d
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L154:
	leal	1(%rax), %edi
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L155:
	leal	1(%rax), %edi
	jmp	.L133
.L135:
	movl	sz(%rip), %r9d
	movq	.LC0(%rip), %rbp
	testl	%r9d, %r9d
	jle	.L137
.L141:
	movzwl	hi(%rip), %r10d
	movq	.LC0(%rip), %rbp
	movl	$2, %ecx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L138:
	movswq	hi+4(%rdx,%rdx), %rax
	leal	(%r10,%rdx), %edi
	movzwl	%cx, %r11d
	xorl	%r12d, %r12d
	leal	1(%rax), %esi
	movw	%si, hi+4(%rdx,%rdx)
	movswq	%di, %rsi
	addq	$1, %rdx
	leaq	(%rsi,%rsi,2), %r8
	movl	%eax, %esi
	sall	$16, %esi
	movq	%rbp, edge+4(,%r8,4)
	orl	%r11d, %esi
	movl	%esi, edge(,%r8,4)
	movslq	%ecx, %rsi
	leaq	(%rax,%rax,2), %r8
	addl	$1, %ecx
	imulq	$36060, %rsi, %rax
	leaq	(%rax,%r8,4), %rax
	movw	%r12w, edge(%rax)
	movq	$0, edge+4(%rax)
	movw	%di, edge+2(%rax)
	cmpl	%edx, %r9d
	jg	.L138
	addl	%r9d, %r10d
	movw	%r10w, hi(%rip)
	testl	%ebx, %ebx
	jle	.L152
.L137:
	movslq	%r9d, %rax
	leal	2(%r9), %ecx
	leal	2(%rbx,%r9), %r10d
	leaq	hi(%rax,%rax), %rsi
	.p2align 4,,10
	.p2align 3
.L140:
	movswq	4(%rsi), %r11
	movslq	%ecx, %rdi
	addq	$2, %rsi
	imulq	$36060, %rdi, %rdi
	leal	1(%r11), %edx
	movq	%r11, %rax
	leaq	(%r11,%r11,2), %r11
	movw	%dx, 2(%rsi)
	movswq	hi+2(%rip), %rdx
	sall	$16, %eax
	leaq	(%rdi,%r11,4), %rdi
	movl	$1, %r11d
	movw	%dx, edge+2(%rdi)
	leal	1(%rdx), %r8d
	leaq	(%rdx,%rdx,2), %rdx
	movw	%r11w, edge(%rdi)
	leaq	36060(,%rdx,4), %rdx
	movswq	%r8w, %r9
	movq	%rbp, edge+4(%rdi)
	movzwl	%cx, %edi
	addl	$1, %ecx
	orl	%edi, %eax
	movw	%r8w, hi+2(%rip)
	movq	$0, edge+4(%rdx)
	movl	%eax, edge(%rdx)
	cmpl	%ecx, %r10d
	jne	.L140
.L139:
	movzwl	hi(%rip), %edx
	movl	$1, %ecx
	xorl	%esi, %esi
	xorl	%edi, %edi
	addl	$1, %r8d
	leal	1(%rdx), %eax
	movw	%r8w, hi+2(%rip)
	movw	%ax, hi(%rip)
	movswq	%dx, %rax
	leaq	(%rax,%rax,2), %rax
	salq	$2, %rax
	movw	%cx, edge(%rax)
	movw	%r9w, edge+2(%rax)
	movq	$3003, edge+4(%rax)
	leaq	(%r9,%r9,2), %rax
	salq	$2, %rax
	movw	%si, edge+36060(%rax)
	movl	$1, %esi
	movw	%dx, edge+36062(%rax)
	leal	(%rbx,%rbx), %edx
	movq	$0, edge+36064(%rax)
	call	minCost
	movl	$.LC2, %edi
	negl	%eax
	movl	%eax, %esi
	xorl	%eax, %eax
	call	printf
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L125:
	.cfi_restore_state
	movl	$cmp, %ecx
	movl	$4, %edx
	xorl	%esi, %esi
	movl	$block, %edi
	call	qsort
	movl	sz(%rip), %r9d
	leal	2(%rbx,%r9), %eax
	movl	%eax, V(%rip)
	testl	%r9d, %r9d
	jg	.L141
.L152:
	movswq	hi+2(%rip), %r9
	movl	%r9d, %r8d
	jmp	.L139
	.cfi_endproc
.LFE17:
	.size	main, .-main
	.globl	sz
	.bss
	.align 4
	.type	sz, @object
	.size	sz, 4
sz:
	.zero	4
	.globl	block
	.align 32
	.type	block, @object
	.size	block, 8008
block:
	.zero	8008
	.globl	b
	.align 32
	.type	b, @object
	.size	b, 4008
b:
	.zero	4008
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 4008
a:
	.zero	4008
	.globl	preve
	.align 32
	.type	preve, @object
	.size	preve, 6010
preve:
	.zero	6010
	.globl	prevv
	.align 32
	.type	prevv, @object
	.size	prevv, 6010
prevv:
	.zero	6010
	.globl	min_cost
	.align 32
	.type	min_cost, @object
	.size	min_cost, 12020
min_cost:
	.zero	12020
	.globl	potential
	.align 32
	.type	potential, @object
	.size	potential, 12020
potential:
	.zero	12020
	.globl	V
	.align 4
	.type	V, @object
	.size	V, 4
V:
	.zero	4
	.globl	hi
	.align 32
	.type	hi, @object
	.size	hi, 6010
hi:
	.zero	6010
	.globl	edge
	.align 32
	.type	edge, @object
	.size	edge, 108360300
edge:
	.zero	108360300
	.globl	qsize
	.align 4
	.type	qsize, @object
	.size	qsize, 4
qsize:
	.zero	4
	.globl	que
	.align 32
	.type	que, @object
	.size	que, 24040
que:
	.zero	24040
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	1
	.long	0
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
