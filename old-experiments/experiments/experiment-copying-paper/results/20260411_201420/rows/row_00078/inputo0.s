```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%f %f\n"
.LC1:
	.string	"NA\n"
.LC2:
	.string	"%lf %lf"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorl	%eax, %eax
	leaq	y(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	x(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%r12, %rdi
	leaq	.LC2(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	gets@PLT
	movl	n(%rip), %esi
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L3:
	leal	1(%rax), %esi
	movl	%esi, n(%rip)
.L2:
	movslq	%esi, %rsi
	xorl	%eax, %eax
	movq	%rbp, %rdi
	salq	$3, %rsi
	leaq	0(%r13,%rsi), %rdx
	addq	%r12, %rsi
	call	scanf@PLT
	cmpl	$-1, %eax
	movl	n(%rip), %eax
	jne	.L3
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%eax, %edx
	sarl	%edx
	testb	$1, %al
	jne	.L5
	movslq	%edx, %rcx
	movsd	(%r12), %xmm4
	movsd	0(%r13), %xmm5
	movl	$1, i(%rip)
	addsd	(%r12,%rcx,8), %xmm4
	addsd	0(%r13,%rcx,8), %xmm5
	movsd	.LC3(%rip), %xmm1
	mulsd	%xmm1, %xmm4
	mulsd	%xmm1, %xmm5
	movsd	%xmm4, X(%rip)
	movsd	%xmm5, Y(%rip)
	cmpl	$3, %eax
	jle	.L5
	salq	$3, %rcx
	movq	.LC4(%rip), %xmm3
	movl	$1, %eax
	xorl	%edi, %edi
	leaq	(%r12,%rcx), %rsi
	movsd	.LC5(%rip), %xmm2
	addq	%r13, %rcx
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L9:
	movsd	0(%r13,%rax,8), %xmm0
	addsd	(%rcx,%rax,8), %xmm0
	mulsd	%xmm1, %xmm0
	subsd	%xmm5, %xmm0
	andpd	%xmm3, %xmm0
	comisd	%xmm0, %xmm2
	jbe	.L22
	leal	1(%rax), %ebx
	addq	$1, %rax
	movl	$1, %edi
	cmpl	%eax, %edx
	jle	.L21
.L8:
	movsd	(%r12,%rax,8), %xmm0
	addsd	(%rsi,%rax,8), %xmm0
	mulsd	%xmm1, %xmm0
	subsd	%xmm4, %xmm0
	andpd	%xmm3, %xmm0
	comisd	%xmm0, %xmm2
	ja	.L9
.L22:
	testb	%dil, %dil
	je	.L5
.L21:
	movl	%ebx, i(%rip)
.L5:
	cmpl	%edx, i(%rip)
	leaq	.LC1(%rip), %rax
	leaq	.LC0(%rip), %rdi
	movsd	Y(%rip), %xmm1
	cmovne	%rax, %rdi
	movsd	X(%rip), %xmm0
	movl	$2, %eax
	call	printf@PLT
	xorl	%edi, %edi
	call	exit@PLT
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	i
	.bss
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	n
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.globl	Y
	.align 8
	.type	Y, @object
	.size	Y, 8
Y:
	.zero	8
	.globl	X
	.align 8
	.type	X, @object
	.size	X, 8
X:
	.zero	8
	.globl	y
	.align 32
	.type	y, @object
	.size	y, 792
y:
	.zero	792
	.globl	x
	.align 32
	.type	x, @object
	.size	x, 792
x:
	.zero	792
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1071644672
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC4:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC5:
	.long	-1698910392
	.long	1048238066
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
```