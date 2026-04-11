	.file	"inputC.c"
	.text
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
.LFB0:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$M, %edx
	movl	$N, %esi
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$.LC0, %edi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$X, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	scanf
	movl	N(%rip), %eax
	testl	%eax, %eax
	jle	.L5
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%rbx, %rsi
	xorl	%eax, %eax
	movl	$.LC1, %edi
	addl	$1, %ebp
	call	scanf
	movslq	(%rbx), %rax
	addq	$4, %rbx
	addl	$1, cnt(,%rax,4)
	cmpl	%ebp, N(%rip)
	jg	.L4
.L5:
	movl	M(%rip), %ebx
	movl	$1, %edi
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%edi, %eax
	movl	cnt(,%rdi,4), %ecx
	addq	$1, %rdi
	cltd
	idivl	%ebx
	movl	%ecx, %esi
	movl	%ecx, %eax
	shrl	$31, %eax
	shrl	$31, %esi
	addl	%ecx, %esi
	addl	%eax, %ecx
	sarl	%esi
	andl	$1, %ecx
	subl	%eax, %ecx
	addl	%esi, %ebp
	movslq	%edx, %rdx
	addl	%ecx, mcnt(,%rdx,4)
	addl	%esi, p(,%rdx,4)
	cmpq	$131072, %rdi
	jne	.L3
	movl	%ebx, %r15d
	shrl	$31, %r15d
	addl	%ebx, %r15d
	sarl	%r15d
	movl	%r15d, 12(%rsp)
	cmpl	$-1, %ebx
	jl	.L6
	movslq	%ebx, %r13
	xorl	%r12d, %r12d
	xorl	%r14d, %r14d
	salq	$2, %r13
	.p2align 4,,10
	.p2align 3
.L9:
	movl	%ebx, %eax
	subl	%r14d, %eax
	cltd
	idivl	%ebx
	cmpl	%r14d, %edx
	je	.L16
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	addl	$1, %r14d
	addq	$4, %r12
	movl	mcnt-4(%r12), %r15d
	subq	$4, %r13
	cvtsi2sdl	mcnt+4(%r13), %xmm0
	cvtsi2sdl	%r15d, %xmm1
	call	fmin
	movl	%r15d, %edx
	pxor	%xmm1, %xmm1
	cvttsd2sil	%xmm0, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	p+4(%r13), %xmm1
	subl	%eax, %edx
	movl	%eax, 8(%rsp)
	movl	%edx, mcnt-4(%r12)
	movl	mcnt+4(%r13), %r15d
	subl	%eax, %r15d
	movl	%r15d, mcnt+4(%r13)
	movl	mcnt-4(%r12), %esi
	movl	%esi, %ecx
	shrl	$31, %ecx
	addl	%esi, %ecx
	sarl	%ecx
	cvtsi2sdl	%ecx, %xmm0
	call	fmin
	movl	8(%rsp), %eax
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	addl	%ebp, %eax
	cvtsi2sdl	%eax, %xmm0
	movl	%r15d, %eax
	shrl	$31, %eax
	addl	%r15d, %eax
	sarl	%eax
	addsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	p-4(%r12), %xmm1
	movq	%xmm0, %rbp
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	call	fmin
	movq	%rbp, %xmm2
	cvttsd2sil	%xmm2, %eax
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movl	12(%rsp), %eax
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %ebp
	cmpl	%eax, %r14d
	jle	.L9
.L6:
	movl	%ebp, %esi
	movl	$.LC2, %edi
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
	.p2align 4,,10
	.p2align 3
.L16:
	.cfi_restore_state
	movl	mcnt(%r12), %edx
	addl	$1, %r14d
	addq	$4, %r12
	subq	$4, %r13
	movl	%edx, %eax
	shrl	$31, %eax
	addl	%edx, %eax
	sarl	%eax
	addl	%eax, %ebp
	cmpl	%r14d, 12(%rsp)
	jge	.L9
	jmp	.L6
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	p
	.bss
	.align 32
	.type	p, @object
	.size	p, 524288
p:
	.zero	524288
	.globl	mcnt
	.align 32
	.type	mcnt, @object
	.size	mcnt, 524288
mcnt:
	.zero	524288
	.globl	cnt
	.align 32
	.type	cnt, @object
	.size	cnt, 524288
cnt:
	.zero	524288
	.globl	X
	.align 32
	.type	X, @object
	.size	X, 524288
X:
	.zero	524288
	.globl	M
	.align 4
	.type	M, @object
	.size	M, 4
M:
	.zero	4
	.globl	N
	.align 4
	.type	N, @object
	.size	N, 4
N:
	.zero	4
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
