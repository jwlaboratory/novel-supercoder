.file	"inputC.c"
	.text
	.globl	i
	.bss
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	j
	.align 4
	.type	j, @object
	.size	j, 4
j:
	.zero	4
	.section	.rodata
.LC0:
	.string	"%dx%d=%d\n"
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
	movl	$0, i(%rip)
.L2:
	movl	i(%rip), %eax
	cmpl	$8, %eax
	jg	.L6
	movl	$0, j(%rip)
.L3:
	movl	j(%rip), %edx
	cmpl	$8, %edx
	jg	.L5
	movl	i(%rip), %ecx
	movl	j(%rip), %eax
	movl	%edx, %esi
	imull	%eax, %esi
	movl	%esi, %edi
	leaq	.LC0(%rip), %rsi
	movl	$0, %eax
	call	printf@PLT
.L5:
	movl	j(%rip), %eax
	leal	1(%eax), %edx
	movl	%edx, j(%rip)
	jmp	.L3
.L6:
	movl	i(%rip), %eax
	leal	1(%eax), %edx
	movl	%edx, i(%rip)
	jmp	.L2
	movl	$0, %eax
	popq	%rbp
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
