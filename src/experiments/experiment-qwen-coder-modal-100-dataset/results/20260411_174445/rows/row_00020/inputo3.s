	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s"
.LC3:
	.string	"YES"
.LC4:
	.string	"NO"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	movl	$.LC0, %edi
	movq	%rsp, %rsi
	call	__isoc99_scanf
	pxor	%xmm0, %xmm0
	pxor	%xmm2, %xmm2
	movdqa	.LC1(%rip), %xmm1
	movdqa	%xmm2, %xmm4
	cmpb	$120, 16(%rsp)
	pcmpeqb	(%rsp), %xmm1
	pcmpgtb	%xmm1, %xmm0
	movdqa	%xmm1, %xmm3
	punpcklbw	%xmm0, %xmm3
	punpckhbw	%xmm0, %xmm1
	pcmpgtw	%xmm3, %xmm4
	pcmpgtw	%xmm1, %xmm2
	movdqa	%xmm3, %xmm0
	punpcklwd	%xmm4, %xmm0
	pand	.LC2(%rip), %xmm0
	punpckhwd	%xmm4, %xmm3
	psubd	%xmm3, %xmm0
	movdqa	%xmm1, %xmm3
	punpckhwd	%xmm2, %xmm1
	punpcklwd	%xmm2, %xmm3
	psubd	%xmm3, %xmm0
	psubd	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	psrldq	$8, %xmm1
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %eax
	je	.L13
.L2:
	cmpb	$120, 17(%rsp)
	je	.L14
.L3:
	cmpb	$120, 18(%rsp)
	je	.L15
.L4:
	cmpb	$120, 19(%rsp)
	je	.L5
.L8:
	cmpl	$7, %eax
	jg	.L16
	movl	$.LC3, %edi
	xorl	%eax, %eax
	call	printf
.L9:
	xorl	%eax, %eax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L16:
	.cfi_restore_state
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L9
.L13:
	addl	$1, %eax
	jmp	.L2
.L5:
	addl	$1, %eax
	jmp	.L8
.L15:
	addl	$1, %eax
	jmp	.L4
.L14:
	addl	$1, %eax
	jmp	.L3
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.align 16
.LC2:
	.long	1
	.long	1
	.long	1
	.long	1
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
