.file	"optimized_inputC.s"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s"
.LC1:
	.string	"%d"
.LC2:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%ebx, %ebx
	subq	$8000032, %rsp
	.cfi_def_cfa_offset 8000048
.L2:
	leaq	6(%rsp), %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movzbl	8(%rsp), %eax
	cmpb	$115, %al
	je	.L24
	cmpb	$116, %al
	je	.L25
	cmpb	$100, %al
	jne	.L2
	addq	$8000032, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L25:
	movl	16(%rsp), %esi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	printf
	movslq	%ebx, %rax
	subl	$1, %ebx
	movl	12(%rsp,%rax,4), %r8d
	movslq	%ebx, %rax
	leaq	16(%rsp,%rax,4), %r9
	xorl	%eax, %eax
	leal	(%rax,%rax), %ecx
	movl	%r8d, 16(%rsp)
	leal	1(%rcx), %edx
	cmpl	%ecx, %ebx
	jl	.L9
.L26:
	movslq	%ecx, %rsi
	leaq	16(%rsp,%rsi,4), %rdi
	movl	(%rdi), %esi
	cmpl	(%r9), %esi
	jle	.L9
	cmpl	%edx, %ebx
	jl	.L15
	movslq	%edx, %r10
	leaq	16(%rsp,%r10,4), %r10
	movl	(%r10), %r11d
	cmpl	%r11d, %esi
	jl	.L16
.L15:
	movl	%ecx, %edx
.L12:
	cmpl	%edx, %eax
	je	.L2
	movl	%esi, 16(%rsp,%rax,4)
	movslq	%edx, %rax
	leal	(%rax,%rax), %ecx
	movl	%r8d, (%rdi)
	leal	1(%rcx), %edx
	cmpl	%ecx, %ebx
	jge	.L26
.L9:
	cmpl	%edx, %ebx
	jl	.L2
	movslq	%edx, %rcx
	leaq	16(%rsp,%rcx,4), %rdi
	movl	(%rdi), %esi
	cmpl	%r8d, %esi
	jg	.L12
	jmp	.L2
.L24:
	movl	$.LC1, %edi
	movq	%rsp, %rsi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	(%rsp), %edi
	movslq	%ebx, %rax
	movl	%edi, 16(%rsp,%rax,4)
	movl	%ebx, %eax
	testl	%ebx, %ebx
	jg	.L4
	jmp	.L6
.L7:
	movl	%ecx, (%rdx)
	movl	%esi, (%rsi)
	testl	%eax, %eax
	je	.L6
.L4:
	movslq	%eax, %rdx
	sarl	%eax
	movslq	%eax, %rcx
	leaq	16(%rsp,%rdx,4), %rdx
	leaq	16(%rsp,%rcx,4), %rsi
	movl	(%rsi), %ecx
	cmpl	%ecx, %edi
	jg	.L7
.L6:
	addl	$1, %ebx
	jmp	.L2
.L16:
	movl	%r11d, %esi
	movq	%r10, %rdi
	jmp	.L12
.LFE3:
	.size	main, .-main
	.text
	.p2align 4
	.globl	Insert
	.type	Insert, @function
Insert:
.LFB4:
	.cfi_startproc
	movslq	%edx, %rax
	movl	%esi, (%rdi,%rax,4)
	testl	%edx, %edx
	jg	.L28
	ret
.L30:
	movl	%ecx, (%rax)
	movl	%esi, (%r8)
	testl	%edx, %edx
	je	.L27
.L28:
	movslq	%edx, %rax
	sarl	%edx
	movslq	%edx, %rcx
	leaq	(%rdi,%rax,4), %rax
	leaq	(%rdi,%rcx,4), %r8
	movl	(%r8), %ecx
	cmpl	%esi, %ecx
	jl	.L30
.L27:
	ret
.LFE4:
	.size	Insert, .-Insert
	.p2align 4
	.globl	swap
	.type	swap, @function
swap:
.LFB5:
	.cfi_startproc
	movl	(%rdi), %eax
	movl	(%rsi), %edx
	movl	%edx, (%rdi)
	movl	%eax, (%rsi)
	ret
.LFE5:
	.size	swap, .-swap
	.p2align 4
	.globl	ExtractMax
	.type	ExtractMax, @function
ExtractMax:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%eax, %eax
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%esi, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	(%rdi), %esi
	movl	$.LC2, %edi
	call	printf
	movslq	%ebx, %rax
	leal	-1(%rbx), %esi
	movl	-4(%rbp,%rax,4), %r10d
	movslq	%esi, %rax
	leaq	0(%rbp,%rax,4), %r9
	xorl	%eax, %eax
	leal	(%rax,%rax), %ecx
	movl	%r10d, 0(%rbp)
	leal	1(%rcx), %edx
	cmpl	%ecx, %esi
	jl	.L37
.L46:
	movslq	%ecx, %rdi
	leaq	0(%rbp,%rdi,4), %r8
	movl	(%r8), %edi
	cmpl	(%r9), %edi
	jle	.L37
	cmpl	%edx, %esi
	jl	.L43
	movslq	%edx, %r11
	leaq	0(%rbp,%r11,4), %r11
	movl	(%r11), %ebx
	cmpl	%ebx, %edi
	jl	.L44
.L43:
	movl	%ecx, %edx
.L41:
	cmpl	%edx, %eax
	je	.L36
	movl	%edi, 0(%rbp,%rax,4)
	movslq	%edx, %rax
	leal	(%rax,%rax), %ecx
	movl	%r10d, (%r8)
	leal	1(%rcx), %edx
	cmpl	%
