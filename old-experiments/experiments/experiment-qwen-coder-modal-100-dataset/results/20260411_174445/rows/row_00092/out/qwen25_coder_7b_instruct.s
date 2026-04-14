.file	"optimized_inputC.s"
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
.L48:
	movl	%eax, %esi
	movl	%edx, %r10d
	movslq	%eax, %rdi
	cmpl	%eax, %ecx
	jge	.L25
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
.L57:
	movq	p(,%rdx,8), %rax
	addq	$1, %rdx
	cmpq	p(,%rdx,8), %rax
	jl	.L56
.L52:
	cmpl	%edx, %ebx
	jg	.L57
	movslq	%ebx, %rdx
	x
