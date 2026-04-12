```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%d"
.LC2:
	.string	"%d %d"
.LC4:
	.string	"%d %.1lf\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
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
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	.LC2(%rip), %rbx
	subq	$536, %rsp
	.cfi_def_cfa_offset 592
	movq	%fs:40, %rax
	movq	%rax, 520(%rsp)
	xorl	%eax, %eax
	leaq	28(%rsp), %rax
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L9:
	movq	8(%rsp), %rsi
	leaq	.LC1(%rip), %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movslq	28(%rsp), %rax
	testl	%eax, %eax
	je	.L2
	jle	.L3
	leaq	32(%rsp), %r15
	xorl	%r12d, %r12d
	leaq	272(%rsp), %r14
	movq	%r15, %r13
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%r13, %rsi
	leaq	(%r14,%r12,4), %rdx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	28(%rsp), %esi
	addq	$1, %r12
	addq	$4, %r13
	cmpl	%r12d, %esi
	jg	.L4
	movl	32(%rsp), %r8d
	movl	272(%rsp), %edx
	movslq	%esi, %rax
	movl	%r8d, 32(%rsp,%rax,4)
	movl	%edx, 272(%rsp,%rax,4)
	testl	%esi, %esi
	jle	.L11
	cmpl	$2, %esi
	jle	.L12
	leal	-3(%rsi), %eax
	movl	272(%rsp), %edi
	movl	$2, %edx
	pxor	%xmm0, %xmm0
	shrl	%eax
	leal	2(%rax), %r9d
	addq	%r9, %r9
.L7:
	movl	-4(%r15,%rdx,4), %r10d
	addl	-4(%r14,%rdx,4), %edi
	pxor	%xmm1, %xmm1
	movl	-4(%r14,%rdx,4), %ecx
	movl	%r10d, %eax
	subl	%r8d, %eax
	movl	(%r15,%rdx,4), %r8d
	imull	%eax, %edi
	movslq	%edx, %rax
	movl	%r8d, %r11d
	subl	%r10d, %r11d
	cvtsi2sdl	%edi, %xmm1
	movl	(%r14,%rdx,4), %edi
	addq	$2, %rdx
	addl	%edi, %ecx
	imull	%r11d, %ecx
	addsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%ecx, %xmm1
	addsd	%xmm1, %xmm0
	cmpq	%r9, %rdx
	jne	.L7
	.p2align 4,,10
	.p2align 3
.L8:
	movl	4(%r14,%rax,4), %edx
	movl	4(%r15,%rax,4), %ecx
	pxor	%xmm1, %xmm1
	addl	(%r14,%rax,4), %edx
	subl	(%r15,%rax,4), %ecx
	addq	$1, %rax
	imull	%ecx, %edx
	cvtsi2sdl	%edx, %xmm1
	addsd	%xmm1, %xmm0
	cmpl	%eax, %esi
	jg	.L8
	mulsd	.LC3(%rip), %xmm0
.L5:
	addl	$1, %ebp
	movl	$1, %edi
	movl	$1, %eax
	movl	%ebp, %edx
	leaq	.LC4(%rip), %rsi
	call	__printf_chk@PLT
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L2:
	movq	520(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L19
	addq	$536, %rsp
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
	.p2align 4,,10
	.p2align 3
.L3:
	.cfi_restore_state
	movl	32(%rsp), %edx
	pxor	%xmm0, %xmm0
	movl	%edx, 32(%rsp,%rax,4)
	movl	272(%rsp), %edx
	movl	%edx, 272(%rsp,%rax,4)
	jmp	.L5
.L12:
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	jmp	.L8
.L11:
	pxor	%xmm0, %xmm0
	jmp	.L5
.L19:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1071644672
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