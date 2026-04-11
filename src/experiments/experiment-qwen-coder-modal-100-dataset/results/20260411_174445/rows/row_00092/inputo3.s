	.file	"inputC.c"
	.text
	.p2align 4
	.globl	argmax
	.type	argmax, @function
argmax:
.LFB3:
	.cfi_startproc
	movslq	%esi, %rdx
	movl	%edi, %eax
	movq	maxileft(,%rdx,8), %rcx
	movslq	%edi, %rdx
	cmpq	maxiright(,%rdx,8), %rcx
	je	.L9
	movl	p(,%rdx,8), %ecx
	leal	1(%rdi), %edx
	cmpl	%edx, %esi
	jl	.L1
	movslq	%edx, %rdx
	.p2align 4,,10
	.p2align 3
.L5:
	movq	p(,%rdx,8), %rdi
	movslq	%ecx, %r8
	cmpq	%r8, %rdi
	cmovg	%edx, %eax
	cmovg	%edi, %ecx
	addq	$1, %rdx
	cmpl	%edx, %esi
	jge	.L5
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE3:
	.size	argmax, .-argmax
	.p2align 4
	.globl	ascending
	.type	ascending, @function
ascending:
.LFB4:
	.cfi_startproc
	movslq	%edi, %rdi
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L13:
	movq	p(,%rdi,8), %rax
	addq	$1, %rdi
	cmpq	p(,%rdi,8), %rax
	jg	.L14
.L11:
	cmpl	%edi, %esi
	jg	.L13
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE4:
	.size	ascending, .-ascending
	.p2align 4
	.globl	descending
	.type	descending, @function
descending:
.LFB5:
	.cfi_startproc
	movslq	%edi, %rdi
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L18:
	movq	p(,%rdi,8), %rax
	addq	$1, %rdi
	cmpq	p(,%rdi,8), %rax
	jl	.L19
.L16:
	cmpl	%edi, %esi
	jg	.L18
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE5:
	.size	descending, .-descending
	.p2align 4
	.globl	firstsum
	.type	firstsum, @function
firstsum:
.LFB6:
	.cfi_startproc
	movl	%edi, %r8d
	movl	%esi, %ecx
	xorl	%r9d, %r9d
	cmpl	%edx, %edi
	jne	.L41
	cmpl	%edx, %ecx
	je	.L47
	.p2align 4,,10
	.p2align 3
.L41:
	leal	1(%r8), %eax
	cmpl	%r8d, %edx
	je	.L48
	movl	%r8d, %esi
	cmpl	%eax, %ecx
	jl	.L34
.L25:
	cltq
	movslq	%esi, %rdi
	.p2align 4,,10
	.p2align 3
.L29:
	cmpl	%eax, %edx
	je	.L28
	movq	p(,%rdi,8), %r11
	cmpq	%r11, p(,%rax,8)
	jle	.L28
	movslq	%eax, %rdi
	movq	%rdi, %rsi
.L28:
	addq	$1, %rax
	cmpl	%eax, %ecx
	jge	.L29
.L27:
	leal	-1(%rsi), %r10d
	cmpl	%esi, %edx
	jle	.L26
	movl	%esi, %eax
	subl	%r8d, %eax
	leal	1(%rsi), %r8d
	addl	$1, %eax
	cltq
	imulq	p(,%rdi,8), %rax
	movl	%ecx, %edi
	subl	%edx, %edi
	addl	$1, %edi
	movslq	%edi, %rdi
	imulq	%rdi, %rax
	addq	%rax, %r9
.L31:
	cmpl	%edx, %r8d
	jne	.L41
	cmpl	%edx, %ecx
	jne	.L41
.L47:
	movq	%r9, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L48:
	movl	%eax, %esi
	movl	%edx, %r10d
	movslq	%eax, %rdi
	cmpl	%eax, %ecx
	jge	.L25
	.p2align 4,,10
	.p2align 3
.L26:
	movl	%edx, %eax
	subl	%esi, %ecx
	subl	%r8d, %eax
	addl	$1, %ecx
	addl	$1, %eax
	movslq	%ecx, %rcx
	cltq
	imulq	p(,%rdi,8), %rax
	imulq	%rcx, %rax
	movl	%r10d, %ecx
	addq	%rax, %r9
	jmp	.L31
.L34:
	movslq	%r8d, %rdi
	jmp	.L27
	.cfi_endproc
.LFE6:
	.size	firstsum, .-firstsum
	.p2align 4
	.globl	secondsum
	.type	secondsum, @function
secondsum:
.LFB7:
	.cfi_startproc
	xorl	%eax, %eax
	cmpl	%edi, %esi
	jle	.L80
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%esi, %ebx
	movslq	%edi, %rsi
	movq	%rsi, %rdx
	movq	%rsi, %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L53:
	movq	p(,%rax,8), %rcx
	addq	$1, %rax
	cmpq	%rcx, p(,%rax,8)
	jl	.L52
.L51:
	cmpl	%eax, %ebx
	jg	.L53
	cmpl	%r12d, %ebx
	jle	.L83
	subl	%r12d, %ebx
	salq	$3, %rsi
	movl	$1, %edx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L55:
	movq	p-8(%rsi,%rdx,8), %rcx
	imulq	%rdx, %rcx
	addq	%rcx, %rax
	movq	%rdx, %rcx
	addq	$1, %rdx
	cmpq	%rbx, %rcx
	jne	.L55
.L49:
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
.L57:
	.cfi_restore_state
	movq	p(,%rdx,8), %rax
	addq	$1, %rdx
	cmpq	p(,%rdx,8), %rax
	jl	.L56
.L52:
	cmpl	%edx, %ebx
	jg	.L57
	movslq	%ebx, %rdx
	xorl	%eax, %eax
	leaq	1(%rdx), %rsi
	cmpl	%r12d, %ebx
	jle	.L49
	.p2align 4,,10
	.p2align 3
.L59:
	movq	%rsi, %rcx
	subq	%rdx, %rcx
	imulq	p(,%rdx,8), %rcx
	subq	$1, %rdx
	addq	%rcx, %rax
	cmpl	%edx, %r12d
	jl	.L59
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
.L56:
	.cfi_restore_state
	movslq	%ebx, %rax
	movq	maxileft(,%rax,8), %r13
	cmpq	maxiright(,%rsi,8), %r13
	je	.L60
	leal	1(%r12), %edi
	movl	p(,%rsi,8), %eax
	cmpl	%edi, %ebx
	jl	.L61
	movslq	%edi, %rdi
	movl	%r12d, %r13d
	.p2align 4,,10
	.p2align 3
.L63:
	movq	p(,%rdi,8), %rdx
	movslq	%eax, %rcx
	cmpq	%rdx, %rcx
	cmovl	%edi, %r13d
	cmovl	%edx, %eax
	addq	$1, %rdi
	cmpl	%edi, %ebx
	jge	.L63
.L60:
	cmpl	%r13d, %r12d
	je	.L84
	leal	-1(%r13), %esi
	movl	%r12d, %edi
	cmpl	%r13d, %ebx
	je	.L85
	call	secondsum
	leal	1(%r13), %edi
	movl	%ebx, %esi
	movq	%rax, %rbp
	call	secondsum
	movl	%r13d, %edx
	movl	%ebx, %esi
	movl	%r12d, %edi
	addq	%rax, %rbp
	call	firstsum
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	addq	%rbp, %rax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L80:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -40
	.cfi_offset 6, -32
	.cfi_offset 12, -24
	.cfi_offset 13, -16
	call	secondsum
	movl	%ebx, %edx
	movl	%ebx, %esi
	movl	%r12d, %edi
	movq	%rax, %rbp
	call	firstsum
	addq	%rbp, %rax
	jmp	.L49
.L84:
	leal	1(%r12), %edi
.L61:
	movl	%ebx, %esi
	call	secondsum
	movl	%r12d, %edx
	movl	%ebx, %esi
	movl	%r12d, %edi
	movq	%rax, %rbp
	call	firstsum
	addq	%rbp, %rax
	jmp	.L49
.L83:
	xorl	%eax, %eax
	jmp	.L49
	.cfi_endproc
.LFE7:
	.size	secondsum, .-secondsum
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%ld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$.LC0, %edi
	xorl	%eax, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	leaq	12(%rsp), %rsi
	call	__isoc99_scanf
	movl	12(%rsp), %edi
	testl	%edi, %edi
	jle	.L87
	movl	$p, %ebp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L88:
	movq	%rbp, %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf
	movl	12(%rsp), %eax
	addq	$8, %rbp
	cmpl	%ebx, %eax
	jg	.L88
	movq	$0, maxileft(%rip)
	leal	-1(%rax), %edi
	movslq	%edi, %r8
	cmpl	$1, %eax
	jle	.L91
	movl	%eax, %esi
	movl	$1, %edx
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L95:
	movq	p(,%rcx,8), %rbx
	cmpq	%rbx, p(,%rdx,8)
	jle	.L92
	movq	%rdx, maxileft(,%rdx,8)
	movq	%rdx, %rcx
	addq	$1, %rdx
	cmpq	%rdx, %rsi
	jne	.L95
.L94:
	movslq	%eax, %rdx
	subl	$2, %eax
	movq	%r8, maxiright(,%r8,8)
	cltq
	movq	maxiright-8(,%rdx,8), %rdx
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L105:
	movq	%rax, maxiright(,%rax,8)
	movq	%rax, %rdx
	subq	$1, %rax
	testl	%eax, %eax
	js	.L90
.L104:
	movq	p(,%rdx,8), %rcx
.L97:
	cmpq	p(,%rax,8), %rcx
	jl	.L105
	movq	%rdx, maxiright(,%rax,8)
	subq	$1, %rax
	testl	%eax, %eax
	jns	.L97
.L90:
	movl	%edi, %esi
	xorl	%edi, %edi
	call	secondsum
	movl	$.LC1, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L92:
	.cfi_restore_state
	movq	%rcx, maxileft(,%rdx,8)
	addq	$1, %rdx
	cmpq	%rsi, %rdx
	jne	.L95
	jmp	.L94
.L87:
	xorl	%eax, %eax
	subl	$1, %edi
	movq	%rax, maxileft(%rip)
	movslq	%edi, %rax
	movq	%rax, maxiright(,%rax,8)
	jmp	.L90
.L91:
	movq	%r8, maxiright(,%r8,8)
	jmp	.L90
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.globl	maxiright
	.bss
	.align 32
	.type	maxiright, @object
	.size	maxiright, 800000
maxiright:
	.zero	800000
	.globl	maxileft
	.align 32
	.type	maxileft, @object
	.size	maxileft, 800000
maxileft:
	.zero	800000
	.globl	p
	.align 32
	.type	p, @object
	.size	p, 800000
p:
	.zero	800000
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
