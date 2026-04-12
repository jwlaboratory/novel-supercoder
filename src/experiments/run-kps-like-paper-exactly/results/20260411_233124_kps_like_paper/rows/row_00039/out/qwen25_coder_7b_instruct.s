.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%s"
.LC1:
	.string	"A"
.LC2:
	.string	"B"
.LC3:
	.string	"C"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$352, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -344(%rbp)
	movl	$0, -340(%rbp)
	movl	$0, -336(%rbp)
	jmp	.L2
.L5:
	leaq	-320(%rbp), %rcx
	movl	-336(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rsi
	addq	%rsi, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	testl	%eax, %eax
	jg	.L3
	movl	$1, %eax
	jmp	.L16
.L3:
	addl	$1, -336(%rbp)
.L2:
	cmpl	$2, -336(%rbp)
	jle	.L5
	leaq	-320(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -332(%rbp)
	leaq	-320(%rbp), %rax
	addq	$101, %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -328(%rbp)
	leaq	-320(%rbp), %rax
	addq	$202, %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -324(%rbp)
	movzbl	-320(%rbp), %eax
	movb	%al, -349(%rbp)
	movl	$1, -348(%rbp)
.L15:
	movsbl	-349(%rbp), %eax
	cmpl	$99, %eax
	je	.L6
	cmpl	$99, %eax
	jg	.L18
	cmpl	$97, %eax
	je	.L8
	cmpl	$98, %eax
	je	.L9
	jmp	.L18
.L8:
	movl	-348(%rbp), %eax
	cltq
	movzbl	-320(%rbp,%rax), %eax
	movb	%al, -349(%rbp)
	addl	$1, -348(%rbp)
	cmpb	$0, -349(%rbp)
	jne	.L19
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L19
.L9:
	movl	-344(%rbp), %eax
	cltq
	movzbl	-219(%rbp,%rax), %eax
	movb	%al, -349(%rbp)
	addl	$1, -344(%rbp)
	cmpb	$0, -349(%rbp)
	jne	.L20
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L20
.L6:
	movl	-340(%rbp), %eax
	cltq
	movzbl	-118(%rbp,%rax), %eax
	movb	%al, -349(%rbp)
	addl	$1, -340(%rbp)
	cmpb	$0, -349(%rbp)
	jne	.L21
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L21
.L19:
	nop
	jmp	.L15
.L20:
	nop
	jmp	.L15
.L21:
	nop
	jmp	.L15
.L18:
	nop
.L14:
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	movl	$0, %eax
.L16:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0"
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
