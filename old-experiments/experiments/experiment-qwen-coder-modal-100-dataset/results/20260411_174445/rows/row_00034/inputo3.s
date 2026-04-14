	.file	"inputC.c"
	.text
	.p2align 4
	.globl	min_heapify
	.type	min_heapify, @function
min_heapify:
.LFB8:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	qsize(%rip), %r8d
	movl	%edi, %esi
	.p2align 4,,10
	.p2align 3
.L11:
	leal	(%rsi,%rsi), %edx
	leal	1(%rdx), %ecx
	cmpl	%edx, %r8d
	jle	.L2
	movslq	%edx, %r9
	leaq	(%r9,%r9,2), %rax
	addq	%rax, %rax
	movzwl	que(%rax), %r10d
	leaq	que(%rax), %rbx
	movslq	%esi, %rax
	leaq	(%rax,%rax,2), %rdi
	addq	%rdi, %rdi
	leaq	que(%rdi), %r11
	cmpw	que(%rdi), %r10w
	jl	.L3
	je	.L4
.L2:
	cmpl	%ecx, %r8d
	jle	.L1
	movslq	%esi, %rax
	movslq	%ecx, %rdi
	leaq	(%rdi,%rdi,2), %rdx
	leaq	(%rax,%rax,2), %r9
	movzwl	que(%rdx,%rdx), %ebx
	cmpw	%bx, que(%r9,%r9)
	jg	.L8
	je	.L15
.L1:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L15:
	.cfi_restore_state
	movl	%esi, %edx
	movq	%rax, %r9
.L9:
	leaq	(%rdi,%rdi,2), %r10
	leaq	(%r9,%r9,2), %rdi
	movzwl	que+4(%rdi,%rdi), %ebx
	cmpw	%bx, que+4(%r10,%r10)
	jge	.L10
	.p2align 4,,10
	.p2align 3
.L8:
	cmpl	%esi, %ecx
	je	.L1
	leaq	(%rax,%rax,2), %rdx
	movslq	%ecx, %rax
	movl	%ecx, %esi
	leaq	(%rax,%rax,2), %rax
	addq	%rdx, %rdx
	addq	%rax, %rax
	movl	que(%rdx), %r10d
	movzwl	que+4(%rdx), %r9d
	leaq	que(%rdx), %rdi
	movl	que(%rax), %r11d
	movl	%r11d, que(%rdx)
	movzwl	que+4(%rax), %edx
	movw	%dx, 4(%rdi)
	movl	%r10d, que(%rax)
	movw	%r9w, que+4(%rax)
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L4:
	movzwl	4(%r11), %edi
	cmpw	%di, 4(%rbx)
	jge	.L2
	.p2align 4,,10
	.p2align 3
.L3:
	cmpl	%ecx, %r8d
	jle	.L10
	movslq	%ecx, %rdi
	leaq	(%rdi,%rdi,2), %r11
	cmpw	que(%r11,%r11), %r10w
	jg	.L8
	je	.L9
.L10:
	movl	%edx, %ecx
	jmp	.L8
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
	xorl	%edi, %edi
	subl	$1, %eax
	movl	%eax, qsize(%rip)
	cltq
	leaq	(%rax,%rax,2), %rax
	addq	%rax, %rax
	movl	que(%rax), %edx
	movl	%edx, que(%rip)
	movzwl	que+4(%rax), %eax
	movw	%ax, que+4(%rip)
	jmp	min_heapify
	.cfi_endproc
.LFE9:
	.size	deq, .-deq
	.p2align 4
	.globl	enq
	.type	enq, @function
enq:
.LFB10:
	.cfi_startproc
	movl	qsize(%rip), %ecx
	leal	1(%rcx), %eax
	movl	%eax, qsize(%rip)
	movslq	%ecx, %rax
	leaq	(%rax,%rax,2), %rax
	addq	%rax, %rax
	movw	%di, que+2(%rax)
	movw	%si, que(%rax)
	movw	%dx, que+4(%rax)
	testl	%ecx, %ecx
	jle	.L25
	.p2align 4,,10
	.p2align 3
.L18:
	movslq	%ecx, %rax
	sarl	%ecx
	movslq	%ecx, %rdi
	leaq	(%rax,%rax,2), %rdx
	leaq	(%rdi,%rdi,2), %rsi
	addq	%rdx, %rdx
	addq	%rsi, %rsi
	leaq	que(%rdx), %r8
	movzwl	que(%rdx), %edx
	leaq	que(%rsi), %r9
	cmpw	%dx, que(%rsi)
	jg	.L20
	jne	.L17
	movzwl	4(%r8), %esi
	cmpw	%si, 4(%r9)
	jle	.L17
.L20:
	leaq	(%rax,%rax,2), %rdx
	leaq	(%rdi,%rdi,2), %rax
	addq	%rax, %rax
	addq	%rdx, %rdx
	movl	que(%rax), %edi
	movl	que(%rdx), %r10d
	leaq	que(%rdx), %r8
	movzwl	que+4(%rdx), %r9d
	movl	%edi, que(%rdx)
	movzwl	que+4(%rax), %edx
	movw	%dx, 4(%r8)
	movl	%r10d, que(%rax)
	movw	%r9w, que+4(%rax)
	testl	%ecx, %ecx
	jne	.L18
.L17:
	ret
.L25:
	ret
	.cfi_endproc
.LFE10:
	.size	enq, .-enq
	.p2align 4
	.globl	in
	.type	in, @function
in:
.LFB11:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L27:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L27
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE11:
	.size	in, .-in
	.p2align 4
	.globl	dijkstra
	.type	dijkstra, @function
dijkstra:
.LFB12:
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
	movl	%edx, %ebp
	movl	$2008008, %edx
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebx
	xorl	%esi, %esi
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdi, 8(%rsp)
	movl	$mk, %edi
	call	memset
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	%ebx, %edi
	movl	$0, qsize(%rip)
	call	enq
	.p2align 4,,10
	.p2align 3
.L50:
	movl	qsize(%rip), %r15d
.L49:
	testl	%r15d, %r15d
	je	.L51
	subl	$1, %r15d
	movswq	que+2(%rip), %r14
	xorl	%edi, %edi
	movswl	que(%rip), %ebx
	movslq	%r15d, %rax
	movswl	que+4(%rip), %r13d
	movl	%r15d, qsize(%rip)
	leaq	(%rax,%rax,2), %rax
	addq	%rax, %rax
	movl	que(%rax), %edx
	movl	%edx, que(%rip)
	movzwl	que+4(%rax), %eax
	movw	%ax, que+4(%rip)
	call	min_heapify
	cmpl	%ebp, %r14d
	je	.L52
	movzwl	hi(%r14,%r14), %ecx
	testl	%r13d, %r13d
	je	.L34
	testw	%cx, %cx
	jle	.L49
	movq	to(,%r14,8), %r12
	movq	no(,%r14,8), %r15
	xorl	%r11d, %r11d
	addl	$1, %ebx
	jmp	.L41
	.p2align 4,,10
	.p2align 3
.L40:
	addq	$1, %r11
	movswl	%cx, %eax
	cmpl	%r11d, %eax
	jle	.L50
.L41:
	movswq	(%r15,%r11,2), %rax
	testl	%eax, %eax
	jle	.L40
	movswq	(%r12,%r11,2), %rdx
	movq	%rdx, %rdi
	imulq	$1002, %rdx, %rdx
	addq	%rdx, %rax
	cmpb	$0, mk+1(%rax,%rax)
	jne	.L40
	movl	%r13d, %edx
	movl	%ebx, %esi
	movb	$1, mk+1(%rax,%rax)
	call	enq
	movzwl	hi(%r14,%r14), %ecx
	jmp	.L40
	.p2align 4,,10
	.p2align 3
.L34:
	testw	%cx, %cx
	jle	.L49
	imulq	$1002, %r14, %r11
	movq	to(,%r14,8), %r12
	movq	no(,%r14,8), %r15
	xorl	%r13d, %r13d
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L54:
	movslq	%edi, %rsi
	imulq	$1002, %rsi, %rsi
	addq	%rsi, %rdx
	cmpb	$0, mk(%rdx,%rdx)
	je	.L53
.L38:
	addq	$1, %r13
	movswl	%cx, %edx
	cmpl	%r13d, %edx
	jle	.L50
.L39:
	movswq	(%r15,%r13,2), %rdx
	movswl	(%r12,%r13,2), %edi
	testl	%edx, %edx
	jg	.L54
	negl	%edx
	movslq	%edx, %rsi
	addq	%r11, %rsi
	cmpb	$0, mk+1(%rsi,%rsi)
	jne	.L38
	movb	$1, mk+1(%rsi,%rsi)
	leal	1(%rbx), %esi
	call	enq
	movzwl	hi(%r14,%r14), %ecx
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L53:
	movb	$1, mk(%rdx,%rdx)
	leal	1(%rbx), %esi
	xorl	%edx, %edx
	call	enq
	movzwl	hi(%r14,%r14), %ecx
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L51:
	movl	$-1, %ebx
.L30:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebx, %eax
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
.L52:
	.cfi_restore_state
	movq	8(%rsp), %rax
	movl	%r13d, (%rax)
	jmp	.L30
	.cfi_endproc
.LFE12:
	.size	dijkstra, .-dijkstra
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB13:
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.p2align 4,,10
	.p2align 3
.L56:
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L73:
	andl	$15, %eax
	leal	0(%rbp,%rbp,4), %edx
	leal	(%rax,%rdx,2), %ebp
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L73
	testl	%ebp, %ebp
	je	.L90
	leal	1(%rbp), %eax
	movl	%eax, 12(%rsp)
	xorl	%eax, %eax
	call	getchar_unlocked
	movl	$0, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L57:
	movl	8(%rsp), %esi
	andl	$15, %eax
	leal	(%rsi,%rsi,4), %edx
	leal	(%rax,%rdx,2), %eax
	movl	%eax, 8(%rsp)
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L57
	xorl	%eax, %eax
	xorl	%r15d, %r15d
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L58:
	andl	$15, %eax
	leal	(%r15,%r15,4), %edx
	leal	(%rax,%rdx,2), %r15d
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L58
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L59:
	andl	$15, %eax
	leal	0(%r13,%r13,4), %edx
	leal	(%rax,%rdx,2), %r13d
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L59
	leal	0(,%r13,4), %edi
	movslq	%edi, %rdi
	call	malloc
	xorl	%esi, %esi
	movl	$hi, %edi
	movq	%rax, 16(%rsp)
	movq	%rax, %rbx
	movl	12(%rsp), %eax
	addl	%eax, %eax
	cltq
	movq	%rax, %rdx
	movq	%rax, 24(%rsp)
	call	memset
	testl	%r13d, %r13d
	je	.L60
	movl	%r13d, %eax
	movq	%rbx, %r12
	leaq	(%rbx,%rax,4), %rax
	movq	%rax, (%rsp)
	.p2align 4,,10
	.p2align 3
.L63:
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L61:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L61
	movw	%bx, (%r12)
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L62:
	andl	$15, %eax
	leal	(%r14,%r14,4), %edx
	leal	(%rax,%rdx,2), %r14d
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L62
	movslq	%ebx, %rbx
	movslq	%r14d, %rdx
	movw	%r14w, 2(%r12)
	addq	$4, %r12
	addw	$1, hi(%rbx,%rbx)
	addw	$1, hi(%rdx,%rdx)
	cmpq	%r12, (%rsp)
	jne	.L63
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L71
.L68:
	xorl	%ebx, %ebx
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L70:
	addq	$1, %rbx
	leal	-1(%rbx), %eax
	cmpl	%eax, %ebp
	jle	.L71
.L66:
	movzwl	hi(%rbx,%rbx), %eax
	testw	%ax, %ax
	je	.L70
	movswl	%ax, %r12d
	addl	%r12d, %r12d
	movslq	%r12d, %r12
	movq	%r12, %rdi
	call	malloc
	movq	%r12, %rdi
	movq	%rax, to(,%rbx,8)
	call	malloc
	movq	%rax, no(,%rbx,8)
	addq	$1, %rbx
	leal	-1(%rbx), %eax
	cmpl	%eax, %ebp
	jg	.L66
.L71:
	movq	24(%rsp), %rdx
	xorl	%esi, %esi
	movl	$hi, %edi
	call	memset
	movq	16(%rsp), %rax
	leal	1(%r13), %r8d
	movl	$1, %ecx
	leaq	2(%rax), %rsi
	testl	%r13d, %r13d
	jle	.L67
	.p2align 4,,10
	.p2align 3
.L72:
	movswq	-2(%rsi), %r9
	movswq	(%rsi), %rax
	addq	$4, %rsi
	movswq	hi(%r9,%r9), %rdx
	movq	%r9, %rdi
	leal	1(%rdx), %r10d
	movw	%r10w, hi(%r9,%r9)
	movq	to(,%r9,8), %r10
	movq	no(,%r9,8), %r9
	movw	%ax, (%r10,%rdx,2)
	movq	to(,%rax,8), %r10
	movw	%cx, (%r9,%rdx,2)
	movswl	hi(%rax,%rax), %r9d
	leal	1(%r9), %edx
	movw	%dx, hi(%rax,%rax)
	movswq	%r9w, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %r10
	addq	no(,%rax,8), %rdx
	movl	%ecx, %eax
	addl	$1, %ecx
	negl	%eax
	movw	%di, (%r10)
	movw	%ax, (%rdx)
	cmpl	%r8d, %ecx
	jne	.L72
	negl	%r13d
	movw	%di, (%r10)
	movl	%r9d, 44(%rsp)
	movw	%r13w, (%rdx)
.L67:
	movq	16(%rsp), %rdi
	call	free
	movl	8(%rsp), %esi
	movl	%r15d, %edx
	leaq	44(%rsp), %rdi
	call	dijkstra
	movl	44(%rsp), %edx
	movl	$.LC0, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
	call	printf
	jmp	.L56
.L90:
	addq	$56, %rsp
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
.L60:
	.cfi_restore_state
	movl	12(%rsp), %edx
	testl	%edx, %edx
	jg	.L68
	movq	24(%rsp), %rdx
	xorl	%esi, %esi
	movl	$hi, %edi
	call	memset
	jmp	.L67
	.cfi_endproc
.LFE13:
	.size	main, .-main
	.globl	mk
	.bss
	.align 32
	.type	mk, @object
	.size	mk, 2008008
mk:
	.zero	2008008
	.globl	no
	.align 32
	.type	no, @object
	.size	no, 8016
no:
	.zero	8016
	.globl	to
	.align 32
	.type	to, @object
	.size	to, 8016
to:
	.zero	8016
	.globl	hi
	.align 32
	.type	hi, @object
	.size	hi, 2004
hi:
	.zero	2004
	.globl	qsize
	.align 4
	.type	qsize, @object
	.size	qsize, 4
qsize:
	.zero	4
	.globl	que
	.align 32
	.type	que, @object
	.size	que, 90000
que:
	.zero	90000
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
