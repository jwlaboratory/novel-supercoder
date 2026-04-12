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
	movslq	%ecx, %rdx
	movl	que+4(,%rdx,8), %r8d
	movslq	%edi, %rdx
	cmpl	que+4(,%rdx,8), %r8d
	jge	.L2
	cmpl	%eax, %esi
	jg	.L6
	movl	%ecx, %eax
.L7:
	cmpl	%edi, %eax
	je	.L1
	movslq	%eax, %rcx
	movl	que+4(,%rdx,8), %edi
	movzwl	que(,%rdx,8), %r8d
	movq	que(,%rcx,8), %r9
	movq	%r9, que(,%rdx,8)
	movw	%r8w, que(,%rcx,8)
	movl	%edi, que+4(,%rcx,8)
	movl	%eax, %edi
.L8:
	leal	(%rdi,%rdi), %ecx
	leal	1(%rcx), %eax
	cmpl	%ecx, %esi
	jg	.L10
.L2:
	cmpl	%eax, %esi
	jg	.L4
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	movslq	%edi, %rdx
	movslq	%eax, %rcx
	movl	que+4(,%rdx,8), %r10d
	cmpl	%r10d, que+4(,%rcx,8)
	jl	.L7
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	movslq	%eax, %r9
	cmpl	que+4(,%r9,8), %r8d
	cmovle	%ecx, %eax
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
	movslq	%ecx, %rdx
	movl	que+4(,%rdx,8), %r8d
	movslq	%esi, %rdx
	cmpl	que+4(,%rdx,8), %r8d
	jge	.L12
	cmpl	%eax, %edi
	jle	.L18
	movslq	%eax, %r9
	cmpl	que+4(,%r9,8), %r8d
	cmovle	%ecx, %eax
.L16:
	cmpl	%eax, %esi
	je	.L11
	movslq	%eax, %rcx
	movl	que+4(,%rdx,8), %esi
	movzwl	que(,%rdx,8), %r8d
	movq	que(,%rcx,8), %r9
	movq	%r9, que(,%rdx,8)
	movw	%r8w, que(,%rcx,8)
	movl	%esi, que+4(,%rcx,8)
	movl	%eax, %esi
.L17:
	leal	(%rsi,%rsi), %ecx
	leal	1(%rcx), %eax
	cmpl	%ecx, %edi
	jg	.L19
.L12:
	cmpl	%eax, %edi
	jg	.L14
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	movslq	%esi, %rdx
	movslq	%eax, %rcx
	movl	que+4(,%rdx,8), %r10d
	cmpl	%r10d, que+4(,%rcx,8)
	jl	.L16
.L11:
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	movl	%ecx, %eax
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
	movb	%dil, que(,%rcx,8)
	movb	%sil, que+1(,%rcx,8)
	movl	%edx, que+4(,%rcx,8)
	testl	%eax, %eax
	jg	.L21
	ret
	.p2align 4,,10
	.p2align 3
.L23:
	movzwl	que(,%rax,8), %edi
	movl	que+4(,%rax,8), %edx
	movq	que(,%rcx,8), %r8
	movq	%r8, que(,%rax,8)
	movw	%di, que(,%rcx,8)
	movl	%edx, que+4(,%rcx,8)
	testl	%esi, %esi
	je	.L20
	movslq	%esi, %rax
.L21:
	movl	%eax, %esi
	sarl	%esi
	movslq	%esi, %rcx
	cmpl	%edx, que+4(,%rcx,8)
	jg	.L23
.L20:
	ret
	.cfi_endproc
.LFE5:
	.size	enq, .-enq
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d"
.LC1:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$10, %esi
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
	movq	stdin(%rip), %rdx
	leaq	54(%rsp), %rdi
	call	fgets
	leaq	48(%rsp), %rcx
	leaq	44(%rsp), %rdx
	xorl	%eax, %eax
	movl	$.LC0, %esi
	leaq	54(%rsp), %rdi
	call	__isoc99_sscanf
	movl	44(%rsp), %eax
	testl	%eax, %eax
	jle	.L70
	movl	$map, %edi
	xorl	%r12d, %r12d
	movl	%ebp, 8(%rsp)
	orl	$-1, %r14d
	movl
