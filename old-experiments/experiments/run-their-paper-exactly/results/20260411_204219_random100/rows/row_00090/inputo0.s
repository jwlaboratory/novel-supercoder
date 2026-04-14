```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"Yes"
.LC2:
	.string	"No"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	.LC0(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%r13, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rsi
	call	__isoc99_scanf@PLT
	movl	(%rsp), %eax
	testl	%eax, %eax
	jle	.L2
	movl	$1, %ebp
	xorl	%r12d, %r12d
	leaq	4(%rsp), %r14
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L3:
	xorl	%eax, %eax
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	__isoc99_scanf@PLT
	movl	4(%rsp), %eax
	addl	%eax, %r12d
	cmpl	%eax, %ebx
	cmovl	%eax, %ebx
	addl	$1, %ebp
	cmpl	%ebp, (%rsp)
	jge	.L3
	subl	%ebx, %r12d
	cmpl	%ebx, %r12d
	jle	.L2
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
.L4:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L9
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L2:
	.cfi_restore_state
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	jmp	.L4
.L9:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
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