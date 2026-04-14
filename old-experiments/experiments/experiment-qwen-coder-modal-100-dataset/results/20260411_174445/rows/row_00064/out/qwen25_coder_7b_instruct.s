.file	"optimized_inputC.s"
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
	movslq	%esi, %rcx
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
	movl	%edx, edge+8(%
