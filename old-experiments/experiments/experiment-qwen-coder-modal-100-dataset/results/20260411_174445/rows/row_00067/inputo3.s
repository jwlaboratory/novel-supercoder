	.file	"inputC.c"
	.text
	.p2align 4
	.globl	min_heapify
	.type	min_heapify, @function
min_heapify:
.LFB3:
	.cfi_startproc
	movl	qsize(%rip), %esi
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L10:
	movslq	%edx, %rcx
	movl	que(,%rcx,8), %r8d
	movslq	%edi, %rcx
	cmpl	que(,%rcx,8), %r8d
	jge	.L2
	cmpl	%eax, %esi
	jg	.L6
	movl	%edx, %eax
.L7:
	cmpl	%edi, %eax
	je	.L1
	movslq	%eax, %rdx
	movq	que(,%rcx,8), %rdi
	movq	que(,%rdx,8), %r8
	movq	%r8, que(,%rcx,8)
	movq	%rdi, que(,%rdx,8)
	movl	%eax, %edi
.L8:
	leal	(%rdi,%rdi), %edx
	leal	1(%rdx), %eax
	cmpl	%edx, %esi
	jg	.L10
.L2:
	cmpl	%eax, %esi
	jg	.L4
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	movslq	%edi, %rcx
	movslq	%eax, %rdx
	movl	que(,%rcx,8), %r10d
	cmpl	%r10d, que(,%rdx,8)
	jl	.L7
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	movslq	%eax, %r9
	cmpl	que(,%r9,8), %r8d
	cmovle	%edx, %eax
	jmp	.L7
.L1:
	ret
	.cfi_endproc
.LFE3:
	.size	min_heapify, .-min_heapify
	.p2align 4
	.globl	deq
	.type	deq, @function
deq:
.LFB4:
	.cfi_startproc
	movl	qsize(%rip), %eax
	xorl	%esi, %esi
	leal	-1(%rax), %edi
	movslq	%edi, %rax
	movl	%edi, qsize(%rip)
	movq	que(,%rax,8), %rax
	movq	%rax, que(%rip)
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L19:
	movslq	%edx, %rcx
	movl	que(,%rcx,8), %r8d
	movslq	%esi, %rcx
	cmpl	que(,%rcx,8), %r8d
	jge	.L12
	cmpl	%eax, %edi
	jle	.L18
	movslq	%eax, %r9
	cmpl	que(,%r9,8), %r8d
	cmovle	%edx, %eax
.L16:
	cmpl	%eax, %esi
	je	.L11
	movslq	%eax, %rdx
	movq	que(,%rcx,8), %rsi
	movq	que(,%rdx,8), %r8
	movq	%r8, que(,%rcx,8)
	movq	%rsi, que(,%rdx,8)
	movl	%eax, %esi
.L17:
	leal	(%rsi,%rsi), %edx
	leal	1(%rdx), %eax
	cmpl	%edx, %edi
	jg	.L19
.L12:
	cmpl	%eax, %edi
	jg	.L14
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	movslq	%esi, %rcx
	movslq	%eax, %rdx
	movl	que(,%rcx,8), %r10d
	cmpl	%r10d, que(,%rdx,8)
	jl	.L16
.L11:
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	movl	%edx, %eax
	jmp	.L16
	.cfi_endproc
.LFE4:
	.size	deq, .-deq
	.p2align 4
	.globl	enq
	.type	enq, @function
enq:
.LFB5:
	.cfi_startproc
	movslq	qsize(%rip), %rax
	leal	1(%rax), %ecx
	movl	%ecx, qsize(%rip)
	movslq	%eax, %rcx
	movw	%di, que+4(,%rcx,8)
	movw	%si, que+6(,%rcx,8)
	movl	%edx, que(,%rcx,8)
	testl	%eax, %eax
	jg	.L21
	ret
	.p2align 4,,10
	.p2align 3
.L23:
	movl	que+4(,%rax,8), %edi
	movq	que(,%rcx,8), %r8
	movq	%r8, que(,%rax,8)
	movl	%edx, que(,%rcx,8)
	movl	%edi, que+4(,%rcx,8)
	testl	%esi, %esi
	je	.L20
	movl	que(,%rcx,8), %edx
	movslq	%esi, %rax
.L21:
	movl	%eax, %esi
	sarl	%esi
	movslq	%esi, %rcx
	cmpl	%edx, que(,%rcx,8)
	jg	.L23
.L20:
	ret
	.cfi_endproc
.LFE5:
	.size	enq, .-enq
	.p2align 4
	.globl	in
	.type	in, @function
in:
.LFB6:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L30:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L30
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE6:
	.size	in, .-in
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB7:
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
.L34:
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	getchar_unlocked
.L63:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L63
	testl	%ebx, %ebx
	je	.L90
	movq	$lsz, 8(%rsp)
	movq	$level, (%rsp)
	movl	%ebx, 20(%rsp)
.L56:
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L35:
	andl	$15, %eax
	leal	(%rbx,%rbx,4), %edx
	leal	(%rax,%rdx,2), %ebx
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L35
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L36:
	andl	$15, %eax
	leal	0(%rbp,%rbp,4), %edx
	leal	(%rax,%rdx,2), %ebp
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L36
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L37:
	andl	$15, %eax
	leal	(%r12,%r12,4), %edx
	leal	(%rax,%rdx,2), %r12d
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L37
	leal	-1(%r12), %eax
	xorl	%r13d, %r13d
	movl	%eax, %r15d
	xorl	%eax, %eax
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L38:
	andl	$15, %eax
	leal	0(%r13,%r13,4), %edx
	leal	(%rax,%rdx,2), %r13d
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L38
	leal	-1(%r13), %eax
	movl	%eax, 16(%rsp)
	testl	%ebp, %ebp
	jle	.L39
	testl	%ebx, %ebx
	jle	.L39
	movslq	%ebp, %rcx
	movslq	%ebx, %rsi
	movl	%ebp, 24(%rsp)
	imulq	$501, %rcx, %rcx
	movl	%ebx, 28(%rsp)
	leaq	0(,%rsi,4), %r13
	leaq	l(%r13), %r12
	addq	%rsi, %rcx
	leaq	l(,%rcx,4), %r14
	.p2align 4,,10
	.p2align 3
.L40:
	movq	%r12, %rbx
	subq	%r13, %rbx
	.p2align 4,,10
	.p2align 3
.L42:
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	call	getchar_unlocked
	.p2align 4,,10
	.p2align 3
.L41:
	andl	$15, %eax
	leal	0(%rbp,%rbp,4), %edx
	leal	(%rax,%rdx,2), %ebp
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	$47, %eax
	jg	.L41
	movl	%ebp, (%rbx)
	addq	$4, %rbx
	cmpq	%rbx, %r12
	jne	.L42
	addq	$2004, %r12
	cmpq	%r12, %r14
	jne	.L40
	movl	24(%rsp), %ebp
	movl	28(%rsp), %ebx
.L39:
	movl	$251001, %edx
	xorl	%esi, %esi
	movl	$mk, %edi
	call	memset
	movq	8(%rsp), %rax
	movslq	%r15d, %rdx
	xorl	%r8d, %r8d
	movq	(%rsp), %rdi
	movw	%dx, que+6(%rip)
	movswl	%dx, %esi
	movl	$2, %r10d
	movl	$1, (%rax)
	movslq	16(%rsp), %rax
	movl	$0, (%rdi)
	subq	$level, %rdi
	movq	%rax, %r15
	imulq	$501, %rax, %rax
	movq	%rdi, %r11
	movw	%r15w, que+4(%rip)
	leaq	(%rax,%rdx), %rcx
	movb	$1, mk(%rdx,%rax)
	movl	$1, %eax
	movl	l(,%rcx,4), %r9d
	movswl	%r15w, %ecx
	movl	%r9d, que(%rip)
	.p2align 4,,10
	.p2align 3
.L55:
	subl	$1, %eax
	xorl	%edi, %edi
	movl	%r8d, %r14d
	movslq	%eax, %rdx
	movq	que(,%rdx,8), %rdx
	movq	%rdx, que(%rip)
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L91:
	movslq	%r8d, %r12
	movl	que(,%r12,8), %r13d
	movslq	%edi, %r12
	cmpl	que(,%r12,8), %r13d
	jge	.L43
	cmpl	%edx, %eax
	jle	.L65
	movslq	%edx, %r15
	cmpl	que(,%r15,8), %r13d
	cmovle	%r8d, %edx
.L47:
	cmpl	%edx, %edi
	je	.L85
	movslq	%edx, %rdi
	movq	que(,%r12,8), %r8
	movq	que(,%rdi,8), %r13
	movq	%r13, que(,%r12,8)
	movq	%r8, que(,%rdi,8)
	movl	%edx, %edi
.L48:
	leal	(%rdi,%rdi), %r8d
	leal	1(%r8), %edx
	cmpl	%r8d, %eax
	jg	.L91
.L43:
	cmpl	%edx, %eax
	jle	.L85
	movslq	%edx, %r8
	movslq	%edi, %r12
	movl	que(,%r8,8), %r8d
	cmpl	%r8d, que(,%r12,8)
	jg	.L47
	.p2align 4,,10
	.p2align 3
.L85:
	movl	%r14d, %r8d
	cmpl	%r9d, %r14d
	movl	$mv, %edi
	cmovl	%r9d, %r8d
	movl	%r8d, level-4(%r11,%r10,4)
.L53:
	movl	%ecx, %r9d
	addl	(%rdi), %r9d
	js	.L49
	cmpl	%ebp, %r9d
	jge	.L49
	movl	%esi, %r13d
	addl	4(%rdi), %r13d
	js	.L49
	cmpl	%ebx, %r13d
	jge	.L49
	movslq	%r9d, %rdx
	movslq	%r13d, %r12
	imulq	$501, %rdx, %rdx
	leaq	mk(%r12,%rdx), %r14
	cmpb	$0, (%r14)
	jne	.L49
	addq	%r12, %rdx
	movb	$1, (%r14)
	movslq	%eax, %r14
	movl	l(,%rdx,4), %r12d
	leal	1(%rax), %edx
	movw	%r9w, que+4(,%r14,8)
	movw	%r13w, que+6(,%r14,8)
	movl	%r12d, que(,%r14,8)
	testl	%eax, %eax
	jg	.L50
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L52:
	cltq
	movq	que(,%r9,8), %r14
	movd	que+4(,%rax,8), %xmm0
	movq	%r14, que(,%rax,8)
	movl	%r12d, que(,%r9,8)
	movd	%xmm0, que+4(,%r9,8)
	testl	%r13d, %r13d
	je	.L51
	movl	que(,%r9,8), %r12d
	movl	%r13d, %eax
.L50:
	movl	%eax, %r13d
	sarl	%r13d
	movslq	%r13d, %r9
	cmpl	%r12d, que(,%r9,8)
	jg	.L52
.L51:
	movl	%edx, %eax
	.p2align 4,,10
	.p2align 3
.L49:
	addq	$8, %rdi
	movl	$mv+32, %edx
	cmpq	%rdi, %rdx
	jne	.L53
	leaq	1(%r10), %rdx
	testl	%eax, %eax
	je	.L54
	movswl	que+4(%rip), %ecx
	movswl	que+6(%rip), %esi
	movq	%rdx, %r10
	movl	que(%rip), %r9d
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L65:
	movl	%r8d, %edx
	jmp	.L47
.L54:
	movq	8(%rsp), %rax
	movl	$level+800008, %esi
	addq	$400004, (%rsp)
	movl	$0, qsize(%rip)
	movl	%r10d, (%rax)
	addq	$4, %rax
	movq	%rax, 8(%rsp)
	movq	(%rsp), %rax
	cmpq	%rax, %rsi
	jne	.L56
	movl	20(%rsp), %ebx
	testl	%ebx, %ebx
	js	.L66
	movl	lsz(%rip), %eax
	movl	$134217727, %esi
	testl	%eax, %eax
	jle	.L57
	leal	1(%rbx), %ecx
	movl	lsz+4(%rip), %r8d
	cmpl	%eax, %ecx
	cmovg	%eax, %ecx
	movslq	%ebx, %rax
	leaq	level(,%rax,4), %rdx
	xorl	%eax, %eax
.L60:
	movl	%ebx, %edi
	subl	%eax, %edi
	cmpl	%edi, %r8d
	jle	.L59
	movl	400004(%rdx), %edi
	addl	level(,%rax,4), %edi
	cmpl	%edi, %esi
	cmovg	%edi, %esi
.L59:
	addq	$1, %rax
	subq	$4, %rdx
	cmpl	%eax, %ecx
	jg	.L60
.L57:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L34
.L66:
	movl	$134217727, %esi
	jmp	.L57
.L90:
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
.LFE7:
	.size	main, .-main
	.globl	mk
	.bss
	.align 32
	.type	mk, @object
	.size	mk, 251001
mk:
	.zero	251001
	.globl	mv
	.data
	.align 32
	.type	mv, @object
	.size	mv, 32
mv:
	.long	-1
	.long	0
	.long	0
	.long	1
	.long	1
	.long	0
	.long	0
	.long	-1
	.globl	lsz
	.bss
	.align 8
	.type	lsz, @object
	.size	lsz, 8
lsz:
	.zero	8
	.globl	level
	.align 32
	.type	level, @object
	.size	level, 800008
level:
	.zero	800008
	.globl	l
	.align 32
	.type	l, @object
	.size	l, 1004004
l:
	.zero	1004004
	.globl	qsize
	.align 4
	.type	qsize, @object
	.size	qsize, 4
qsize:
	.zero	4
	.globl	que
	.align 32
	.type	que, @object
	.size	que, 1200000
que:
	.zero	1200000
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
