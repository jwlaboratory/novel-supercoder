.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d%d%d"
.LC5:
	.string	"%d\n"
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
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4136
	orq	$0, (%rsp)
	subq	$1944, %rsp
	.cfi_def_cfa_offset 6080
	movl	%edi, 12(%rsp)
	leaq	12(%rsp), %rsi
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 6024(%rsp)
	xorl	%eax, %eax
	call	scanf@PLT
	movl	12(%rsp), %eax
	leal	-1(%rax), %ecx
	movl	k(%rip), %eax
	cmpl	%eax, %ecx
	jle	.L2
	leaq	16(%rsp), %r13
	leaq	2016(%rsp), %rbp
	leaq	4016(%rsp), %r12
	leaq	.LC1(%rip), %rbx
	.p2align 4,,10
	.p2align 3
.L3:
	cltq
	movq	%rbx, %rdi
	salq	$2, %rax
	leaq	0(%r13,%rax), %rcx
	leaq	0(%rbp,%rax), %rdx
	leaq	(%r12,%rax), %rsi
	xorl	%eax, %eax
	call	scanf@PLT
	movl	k(%rip), %eax
	movl	12(%rsp), %ecx
	addl	$1, %eax
	subl	$1, %ecx
	movl	%eax, k(%rip)
	cmpl	%ecx, %eax
	jl	.L3
.L2:
	movl	i(%rip), %eax
	leaq	2016(%rsp), %rbp
	leaq	4016(%rsp), %r12
	leaq	.LC5(%rip), %rbx
	cmpl	%ecx, %eax
	jge	.L8
	movsd	.LC2(%rip), %xmm5
	movsd	.LC3(%rip), %xmm4
	.p2align 4,,10
	.p2align 3
.L4:
	movsd	.LC4(%rip), %xmm6
	cltq
	xorl	%esi, %esi
	leaq	16(%rsp), %r8
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L20:
	pxor	%xmm0, %xmm0
	pxor	%xmm2, %xmm2
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%edx, %xmm2
	cvtsi2sdl	%esi, %xmm0
	cvtsi2sdl	(%r8,%rax,4), %xmm1
	subsd	%xmm2, %xmm0
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm2
	andpd	%xmm4, %xmm2
	ucomisd	%xmm2, %xmm5
	jbe	.L6
	cvttsd2siq	%xmm0, %rdx
	pxor	%xmm2, %xmm2
	movapd	%xmm0, %xmm3
	cvtsi2sdq	%rdx, %xmm2
	cmpnlesd	%xmm2, %xmm3
	andpd	%xmm6, %xmm3
	addsd	%xmm3, %xmm2
	movapd	%xmm4, %xmm3
	andnpd	%xmm0, %xmm3
	movapd	%xmm2, %xmm0
	orpd	%xmm3, %xmm0
.L6:
	mulsd	%xmm0, %xmm1
	pxor	%xmm2, %xmm2
	addq	$1, %rax
	cvtsi2sdl	%edi, %xmm2
	addsd	%xmm1, %xmm2
	cvttsd2sil	%xmm2, %esi
	cmpl	%eax, %ecx
	jle	.L19
.L7:
	movl	0(%rbp,%rax,4), %edx
	movl	(%r12,%rax,4), %edi
	addl	%edx, %edi
	cmpl	%esi, %edx
	jl	.L20
	addq	$1, %rax
	movl	%edi, %esi
	cmpl	%eax, %ecx
	jg	.L7
.L19:
	xorl	%eax, %eax
	movq	%rbx, %rdi
	movl	%esi, t(%rip)
	call	printf@PLT
	movl	i(%rip), %eax
	movq	.LC2(%rip), %rsi
	movl	12(%rsp), %ecx
	addl	$1, %eax
	movq	%rsi, %xmm5
	movq	.LC6(%rip), %rsi
	subl	$1, %ecx
	movl	%eax, i(%rip)
	cmpl	%ecx, %eax
	movq	%rsi, %xmm4
	jl	.L4
.L8:
	movl	$48, %edi
	call	putchar@PLT
	movq	6024(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L21
	addq	$6040, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L21:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	t
	.bss
	.align 4
	.type	t, @object
	.size	t, 4
t:
	.zero	4
	.globl	k
	.align 4
	.type	k, @object
	.size	k, 4
k:
	.zero	4
	.globl	i
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1127219200
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.set	.LC6,.LC3
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