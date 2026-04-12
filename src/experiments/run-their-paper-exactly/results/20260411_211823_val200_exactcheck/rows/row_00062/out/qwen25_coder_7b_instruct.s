.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"98 98"
.LC1:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	.LC1(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	.LC0(%rip), %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movl	%edi, 12(%rsp)
	leaq	12(%rsp), %r12
.L2:
	movl	i(%rip), %edx
	imull	$438261969, %edx, %eax
	addl	$43826196, %eax
	rorl	%eax
	cmpl	$43826196, %eax
	ja	.L5
	cmpl	$1, %edx
	movq	%rbx, %rdi
	adcq	$-1, %rdi
	call	puts@PLT
	movl	i(%rip), %edx
	imull	%edx, %eax
	imull	$359553697, %eax, %eax
	addl	$894412, %eax
	rorl	%eax
	cmpl	$894412, %eax
	ja	.L5
	xorl	%eax, %eax
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	scanf@PLT
	cmpl	$-1, %eax
	je	.L6
	movl	i(%rip), %edx
	jmp	.L5
.L6:
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
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
