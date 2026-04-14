.file	"temp.c"
	.text
	.p2align 4
	.globl	isodd
	.type	isodd, @function
isodd:
.LFB39:
	.cfi_startproc
	endbr64
	movl	%edi, %eax
	shrl	$31, %eax
	addl	%eax, %edi
	andl	$1, %edi
	subl	%eax, %edi
	xorl	%eax, %eax
	cmpl	$1, %edi
	sete	%al
	ret
	.cfi_endproc
.LFE39:
	.size	isodd, .-isodd
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	" %d %d"
.LC4:
	.string	"%lf"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB40:
	.cfi_startproc
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	.LC2(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rdx
	movq	%rsp, %rsi
	call	__isoc99_scanf@PLT
	movl	(%rsp), %eax
	pxor	%xmm0, %xmm0
	movl	%eax, %edx
	cvtsi2sdl	%eax, %xmm0
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	cmpl	$1, %eax
	je	.L8
	pxor	%xmm1, %xmm1
	movsd	.LC3(%rip), %xmm3
	pxor	%xmm2, %xmm2
	cvtsi2sdl	4(%rsp), %xmm1
.L4:
	mulsd	%xmm3, %xmm1
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC4(%rip), %rsi
	divsd	%xmm1, %xmm0
	addsd	%xmm2, %xmm0
	call	__printf_chk@PLT
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L9
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore_state
	pxor	%xmm1, %xmm1
	movsd	.LC3(%rip), %xmm3
	movsd	.LC1(%rip), %xmm2
	cvtsi2sdl	4(%rsp), %xmm1
	movapd	%xmm2, %xmm4
	movapd	%xmm1, %xmm5
	mulsd	%xmm3, %xmm5
	subsd	%xmm5, %xmm4
	addsd	%xmm4, %xmm0
	jmp	.L4
.L9:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE40:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC3:
	.long	1202590843
	.long	1066695393
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