	.file	"inputC.c"
	.text
	.p2align 4
	.globl	hexDistance
	.type	hexDistance, @function
hexDistance:
.LFB3:
	.cfi_startproc
	movl	%ecx, %eax
	movl	%edx, %ecx
	subl	%edi, %ecx
	movl	%ecx, %r8d
	negl	%r8d
	cmovs	%ecx, %r8d
	cmpl	%edi, %edx
	je	.L7
	cmpl	%esi, %eax
	je	.L1
	cmpl	%edi, %edx
	jge	.L8
	andl	$1, %edx
	cmpl	%esi, %eax
	jg	.L5
.L9:
	leal	1(%r8), %ecx
	subl	%edx, %ecx
	sarl	%ecx
	movl	%ecx, %edx
	addl	%eax, %edx
	movl	%esi, %eax
	subl	%edx, %eax
	addl	%r8d, %eax
	cmpl	%edx, %esi
	cmovge	%eax, %r8d
.L1:
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	addl	%r8d, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%ecx, %edx
	sarl	%edx
	subl	%edx, %eax
	movl	%eax, %edx
	subl	%esi, %edx
	addl	%r8d, %edx
	cmpl	%eax, %esi
	cmovle	%edx, %r8d
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	movl	%eax, %edx
	movl	%esi, %eax
	movl	%edx, %esi
	movl	%edi, %edx
	andl	$1, %edx
	cmpl	%esi, %eax
	jg	.L5
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L7:
	subl	%esi, %eax
	movl	%eax, %r8d
	negl	%r8d
	cmovs	%eax, %r8d
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE3:
	.size	hexDistance, .-hexDistance
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d%d"
.LC2:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB4:
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
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
.L11:
	xorl	%eax, %eax
	movl	$R, %edx
	movl	$C, %esi
	movl	$.LC1, %edi
	call	__isoc99_scanf
	testl	%eax, %eax
	je	.L43
	movl	C(%rip), %eax
	testl	%eax, %eax
	je	.L43
	movl	$S, %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	__isoc99_scanf
	movl	S(%rip), %ecx
	xorl	%eax, %eax
	movl	$0, n(%rip)
	testl	%ecx, %ecx
	jle	.L15
	.p2align 4,,10
	.p2align 3
.L12:
	cltq
	movl	$.LC1, %edi
	addl	$1, %ebx
	leaq	(%rax,%rax,2), %rax
	salq	$2, %rax
	leaq	shop(%rax), %rdx
	leaq	shop+4(%rax), %rsi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movslq	n(%rip), %rdx
	cmpl	%ebx, S(%rip)
	leal	1(%rdx), %eax
	leaq	(%rdx,%rdx,2), %rdx
	movl	%eax, n(%rip)
	movl	$0, shop+8(,%rdx,4)
	jg	.L12
.L15:
	movl	$N, %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	__isoc99_scanf
	movl	N(%rip), %edx
	movl	n(%rip), %r12d
	testl	%edx, %edx
	jle	.L17
	.p2align 4,,10
	.p2align 3
.L16:
	movslq	%r12d, %r12
	movl	$.LC1, %edi
	addl	$1, %ebx
	leaq	(%r12,%r12,2), %rax
	salq	$2, %rax
	leaq	shop(%rax), %rdx
	leaq	shop+4(%rax), %rsi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movslq	n(%rip), %rax
	cmpl	%ebx, N(%rip)
	leal	1(%rax), %r12d
	leaq	(%rax,%rax,2), %rax
	movl	%r12d, n(%rip)
	movl	$0, shop+8(,%rax,4)
	jg	.L16
.L17:
	movl	R(%rip), %eax
	movl	S(%rip), %r13d
	testl	%eax, %eax
	jle	.L18
	movl	C(%rip), %edi
	testl	%edi, %edi
	jle	.L18
	leal	1(%rax), %edx
	movslq	%r12d, %rax
	leal	1(%rdi), %r14d
	movl	$1, %r8d
	leaq	16(%rsp,%rax,4), %rbp
	movslq	%r13d, %rax
	leaq	(%rax,%rax,2), %rsi
	leaq	16(%rsp,%rax,4), %rcx
	leaq	shop+8(,%rsi,4), %r15
	movl	%r12d, %esi
	subl	%r13d, %esi
	addq	%rsi, %rax
	movq	%r15, %rsi
	leaq	16(%rsp,%rax,4), %rbx
	.p2align 4,,10
	.p2align 3
.L20:
	movl	$1, %r15d
	.p2align 4,,10
	.p2align 3
.L32:
	movl	$shop+4, %r9d
	leaq	16(%rsp), %rdi
	testl	%r12d, %r12d
	jle	.L85
	movl	%r12d, 8(%rsp)
	movl	%r13d, 12(%rsp)
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L88:
	movl	%r11d, %r12d
	movl	%r15d, %r11d
	andl	$1, %r10d
	cmpl	%r11d, %r12d
	jg	.L24
.L89:
	leal	1(%rax), %r13d
	subl	%r10d, %r13d
	movl	%r11d, %r10d
	sarl	%r13d
	addl	%r12d, %r13d
	subl	%r13d, %r10d
	addl	%eax, %r10d
	cmpl	%r13d, %r11d
	cmovge	%r10d, %eax
.L22:
	movl	%eax, (%rdi)
	addq	$4, %rdi
	addq	$12, %r9
	cmpq	%rbp, %rdi
	je	.L86
.L25:
	movl	-4(%r9), %r10d
	movl	%r8d, %r12d
	movl	(%r9), %r11d
	subl	%r10d, %r12d
	movl	%r12d, %eax
	negl	%eax
	cmovs	%r12d, %eax
	cmpl	%r8d, %r10d
	je	.L87
	cmpl	%r15d, %r11d
	je	.L22
	cmpl	%r8d, %r10d
	jle	.L88
	movl	%r8d, %r10d
	movl	%r15d, %r12d
	andl	$1, %r10d
	cmpl	%r11d, %r12d
	jle	.L89
.L24:
	addl	%eax, %r10d
	movl	%r10d, %r13d
	shrl	$31, %r13d
	addl	%r10d, %r13d
	sarl	%r13d
	subl	%r13d, %r12d
	movl	%r12d, %r10d
	subl	%r11d, %r10d
	addl	%eax, %r10d
	cmpl	%r12d, %r11d
	cmovle	%r10d, %eax
	addq	$4, %rdi
	addq	$12, %r9
	movl	%eax, -4(%rdi)
	cmpq	%rbp, %rdi
	jne	.L25
.L86:
	movl	12(%rsp), %r13d
	movl	8(%rsp), %r12d
	movl	$-1, %edi
	testl	%r13d, %r13d
	jle	.L27
.L26:
	leaq	16(%rsp), %rax
	movl	$-1, %edi
	.p2align 4,,10
	.p2align 3
.L31:
	testl	%edi, %edi
	js	.L29
	cmpl	%edi, (%rax)
	jge	.L30
.L29:
	movl	(%rax), %edi
.L30:
	addq	$4, %rax
	cmpq	%rax, %rcx
	jne	.L31
.L28:
	cmpl	%r13d, %r12d
	jle	.L36
.L27:
	movq	%rsi, %r9
	movq	%rcx, %rax
	.p2align 4,,10
	.p2align 3
.L35:
	cmpl	%edi, (%rax)
	jge	.L34
	addl	$1, (%r9)
.L34:
	addq	$4, %rax
	addq	$12, %r9
	cmpq	%rbx, %rax
	jne	.L35
.L36:
	addl	$1, %r15d
	cmpl	%r14d, %r15d
	jne	.L32
	addl	$1, %r8d
	cmpl	%edx, %r8d
	jne	.L20
.L18:
	cmpl	%r13d, %r12d
	jle	.L48
	movl	%r12d, %edx
	subl	%r13d, %edx
	subl	$1, %edx
	cmpl	$3, %edx
	jbe	.L49
	movslq	%r13d, %rax
	movl	%edx, %ecx
	leaq	(%rax,%rax,2), %rax
	shrl	$2, %ecx
	leaq	8(,%rax,4), %rsi
	leaq	shop(%rsi), %rax
	movdqu	shop(%rsi), %xmm0
	movdqu	16(%rax), %xmm1
	shufps	$10, %xmm0, %xmm1
	shufps	$140, %xmm1, %xmm0
	movdqu	32(%rax), %xmm1
	shufps	$165, %xmm0, %xmm1
	shufps	$36, %xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	pcmpgtd	.LC3(%rip), %xmm1
	pand	%xmm1, %xmm0
	pandn	.LC3(%rip), %xmm1
	por	%xmm1, %xmm0
	cmpl	$1, %ecx
	je	.L41
	movdqu	48(%rax), %xmm3
	movdqu	64(%rax), %xmm2
	movdqa	%xmm3, %xmm1
	shufps	$10, %xmm3, %xmm2
	shufps	$140, %xmm2, %xmm1
	movdqu	80(%rax), %xmm2
	shufps	$165, %xmm1, %xmm2
	shufps	$36, %xmm2, %xmm1
	movdqa	%xmm1, %xmm2
	pcmpgtd	%xmm0, %xmm2
	pand	%xmm2, %xmm1
	pandn	%xmm0, %xmm2
	movdqa	%xmm2, %xmm0
	por	%xmm1, %xmm0
	cmpl	$2, %ecx
	je	.L41
	movdqu	96(%rax), %xmm4
	movdqu	112(%rax), %xmm2
	movdqa	%xmm4, %xmm1
	shufps	$10, %xmm4, %xmm2
	shufps	$140, %xmm2, %xmm1
	movdqu	128(%rax), %xmm2
	shufps	$165, %xmm1, %xmm2
	shufps	$36, %xmm2, %xmm1
	movdqa	%xmm1, %xmm2
	pcmpgtd	%xmm0, %xmm2
	pand	%xmm2, %xmm1
	pandn	%xmm0, %xmm2
	movdqa	%xmm2, %xmm0
	por	%xmm1, %xmm0
	cmpl	$3, %ecx
	je	.L41
	movdqu	144(%rax), %xmm5
	movdqu	160(%rax), %xmm2
	movdqa	%xmm5, %xmm1
	shufps	$10, %xmm5, %xmm2
	shufps	$140, %xmm2, %xmm1
	movdqu	176(%rax), %xmm2
	shufps	$165, %xmm1, %xmm2
	shufps	$36, %xmm2, %xmm1
	movdqa	%xmm1, %xmm2
	pcmpgtd	%xmm0, %xmm2
	pand	%xmm2, %xmm1
	pandn	%xmm0, %xmm2
	movdqa	%xmm2, %xmm0
	por	%xmm1, %xmm0
	cmpl	$4, %ecx
	je	.L41
	movdqu	192(%rax), %xmm6
	movdqu	208(%rax), %xmm2
	movdqa	%xmm6, %xmm1
	shufps	$10, %xmm6, %xmm2
	shufps	$140, %xmm2, %xmm1
	movdqu	224(%rax), %xmm2
	shufps	$165, %xmm1, %xmm2
	shufps	$36, %xmm2, %xmm1
	movdqa	%xmm1, %xmm2
	pcmpgtd	%xmm0, %xmm2
	pand	%xmm2, %xmm1
	pandn	%xmm0, %xmm2
	movdqa	%xmm2, %xmm0
	por	%xmm1, %xmm0
	cmpl	$5, %ecx
	je	.L41
	movdqu	240(%rax), %xmm7
	movdqu	256(%rax), %xmm2
	movdqa	%xmm7, %xmm1
	shufps	$10, %xmm7, %xmm2
	shufps	$140, %xmm2, %xmm1
	movdqu	272(%rax), %xmm2
	shufps	$165, %xmm1, %xmm2
	shufps	$36, %xmm2, %xmm1
	movdqa	%xmm1, %xmm2
	pcmpgtd	%xmm0, %xmm2
	pand	%xmm2, %xmm1
	pandn	%xmm0, %xmm2
	movdqa	%xmm2, %xmm0
	por	%xmm1, %xmm0
.L41:
	movdqa	%xmm0, %xmm2
	andl	$-4, %edx
	psrldq	$8, %xmm2
	addl	%edx, %r13d
	movdqa	%xmm2, %xmm1
	pcmpgtd	%xmm0, %xmm1
	pand	%xmm1, %xmm2
	pandn	%xmm0, %xmm1
	por	%xmm2, %xmm1
	movdqa	%xmm1, %xmm2
	psrldq	$4, %xmm2
	movdqa	%xmm2, %xmm0
	pcmpgtd	%xmm1, %xmm0
	pand	%xmm0, %xmm2
	pandn	%xmm1, %xmm0
	por	%xmm2, %xmm0
	movd	%xmm0, %esi
.L40:
	movslq	%r13d, %rax
	leaq	(%rax,%rax,2), %rax
	movl	shop+8(,%rax,4), %eax
	cmpl	%eax, %esi
	cmovl	%eax, %esi
	leal	1(%r13), %eax
	cmpl	%eax, %r12d
	jle	.L39
	cltq
	leaq	(%rax,%rax,2), %rax
	movl	shop+8(,%rax,4), %eax
	cmpl	%eax, %esi
	cmovl	%eax, %esi
	leal	2(%r13), %eax
	cmpl	%eax, %r12d
	jle	.L39
	cltq
	leaq	(%rax,%rax,2), %rax
	movl	shop+8(,%rax,4), %eax
	cmpl	%eax, %esi
	cmovl	%eax, %esi
	leal	3(%r13), %eax
	cmpl	%eax, %r12d
	jle	.L39
	cltq
	leaq	(%rax,%rax,2), %rax
	movl	shop+8(,%rax,4), %eax
	cmpl	%eax, %esi
	cmovl	%eax, %esi
.L39:
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L87:
	movl	%r15d, %r10d
	subl	%r11d, %r10d
	movl	%r10d, %eax
	negl	%eax
	cmovs	%r10d, %eax
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L85:
	testl	%r13d, %r13d
	jg	.L26
	movl	$-1, %edi
	jmp	.L28
.L43:
	addq	$136, %rsp
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
.L48:
	.cfi_restore_state
	movl	$-1, %esi
	jmp	.L39
.L49:
	movl	$-1, %esi
	jmp	.L40
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.globl	C
	.bss
	.align 4
	.type	C, @object
	.size	C, 4
C:
	.zero	4
	.globl	R
	.align 4
	.type	R, @object
	.size	R, 4
R:
	.zero	4
	.globl	N
	.align 4
	.type	N, @object
	.size	N, 4
N:
	.zero	4
	.globl	S
	.align 4
	.type	S, @object
	.size	S, 4
S:
	.zero	4
	.globl	n
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.globl	shop
	.align 32
	.type	shop, @object
	.size	shop, 300
shop:
	.zero	300
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
