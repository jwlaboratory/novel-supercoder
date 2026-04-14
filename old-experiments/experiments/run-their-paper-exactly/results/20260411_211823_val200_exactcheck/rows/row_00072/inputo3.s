.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	b(%rip), %ebx
	cmpl	%ebx, %esi
	je	.L2
	movl	%esi, %eax
	cmpl	%esi, %edi
	jne	.L20
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L22:
	cmpl	%edi, %eax
	je	.L7
.L20:
	cmpl	$-1, %eax
	je	.L3
	movl	i(%rip), %edi
	movl	%eax, b(%rip)
	leal	1(%rdi), %eax
	movl	%eax, i(%rip)
	xorl	%eax, %eax
	call	getchar_unlocked@PLT
	movl	%ebx, %edi
	movl	b(%rip), %ebx
	cmpl	%eax, %ebx
	jne	.L22
.L2:
	movl	i(%rip), %edx
	leal	-1(%rdx), %esi
.L6:
	leaq	.LC0(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	xorl	%eax, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	cmpl	%edi, %eax
	je	.L7
	orl	$-1, %edx
	orl	$-1, %esi
	jmp	.L6
.L7:
	movl	i(%rip), %edx
	leal	-2(%rdx), %esi
	jmp	.L6
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	b
	.bss
	.align 4
	.type	b, @object
	.size	b, 4
b:
	.zero	4
	.globl	i
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