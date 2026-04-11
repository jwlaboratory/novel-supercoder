	.file	"inputC.c"
	.text
	.p2align 4
	.type	max_score.part.0, @function
max_score.part.0:
.LFB11:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movslq	%edi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movslq	%esi, %r14
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	as(,%r15,4), %r13d
	movl	c(%rip), %r8d
	orl	%r14d, %r13d
	testl	%r8d, %r8d
	jle	.L2
	addl	$1, %edi
	movl	$1, %ebp
	movl	%r13d, %esi
	movslq	%edi, %rcx
	andl	bs-4(,%rbp,4), %esi
	je	.L17
.L31:
	movl	%esi, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L5:
	movl	%eax, %edx
	andl	$1, %edx
	cmpl	$1, %edx
	sbbl	$-1, %ebx
	sarl	%eax
	jne	.L5
	cmpl	n(%rip), %edi
	jge	.L6
.L32:
	xorl	%r13d, %esi
	movq	%rcx, %rax
	movslq	%esi, %rdx
	salq	$16, %rax
	addq	%rdx, %rax
	movl	mscache(,%rax,4), %eax
	testl	%eax, %eax
	jns	.L30
	movq	%rcx, 8(%rsp)
	movl	%edi, 4(%rsp)
	call	max_score.part.0
	movl	c(%rip), %r8d
	movl	4(%rsp), %edi
	movq	8(%rsp), %rcx
	addl	%ebx, %eax
.L8:
	cmpl	%eax, %r12d
	cmovl	%eax, %r12d
	cmpl	%ebp, %r8d
	jle	.L2
	addq	$1, %rbp
	movl	%r13d, %esi
	andl	bs-4(,%rbp,4), %esi
	jne	.L31
.L17:
	xorl	%ebx, %ebx
	cmpl	n(%rip), %edi
	jl	.L32
	.p2align 4,,10
	.p2align 3
.L6:
	cmpl	%ebx, %r12d
	cmovl	%ebx, %r12d
	cmpl	%ebp, %r8d
	jle	.L2
.L12:
	movl	%r13d, %eax
	xorl	%edx, %edx
	andl	bs(,%rbp,4), %eax
	je	.L9
	.p2align 4,,10
	.p2align 3
.L11:
	movl	%eax, %ecx
	andl	$1, %ecx
	cmpl	$1, %ecx
	sbbl	$-1, %edx
	sarl	%eax
	jne	.L11
.L9:
	cmpl	%edx, %r12d
	cmovl	%edx, %r12d
	addq	$1, %rbp
	cmpl	%ebp, %r8d
	jg	.L12
.L2:
	salq	$16, %r15
	movl	%r12d, %eax
	addq	%r14, %r15
	movl	%r12d, mscache(,%r15,4)
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
	.p2align 4,,10
	.p2align 3
.L30:
	.cfi_restore_state
	addl	%ebx, %eax
	jmp	.L8
	.cfi_endproc
.LFE11:
	.size	max_score.part.0, .-max_score.part.0
	.p2align 4
	.globl	count_bits
	.type	count_bits, @function
count_bits:
.LFB8:
	.cfi_startproc
	xorl	%eax, %eax
	testl	%edi, %edi
	je	.L37
	.p2align 4,,10
	.p2align 3
.L36:
	movl	%edi, %edx
	andl	$1, %edx
	cmpl	$1, %edx
	sbbl	$-1, %eax
	sarl	%edi
	jne	.L36
	ret
	.p2align 4,,10
	.p2align 3
.L37:
	ret
	.cfi_endproc
.LFE8:
	.size	count_bits, .-count_bits
	.p2align 4
	.globl	max_score
	.type	max_score, @function
max_score:
.LFB9:
	.cfi_startproc
	cmpl	%edi, n(%rip)
	jle	.L43
	movslq	%edi, %rax
	movslq	%esi, %rdx
	salq	$16, %rax
	addq	%rdx, %rax
	movl	mscache(,%rax,4), %eax
	testl	%eax, %eax
	jns	.L41
	jmp	max_score.part.0
	.p2align 4,,10
	.p2align 3
.L43:
	xorl	%eax, %eax
.L41:
	ret
	.cfi_endproc
.LFE9:
	.size	max_score, .-max_score
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d"
.LC1:
	.string	"%d"
.LC2:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB10:
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
.L70:
	movl	$c, %edx
	movl	$n, %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	n(%rip), %eax
	testl	%eax, %eax
	jne	.L93
	movl	c(%rip), %eax
	testl	%eax, %eax
	je	.L94
.L49:
	testl	%eax, %eax
	jle	.L55
.L71:
	xorl	%r12d, %r12d
.L53:
	movl	$16, %ebp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L54:
	leaq	28(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addl	%ebx, %ebx
	call	__isoc99_scanf
	orl	28(%rsp), %ebx
	subl	$1, %ebp
	jne	.L54
	movl	%ebx, bs(,%r12,4)
	movl	c(%rip), %ebx
	addq	$1, %r12
	cmpl	%r12d, %ebx
	jg	.L53
	movl	n(%rip), %ebp
	testl	%ebp, %ebp
	jle	.L55
.L98:
	movl	%ebp, %edx
	movl	$255, %esi
	movl	$mscache, %edi
	salq	$18, %rdx
	call	memset
	movl	mscache(%rip), %r12d
	testl	%r12d, %r12d
	jns	.L56
	xorl	%r12d, %r12d
	testl	%ebx, %ebx
	jle	.L58
	movl	as(%rip), %eax
	xorl	%r13d, %r13d
	movl	%eax, 12(%rsp)
	movl	12(%rsp), %r14d
	andl	bs(,%r13,4), %r14d
	je	.L74
.L96:
	movl	%r14d, %eax
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L61:
	movl	%eax, %edx
	andl	$1, %edx
	cmpl	$1, %edx
	sbbl	$-1, %r10d
	sarl	%eax
	jne	.L61
.L59:
	cmpl	$1, %ebp
	jle	.L62
	movl	12(%rsp), %eax
	xorl	%eax, %r14d
	movslq	%r14d, %rbp
	movl	mscache+262144(,%rbp,4), %eax
	testl	%eax, %eax
	jns	.L95
	orl	as+4(%rip), %r14d
	xorl	%r15d, %r15d
	testl	%ebx, %ebx
	jle	.L64
	xorl	%r11d, %r11d
.L68:
	movl	bs(,%r11,4), %eax
	movl	%r14d, %esi
	xorl	%r9d, %r9d
	andl	%r14d, %eax
	xorl	%eax, %esi
	testl	%eax, %eax
	je	.L65
	.p2align 4,,10
	.p2align 3
.L67:
	movl	%eax, %edx
	andl	$1, %edx
	cmpl	$1, %edx
	sbbl	$-1, %r9d
	sarl	%eax
	jne	.L67
.L65:
	movl	$2, %edi
	call	max_score
	movl	c(%rip), %ebx
	addl	%r9d, %eax
	cmpl	%eax, %r15d
	cmovl	%eax, %r15d
	addq	$1, %r11
	cmpl	%r11d, %ebx
	jg	.L68
	addl	%r15d, %r10d
.L64:
	movl	%r15d, mscache+262144(,%rbp,4)
.L62:
	cmpl	%r10d, %r12d
	cmovl	%r10d, %r12d
	addq	$1, %r13
	cmpl	%r13d, %ebx
	jle	.L58
	movl	n(%rip), %ebp
	movl	12(%rsp), %r14d
	andl	bs(,%r13,4), %r14d
	jne	.L96
.L74:
	xorl	%r10d, %r10d
	jmp	.L59
.L58:
	movl	%r12d, mscache(%rip)
.L56:
	movl	%r12d, %esi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L70
.L93:
	jle	.L97
	xorl	%r12d, %r12d
.L46:
	movl	$16, %ebp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L50:
	leaq	28(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addl	%ebx, %ebx
	call	__isoc99_scanf
	orl	28(%rsp), %ebx
	subl	$1, %ebp
	jne	.L50
	movl	n(%rip), %ebp
	movl	%ebx, as(,%r12,4)
	addq	$1, %r12
	cmpl	%r12d, %ebp
	jg	.L46
	movl	c(%rip), %ebx
	testl	%ebx, %ebx
	jg	.L71
	testl	%ebp, %ebp
	jg	.L98
.L55:
	xorl	%r12d, %r12d
	movl	$.LC2, %edi
	xorl	%eax, %eax
	movl	%r12d, %esi
	call	printf
	jmp	.L70
.L95:
	addl	%eax, %r10d
	jmp	.L62
.L94:
	addq	$40, %rsp
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
.L97:
	.cfi_restore_state
	movl	c(%rip), %eax
	jmp	.L49
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.local	mscache
	.comm	mscache,7864320,32
	.local	bs
	.comm	bs,120,32
	.local	as
	.comm	as,120,32
	.local	c
	.comm	c,4,4
	.local	n
	.comm	n,4,4
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
