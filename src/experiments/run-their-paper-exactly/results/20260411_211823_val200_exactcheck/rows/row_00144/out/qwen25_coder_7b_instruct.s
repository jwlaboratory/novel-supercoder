.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d"
.LC2:
	.string	"%.7f\n"
	.text
	.p2align 4
	.globl	run
	.type	run, @function
run:
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
	movl	(%rsp), %eax
	pxor	%xmm1, %xmm1
	cvtsi2sdl	4(%rsp), %xmm1
	divsd	.LC1(%rip), %xmm1
	testb	$1, %al
	jne	.L2
	movl	%eax, %edx
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	shrl	$31, %edx
	leaq	.LC2(%rip), %rsi
	addl	%edx, %eax
	sarl	%eax
	cvtsi2sdl	%eax, %xmm0
	movl	%eax, (%rsp)
	movl	$1, %eax
	divsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	jmp	.L1
.L2:
	leal	-1(%rax), %ecx
	pxor	%xmm0, %xmm0
	addl	$1, %eax
	movl	$1, %edi
	movl	%ecx, %edx
	pxor	%xmm2, %xmm2
	movsd	.LC3(%rip), %xmm3
	leaq	.LC2(%rip), %rsi
	shrl	$31, %edx
	addl	%ecx, %edx
	sarl	%edx
	cvtsi2sdl	%edx, %xmm0
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	divsd	%xmm1, %xmm0
	cvtsi2sdl	%eax, %xmm2
	movl	$1, %eax
	divsd	%xmm1, %xmm2
	mulsd	%xmm1, %xmm0
	addsd	%xmm3, %xmm0
	subsd	%xmm1, %xmm3
	mulsd	%xmm3, %xmm2
	addsd	%xmm2, %xmm0
	call	__printf_chk@PLT
.L1:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	run, .-run
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	run
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1079574528
	.align 8
.LC3:
	.long	0
	.long	1072693248
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
