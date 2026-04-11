	.file	"inputC.c"
	.text
	.p2align 4
	.globl	add
	.type	add, @function
add:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edi, %ebx
	movl	$16, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	malloc
	movslq	%ebx, %rdi
	movq	edge(,%rdi,8), %rdx
	movl	%ebp, (%rax)
	movq	%rax, edge(,%rdi,8)
	movq	%rdx, 8(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE8:
	.size	add, .-add
	.p2align 4
	.globl	end
	.type	end, @function
end:
.LFB9:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L15
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leal	1(%rdi), %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	$1, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.p2align 4,,10
	.p2align 3
.L8:
	movq	edge(,%rbp,8), %rax
	movq	8(%rax), %rbx
	testq	%rbx, %rbx
	je	.L6
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%rbx, %rdi
	call	free
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7
.L6:
	addq	$1, %rbp
	cmpq	%r12, %rbp
	jne	.L8
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.cfi_endproc
.LFE9:
	.size	end, .-end
	.p2align 4
	.globl	check
	.type	check, @function
check:
.LFB10:
	.cfi_startproc
	movslq	%edi, %rdi
	movq	edge(,%rdi,8), %rax
	testq	%rax, %rax
	jne	.L20
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L23:
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L21
.L20:
	movslq	(%rax), %rcx
	movq	%rcx, %rdx
	movl	used(,%rcx,4), %ecx
	testl	%ecx, %ecx
	jne	.L23
	movl	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L21:
	movl	$-1, %edx
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE10:
	.size	check, .-check
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d"
.LC1:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$.LC0, %edi
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	leaq	4(%rsp), %rdx
	movq	%rsp, %rsi
	call	__isoc99_scanf
	movl	4(%rsp), %r12d
	testl	%r12d, %r12d
	jle	.L27
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L25:
	leaq	12(%rsp), %rdx
	leaq	8(%rsp), %rsi
	xorl	%eax, %eax
	addl	$1, %r12d
	movl	$.LC0, %edi
	call	__isoc99_scanf
	movl	8(%rsp), %ebp
	movl	$16, %edi
	movslq	12(%rsp), %rbx
	call	malloc
	movl	$16, %edi
	movslq	%ebp, %rdx
	movl	%ebx, (%rax)
	movq	edge(,%rdx,8), %rcx
	movq	%rax, edge(,%rdx,8)
	movq	%rcx, 8(%rax)
	call	malloc
	movq	edge(,%rbx,8), %rdx
	movl	%ebp, (%rax)
	movq	%rdx, 8(%rax)
	movq	%rax, edge(,%rbx,8)
	cmpl	%r12d, 4(%rsp)
	jg	.L25
.L27:
	movslq	size1(%rip), %rsi
	movq	edge+8(%rip), %rax
	xorl	%r9d, %r9d
	leal	1(%rsi), %r11d
	movslq	(%rax), %rdx
	movl	$1, ans(,%rsi,4)
	movslq	%r11d, %rbx
	movl	%r11d, size1(%rip)
	movq	%rbx, %r8
	movq	%rdx, %rcx
	movl	$1, used(,%rdx,4)
	movl	$1, used+4(%rip)
	movl	%r8d, %r10d
	testq	%rax, %rax
	jne	.L28
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L82:
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L32
.L28:
	movslq	(%rax), %rsi
	movl	used(,%rsi,4), %ebp
	testl	%ebp, %ebp
	jne	.L82
	cmpl	$-1, %esi
	je	.L32
	movq	edge(,%rsi,8), %rax
	movl	%esi, ans(,%r8,4)
	addq	$1, %r8
	movl	$1, %r9d
	movl	$1, used(,%rsi,4)
	movl	%r8d, %r10d
	testq	%rax, %rax
	jne	.L28
.L81:
	testb	%r9b, %r9b
	je	.L29
	movl	%r8d, size1(%rip)
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L32:
	testb	%r9b, %r9b
	je	.L29
	movl	%r10d, size1(%rip)
.L31:
	movslq	%r10d, %rbx
	movq	%rbx, %r11
	.p2align 4,,10
	.p2align 3
.L29:
	addl	$1, %r11d
	movq	edge(,%rdx,8), %rax
	movl	%ecx, ans(,%rbx,4)
	xorl	%edi, %edi
	movslq	%r11d, %rsi
	movl	%r11d, size2(%rip)
	movl	%esi, %r8d
	testq	%rax, %rax
	jne	.L33
	jmp	.L83
	.p2align 4,,10
	.p2align 3
.L84:
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L37
.L33:
	movslq	(%rax), %rdx
	movl	used(,%rdx,4), %r9d
	testl	%r9d, %r9d
	jne	.L84
	cmpl	$-1, %edx
	je	.L37
	movq	edge(,%rdx,8), %rax
	movl	%edx, ans(,%rsi,4)
	addq	$1, %rsi
	movl	$1, %edi
	movl	$1, used(,%rdx,4)
	movl	%esi, %r8d
	testq	%rax, %rax
	jne	.L33
.L83:
	testb	%dil, %dil
	je	.L34
	movl	%esi, size2(%rip)
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L37:
	testb	%dil, %dil
	je	.L34
	movl	%r8d, size2(%rip)
.L36:
	movl	%r8d, %r11d
	.p2align 4,,10
	.p2align 3
.L34:
	movl	%r11d, %esi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	printf
	movl	size1(%rip), %eax
	leal	-1(%rax), %edx
	movslq	%edx, %rbx
	testl	%edx, %edx
	js	.L43
	.p2align 4,,10
	.p2align 3
.L42:
	movl	ans(,%rbx,4), %esi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	subq	$1, %rbx
	call	printf
	testl	%ebx, %ebx
	jns	.L42
	movl	size1(%rip), %eax
.L43:
	cmpl	size2(%rip), %eax
	movslq	%eax, %rbx
	jge	.L41
	.p2align 4,,10
	.p2align 3
.L44:
	movl	ans(,%rbx,4), %esi
	xorl	%eax, %eax
	movl	$.LC1, %edi
	addq	$1, %rbx
	call	printf
	cmpl	%ebx, size2(%rip)
	jg	.L44
.L41:
	movl	(%rsp), %edi
	call	end
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.globl	size2
	.bss
	.align 4
	.type	size2, @object
	.size	size2, 4
size2:
	.zero	4
	.globl	size1
	.align 4
	.type	size1, @object
	.size	size1, 4
size1:
	.zero	4
	.globl	ans
	.align 32
	.type	ans, @object
	.size	ans, 400000
ans:
	.zero	400000
	.globl	used
	.align 32
	.type	used, @object
	.size	used, 400004
used:
	.zero	400004
	.globl	edge
	.align 32
	.type	edge, @object
	.size	edge, 800008
edge:
	.zero	800008
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
