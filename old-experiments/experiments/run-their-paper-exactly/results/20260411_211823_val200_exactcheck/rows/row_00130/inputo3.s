.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d"
.LC3:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	n(%rip), %rsi
	leaq	k(%rip), %rdx
	xorl	%eax, %eax
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	.LC0(%rip), %rdi
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	call	scanf@PLT
	movl	n(%rip), %r8d
	leaq	f(%rip), %rsi
	leal	1(%r8), %eax
	movl	%r8d, %r10d
	subl	k(%rip), %r10d
	cltq
	movl	$1, (%rsi,%rax,4)
	cmpl	%r10d, %r8d
	jle	.L2
	movl	M(%rip), %edi
	testl	%r8d, %r8d
	jle	.L2
	movslq	%r8d, %rax
	movd	%r8d, %xmm7
	movl	%r8d, %r9d
	movl	$1, %ebx
	leaq	-12(%rsi,%rax,4), %r11
	movdqa	.LC1(%rip), %xmm5
	leaq	4(%rsi), %rbp
	movdqa	.LC2(%rip), %xmm4
	pshufd	$0, %xmm7, %xmm6
	leaq	-16(%r11), %r12
	pxor	%xmm3, %xmm3
	pcmpeqd	%xmm2, %xmm2
	.p2align 4,,10
	.p2align 3
.L4:
	cmpl	%r9d, %r8d
	jg	.L11
	movl	%r8d, %ecx
.L10:
	movslq	%ecx, %rcx
	movl	0(%rbp,%rcx,4), %edx
	.p2align 4,,10
	.p2align 3
.L8:
	movl	(%rsi,%rcx,4), %eax
	addl	%edx, %eax
	cltd
	idivl	%edi
	movl	%edx, (%rsi,%rcx,4)
	subq	$1, %rcx
	testl	%ecx, %ecx
	jg	.L8
	subl	$1, %r9d
	cmpl	%r10d, %r9d
	jne	.L4
.L2:
	movl	4+f(%rip), %edx
	cmpl	$1, %r10d
	jle	.L12
	movl	M(%rip), %ecx
	.p2align 4,,10
	.p2align 3
.L13:
	leal	(%rdx,%rdx), %eax
	subl	$1, %r10d
	cltd
	idivl	%ecx
	cmpl	$1, %r10d
	jne	.L13
	movl	%edx, 4+f(%rip)
.L12:
	movl	%edx, %esi
	leaq	.LC3(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
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
.L11:
	.cfi_restore_state
	xorl	%edx, %edx
	testl	%r9d, %r9d
	movl	%r8d, %eax
	movl	%ebx, %r13d
	cmovns	%r9d, %edx
	subl	%edx, %eax
	cmpl	%edx, %r8d
	cmovg	%eax, %r13d
	subl	$1, %eax
	cmpl	$2, %eax
	jbe	.L14
	cmpl	%edx, %r8d
	jle	.L14
	movl	%r13d, %eax
	movdqa	%xmm6, %xmm1
	movq	%r12, %rcx
	shrl	$2, %eax
	paddd	%xmm5, %xmm1
	subl	$1, %eax
	salq	$4, %rax
	subq	%rax, %rcx
	movq	%r11, %rax
	.p2align 4,,10
	.p2align 3
.L6:
	movdqa	%xmm1, %xmm0
	movups	%xmm3, (%rax)
	subq	$16, %rax
	paddd	%xmm4, %xmm1
	paddd	%xmm2, %xmm0
	cmpq	%rax, %rcx
	jne	.L6
	movl	%r13d, %r14d
	pshufd	$255, %xmm0, %xmm0
	movl	%r8d, %eax
	andl	$-4, %r14d
	movd	%xmm0, %ecx
	subl	%r14d, %eax
	cmpl	%r14d, %r13d
	je	.L7
.L5:
	movslq	%eax, %rcx
	movl	$0, (%rsi,%rcx,4)
	leal	-1(%rax), %ecx
	cmpl	%ecx, %edx
	jge	.L7
	movslq	%ecx, %rcx
	movl	$0, (%rsi,%rcx,4)
	leal	-2(%rax), %ecx
	cmpl	%ecx, %edx
	jge	.L7
	movslq	%ecx, %rcx
	movl	$0, (%rsi,%rcx,4)
	leal	-3(%rax), %ecx
.L7:
	testl	%ecx, %ecx
	jg	.L10
	subl	$1, %r9d
	cmpl	%r10d, %r9d
	jne	.L4
	jmp	.L2
.L14:
	movl	%r8d, %eax
	jmp	.L5
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	M
	.data
	.align 4
	.type	M, @object
	.size	M, 4
M:
	.long	1000000007
	.globl	k
	.bss
	.align 4
	.type	k, @object
	.size	k, 4
k:
	.zero	4
	.globl	n
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.globl	f
	.align 32
	.type	f, @object
	.size	f, 8020
f:
	.zero	8020
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	-1
	.long	-2
	.long	-3
	.align 16
.LC2:
	.long	-4
	.long	-4
	.long	-4
	.long	-4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4: