.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d"
.LC3:
	.string	"%d"
.LC4:
	.string	"IMPOSSIBLE"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rdx
	movq	%rsp, %rsi
	call	__isoc99_scanf@PLT
	movl	4(%rsp), %eax
	movl	(%rsp), %edx
	cmpl	%edx, %eax
	jle	.L2
	movl	%eax, (%rsp)
	movl	%edx, 4(%rsp)
	movl	%eax, %edx
.L2:
	movl	%edx, %ecx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	subl	4(%rsp), %ecx
	movl	%ecx, %eax
	cvtsi2sdl	%ecx, %xmm0
	mulsd	.LC1(%rip), %xmm0
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
	cvtsi2sdl	%eax, %xmm1
	subsd	%xmm1, %xmm0
	ucomisd	.LC2(%rip), %xmm0
	jp	.L3
	jne	.L3
	subl	%eax, %edx
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L5:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L10
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L5
.L10:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1071644672
	.align 8
.LC2:
	.long	0
	.long	0
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