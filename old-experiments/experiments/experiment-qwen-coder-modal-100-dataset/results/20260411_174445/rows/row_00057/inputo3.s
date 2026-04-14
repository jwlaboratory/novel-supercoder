	.file	"inputC.c"
	.text
	.p2align 4
	.globl	is_edge
	.type	is_edge, @function
is_edge:
.LFB8:
	.cfi_startproc
	testl	%edi, %edi
	je	.L3
	testl	%esi, %esi
	je	.L3
	movl	h(%rip), %eax
	leal	-1(%rax), %edx
	movl	$1, %eax
	cmpl	%edi, %edx
	je	.L1
	movl	w(%rip), %eax
	subl	$1, %eax
	cmpl	%esi, %eax
	sete	%al
	movzbl	%al, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$1, %eax
.L1:
	ret
	.cfi_endproc
.LFE8:
	.size	is_edge, .-is_edge
	.p2align 4
	.globl	min
	.type	min, @function
min:
.LFB9:
	.cfi_startproc
	cmpl	%esi, %edi
	movl	%esi, %eax
	cmovle	%edi, %eax
	ret
	.cfi_endproc
.LFE9:
	.size	min, .-min
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d %d"
.LC1:
	.string	"%s"
.LC5:
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
	movl	$k, %ecx
	movl	$w, %edx
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$h, %esi
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$5760024, %rsp
	.cfi_def_cfa_offset 5760080
	call	__isoc99_scanf
	movl	h(%rip), %eax
	testl	%eax, %eax
	jle	.L8
	leaq	16(%rsp), %r12
	xorl	%r13d, %r13d
	movq	%r12, %r14
	.p2align 4,,10
	.p2align 3
.L9:
	movq	%r14, %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addl	$1, %r13d
	call	__isoc99_scanf
	movl	h(%rip), %edi
	addq	$800, %r14
	cmpl	%r13d, %edi
	jg	.L9
	movslq	w(%rip), %rsi
	xorl	%eax, %eax
	movq	%rsi, %rcx
	testl	%edi, %edi
	jle	.L41
	.p2align 4,,10
	.p2align 3
.L10:
	xorl	%edx, %edx
	testl	%ecx, %ecx
	jle	.L15
	.p2align 4,,10
	.p2align 3
.L13:
	cmpb	$83, (%r12,%rdx)
	cmove	%edx, %ebx
	cmove	%eax, %ebp
	addq	$1, %rdx
	cmpq	%rsi, %rdx
	jne	.L13
.L15:
	addl	$1, %eax
	addq	$800, %r12
	cmpl	%eax, %edi
	jne	.L10
.L11:
	movl	k(%rip), %esi
	movl	%ebp, 640016(%rsp)
	movl	%ebx, 640020(%rsp)
	testl	%esi, %esi
	jle	.L29
	movl	%esi, 12(%rsp)
	leal	-1(%rcx), %ebp
	movl	$1, %r10d
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	leal	-1(%rax), %ebx
	movl	%eax, %r15d
	movl	%ecx, %r14d
	leaq	640016(%rsp), %r11
	.p2align 4,,10
	.p2align 3
.L23:
	movl	%r10d, %ecx
	movslq	%edx, %rdi
	movl	%r9d, 8(%rsp)
	xorl	%r8d, %r8d
	subl	%edx, %ecx
	leaq	(%r11,%rdi,8), %rax
	leaq	(%rcx,%rdi), %rdx
	leaq	(%r11,%rdx,8), %r12
	.p2align 4,,10
	.p2align 3
.L21:
	movl	4(%rax), %ecx
	movl	(%rax), %edx
	testl	%ecx, %ecx
	je	.L17
	testl	%edx, %edx
	je	.L17
	cmpl	%ebx, %edx
	je	.L17
	cmpl	%ebp, %ecx
	je	.L17
	movslq	%edx, %rdi
	leal	1(%rcx), %r9d
	leaq	(%rdi,%rdi,4), %rsi
	movslq	%r9d, %r13
	leaq	(%rsi,%rsi,4), %rsi
	salq	$5, %rsi
	addq	$5760016, %rsi
	addq	%rsp, %rsi
	addq	%r13, %rsi
	cmpb	$46, -5760000(%rsi)
	jne	.L18
	leal	(%r8,%r10), %r13d
	movd	%edx, %xmm0
	movd	%r9d, %xmm5
	addl	$1, %r8d
	movslq	%r13d, %r13
	punpckldq	%xmm5, %xmm0
	movq	%xmm0, (%r11,%r13,8)
	movb	$102, -5760000(%rsi)
.L18:
	leaq	(%rdi,%rdi,4), %rsi
	leal	-1(%rcx), %r9d
	leaq	(%rsi,%rsi,4), %rsi
	movslq	%r9d, %r13
	salq	$5, %rsi
	leaq	5760016(%rsi), %rdi
	leaq	(%rsp,%rdi), %rsi
	addq	%r13, %rsi
	cmpb	$46, -5760000(%rsi)
	jne	.L19
	leal	(%r8,%r10), %edi
	movd	%edx, %xmm0
	movd	%r9d, %xmm6
	addl	$1, %r8d
	movslq	%edi, %rdi
	punpckldq	%xmm6, %xmm0
	movq	%xmm0, (%r11,%rdi,8)
	movb	$102, -5760000(%rsi)
.L19:
	leal	1(%rdx), %edi
	movslq	%ecx, %r9
	movslq	%edi, %rsi
	leaq	(%rsi,%rsi,4), %rsi
	leaq	(%rsi,%rsi,4), %rsi
	salq	$5, %rsi
	addq	$5760016, %rsi
	addq	%rsp, %rsi
	addq	%r9, %rsi
	cmpb	$46, -5760000(%rsi)
	jne	.L20
	leal	(%r8,%r10), %r13d
	movd	%edi, %xmm0
	movd	%ecx, %xmm3
	addl	$1, %r8d
	movslq	%r13d, %r13
	punpckldq	%xmm3, %xmm0
	movq	%xmm0, (%r11,%r13,8)
	movb	$102, -5760000(%rsi)
.L20:
	subl	$1, %edx
	movslq	%edx, %rsi
	leaq	(%rsi,%rsi,4), %rsi
	leaq	(%rsi,%rsi,4), %rsi
	salq	$5, %rsi
	leaq	5760016(%rsi), %rdi
	leaq	(%rsp,%rdi), %rsi
	addq	%r9, %rsi
	cmpb	$46, -5760000(%rsi)
	jne	.L17
	leal	(%r8,%r10), %edi
	movd	%edx, %xmm0
	movd	%ecx, %xmm4
	addl	$1, %r8d
	movslq	%edi, %rdi
	punpckldq	%xmm4, %xmm0
	movq	%xmm0, (%r11,%rdi,8)
	movb	$102, -5760000(%rsi)
	.p2align 4,,10
	.p2align 3
.L17:
	addq	$8, %rax
	cmpq	%r12, %rax
	jne	.L21
	movl	8(%rsp), %r9d
	leal	(%r8,%r10), %edi
	addl	$1, %r9d
	cmpl	%r10d, %edi
	je	.L22
	cmpl	%r9d, 12(%rsp)
	jle	.L22
	movl	%r10d, %edx
	cmpl	%r10d, %edi
	jle	.L22
	movl	%edi, %r10d
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L22:
	movl	12(%rsp), %esi
	movl	%r15d, %eax
	movl	%r14d, %ecx
	testl	%edi, %edi
	jle	.L42
.L16:
	pxor	%xmm6, %xmm6
	movsd	.LC2(%rip), %xmm5
	movsd	.LC4(%rip), %xmm4
	movl	$800, %r8d
	movsd	.LC6(%rip), %xmm3
	cvtsi2sdl	%esi, %xmm6
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L27:
	movl	(%r11,%rsi,8), %r9d
	movl	%eax, %edx
	pxor	%xmm1, %xmm1
	subl	%r9d, %edx
	subl	$1, %edx
	cmpl	%r9d, %edx
	cmovg	%r9d, %edx
	cvtsi2sdl	%edx, %xmm1
	divsd	%xmm6, %xmm1
	movapd	%xmm1, %xmm0
	andpd	%xmm3, %xmm0
	ucomisd	%xmm0, %xmm5
	jbe	.L25
	cvttsd2siq	%xmm1, %rdx
	pxor	%xmm0, %xmm0
	movapd	%xmm1, %xmm2
	cvtsi2sdq	%rdx, %xmm0
	cmpnlesd	%xmm0, %xmm2
	andpd	%xmm4, %xmm2
	addsd	%xmm2, %xmm0
	movapd	%xmm3, %xmm2
	andnpd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	orpd	%xmm2, %xmm1
.L25:
	movl	4(%r11,%rsi,8), %r9d
	movl	%ecx, %edx
	pxor	%xmm0, %xmm0
	subl	%r9d, %edx
	subl	$1, %edx
	cmpl	%r9d, %edx
	cmovg	%r9d, %edx
	cvtsi2sdl	%edx, %xmm0
	divsd	%xmm6, %xmm0
	movapd	%xmm0, %xmm2
	andpd	%xmm3, %xmm2
	ucomisd	%xmm2, %xmm5
	jbe	.L26
	cvttsd2siq	%xmm0, %rdx
	pxor	%xmm2, %xmm2
	movapd	%xmm0, %xmm7
	cvtsi2sdq	%rdx, %xmm2
	cmpnlesd	%xmm2, %xmm7
	andpd	%xmm4, %xmm7
	addsd	%xmm7, %xmm2
	movapd	%xmm3, %xmm7
	andnpd	%xmm0, %xmm7
	orpd	%xmm7, %xmm2
	movapd	%xmm2, %xmm0
.L26:
	addsd	%xmm4, %xmm1
	addsd	%xmm4, %xmm0
	cvttsd2sil	%xmm1, %edx
	cvttsd2sil	%xmm0, %r9d
	cmpl	%r9d, %edx
	cmovg	%r9d, %edx
	cmpl	%edx, %r8d
	cmovg	%edx, %r8d
	addq	$1, %rsi
	cmpl	%esi, %edi
	jg	.L27
.L24:
	movl	%r8d, %esi
	movl	$.LC5, %edi
	xorl	%eax, %eax
	call	printf
	addq	$5760024, %rsp
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
.L42:
	.cfi_restore_state
	movl	$800, %r8d
	jmp	.L24
.L8:
	movl	w(%rip), %ecx
	jmp	.L11
.L29:
	movl	$1, %edi
	leaq	640016(%rsp), %r11
	jmp	.L16
.L41:
	movl	%edi, %eax
	jmp	.L11
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.globl	k
	.bss
	.align 4
	.type	k, @object
	.size	k, 4
k:
	.zero	4
	.globl	h
	.align 4
	.type	h, @object
	.size	h, 4
h:
	.zero	4
	.globl	w
	.align 4
	.type	w, @object
	.size	w, 4
w:
	.zero	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1127219200
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.align 8
.LC6:
	.long	-1
	.long	2147483647
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
