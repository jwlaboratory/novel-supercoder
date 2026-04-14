	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d"
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	$K, %edx
	movl	$N, %esi
	xorl	%eax, %eax
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	$.LC0, %edi
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	xorl	%ebx, %ebx
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	call	__isoc99_scanf
	movl	K(%rip), %r13d
	testl	%r13d, %r13d
	jle	.L5
	.p2align 4,,10
	.p2align 3
.L2:
	xorl	%eax, %eax
	leaq	12(%rsp), %rsi
	movl	$.LC1, %edi
	addl	$1, %ebx
	call	__isoc99_scanf
	movslq	12(%rsp), %rax
	cmpl	%ebx, K(%rip)
	movl	$1, Dis(,%rax,4)
	jg	.L2
.L5:
	movslq	N(%rip), %rcx
	movl	$1, %ebx
	movq	%rcx, %rax
	imulq	$1717986919, %rcx, %rcx
	cltd
	sarq	$34, %rcx
	subl	%edx, %ecx
	je	.L4
	.p2align 4,,10
	.p2align 3
.L3:
	movslq	%ecx, %rdx
	sarl	$31, %ecx
	addl	$1, %ebx
	imulq	$1717986919, %rdx, %rdx
	movl	%ecx, %esi
	sarq	$34, %rdx
	movl	%edx, %ecx
	subl	%esi, %ecx
	jne	.L3
.L4:
	movl	Dis(%rip), %ebp
	testl	%ebp, %ebp
	je	.L6
	movl	Dis+4(%rip), %r12d
	testl	%r12d, %r12d
	je	.L7
	movl	Dis+8(%rip), %ebp
	testl	%ebp, %ebp
	je	.L32
	movl	Dis+12(%rip), %r11d
	testl	%r11d, %r11d
	je	.L33
	cmpl	$0, Dis+16(%rip)
	je	.L34
	cmpl	$0, Dis+20(%rip)
	je	.L35
	cmpl	$0, Dis+24(%rip)
	je	.L36
	cmpl	$0, Dis+28(%rip)
	je	.L37
	cmpl	$0, Dis+32(%rip)
	je	.L38
	cmpl	$1, Dis+36(%rip)
	sbbl	%ebp, %ebp
	addl	$10, %ebp
.L8:
	movl	Dis+4(%rip), %edx
.L29:
	movl	Dis+8(%rip), %r10d
	testl	%r10d, %r10d
	je	.L41
	movl	Dis+12(%rip), %r9d
	testl	%r9d, %r9d
	je	.L42
	movl	Dis+16(%rip), %r8d
	testl	%r8d, %r8d
	je	.L43
	cmpl	$0, Dis+20(%rip)
	je	.L44
	cmpl	$0, Dis+24(%rip)
	je	.L45
	cmpl	$0, Dis+28(%rip)
	je	.L46
	cmpl	$0, Dis+32(%rip)
	je	.L47
	cmpl	$0, Dis+36(%rip)
	movl	$10, %r8d
	je	.L84
.L10:
	movl	Dis+32(%rip), %edi
	testl	%edi, %edi
	je	.L50
	movl	Dis+28(%rip), %esi
	testl	%esi, %esi
	je	.L51
	movl	Dis+24(%rip), %ecx
	testl	%ecx, %ecx
	je	.L52
	cmpl	$0, Dis+20(%rip)
	je	.L53
	cmpl	$0, Dis+16(%rip)
	je	.L54
	cmpl	$0, Dis+12(%rip)
	je	.L55
	cmpl	$0, Dis+8(%rip)
	je	.L56
	xorl	%ecx, %ecx
	testl	%edx, %edx
	sete	%cl
.L11:
	movl	$5, %r13d
	movl	$6, %esi
	movl	%ecx, %edx
	subl	%ebx, %r13d
	subl	%ebx, %esi
	movslq	%r13d, %r13
	movl	Divider(,%r13,4), %r9d
	imull	%r9d, %edx
	cmpl	$5, %esi
	je	.L12
	movslq	%esi, %rdi
	movl	Divider(,%rdi,4), %esi
	imull	%ecx, %esi
	addl	%esi, %edx
	movl	$7, %esi
	subl	%ebx, %esi
	cmpl	$5, %esi
	je	.L13
	movslq	%esi, %rsi
	movl	Divider(,%rsi,4), %r10d
	movl	$8, %esi
	subl	%ebx, %esi
	imull	%ecx, %r10d
	addl	%r10d, %edx
	cmpl	$5, %esi
	je	.L13
	movslq	%esi, %rsi
	movl	Divider(,%rsi,4), %r11d
	movl	$9, %esi
	subl	%ebx, %esi
	imull	%ecx, %r11d
	addl	%r11d, %edx
	cmpl	$5, %esi
	je	.L13
	movslq	%esi, %rsi
	imull	Divider(,%rsi,4), %ecx
	addl	%ecx, %edx
.L13:
	cmpl	%edx, %eax
	jg	.L85
.L27:
	movl	$4, %r12d
.L16:
	cltd
	idivl	Divider(,%r13,4)
	movslq	%eax, %rdx
	movl	%eax, %ecx
	imulq	$1717986919, %rdx, %rdx
	sarl	$31, %ecx
	sarq	$34, %rdx
	subl	%ecx, %edx
	leal	(%rdx,%rdx,4), %ecx
	addl	%ecx, %ecx
	subl	%ecx, %eax
	movl	%eax, 12(%rsp)
	movl	%eax, %edx
	cltq
	movl	Dis(,%rax,4), %r14d
	testl	%r14d, %r14d
	je	.L86
	leal	1(%rdx), %esi
	movslq	%esi, %rax
	movl	Dis(,%rax,4), %eax
	testl	%eax, %eax
	je	.L21
	leal	2(%rdx), %esi
	movslq	%esi, %rax
	movl	Dis(,%rax,4), %r14d
	testl	%r14d, %r14d
	je	.L21
	leal	3(%rdx), %esi
	movslq	%esi, %rax
	movl	Dis(,%rax,4), %r11d
	testl	%r11d, %r11d
	je	.L21
	leal	4(%rdx), %esi
	movslq	%esi, %rax
	movl	Dis(,%rax,4), %r10d
	testl	%r10d, %r10d
	je	.L21
	leal	5(%rdx), %esi
	movslq	%esi, %rax
	movl	Dis(,%rax,4), %r9d
	testl	%r9d, %r9d
	je	.L21
	leal	6(%rdx), %esi
	movslq	%esi, %rax
	movl	Dis(,%rax,4), %r8d
	testl	%r8d, %r8d
	je	.L21
	leal	7(%rdx), %esi
	movslq	%esi, %rax
	movl	Dis(,%rax,4), %edi
	testl	%edi, %edi
	je	.L21
	leal	8(%rdx), %esi
	movslq	%esi, %rax
	movl	Dis(,%rax,4), %ecx
	testl	%ecx, %ecx
	je	.L21
	leal	9(%rdx), %esi
	movslq	%esi, %rax
	movl	Dis(,%rax,4), %eax
	testl	%eax, %eax
	je	.L21
	leal	10(%rdx), %esi
.L21:
	movl	%esi, Divider(,%r13,4)
	movl	$1, %r14d
	cmpl	$10, %esi
	je	.L87
.L23:
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addq	$1, %r13
	call	printf
	cmpl	$5, %r13d
	je	.L18
	testl	%r14d, %r14d
	jne	.L17
	movl	N(%rip), %eax
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L17:
	movl	%ebp, %esi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	addq	$1, %r13
	call	printf
	cmpl	$5, %r13d
	jne	.L17
.L18:
	movl	$10, %edi
	call	putchar
.L79:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L87:
	.cfi_restore_state
	movl	%r12d, %eax
	movl	$1, %r14d
	subl	%ebx, %eax
	cmpl	%r13d, %eax
	je	.L23
	movl	$0, Divider(,%r13,4)
	xorl	%esi, %esi
	jmp	.L23
.L86:
	movl	%edx, Divider(,%r13,4)
	movl	%edx, %esi
	jmp	.L23
.L85:
	movl	$4, %eax
	imull	%ebp, %r9d
	subl	%ebx, %eax
	cltq
	imull	Divider(,%rax,4), %r8d
	movl	Divider(,%rdi,4), %eax
	imull	%ebp, %eax
	leal	(%r8,%r9), %esi
	addl	%eax, %esi
	movl	$7, %eax
	subl	%ebx, %eax
	cmpl	$5, %eax
	je	.L14
	cltq
	movl	Divider(,%rax,4), %edi
	movl	$8, %eax
	subl	%ebx, %eax
	imull	%ebp, %edi
	addl	%edi, %esi
	cmpl	$5, %eax
	je	.L14
	cltq
	movl	Divider(,%rax,4), %edi
	movl	$9, %eax
	subl	%ebx, %eax
	imull	%ebp, %edi
	addl	%edi, %esi
	cmpl	$5, %eax
	je	.L14
	cltq
	imull	Divider(,%rax,4), %ebp
	addl	%ebp, %esi
.L14:
	movl	$.LC2, %edi
	xorl	%eax, %eax
	movl	%esi, 12(%rsp)
	call	printf
	jmp	.L79
.L35:
	movl	$5, %ebp
	jmp	.L8
.L12:
	cmpl	%edx, %eax
	jle	.L27
	movl	Divider+12(%rip), %esi
	imull	%ebp, %r9d
	imull	%r8d, %esi
	addl	%r9d, %esi
	jmp	.L14
.L6:
	movl	Dis+4(%rip), %edx
	testl	%edx, %edx
	jne	.L29
.L82:
	movl	$1, %r8d
.L9:
	cmpl	$0, Dis+36(%rip)
	jne	.L10
	movl	$9, %ecx
	jmp	.L11
.L50:
	movl	$8, %ecx
	jmp	.L11
.L7:
	xorl	%edx, %edx
	movl	$1, %ebp
	jmp	.L82
.L41:
	movl	$2, %r8d
	jmp	.L9
.L42:
	movl	$3, %r8d
	jmp	.L9
.L51:
	movl	$7, %ecx
	jmp	.L11
.L32:
	movl	$2, %ebp
	jmp	.L8
.L33:
	movl	$3, %ebp
	jmp	.L8
.L43:
	movl	$4, %r8d
	jmp	.L9
.L52:
	movl	$6, %ecx
	jmp	.L11
.L53:
	movl	$5, %ecx
	jmp	.L11
.L34:
	movl	$4, %ebp
	jmp	.L8
.L44:
	movl	$5, %r8d
	jmp	.L9
.L54:
	movl	$4, %ecx
	jmp	.L11
.L45:
	movl	$6, %r8d
	jmp	.L9
.L55:
	movl	$3, %ecx
	jmp	.L11
.L46:
	movl	$7, %r8d
	jmp	.L9
.L36:
	movl	$6, %ebp
	jmp	.L8
.L56:
	movl	$2, %ecx
	jmp	.L11
.L37:
	movl	$7, %ebp
	jmp	.L8
.L47:
	movl	$8, %r8d
	jmp	.L9
.L38:
	movl	$8, %ebp
	jmp	.L8
.L84:
	movl	$9, %r8d
	movl	$9, %ecx
	jmp	.L11
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.globl	Divider
	.data
	.align 16
	.type	Divider, @object
	.size	Divider, 20
Divider:
	.long	10000
	.long	1000
	.long	100
	.long	10
	.long	1
	.globl	Dis
	.bss
	.align 32
	.type	Dis, @object
	.size	Dis, 44
Dis:
	.zero	44
	.globl	K
	.align 4
	.type	K, @object
	.size	K, 4
K:
	.zero	4
	.globl	N
	.align 4
	.type	N, @object
	.size	N, 4
N:
	.zero	4
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
