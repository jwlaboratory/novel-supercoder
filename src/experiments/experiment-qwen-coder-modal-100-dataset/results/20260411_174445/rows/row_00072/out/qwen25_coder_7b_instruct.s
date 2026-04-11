ret
	.cfi_endproc
.LFE14:
	.size	divide, .-divide
	.p2align 4
	.globl	udiff
	.type	udiff, @function
udiff:
.LFB15:
	.cfi_startproc
	cmpq	%rdi, %rsi
	movq	%rdi, %rax
	cmovge	%rsi, %rax
	ret
	.cfi_endproc
.LFE15:
	.size	udiff, .-udiff
	.p2align 4
	.globl	sdiff
	.type	sdiff, @function
sdiff:
.LFB16:
	.cfi_startproc
	cmpq	%rdi, %rsi
	movq	%rdi, %rax
	cmovge	%rsi, %rax
	ret
	.cfi_endproc
.LFE16:
	.size	sdiff, .-sdiff
	.p2align 4
	.globl	bitcount
	.type	bitcount, @function
bitcount:
.LFB17:
	.cfi_startproc
	movl	$0, %eax
	testq	%rdi, %rdi
	je	.L25
	.p2align 4,,10
	.p2align 3
.L27:
	testb	$1, %al
	je	.L26
	addl	$1, %eax
.L26:
	shrl	%edi
	jne	.L27
.L25:
	ret
	.cfi_endproc
.LFE17:
	.size	bitcount, .-bitcount
	.p2align 4
	.globl	pullcomp
	.type	pullcomp, @function
pullcomp:
.LFB18:
	.cfi_startproc
	movq	(%rdi), %rax
	movq	(%rsi), %rdx
	cmpq	%rax, %rdx
	ret
	.cfi_endproc
.LFE18:
	.size	pullcomp, .-pullcomp
	.p2align 4
	.globl	prevcomp
	.type	prevcomp, @function
prevcomp:
.LFB19:
	.cfi_startproc
	movq	(%rdi), %rax
	movq	(%rsi), %rdx
	cmpq	%rdx, %rax
	ret
	.cfi_endproc
.LFE19:
	.size	prevcomp, .-prevcomp
	.p2align 4
	.globl	psllcomp
	.type	psllcomp, @function
psllcomp:
.LFB20:
	.cfi_startproc
	movq	(%rdi), %rax
	movq	(%rsi), %rdx
	cmpq	%rax, %rdx
	ret
	.cfi_endproc
.LFE20:
	.size	psllcomp, .-psllcomp
	.p2align 4
	.globl	pcharcomp
	.type	pcharcomp, @function
pcharcomp:
.LFB21:
	.cfi_startproc
	movb	(%rdi), %al
	movb	(%rsi), %dl
	cmpb	%al, %dl
	ret
	.cfi_endproc
.LFE21:
	.size	pcharcomp, .-pcharcomp
	.p2align 4
	.globl	pdoublecomp
	.type	pdoublecomp, @function
pdoublecomp:
.LFB22:
	.cfi_startproc
	movq	(%rdi), %rax
	movq	(%rsi), %rdx
	cmpq	%rax, %rdx
	ret
	.cfi_endproc
.LFE22:
	.size	pdoublecomp, .-pdoublecomp
	.p2align 4
	.globl	pstrcomp
	.type	pstrcomp, @function
pstrcomp:
.LFB23:
	.cfi_startproc
	movq	(%rdi), %rax
	movq	(%rsi), %rdx
	movq	(%rax), %rax
	movq	(%rdx), %rdx
	cmpq	%rax, %rdx
	ret
	.cfi_endproc
.LFE23:
	.size	pstrcomp, .-pstrcomp
	.p2align 4
	.globl	phwllABcomp
	.type	phwllABcomp, @function
phwllABcomp:
.LFB24:
	.cfi_startproc
	movq	(%rdi), %rax
	movq	(%rsi), %rdx
	cmpq	%rax, %rdx
	ret
	.cfi_endproc
.LFE24:
	.size	phwllABcomp, .-phwllABcomp
	.p2align 4
	.globl	phwllREVcomp
	.type	phwllREVcomp, @function
phwllREVcomp:
.LFB25:
	.cfi_startproc
	movq	(%rdi), %rax
	movq	(%rsi), %rdx
	cmpq	%rdx, %rax
	ret
	.cfi_endproc
.LFE25:
	.size	phwllREVcomp, .-phwllREVcomp
	.p2align 4
	.globl	ptriplecomp
	.type	ptriplecomp, @function
ptriplecomp:
.LFB26:
	.cfi_startproc
	movq	(%rdi), %rax
	movq	(%rsi), %rdx
	cmpq	%rax, %rdx
	ret
	.cfi_endproc
.LFE26:
	.size	ptriplecomp, .-ptriplecomp
	.p2align 4
	.globl	ptripleREVcomp
	.type	ptripleREVcomp, @function
ptripleREVcomp:
.LFB27:
	.cfi_startproc
	movq	(%rdi), %rax
	movq	(%rsi), %rdx
	cmpq	%rdx, %rax
	ret
	.cfi_endproc
.LFE27:
	.size	ptripleREVcomp, .-ptripleREVcomp
	.p2align 4
	.globl	pquadcomp
	.type	pquadcomp, @function
pquadcomp:
.LFB28:
	.cfi_startproc
	movq	(%rdi), %rax
	movq	(%rsi), %rdx
	movq	(%rax), %rax
	movq	(%rdx), %rdx
	movq	(%rax), %rax
	movq	(%rdx), %rdx
	cmpq	%rax, %rdx
	ret
	.cfi_endproc
.LFE28:
	.size	pquadcomp, .-pquadcomp
:
