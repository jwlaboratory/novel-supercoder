.file	"optimized_inputC.s"
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
	cmpl	%eax, %esi
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
	movslq	%esi, %rcx
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
	leal
