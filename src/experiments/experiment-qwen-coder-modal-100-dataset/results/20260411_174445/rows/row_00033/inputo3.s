	.file	"inputC.c"
	.text
	.p2align 4
	.globl	cmp
	.type	cmp, @function
cmp:
.LFB8:
	.cfi_startproc
	movq	(%rsi), %rdx
	xorl	%eax, %eax
	cmpq	%rdx, (%rdi)
	je	.L1
	setge	%al
	movzbl	%al, %eax
	leal	-1(%rax,%rax), %eax
.L1:
	ret
	.cfi_endproc
.LFE8:
	.size	cmp, .-cmp
	.p2align 4
	.globl	zaatsu
	.type	zaatsu, @function
zaatsu:
.LFB9:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movslq	%esi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	leaq	0(,%r12,8), %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	call	malloc
	movq	%rax, za(%rip)
	movq	%rax, %rdi
	testl	%r12d, %r12d
	jle	.L7
	movl	%r12d, %edx
	movq	%rbp, %rsi
	movq	%r12, %rbx
	salq	$3, %rdx
	call	memcpy
	movl	$cmp, %ecx
	movq	%r12, %rsi
	movl	$8, %edx
	movq	%rax, %rdi
	call	qsort
	movq	za(%rip), %rsi
	xorl	%edi, %edi
	movl	$1, %r8d
	leal	1(%rdi), %eax
	movl	%r8d, %r9d
	movq	(%rsi), %rcx
	movq	%rcx, -8(%rsi,%r8,8)
	cmpl	%eax, %ebx
	jle	.L9
	.p2align 4,,10
	.p2align 3
.L14:
	cltq
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L11:
	addq	$1, %rax
	cmpl	%eax, %ebx
	jle	.L9
.L10:
	movq	(%rsi,%rax,8), %rdx
	cmpq	%rcx, %rdx
	je	.L11
	movl	%eax, %edi
	addq	$1, %r8
	cmpl	%eax, %ebx
	jle	.L9
	movq	%rdx, %rcx
	leal	1(%rdi), %eax
	movl	%r8d, %r9d
	movq	%rcx, -8(%rsi,%r8,8)
	cmpl	%eax, %ebx
	jg	.L14
.L9:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	%r9d, len(%rip)
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	movq	%r12, %rsi
	movl	$cmp, %ecx
	movl	$8, %edx
	call	qsort
	xorl	%r9d, %r9d
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	%r9d, len(%rip)
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE9:
	.size	zaatsu, .-zaatsu
	.p2align 4
	.globl	toIndex
	.type	toIndex, @function
toIndex:
.LFB10:
	.cfi_startproc
	movl	len(%rip), %ecx
	movq	za(%rip), %r8
	xorl	%edx, %edx
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L18:
	leal	(%rdx,%rcx), %esi
	movl	%esi, %eax
	shrl	$31, %eax
	addl	%esi, %eax
	sarl	%eax
	movslq	%eax, %rsi
	cmpq	%rdi, (%r8,%rsi,8)
	cmovg	%eax, %ecx
	cmovle	%eax, %edx
.L17:
	movl	%ecx, %eax
	subl	%edx, %eax
	cmpl	$1, %eax
	jg	.L18
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE10:
	.size	toIndex, .-toIndex
	.p2align 4
	.globl	inc
	.type	inc, @function
inc:
.LFB11:
	.cfi_startproc
	cmpl	%esi, %edx
	jg	.L20
	.p2align 4,,10
	.p2align 3
.L22:
	movslq	%edx, %rax
	addl	$1, (%rdi,%rax,4)
	movl	%edx, %eax
	negl	%eax
	andl	%edx, %eax
	addl	%eax, %edx
	cmpl	%edx, %esi
	jge	.L22
.L20:
	ret
	.cfi_endproc
.LFE11:
	.size	inc, .-inc
	.p2align 4
	.globl	sum
	.type	sum, @function
sum:
.LFB12:
	.cfi_startproc
	xorl	%ecx, %ecx
	testl	%edx, %edx
	jle	.L24
	.p2align 4,,10
	.p2align 3
.L26:
	movslq	%edx, %rax
	addl	(%rdi,%rax,4), %ecx
	leal	-1(%rdx), %eax
	andl	%eax, %edx
	jne	.L26
.L24:
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE12:
	.size	sum, .-sum
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d"
.LC1:
	.string	"%d"
.LC2:
	.string	"%lld\n"
	.text
	.p2align 4
	.globl	run
	.type	run, @function
run:
.LFB13:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	$.LC0, %edi
	xorl	%eax, %eax
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	leaq	12(%rsp), %rdx
	leaq	8(%rsp), %rsi
	call	__isoc99_scanf
	movslq	8(%rsp), %rdi
	movq	%rdi, %rbx
	salq	$2, %rdi
	call	malloc
	testl	%ebx, %ebx
	jle	.L30
	movq	%rax, %r13
	movq	%rax, %rbx
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L31:
	movq	%rbx, %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addl	$1, %r12d
	call	__isoc99_scanf
	movl	8(%rsp), %ebp
	movl	12(%rsp), %eax
	subl	%eax, (%rbx)
	addq	$4, %rbx
	cmpl	%r12d, %ebp
	jg	.L31
	leal	1(%rbp), %ebx
	movslq	%ebx, %rdi
	salq	$3, %rdi
	call	malloc
	movq	$0, (%rax)
	movq	%rax, %r12
	testl	%ebp, %ebp
	jle	.L33
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L35:
	movslq	0(%r13,%rax,4), %rcx
	addq	%rcx, %rdx
	movq	%rdx, 8(%r12,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %rbp
	jne	.L35
.L33:
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	zaatsu
	movl	len(%rip), %ebx
	movl	$4, %esi
	leal	1(%rbx), %edi
	movslq	%edi, %rdi
	call	calloc
	movq	%rax, %r9
	movslq	8(%rsp), %rax
	testl	%eax, %eax
	js	.L45
	movq	za(%rip), %r8
	movq	%r12, %r10
	leaq	8(%r12,%rax,8), %rbp
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L43:
	movq	(%r10), %rdi
	movl	%ebx, %ecx
	xorl	%edx, %edx
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L39:
	leal	(%rdx,%rcx), %esi
	movl	%esi, %eax
	shrl	$31, %eax
	addl	%esi, %eax
	sarl	%eax
	movslq	%eax, %rsi
	cmpq	(%r8,%rsi,8), %rdi
	cmovl	%eax, %ecx
	cmovge	%eax, %edx
.L38:
	movl	%ecx, %eax
	subl	%edx, %eax
	cmpl	$1, %eax
	jg	.L39
	addl	$1, %edx
	testl	%edx, %edx
	jle	.L55
	movl	%edx, %eax
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L41:
	movslq	%eax, %rcx
	addl	(%r9,%rcx,4), %esi
	leal	-1(%rax), %ecx
	andl	%ecx, %eax
	jne	.L41
	movslq	%esi, %rsi
	addq	%rsi, %r11
	cmpl	%edx, %ebx
	jl	.L56
	.p2align 4,,10
	.p2align 3
.L42:
	movslq	%edx, %rax
	addl	$1, (%r9,%rax,4)
	movl	%edx, %eax
	negl	%eax
	andl	%edx, %eax
	addl	%eax, %edx
.L55:
	cmpl	%edx, %ebx
	jge	.L42
.L56:
	addq	$8, %r10
	cmpq	%r10, %rbp
	jne	.L43
.L36:
	movq	%r11, %rsi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	printf
	addq	$24, %rsp
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
.L30:
	.cfi_restore_state
	addl	$1, %ebx
	movslq	%ebx, %rdi
	salq	$3, %rdi
	call	malloc
	movq	$0, (%rax)
	movq	%rax, %r12
	jmp	.L33
.L45:
	xorl	%r11d, %r11d
	jmp	.L36
	.cfi_endproc
.LFE13:
	.size	run, .-run
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB14:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	run
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE14:
	.size	main, .-main
	.globl	len
	.bss
	.align 4
	.type	len, @object
	.size	len, 4
len:
	.zero	4
	.globl	za
	.align 8
	.type	za, @object
	.size	za, 8
za:
	.zero	8
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
