	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC2:
	.string	"%d\n"
.LC3:
	.string	"%d%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	.p2align 4,,10
	.p2align 3
.L2:
	xorl	%eax, %eax
	leaq	56(%rsp), %rdx
	leaq	52(%rsp), %rsi
	movl	$.LC3, %edi
	call	__isoc99_scanf
	testl	%eax, %eax
	je	.L39
	movl	52(%rsp), %edx
	testl	%edx, %edx
	jle	.L39
	movl	$mk, %esi
	movl	$87, %ecx
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	movq	%rsi, %rdi
	movl	56(%rsp), %r11d
	xorl	%ebp, %ebp
	rep stosq
	movl	$0, (%rdi)
	testl	%r11d, %r11d
	jle	.L4
	.p2align 4,,10
	.p2align 3
.L62:
	xorl	%r12d, %r12d
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L5:
	cmpl	$3, %eax
	movl	52(%rsp), %edx
	cmove	%r12d, %r13d
	cmove	%ebp, %r14d
	addq	$1, %r12
	cmpl	%r12d, %edx
	jle	.L64
.L3:
	leaq	60(%rsp), %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	60(%rsp), %eax
	movb	%al, map(%rbx,%r12)
	cmpl	$2, %eax
	jne	.L5
	movl	52(%rsp), %edx
	movl	%r12d, %r15d
	movl	%ebp, (%rsp)
	movb	$1, map(%rbx,%r12)
	addq	$1, %r12
	cmpl	%r12d, %edx
	jg	.L3
.L64:
	movl	56(%rsp), %r11d
	addl	$1, %ebp
	cmpl	%r11d, %ebp
	jge	.L4
	addq	$10, %rbx
	testl	%edx, %edx
	jg	.L62
.L4:
	movslq	(%rsp), %rax
	movslq	%r15d, %rsi
	movl	%r15d, 40(%rsp)
	xorl	%r9d, %r9d
	movq	.LC1(%rip), %rcx
	movb	$0, 46(%rsp)
	movl	$1, %ebp
	movl	%eax, q(%rip)
	imulq	$70, %rax, %rax
	movq	%rcx, q+8(%rip)
	leaq	0(,%rsi,8), %rcx
	subq	%rsi, %rcx
	movl	%r13d, 4(%rsp)
	xorl	%esi, %esi
	movb	$1, mk+6(%rcx,%rax)
	movl	mv(%rip), %eax
	movl	%r15d, q+4(%rip)
	movl	%edx, %r15d
	movl	%eax, 8(%rsp)
	movl	mv+4(%rip), %eax
	movl	$0, top(%rip)
	movl	%eax, 12(%rsp)
	movl	mv+8(%rip), %eax
	movl	$1, end(%rip)
	movl	%eax, 16(%rsp)
	movl	mv+12(%rip), %eax
	movl	%eax, 20(%rsp)
	movl	mv+16(%rip), %eax
	movl	%eax, 24(%rsp)
	movl	mv+20(%rip), %eax
	movl	%eax, 28(%rsp)
	movl	mv+24(%rip), %eax
	movl	%eax, 32(%rsp)
	movl	mv+28(%rip), %eax
	movl	%eax, 36(%rsp)
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L22:
	movl	(%rdi), %eax
	movl	4(%rdi), %edx
	addl	$1, %esi
	movl	8(%rdi), %r13d
	movl	12(%rdi), %ecx
	cmpl	%r14d, %eax
	jne	.L10
	movl	4(%rsp), %ebx
	cmpl	%ebx, %edx
	je	.L65
.L10:
	addq	$16, %rdi
	movl	$1, %r9d
	cmpl	$1, %ecx
	jle	.L13
	movl	8(%rsp), %ebx
	leal	(%rax,%rbx), %edi
	movl	12(%rsp), %ebx
	leal	(%rdx,%rbx), %r8d
	movl	%edi, %ebx
	orl	%r8d, %ebx
	js	.L14
	cmpl	%edi, %r11d
	jle	.L14
	cmpl	%r15d, %r8d
	jge	.L14
	movslq	%edi, %r9
	movslq	%r8d, %r10
	leaq	(%r9,%r9,4), %rbx
	movzbl	map(%r10,%rbx,2), %ebx
	movb	%bl, 47(%rsp)
	testb	%bl, %bl
	je	.L14
	imulq	$70, %r9, %r9
	leaq	0(,%r10,8), %r12
	subq	%r10, %r12
	leal	-1(%rcx), %ebx
	leaq	mk(%r9,%r12), %r9
	movslq	%ebx, %r12
	addq	%r12, %r9
	cmpb	$0, (%r9)
	jne	.L14
	movb	$1, (%r9)
	movslq	%ebp, %r9
	salq	$4, %r9
	cmpb	$4, 47(%rsp)
	movb	$1, 46(%rsp)
	movl	%edi, q(%r9)
	leal	1(%r13), %edi
	movl	%edi, q+8(%r9)
	movl	$6, %edi
	cmove	%edi, %ebx
	movl	%r8d, q+4(%r9)
	addl	$1, %ebp
	movl	%ebx, q+12(%r9)
	.p2align 4,,10
	.p2align 3
.L14:
	movl	16(%rsp), %ebx
	leal	(%rax,%rbx), %edi
	movl	20(%rsp), %ebx
	leal	(%rdx,%rbx), %r8d
	movl	%edi, %ebx
	orl	%r8d, %ebx
	js	.L16
	cmpl	%edi, %r11d
	jle	.L16
	cmpl	%r15d, %r8d
	jge	.L16
	movslq	%edi, %r9
	movslq	%r8d, %r10
	leaq	(%r9,%r9,4), %rbx
	movzbl	map(%r10,%rbx,2), %ebx
	movb	%bl, 47(%rsp)
	testb	%bl, %bl
	je	.L16
	imulq	$70, %r9, %r9
	leaq	0(,%r10,8), %r12
	subq	%r10, %r12
	leal	-1(%rcx), %ebx
	leaq	mk(%r9,%r12), %r9
	movslq	%ebx, %r12
	addq	%r12, %r9
	cmpb	$0, (%r9)
	jne	.L16
	movb	$1, (%r9)
	movslq	%ebp, %r9
	salq	$4, %r9
	cmpb	$4, 47(%rsp)
	movb	$1, 46(%rsp)
	movl	%edi, q(%r9)
	leal	1(%r13), %edi
	movl	%edi, q+8(%r9)
	movl	$6, %edi
	cmove	%edi, %ebx
	movl	%r8d, q+4(%r9)
	addl	$1, %ebp
	movl	%ebx, q+12(%r9)
	.p2align 4,,10
	.p2align 3
.L16:
	movl	24(%rsp), %ebx
	leal	(%rax,%rbx), %edi
	movl	28(%rsp), %ebx
	leal	(%rdx,%rbx), %r8d
	movl	%edi, %ebx
	orl	%r8d, %ebx
	js	.L18
	cmpl	%edi, %r11d
	jle	.L18
	cmpl	%r15d, %r8d
	jge	.L18
	movslq	%edi, %r9
	movslq	%r8d, %r10
	leaq	(%r9,%r9,4), %rbx
	movzbl	map(%r10,%rbx,2), %ebx
	movb	%bl, 47(%rsp)
	testb	%bl, %bl
	je	.L18
	imulq	$70, %r9, %r9
	leaq	0(,%r10,8), %r12
	subq	%r10, %r12
	leal	-1(%rcx), %ebx
	leaq	mk(%r9,%r12), %r9
	movslq	%ebx, %r12
	addq	%r12, %r9
	cmpb	$0, (%r9)
	jne	.L18
	movb	$1, (%r9)
	movslq	%ebp, %r9
	salq	$4, %r9
	cmpb	$4, 47(%rsp)
	movb	$1, 46(%rsp)
	movl	%edi, q(%r9)
	leal	1(%r13), %edi
	movl	%edi, q+8(%r9)
	movl	$6, %edi
	cmove	%edi, %ebx
	movl	%r8d, q+4(%r9)
	addl	$1, %ebp
	movl	%ebx, q+12(%r9)
	.p2align 4,,10
	.p2align 3
.L18:
	movl	32(%rsp), %ebx
	movl	36(%rsp), %edi
	addl	%ebx, %eax
	addl	%edi, %edx
	movl	%eax, %ebx
	orl	%edx, %ebx
	js	.L20
	cmpl	%eax, %r11d
	jle	.L20
	cmpl	%r15d, %edx
	jge	.L20
	movslq	%eax, %rdi
	movslq	%edx, %r8
	leaq	(%rdi,%rdi,4), %r9
	movzbl	map(%r8,%r9,2), %r10d
	testb	%r10b, %r10b
	je	.L20
	imulq	$70, %rdi, %rdi
	leaq	0(,%r8,8), %rbx
	subl	$1, %ecx
	subq	%r8, %rbx
	movslq	%ecx, %r9
	leaq	mk(%rdi,%rbx), %rdi
	addq	%r9, %rdi
	cmpb	$0, (%rdi)
	jne	.L20
	movslq	%ebp, %r9
	movb	$1, (%rdi)
	salq	$4, %r9
	cmpb	$4, %r10b
	movb	$1, 46(%rsp)
	movl	%eax, q(%r9)
	leal	1(%r13), %eax
	movl	%eax, q+8(%r9)
	movl	$6, %eax
	cmove	%eax, %ecx
	movl	%edx, q+4(%r9)
	addl	$1, %ebp
	movl	%ecx, q+12(%r9)
	.p2align 4,,10
	.p2align 3
.L20:
	movl	$1, %r9d
.L9:
	movslq	%esi, %rdi
	salq	$4, %rdi
	addq	$q, %rdi
.L13:
	cmpl	%esi, %ebp
	jg	.L22
	cmpb	$0, 46(%rsp)
	movl	40(%rsp), %r15d
	movl	4(%rsp), %r13d
	je	.L23
	movl	%ebp, end(%rip)
.L23:
	testb	%r9b, %r9b
	je	.L24
	movl	%esi, top(%rip)
.L24:
	movl	$-1, %ecx
.L12:
	movl	%ecx, %esi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L2
.L65:
	cmpb	$0, 46(%rsp)
	movl	%r13d, %ecx
	movl	40(%rsp), %r15d
	movl	%ebx, %r13d
	je	.L11
	movl	%ebp, end(%rip)
.L11:
	movl	%esi, top(%rip)
	jmp	.L12
.L39:
	addq	$72, %rsp
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
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.globl	mv
	.data
	.align 32
	.type	mv, @object
	.size	mv, 32
mv:
	.long	-1
	.long	0
	.long	0
	.long	1
	.long	1
	.long	0
	.long	0
	.long	-1
	.globl	mk
	.bss
	.align 32
	.type	mk, @object
	.size	mk, 700
mk:
	.zero	700
	.globl	map
	.align 32
	.type	map, @object
	.size	map, 100
map:
	.zero	100
	.globl	end
	.align 4
	.type	end, @object
	.size	end, 4
end:
	.zero	4
	.globl	top
	.align 4
	.type	top, @object
	.size	top, 4
top:
	.zero	4
	.globl	q
	.align 32
	.type	q, @object
	.size	q, 11200
q:
	.zero	11200
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	6
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
